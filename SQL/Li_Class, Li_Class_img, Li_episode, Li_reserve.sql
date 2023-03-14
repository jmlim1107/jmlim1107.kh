-- Ŭ����(Li_Class)      (update 23.03.14)                                                     
create table li_class (
	c_no number not null,                   --Ŭ���� ��ȣ
    ct_bizno number not null,               --����� ��Ϲ�ȣ
    c_title varchar2(20) not null,          --Ŭ���� ����
    c_content clob not null,                --Ŭ���� �Ұ���
    c_category varchar2(10) not null,       --Ŭ���� ī�װ� ( 0.����, 1.�丮, 2.�̼�, 3.�ö��, 4.��Ƽ, 5.ü��ױ�Ÿ )
    c_level varchar2(1) not null,           --Ŭ���� ���̵�
    c_area varchar2(10) not null,           --Ŭ���� ����
    c_luv number not null,                  --Ŭ���� ���ɼ�
    c_leadtime number not null,             --Ŭ���� �ҿ�ð�
    c_maxcnt number not null,               --Ŭ���� �ִ��ο�
    c_mincnt number default 1 not null,     --Ŭ���� �ּ��ο�
    c_date date default sysdate not null,   --Ŭ���� �������
    c_state number default 0 not null,      --Ŭ���� ���� ( 0:��ϿϷ�/���డ��, 1:����/����Ұ� )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is 'Ŭ���� ���̺�';
comment on column li_class.c_no is 'Ŭ���� ��ȣ';
comment on column li_class.c_title is 'Ŭ���� ����';
comment on column li_class.c_content is 'Ŭ���� �Ұ���';
comment on column li_class.c_category is 'Ŭ���� ī�װ�';
comment on column li_class.c_level is 'Ŭ���� ���̵�';
comment on column li_class.c_area is 'Ŭ���� ����';
comment on column li_class.c_luv is 'Ŭ���� ���ɼ�';
comment on column li_class.c_leadtime is 'Ŭ���� �ҿ�ð�';
comment on column li_class.c_maxcnt is 'Ŭ���� �ִ��ο�';
comment on column li_class.c_mincnt is 'Ŭ���� �ּ��ο�';
comment on column li_class.c_date is 'Ŭ���� �������';
comment on column li_class.c_state is 'Ŭ���� ����';
--Ŭ���� ��ȣ
create sequence li_class_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;



--Ŭ���� �̹���(Li_Class_img)      (update 23.03.14)
create table li_class_img (
    c_img_no number not null,                           --������ȣ
    c_no number not null,                               --Ŭ���� ��ȣ
    c_img_file varchar2(20) not null,                   --�̹��� �̸�
    thumb_file varchar2(20) not null,                   --����� �̸�
    c_img_date date default sysdate not null,           --�̹��� �����
    constraint li_class_img_pk primary key(img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_uk unique(thumb_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is 'Ŭ���� �̹��� ���̺�';
comment on column li_class_img.c_img_file is '�̹��� �̸�';
comment on column li_class_img.thumb_file is '����� �̸�';
comment on column li_class_img.c_img_date is '�̹��� �����';
--���� ��ȣ
create sequence li_class_img_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;



--Ŭ���� ȸ��(Li_episode)      (update 23.03.14)
create table li_episode (
    ep_no number not null,                  --ȸ�� ��ȣ
    c_no number not null,                   --Ŭ���� ��ȣ
    ep_price number not null,               --ȸ�� ������
    ep_date date not null,                  --ȸ�� ��¥ �� �ð� (��¥ + �ð�)
    ep_state number not null,               --ȸ�� ���� (0:���డ�� / 1:�ο��������� ����Ұ� / 2:ȸ�������� ����Ұ�)
    ep_cnt number default 0 not null,       --���� �����ο�
    constraint li_episode_pk primary key(ep_no),
    constraint li_episode_uk unique(ep_date),
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



--����(Li_reserve)      (update 23.03.14)
create table li_reserve (
    r_no number not null,                       --�����ȣ
    user_no varchar2 not null,                  --ȸ����ȣ
    ep_no number not null,                      --ȸ����ȣ
    r_date date default sysdate not null,       --��������
    r_state number default 1 not null,          --������� ( 1:������(��������) / 2:����Ϸ�(�����Ϸ�) / 3: �������(ȯ��) )
    r_price number not null,                    --����ݾ�
    r_cnt number not null,                      --�����ο�
    constraint li_reserve primary key(r_no),
    constraint li_episode_fk foreign key(user_no) references li_user(user_no),
    constraint li_episode_fk foreign key(ep_no) references li_episode(ep_no)
);
comment on table li_reserve is 'Ŭ���� ���� ���̺�';
comment on column li_reserve.r_no is '���� ��ȣ';
comment on column li_reserve.r_date is '���� ����';
comment on column li_reserve.r_state is '���� ����';
comment on column li_reserve.r_price is '���� �ݾ�';
comment on column li_reserve.r_cnt is '���� �ο�';
--�����ȣ
create sequence li_reserve_seq
start with 1
minvalue 1
nocycle
nocache;