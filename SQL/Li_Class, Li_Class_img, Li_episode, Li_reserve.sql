-- 클래스(Li_Class)      (update 23.03.14)                                                     
create table li_class (
	c_no number not null,                   --클래스 번호
    ct_bizno varchar2(30) not null,               --사업자 등록번호
    c_title varchar2(20) not null,          --클래스 제목
    c_content clob not null,                --클래스 소개글
    c_category varchar2(10) not null,       --클래스 카테고리 ( 0.공예, 1.요리, 2.미술, 3.플라워, 4.뷰티, 5.체험및기타 )
    c_level varchar2(1) not null,           --클래스 난이도
    c_area varchar2(10) not null,           --클래스 지역
    c_luv number not null,                  --클래스 관심수
    c_leadtime number not null,             --클래스 소요시간
    c_maxcnt number not null,               --클래스 최대인원
    c_mincnt number default 1 not null,     --클래스 최소인원
    c_date date default sysdate not null,   --클래스 등록일자
    c_state number default 0 not null,      --클래스 상태 ( 0:등록완료/예약가능, 1:삭제/예약불가 )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is '클래스 테이블';
comment on column li_class.c_no is '클래스 번호';
comment on column li_class.c_title is '클래스 제목';
comment on column li_class.c_content is '클래스 소개글';
comment on column li_class.c_category is '클래스 카테고리';
comment on column li_class.c_level is '클래스 난이도';
comment on column li_class.c_area is '클래스 지역';
comment on column li_class.c_luv is '클래스 관심수';
comment on column li_class.c_leadtime is '클래스 소요시간';
comment on column li_class.c_maxcnt is '클래스 최대인원';
comment on column li_class.c_mincnt is '클래스 최소인원';
comment on column li_class.c_date is '클래스 등록일자';
comment on column li_class.c_state is '클래스 상태';
--클래스 번호
create sequence li_class_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;



--클래스 이미지(Li_Class_img)      (update 23.03.14)
create table li_class_img (
    c_img_no number not null,                           --사진번호
    c_no number not null,                               --클래스 번호
    c_img_file varchar2(20) not null,                   --이미지 이름
    thumb_file varchar2(20) not null,                   --썸네일 이름
    c_img_date date default sysdate not null,           --이미지 등록일
    constraint li_class_img_pk primary key(img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_uk unique(thumb_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is '클래스 이미지 테이블';
comment on column li_class_img.c_img_file is '이미지 이름';
comment on column li_class_img.thumb_file is '썸네일 이름';
comment on column li_class_img.c_img_date is '이미지 등록일';
--사진 번호
create sequence li_class_img_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;



--클래스 회차(Li_episode)      (update 23.03.14)
create table li_episode (
    ep_no number not null,                  --회차 번호
    c_no number not null,                   --클래스 번호
    ep_price number not null,               --회차 수강료
    ep_date date not null,                  --회차 날짜 및 시간 (날짜 + 시간)
    ep_state number not null,               --회차 상태 (0:예약가능 / 1:인원만석으로 예약불가 / 2:회차삭제로 예약불가)
    ep_cnt number default 0 not null,       --현재 예약인원
    constraint li_episode_pk primary key(ep_no),
    constraint li_episode_uk unique(ep_date),
    constraint li_episode_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_episode is '클래스 회차 테이블';
comment on column li_episode.ep_no is '회차 번호';
comment on column li_episode.ep_price is '회차 가격';
comment on column li_episode.ep_date is '회차 날짜및시간';
comment on column li_episode.ep_cnt is '회차 예약인원';
--회차번호
create sequence li_episode_seq
start with 1
minvalue 1
nocycle
nocache;



--예약(Li_reserve)      (update 23.03.14)
create table li_reserve (
    r_no number not null,                       --예약번호
    user_no varchar2 not null,                  --회원번호
    ep_no number not null,                      --회차번호
    r_date date default sysdate not null,       --예약일자
    r_state number default 1 not null,          --예약상태 ( 1:예약중(결제예정) / 2:예약완료(결제완료) / 3: 예약취소(환불) )
    r_price number not null,                    --예약금액
    r_cnt number not null,                      --예약인원
    constraint li_reserve primary key(r_no),
    constraint li_episode_fk foreign key(user_no) references li_user(user_no),
    constraint li_episode_fk foreign key(ep_no) references li_episode(ep_no)
);
comment on table li_reserve is '클래스 예약 테이블';
comment on column li_reserve.r_no is '예약 번호';
comment on column li_reserve.r_date is '예약 일자';
comment on column li_reserve.r_state is '예약 상태';
comment on column li_reserve.r_price is '예약 금액';
comment on column li_reserve.r_cnt is '예약 인원';
--예약번호
create sequence li_reserve_seq
start with 1
minvalue 1
nocycle
nocache;
