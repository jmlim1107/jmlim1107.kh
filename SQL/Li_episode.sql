--Ŭ���� ȸ��(Li_episode)      (update 23.03.23)
create table li_episode (
    ep_no number not null,                  --ȸ�� ��ȣ
    c_no number not null,                   --Ŭ���� ��ȣ
    ep_price number not null,               --ȸ�� ������
    ep_date date not null,                  --ȸ�� ��¥ �� �ð� (��¥ + �ð� ����)
    ep_cnt number default 0 not null,       --���� �����ο�
    constraint li_episode_pk primary key(ep_no),
    constraint li_episode_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_episode is 'Ŭ���� ȸ�� ���̺�';
comment on column li_episode.ep_no is 'ȸ�� ��ȣ';
comment on column li_episode.ep_price is 'ȸ�� ����';
comment on column li_episode.ep_date is 'ȸ�� ��¥�׽ð�';
comment on column li_episode.ep_cnt is 'ȸ�� �����ο�';
--ȸ����ȣ
create sequence li_episode_seq
start with 1
minvalue 1
nocycle
nocache;

--********** ��������(DDL�� ��� ��ݿ� �Ϸ�) **********
--uk����(23.03.19)
--alter table li_episode drop constraint li_episode_uk;
--ȸ������ �÷� ����(23.03.19)
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