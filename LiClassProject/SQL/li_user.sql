-- 사용자(li_user) 
-- (update 23.03.16 - 회원번호 랜덤생성함수 추가)  
-- (update 23.03.22 - 회원프로필사진 default img)  
create table li_user (
	user_no	number NOT NULL,
	user_email varchar2(100) NOT NULL,
	user_pw	varchar2(255) NOT NULL,
	user_name varchar2(30) NOT NULL,
    
	user_tel varchar2(30),
    user_img	clob DEFAULT 'default-profile.png' NOT NULL,
    user_point number DEFAULT 0,
	user_regdate date DEFAULT sysdate NOT NULL,
    user_update date DEFAULT sysdate NOT NULL,
	user_unregdate	date,
	user_status	number	DEFAULT 0 NOT NULL,
    user_type number  DEFAULT 0 NOT NULL ,
    
   	constraint li_user_pk primary key(user_no),
   	constraint li_user_uk unique(user_email)
);

--drop table li_user;
    
comment on table li_user is '회원 테이블';
comment on column li_user.user_no is '회원번호';
comment on column li_user.user_email is '회원이메일';
comment on column li_user.user_pw is '회원비밀번호';
comment on column li_user.user_name is '회원이름';

comment on column li_user.user_tel  is '회원연락처';
comment on column li_user.user_img is '회원프로필사진';
comment on column li_user.user_point is '포인트';

comment on column li_user.user_regdate is '회원가입일자';
comment on column li_user.user_update is '회원수정일자';
comment on column li_user.user_regdate is '회원탈퇴일자';
comment on column li_user.user_status is '회원계정상태';
comment on column li_user.user_type is '회원계정종류';

--회원번호 생성 함수
CREATE OR REPLACE EDITIONABLE FUNCTION USER_NO_FUNC (sysdate IN date)
RETURN number IS
user_no number;
BEGIN 
  IF sysdate IS NULL OR sysdate = NULL THEN
    user_no := '0000000000';
  ELSE 
      SELECT to_char(sysdate,'YYMMDD') || ROUND(DBMS_RANDOM.VALUE (1000, 9999))
      INTO user_no 
      FROM dual;
  END IF;
  RETURN user_no;
EXCEPTION 
  WHEN OTHERS THEN
    RETURN '0000000000';
END user_no_func;

/

--테스트용 데이터
insert into li_user(user_no,user_email,user_pw,user_name,user_tel,user_img,user_type)
values( user_no_func(sysdate),'test1234@gmail.com','1234','test','01012341234','2.jpg','0');
