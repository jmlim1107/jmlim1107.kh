-- �����(Li_User)      (update 23.03.14)                                                     

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
    
comment on table Li_User is 'ȸ�� ���̺�';
comment on column Li_User.user_no is 'ȸ����ȣ';
comment on column Li_User.user_email is 'ȸ���̸���';
comment on column Li_User.user_pw is 'ȸ����й�ȣ';
comment on column Li_User.user_name is 'ȸ���̸�';

comment on column Li_User.user_tel  is 'ȸ������ó';
comment on column Li_User.user_img is 'ȸ�������ʻ���';
comment on column Li_User.user_point is '����Ʈ';

comment on column Li_User.user_regdate is 'ȸ����������';
comment on column Li_User.user_update is 'ȸ����������';
comment on column Li_User.user_regdate is 'ȸ��Ż������';
comment on column Li_User.user_status is 'ȸ����������';
comment on column Li_User.user_type is 'ȸ����������';

insert into Li_User(user_no,user_email,user_pw,user_name,user_tel,user_img,user_type)
values(
(SELECT to_char(sysdate,'YYMMDD') || ROUND(DBMS_RANDOM.VALUE (1000, 9999))as user_no 
FROM DUAL) ,
'test1234@gmail.com','1234','test','01012341234','1.jpg','0');


