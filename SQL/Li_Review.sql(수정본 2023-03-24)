-- select * from Li_review;
-- drop table Li_review;
-- 외래키가 잡히지 않은 테스트상태

CREATE TABLE Li_Review(
    review_no NUMBER(4) null,
    review_name varchar2(60) null,
    review_title varchar2(100) null,
    review_content CLOB null,
    review_date DATE null,
    review_update DATE NULL,
    review_status NUMBER(2) null,
    review_img VARCHAR2(50) NULL,
    review_thumb_file VARCHAR2(50) NULL,
    review_rating number(2) null,
    review_recommend varchar2(40) null,
    -- review_rating_total varchar2(30),
    
    -- 추후 변경예정(외래키)
    r_no number(4),
    history_no number(4),
    user_img varchar2(50) null,
    review_c_no NUMBER(8) null,
    user_no NUMBER(8) NULL,
    c_name varchar2(50) null,
    c_no number(10) null,
    
    -- CONSTRAINT review_c_no FOREIGN KEY(review_c_no) REFERENCES Li_class (c_no)  -- 클래스 번호(클래스 테이블 외래키)
    -- CONSTRAINT fk_user_no FOREIGN KEY(review_user_no) REFERENCES li_user (user_no)   -- 회원 번호  (회원 테이블 외래키)
);



COMMENT ON TABLE Li_Review is  '후기 게시판 테이블';
COMMENT ON COLUMN Li_Review.review_no is '후기 게시글 번호';
COMMENT ON COLUMN Li_Review.review_name is '후기 작성자명';
COMMENT ON COLUMN Li_Review.review_title is '후기 제목';
COMMENT ON COLUMN Li_Review.review_content is '후기 내용';
COMMENT ON COLUMN Li_Review.review_date is '후기 작성일';
COMMENT ON COLUMN Li_Review.review_update is '후기 수정일';
COMMENT ON COLUMN Li_Review.review_status is ' 후기 상태(0,1)';
COMMENT ON COLUMN Li_Review.review_img is '후기 사진명';
COMMENT ON COLUMN Li_Review.review_thumb_file is '후기 썸네일명';
COMMENT ON COLUMN Li_Review.review_rating is '후기 별점';
COMMENT ON COLUMN Li_Review.review_recommend is '후기 추천';


-- 추후 변경예정(외래키)
COMMENT ON COLUMN Li_Review.r_no is '수강내역 글번호';
COMMENT ON COLUMN Li_Review.history_no is '수강내역 글번호';
COMMENT ON COLUMN Li_Review.user_img is '유저 프로필 사진';
COMMENT ON COLUMN Li_Review.c_name is '클래스 명';
COMMENT ON COLUMN Li_Review.c_no is '클래스 번호';
COMMENT ON COLUMN Li_Review.user_no is '회원번호';


 DROP SEQUENCE Li_review_seq;
-- Review 테이블 시퀀스
CREATE SEQUENCE Li_review_seq
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;

-- Test Insert(더미 데이터)
create or replace procedure reviewProcedure
is
begin
    for cnt in 1..30 loop
        insert into Li_review (review_no, review_title, review_content, review_date, review_recommend, review_rating, c_no)
        values(li_review_seq.nextval, '1', '1', sysdate, 'no' , 2, '1234');
    end loop;
    commit;
end;
/
show error;
EXECUTE reviewProcedure;
