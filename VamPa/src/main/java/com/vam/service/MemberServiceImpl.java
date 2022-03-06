package com.vam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.MemberMapper;
import com.vam.model.MemberVO;

@Service
public class MemberServiceImpl  implements MemberService{
	
	@Autowired
	private MemberMapper mapper;

	// 회원 가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		mapper.memberJoin(member);
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(String memberId) throws Exception {
		 int result = mapper.idCheck(memberId);
		return result;
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return mapper.memberLogin(member);
	}

}
