-- 사용자

  CREATE TABLE "C##JAVAUSER"."USER_TABLE" 
   (	"USER_NO" NUMBER NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"USER_PW" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"USER_NAME" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"USER_PHONE" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"USER_POINT" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"USER_NICKNAME" VARCHAR2(30 BYTE), 
	"USER_BIRTH" VARCHAR2(30 BYTE), 
	"USER_ADDRESS" VARCHAR2(30 BYTE), 
	"USER_PHOTO" CLOB, 
	"USER_REGDATE" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"USER_STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"USER_EMAIL" VARCHAR2(20 BYTE), 
	"USER_UNREGDATE" DATE, 
	 CONSTRAINT "USER_PK" PRIMARY KEY ("USER_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "USER_UK" UNIQUE ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("USER_PHOTO") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_ID" IS '회원아이디';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_PW" IS '회원비밀번호';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_NAME" IS '회원이름';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_PHONE" IS '회원휴대전화';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_POINT" IS '회원포인트';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_NICKNAME" IS '회원별명';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_BIRTH" IS '회원생년월일';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_ADDRESS" IS '회원주소';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_PHOTO" IS '회원사진';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_REGDATE" IS '회원가입일자';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_STATUS" IS '회원계정상태';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_EMAIL" IS '회원이메일';
   COMMENT ON COLUMN "C##JAVAUSER"."USER_TABLE"."USER_UNREGDATE" IS '회원탈퇴일자';
   COMMENT ON TABLE "C##JAVAUSER"."USER_TABLE"  IS '일반회원';

create table user(
    user_no number not null,
    user_id varchar2(30) not null,
    user_pw varchar2(30) not null,
    user_phone varchar2(2000) not null,
    r_pwd varchar2(30) not null,
    r_date date default sysdate not null,
    constraint User_pk primary key(userno),
    constraint spring_reply_fk foreign key(b_num) references spring_board(b_num)
   );
   
    --drop table User;
    
    comment on table User is '사용자';
    comment on column User.r_num is '댓글번호';
    comment on column User.b_num is '게시글 글번호';
    comment on column User.r_name is '댓글 작성자';
    comment on column User.r_content is '댓글 내용';
    comment on column User.r_pwd is '댓글 비밀번호';
    comment on column User.r_date is '댓글 등록일';
    
    create sequence spring_reply_seq
    start with 1
    increment by 1
    minvalue 1
    nocycle
    cache 2;
    
    --drop sequence spring_reply_seq;
    
    select * from spring_reply;
    
    insert into spring_reply(r_num,b_num,r_name,r_content,r_pwd)
    values(spring_reply_seq.nextval, 1,'Aristotle','Happiness depends upon ourselves.','1234');
    
    insert into spring_reply(r_num,b_num,r_name,r_content,r_pwd)
    values(spring_reply_seq.nextval, 2,'Albert Camus','To be happy, we must not be too concerned with others.','1234');
    
    insert into spring_reply(r_num,b_num,r_name,r_content,r_pwd)
    values(spring_reply_seq.nextval, 3,'Dalai Lama','Happiness is not something ready-made. It comes from your own actions.','1234');
    
    insert into spring_reply(r_num,b_num,r_name,r_content,r_pwd)
    values(spring_reply_seq.nextval, 4,'Dennis Waitley','Happy people plan actions, they don’t plan results.','1234');
    
    insert into spring_reply(r_num,b_num,r_name,r_content,r_pwd)
    values(spring_reply_seq.nextval, 5,'Arthur Schopenhauer','The two enemies of human happiness are pain and boredom.','1234');
    
    insert into spring_reply(r_num,b_num,r_name,r_content,r_pwd)
    values(spring_reply_seq.nextval, 6,'Aristotle','Happiness is a state of activity.','1234');
    
    
    select * from spring_reply where b_num = 5;
    
    select * from spring_reply where b_num = 5 ;
    
    select spring_reply_seq.nextval as r_num from dual;
    
    select nvl((select count(*) from spring_reply where r_num = 2 and r_pwd=1234 ) ,0)
		as result from dual