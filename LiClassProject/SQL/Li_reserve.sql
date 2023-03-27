--����(Li_reserve)      (update 23.03.23)
create table li_reserve (
    r_no number not null,                       --�����ȣ
    user_no varchar2(20) not null,              --ȸ����ȣ
    ep_no number not null,                      --ȸ����ȣ
    c_title varchar2(1000) not null,            --Ŭ���� ����
    r_date date default sysdate not null,       --��������
    r_state number default 1 not null,          --������� 1:������(��������) / 2:����Ϸ�(�����Ϸ�) / 3: �������(ȯ��) 
    r_price number not null,                    --����ݾ�
    r_cnt number not null,                      --�����ο�
    
    constraint li_reserve primary key(r_no),
    constraint li_episode_fk foreign key(ep_no) references li_episode(ep_no),
    constraint li_episode_fk foreign key(user_no) references li_user(user_no) 
);

comment on table li_reserve is 'Ŭ���� ���� ���̺�';
comment on column li_reserve.r_no is '���� ��ȣ';
comment on column li_reserve.r_date is '���� ����';
comment on column li_reserve.r_state is '���� ����';
comment on column li_reserve.r_price is '���� �ݾ�';
comment on column li_reserve.r_cnt is '���� �ο�';

--�����ȣ ���� ������
create sequence li_reserve_seq
start with 1
minvalue 1
nocycle
nocache;