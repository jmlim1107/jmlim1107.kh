create table li_qna(
qna_no number not null,                    --공지,문의게시판 글번호
admin_no number not null,                  --관리자 번호
qna_title varchar2(100) not null,          --공지,문의게시판 제목
qna_content varchar2(1000) not null,       --공지,문의게시판 내용
qna_date date default sysdate,             --공지,문의게시판 등록일
qna_category varchar2(10) not null,        --공지,문의게시판 카테고리
qna_top_state number default 0 not null,   --공지사항,문의사항 구분 및 공지사항 상단 고정 상태값
    constraint li_qna_pk primary key(qna_no),
    constraint li_admin_fk foreign key(admin_no) references li_admin(admin_no)
);  
select * from li_qna;


comment on table li_qna is '공지, 문의게시판';
comment on column li_qna.qna_title is '공지, 문의게시판 제목';
comment on column li_qna.qna_content is '공지, 문의게시판 내용';
comment on column li_qna.qna_date is '공지, 문의게시판 등록일';
comment on column li_qna.qna_category is '공지사항,문의사항 구분 및 공지사항 상단 고정 상태값';

create sequence li_qna_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

create table li_admin(              --관리자 계정
 admin_no number not null,          --관리자 번호
 admin_id varchar2(50) not null,    --관리자 아이디
 admin_pw varchar2(40) not null,    --관리자 비밀번호
 admin_name varchar2(10) not null,  --관리자 이름
 admin_email varchar2(40) not null,  --관리자 이메일
 
 constraint li_admin_pk primary key(admin_no)
);

create sequence li_admin_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

comment on table li_admin is '관리자 계정 테이블';
comment on column li_admin.admin_no is '관리자 번호' ;
comment on column li_admin.admin_id is '관리자 아이디';
comment on column li_admin.admin_pw is '관리자 비밀번호';
comment on column li_admin.admin_name is '관리자 이름';
comment on column li_admin.admin_email is '관리자 이메일';

select * from li_admin;
commit;