--Ŭ���� �̹���(Li_Class_img)      (update 23.03.23)
create table li_class_img (
    c_img_no number not null,                            --������ȣ
    c_no number not null,                                --Ŭ���� ��ȣ
    c_img_file varchar2(500) not null,                   --�̹��� �̸�
    thumb_file varchar2(500) not null,                   --����� �̸�
    c_img_date date default sysdate not null,            --�̹��� �����
    constraint li_class_img_pk primary key(c_img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is 'Ŭ���� �̹��� ���̺�';
comment on column li_class_img.c_img_file is '�̹��� �̸�';
comment on column li_class_img.thumb_file is '����� �̸�';
comment on column li_class_img.c_img_date is '�̹��� �����';

--���� ��ȣ ������
create sequence li_class_img_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;

--********** ���̺� ���泻�� : DDL���� ��� �ݿ��س��ҽ��ϴ�! **********
--alter table li_class_img drop constraint LI_CLASS_IMG_UK2;
--************************************************************************

select * from li_class_img;
