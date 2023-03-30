--예약(Li_reserve)      (update 23.03.23)
create table li_reserve (
    r_no number not null,                       --예약번호
    user_no varchar2(20) not null,              --회원번호
    ep_no number not null,                      --회차번호
    c_title varchar2(1000) not null,            --클래스 제목
    r_date date default sysdate not null,       --예약일자
    r_state number default 1 not null,          --예약상태 1:예약중(결제예정) / 2:예약완료(결제완료) / 3: 예약취소(환불) 
    r_price number not null,                    --예약금액
    r_cnt number not null,                      --예약인원
    
    constraint li_reserve primary key(r_no),
    constraint li_episode_fk foreign key(ep_no) references li_episode(ep_no),
    constraint li_episode_fk foreign key(user_no) references li_user(user_no) 
);

comment on table li_reserve is '클래스 예약 테이블';
comment on column li_reserve.r_no is '예약 번호';
comment on column li_reserve.r_date is '예약 일자';
comment on column li_reserve.r_state is '예약 상태';
comment on column li_reserve.r_price is '예약 금액';
comment on column li_reserve.r_cnt is '예약 인원';

--예약번호 생성 시퀀스
create sequence li_reserve_seq
start with 1
minvalue 1
nocycle
nocache;