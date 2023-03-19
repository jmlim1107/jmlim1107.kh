-- 관심클래스(li_likes)      
--(update 23.03.19 -sequence 추가)  
-- li_user,li_class 생성 시 외래키 코드 주석해제, 콤마 추가해주세요.
create table li_likes (
	like_no	number NOT NULL,
    like_date date DEFAULT sysdate NOT NULL,
	user_no number(10) NOT NULL,
	c_no number NOT NULL,
    
   	constraint like_no_pk primary key(like_no),
   	constraint user_no_fk foreign key(user_no) references li_user(user_no),
    constraint c_no_fk foreign key(c_no) references li_class(c_no)
);

--drop table li_likes;
    
comment on table li_likes is '관심클래스 테이블';
comment on column li_likes.like_no is '관심클래스번호';
comment on column li_likes.like_date is '관심클래스등록일자';
comment on column li_likes.user_no is '회원번호';
comment on column li_likes.c_no is '클래스이름';

create sequence li_likes_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;
-- drop sequence li_likes_seq;

