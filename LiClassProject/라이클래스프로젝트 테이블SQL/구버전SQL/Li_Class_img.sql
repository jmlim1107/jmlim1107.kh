--클래스 이미지(Li_Class_img)      (update 23.03.23)
create table li_class_img (
    c_img_no number not null,                            --사진번호
    c_no number not null,                                --클래스 번호
    c_img_file varchar2(500) not null,                   --이미지 이름
    thumb_file varchar2(500) not null,                   --썸네일 이름
    c_img_date date default sysdate not null,            --이미지 등록일
    constraint li_class_img_pk primary key(c_img_no),
    constraint li_class_img_uk unique(c_img_file),
    constraint li_class_img_fk foreign key(c_no) references li_class(c_no)
);
comment on table li_class_img is '클래스 이미지 테이블';
comment on column li_class_img.c_img_file is '이미지 이름';
comment on column li_class_img.thumb_file is '썸네일 이름';
comment on column li_class_img.c_img_date is '이미지 등록일';

--사진 번호 시퀀스
create sequence li_class_img_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;

--********** 테이블 변경내용 : DDL문에 모두 반영해놓았습니다! **********
--alter table li_class_img drop constraint LI_CLASS_IMG_UK2;
--************************************************************************

select * from li_class_img;
