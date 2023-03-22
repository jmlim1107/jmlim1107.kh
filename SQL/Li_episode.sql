--클래스 회차(Li_episode)      (update 23.03.23)
create table li_episode (
    ep_no number not null,                  --회차 번호
    c_no number not null,                   --클래스 번호
    ep_price number not null,               --회차 수강료
    ep_date date not null,                  --회차 날짜 및 시간 (날짜 + 시간 조합)
    ep_cnt number default 0 not null,       --현재 예약인원
    constraint li_episode_pk primary key(ep_no),
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

--********** 수정사항(DDL에 모두 재반영 완료) **********
--uk삭제(23.03.19)
--alter table li_episode drop constraint li_episode_uk;
--회차상태 컬럼 삭제(23.03.19)
--alter table li_episode drop column ep_state;
--********************************************************

--***************************** sample data ************************************--
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 121 , 12000, to_date('2023/04/01 13:00','yyyy/mm/dd hh24:mi') ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 121 , 12000, to_date('2023/04/01 17:00','yyyy/mm/dd hh24:mi') ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 121 , 12000, to_date('2023/04/02 13:00','yyyy/mm/dd hh24:mi') ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 121 , 12000, to_date('2023/04/02 19:00','yyyy/mm/dd hh24:mi') ); 
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 121 , 10000, to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi') );

insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 120 , 9000, to_date('2023/04/03 15:00','yyyy/mm/dd hh24:mi') );
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 120 , 9000, to_date('2023/04/03 16:00','yyyy/mm/dd hh24:mi') );
insert into li_episode(ep_no, c_no, ep_price, ep_date)
values( li_episode_seq.nextval, 120 , 9000, to_date('2023/04/03 17:00','yyyy/mm/dd hh24:mi') );
--****************************************************************************

select ep_no, c_no, ep_price, to_char(ep_date,'yy/mm/dd hh24:mi') from li_episode;
select ep_no, c_no, ep_price, to_char(ep_date,'yy/mm/dd hh24:mi') from li_episode where c_no = 121;
select ep_no, c_no, ep_price, to_char(ep_date,'yy/mm/dd hh24:mi') from li_episode where c_no = 120;