-- 사용자(Li_User)      (update 23.03.14)                                                     

create table Li_User (
	user_no	number NOT NULL,
	user_email varchar2(100) NOT NULL,
	user_pw	varchar2(255) NOT NULL,
	user_name varchar2(30) NOT NULL,
    
	user_tel varchar2(30),
    	user_img	clob,
    	user_point number DEFAULT 0,
	user_regdate date DEFAULT sysdate NOT NULL,
    	user_update date DEFAULT sysdate NOT NULL,
	user_unregdate	date,
	user_status	number	DEFAULT 0 NOT NULL,
    	user_type number  DEFAULT 0 NOT NULL ,
    
   	constraint Li_User_pk primary key(user_no),
   	constraint Li_User_uk unique(user_email)
);

--drop table Li_User;
    
comment on table Li_User is '회원 테이블';
comment on column Li_User.user_no is '회원번호';
comment on column Li_User.user_email is '회원이메일';
comment on column Li_User.user_pw is '회원비밀번호';
comment on column Li_User.user_name is '회원이름';

comment on column Li_User.user_tel  is '회원연락처';
comment on column Li_User.user_img is '회원프로필사진';
comment on column Li_User.user_point is '포인트';

comment on column Li_User.user_regdate is '회원가입일자';
comment on column Li_User.user_update is '회원수정일자';
comment on column Li_User.user_regdate is '회원탈퇴일자';
comment on column Li_User.user_status is '회원계정상태';
comment on column Li_User.user_type is '회원계정종류';

insert into Li_User(user_no,user_email,user_pw,user_name,user_tel,user_img,user_type)
values(
(SELECT to_char(sysdate,'YYMMDD') || ROUND(DBMS_RANDOM.VALUE (1000, 9999))as user_no 
FROM DUAL) ,
'test1234@gmail.com','1234','test','01012341234','1.jpg','0');


