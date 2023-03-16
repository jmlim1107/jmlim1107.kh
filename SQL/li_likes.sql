-- ����Ŭ����(li_likes)      (update 23.03.16)  
create table li_likes (
	like_no	number NOT NULL,
    like_date date DEFAULT sysdate NOT NULL,
	user_no number(10) NOT NULL,
	class_no number NOT NULL,
    
   	constraint like_no_pk primary key(like_no),
   	constraint user_no_fk foreign key(user_no) references li_user(user_no)
    constraint class_no_fk foreign key(class_no) references li_class(class_no)
);

--drop table li_likes;
    
comment on table li_likes is '����Ŭ���� ���̺�';
comment on column li_likes.like_no is '����Ŭ������ȣ';
comment on column li_likes.like_date is '����Ŭ�����������';
comment on column li_likes.user_no is 'ȸ����ȣ';
comment on column li_likes.class_no is 'Ŭ�����̸�';

