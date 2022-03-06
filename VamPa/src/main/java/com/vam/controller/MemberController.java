package com.vam.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.MemberVO;
import com.vam.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;		// 이메일 전송용
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	

	
	// 회원 가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		log.info("회원가입 페이지 진입");
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void joinGET() throws Exception{
		log.info("로그인 페이지 진입");
	}
	
	// 회원 가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {

		String rawPw = "";				// 인코딩 전 비밀번호
		String encodePw = "";			// 인코딩 후 비밀번호
		
		rawPw = member.getMemberPw();			// 회원가입이 입력한 비밀번호 데이터 가져옴
		encodePw = pwEncoder.encode(rawPw);		// 가져온 비밀번호를 인코딩
		member.setMemberPw(encodePw);			// 인코딩된 비밀번호를 member객체에 다시 저장
		
		memberService.memberJoin(member);
		
		return "redirect:/main";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	public String memberIdChkPOST(String memberId) throws Exception{
		log.info("memberIdChk() 진입");
		
		int result = memberService.idCheck(memberId);
		
		log.info("idCheck 결과값 : " + result);
		
		if (result !=0) {		// 중복아이디 O
			return "fail";
		} else {
			return "success";	// 중복아이디 X
		}
	}
	
	// 이메일 인증
	@ResponseBody
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	public String mailCheckGET(String email) throws Exception{
		// View 로 부터 넘어온 데이터 확인
		log.info("이메일 데이터 전송 확인");
		log.info("email : " + email);
		
		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		log.info("checkNum : " + checkNum);
		
		// 이메일 보내기
		String from = "parkkh1092@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." +
		                 "<br><br>" + 
		                 "인증 번호는 " + checkNum + "입니다." + 
		                 "<br>" + 
		                 "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		// 이메일 전송을 위한 코드
//		try {
//			MimeMessage message = mailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom(from);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content, true);
//			mailSender.send(message);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	
	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
		log.info("login 메서드 진입");
		log.info(" 전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
    
        MemberVO lvo = memberService.memberLogin(member);    // 제출한아이디와 일치하는 아이디 있는지 
        
        if(lvo != null) {            // 일치하는 아이디 존재시
            
            rawPw = member.getMemberPw();        // 사용자가 제출한 비밀번호
            encodePw = lvo.getMemberPw();        // 데이터베이스에 저장한 인코딩된 비밀번호

            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                
                lvo.setMemberPw("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", lvo);     // session에 사용자의 정보 저장
                return "redirect:/main";        // 메인페이지 이동
                
                
            } else {
 
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
                
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
            
        }
	
	}
	
	// 메인페이지 로그아웃
	@RequestMapping(value = "logout.do", method=RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		log.info("logoutMainGET 메서드 진입");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	// 비동기방식 로그아웃 메서드
	@ResponseBody
	@RequestMapping(value = "logout.do", method = RequestMethod.POST)
	public void logoutPOST(HttpServletRequest request) throws Exception{
		log.info("비동기 로그아웃 메서드 진입");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	}

}




