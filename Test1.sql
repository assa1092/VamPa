--            Vampa 쇼핑몰 프로젝트       ----

SELECT TABLE_NAME, COLUMN_NAME, DATA_DEFAULT FROM USER_TAB_COLUMNS;
--WHERE TABLE_NAME = 'VAM_BOOK';

SELECT ISEQ$$_73075.nextval from dual;

--C##CA.SYS_C007460

 SELECT  LAST_NUMBER
 FROM    USER_SEQUENCES
 WHERE  SEQUENCE_NAME = 'ISEQ$$_73075';



select * from vam_book order by bookId desc;
SELECT * FROM vam_image;
SELECT * FROM vam_author;
select * from ALL_users;

-- 이미지 파일 저장 테이블 생성
create table vam_image(
    bookId int ,
    fileName varchar2(100) not null,
    uploadPath varchar2(200) not null,
    uuid varchar2(100)not null ,
    primary key (uuid),
    foreign key (bookId) references vam_book(bookId)
);

-- vam_book 테이블의 인덱스명을 찾는다.
SELECT * FROM USER_INDEXES ;-- WHERE TABLE_NAME = 'VAM_BOOK';
commit;

--상품등록 재귀 복사
insert into vam_book(bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents)
(select bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents from vam_book);

-- 외래키 추가
alter table vam_book add foreign key (authorId) references vam_author(authorId);
alter table vam_book add foreign key (cateCode) references vam_bcate(cateCode);

SELECT * FROM vam_bcate  ORDER BY catecode; 
select * from vam_book order by bookid;
select * from vam_author;

select * from book_member;


select * from vam_book; --WHERE authorId='321';

delete  vam_book;
commit;

-- Oracle
-- 상품 테이블 
create table vam_book(
    bookId number generated as identity (start with 1) primary key,
    bookName varchar2(50)   not null,
    authorId number,
    publeYear Date not null,
    publisher varchar2(70) not null,
    cateCode varchar2(30),
    bookPrice number not null,
    bookStock number not null,
    bookDiscount number(2,2),
    bookIntro clob,
    bookContents clob,
    regDate date default sysdate,
    updateDate date default sysdate
);

-- Oracle
-- 카테고리 테이블
create table vam_bcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30) ,
    primary key(cateCode),
    foreign key(cateParent) references vam_bcate(cateCode) 
);

-- 데이터 삽입
insert into vam_bcate(tier, cateName, cateCode) values (1, '국내', '100000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '소설', '101000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '한국소설', '101001','101000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '영미소설', '101002','101000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '일본소설', '101003','101000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '시/에세이', '102000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '한국시', '102001','102000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '해외시', '102002','102000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '경제/경영', '103000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경영일반', '103001','103000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경영이론', '103002','103000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경제일반', '103003','103000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경제이론', '103004','103000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '자기계발', '104000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '성공/처세', '104001','104000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '자기능력계발', '104002','104000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '인간관계', '104003','104000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '인문', '105000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '심리학', '105001','105000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '교육학', '105002','105000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '철학', '105003','105000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '역사/문화', '106000','100000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '역사일반', '106001','106000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '세계사', '106002','106000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '한국사', '106003','106000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '과학', '107000','100000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '과학이론', '107001','107000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '수학', '107002','107000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '물리학', '107003','107000');
insert into vam_bcate(tier, cateName, cateCode) values (1, '국외', '200000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '문학', '201000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '소설', '201001','201000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '시', '201002','201000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '희곡', '201003','201000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '인문/사회', '202000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '교양', '202001','202000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '철학', '202002','202000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '경제/경영', '203000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경제학', '203001','203000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '경영학', '203002','203000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '투자', '203003','203000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '과학/기술', '204000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '교양과학', '204001','204000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '물리학', '204002','204000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '수학', '204003','204000');  

commit;

select * from vam_book;

CREATE TABLE BOOK_MEMBER(
  memberId VARCHAR2(50),
  memberPw VARCHAR2(100) NOT NULL,
  memberName VARCHAR2(30) NOT NULL,
  memberMail VARCHAR2(100) NOT NULL,
  memberAddr1 VARCHAR2(100) NOT NULL,
  memberAddr2 VARCHAR2(100) NOT NULL,
  memberAddr3 VARCHAR2(100) NOT NULL,
  adminCk NUMBER NOT NULL,
  regDate DATE NOT NULL,
  money number NOT NULL,
  point number NOT NULL,
  PRIMARY KEY(memberId)
);
commit;


select * from book_member; -- WHERE adminck=1;
update book_member set adminck =1 where memberid= 'admin1';

SELECT memberId, memberName, adminCk, money, point  FROM book_member
  			WHERE memberId = 'test'
  			AND	  memberPw = 'test';

-- 회원가입 쿼리(Oracle)
insert into book_member values('admin', '1111', 'admin', 'admin', 'admin', 'admin', 'admin', 1, sysdate, 1000000, 1000000);

-- 국가 테이블 생성
create table vam_nation(
    nationId varchar2(2) primary key,
    nationName varchar2(50)
);
 
-- 국가 테이블 데이터 삽입
insert into vam_nation values ('01', '국내');
insert into vam_nation values ('02', '국외');
 
-- 작가 테이블 생성
create table vam_author(
    authorId number generated as identity (start with 1) primary key,
    authorName varchar2(50),
    nationId varchar2(2),
    authorIntro long,
    foreign key (nationId) references vam_nation(nationId)
);

insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', '작가 소개입니다' );
insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', '작가 소개입니다' );
insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', '작가 소개입니다' );

commit;

select * from vam_author;

alter table vam_author ADD regDate date default sysdate;
alter table vam_author ADD updateDate date default sysdate;

delete from vam_author;
alter table vam_author modify (authorId GENERATED AS IDENTITY (START WITH 1));
commit;
insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', '작가 소개입니다' );
insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', '작가 소개입니다' );
insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', '작가 소개입니다' );


SELECT * FROM vam_author;
SELECT * FROM book_member;

select sysdate from dual;

select * from user_indexes;

-- 재귀 복사
insert into vam_author(authorname, nationid)(select authorname, nationid from vam_author);
commit;

select count(*) from vam_author where authorname like '%난%';




-- Vampa 게시판 -----------------------------------------------------------------------------------

create table vam_board(
    bno number generated always as IDENTITY,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    constraint pk_board PRIMARY key(bno)
);

insert into vam_board(title, content, writer) values ('테스트1 제목', '테스트1 내용', '작가1');
insert into vam_board(title, content, writer) values ('테스트2 제목', '테스트2 내용', '작가2');
insert into vam_board(title, content, writer) values ('테스트3 제목', '테스트3 내용', '작가3');
commit;

select * from vam_board ;

update vam_board set title='제목 수정', content='내용 수정', updateDate = sysdate where bno = 5;

delete from vam_board where bno = 23;

select * from vam_board  order by bno desc;
-- 재귀 복사
insert into vam_board(title,content,writer)(select title,content, writer from vam_board);
 
-- 행 확인
select count(*) from vam_board;
commit;

select rn, bno, title, content, writer, regdate, updatedate from(
 
        select /*+INDEX_DESC(vam_board pk_board) */ rownum as rn, bno, title, content, writer, regdate, updatedate
 
        from vam_board)
        -- select rownum as rownum as rn, bno, title, content, writer, regdate, updatedate from vam_board order by bno desc
 
where rn between 20 and 30;
    -- rn > 10 and rn <= 20;
    
    
    
