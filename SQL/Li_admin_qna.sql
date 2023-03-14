create table li_qna(
qna_no number not null,                    --����,���ǰԽ��� �۹�ȣ
admin_no number not null,                  --������ ��ȣ
qna_title varchar2(100) not null,          --����,���ǰԽ��� ����
qna_content varchar2(1000) not null,       --����,���ǰԽ��� ����
qna_date date default sysdate,             --����,���ǰԽ��� �����
qna_category varchar2(10) not null,        --����,���ǰԽ��� ī�װ�
qna_top_state number default 0 not null,   --��������,���ǻ��� ���� �� �������� ��� ���� ���°�
    constraint li_qna_pk primary key(qna_no),
    constraint li_admin_fk foreign key(admin_no) references li_admin(admin_no)
);  
select * from li_qna;


comment on table li_qna is '����, ���ǰԽ���';
comment on column li_qna.qna_title is '����, ���ǰԽ��� ����';
comment on column li_qna.qna_content is '����, ���ǰԽ��� ����';
comment on column li_qna.qna_date is '����, ���ǰԽ��� �����';
comment on column li_qna.qna_category is '��������,���ǻ��� ���� �� �������� ��� ���� ���°�';

create sequence li_qna_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

create table li_admin(              --������ ����
 admin_no number not null,          --������ ��ȣ
 admin_id varchar2(50) not null,    --������ ���̵�
 admin_pw varchar2(40) not null,    --������ ��й�ȣ
 admin_name varchar2(10) not null,  --������ �̸�
 admin_email varchar2(40) not null,  --������ �̸���
 
 constraint li_admin_pk primary key(admin_no)
);

create sequence li_admin_seq
start with 1
increment by 1
minvalue 1
nocycle
cache 2;

comment on table li_admin is '������ ���� ���̺�';
comment on column li_admin.admin_no is '������ ��ȣ' ;
comment on column li_admin.admin_id is '������ ���̵�';
comment on column li_admin.admin_pw is '������ ��й�ȣ';
comment on column li_admin.admin_name is '������ �̸�';
comment on column li_admin.admin_email is '������ �̸���';

select * from li_admin;
commit;