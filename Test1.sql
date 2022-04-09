--            Vampa ���θ� ������Ʈ       ----

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

-- �̹��� ���� ���� ���̺� ����
create table vam_image(
    bookId int ,
    fileName varchar2(100) not null,
    uploadPath varchar2(200) not null,
    uuid varchar2(100)not null ,
    primary key (uuid),
    foreign key (bookId) references vam_book(bookId)
);

-- vam_book ���̺��� �ε������� ã�´�.
SELECT * FROM USER_INDEXES ;-- WHERE TABLE_NAME = 'VAM_BOOK';
commit;

--��ǰ��� ��� ����
insert into vam_book(bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents)
(select bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount,bookIntro, bookContents from vam_book);

-- �ܷ�Ű �߰�
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
-- ��ǰ ���̺� 
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
-- ī�װ� ���̺�
create table vam_bcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30) ,
    primary key(cateCode),
    foreign key(cateParent) references vam_bcate(cateCode) 
);

-- ������ ����
insert into vam_bcate(tier, cateName, cateCode) values (1, '����', '100000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�Ҽ�', '101000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ��Ҽ�', '101001','101000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '���̼Ҽ�', '101002','101000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�Ϻ��Ҽ�', '101003','101000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '��/������', '102000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ���', '102001','102000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ؿܽ�', '102002','102000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/�濵', '103000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵�Ϲ�', '103001','103000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵�̷�', '103002','103000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����Ϲ�', '103003','103000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����̷�', '103004','103000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�ڱ���', '104000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����/ó��', '104001','104000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ڱ�ɷ°��', '104002','104000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ΰ�����', '104003','104000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�ι�', '105000','100000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ɸ���', '105001','105000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '105002','105000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, 'ö��', '105003','105000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/��ȭ', '106000','100000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����Ϲ�', '106001','106000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����', '106002','106000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�ѱ���', '106003','106000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����', '107000','100000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�����̷�', '107001','107000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '107002','107000');
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '107003','107000');
insert into vam_bcate(tier, cateName, cateCode) values (1, '����', '200000');
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����', '201000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�Ҽ�', '201001','201000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '��', '201002','201000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '���', '201003','201000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '�ι�/��ȸ', '202000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '202001','202000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, 'ö��', '202002','202000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/�濵', '203000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '203001','203000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�濵��', '203002','203000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '203003','203000');    
    insert into vam_bcate(tier, cateName, cateCode, cateParent) values (2, '����/���', '204000','200000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '�������', '204001','204000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '������', '204002','204000');    
        insert into vam_bcate(tier, cateName, cateCode, cateParent) values (3, '����', '204003','204000');  

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

-- ȸ������ ����(Oracle)
insert into book_member values('admin', '1111', 'admin', 'admin', 'admin', 'admin', 'admin', 1, sysdate, 1000000, 1000000);

-- ���� ���̺� ����
create table vam_nation(
    nationId varchar2(2) primary key,
    nationName varchar2(50)
);
 
-- ���� ���̺� ������ ����
insert into vam_nation values ('01', '����');
insert into vam_nation values ('02', '����');
 
-- �۰� ���̺� ����
create table vam_author(
    authorId number generated as identity (start with 1) primary key,
    authorName varchar2(50),
    nationId varchar2(2),
    authorIntro long,
    foreign key (nationId) references vam_nation(nationId)
);

insert into vam_author(authorName, nationId, authorIntro) values('��ȫ��', '01', '�۰� �Ұ��Դϴ�' );
insert into vam_author(authorName, nationId, authorIntro) values('�賭��', '01', '�۰� �Ұ��Դϴ�' );
insert into vam_author(authorName, nationId, authorIntro) values('��ũ��׸�', '02', '�۰� �Ұ��Դϴ�' );

commit;

select * from vam_author;

alter table vam_author ADD regDate date default sysdate;
alter table vam_author ADD updateDate date default sysdate;

delete from vam_author;
alter table vam_author modify (authorId GENERATED AS IDENTITY (START WITH 1));
commit;
insert into vam_author(authorName, nationId, authorIntro) values('��ȫ��', '01', '�۰� �Ұ��Դϴ�' );
insert into vam_author(authorName, nationId, authorIntro) values('�賭��', '01', '�۰� �Ұ��Դϴ�' );
insert into vam_author(authorName, nationId, authorIntro) values('��ũ��׸�', '02', '�۰� �Ұ��Դϴ�' );


SELECT * FROM vam_author;
SELECT * FROM book_member;

select sysdate from dual;

select * from user_indexes;

-- ��� ����
insert into vam_author(authorname, nationid)(select authorname, nationid from vam_author);
commit;

select count(*) from vam_author where authorname like '%��%';




-- Vampa �Խ��� -----------------------------------------------------------------------------------

create table vam_board(
    bno number generated always as IDENTITY,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    constraint pk_board PRIMARY key(bno)
);

insert into vam_board(title, content, writer) values ('�׽�Ʈ1 ����', '�׽�Ʈ1 ����', '�۰�1');
insert into vam_board(title, content, writer) values ('�׽�Ʈ2 ����', '�׽�Ʈ2 ����', '�۰�2');
insert into vam_board(title, content, writer) values ('�׽�Ʈ3 ����', '�׽�Ʈ3 ����', '�۰�3');
commit;

select * from vam_board ;

update vam_board set title='���� ����', content='���� ����', updateDate = sysdate where bno = 5;

delete from vam_board where bno = 23;

select * from vam_board  order by bno desc;
-- ��� ����
insert into vam_board(title,content,writer)(select title,content, writer from vam_board);
 
-- �� Ȯ��
select count(*) from vam_board;
commit;

select rn, bno, title, content, writer, regdate, updatedate from(
 
        select /*+INDEX_DESC(vam_board pk_board) */ rownum as rn, bno, title, content, writer, regdate, updatedate
 
        from vam_board)
        -- select rownum as rownum as rn, bno, title, content, writer, regdate, updatedate from vam_board order by bno desc
 
where rn between 20 and 30;
    -- rn > 10 and rn <= 20;
    
    
    
