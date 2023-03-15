-- select * from Li_review;
-- drop table Li_review;
-- 외래키가 잡히지 않은 테스트상태(2023/03/14)

CREATE TABLE Li_Review(
    review_no NUMBER(4),
    review_name varchar2(30),
    review_content CLOB,
    review_date DATE,
    review_update DATE,
    review_status NUMBER(2),
    review_img VARCHAR2(50),
    review_thumb_file VARCHAR2(50),
    CONSTRAINT review_c_no FOREIGN KEY(review_c_no) REFERENCES li_class (c_no),   -- 클래스 번호(클래스 테이블 외래키)
    CONSTRAINT review_user_no FOREIGN KEY(review_user_no) REFERENCES li_user (user_no)   -- 회원 번호  (회원 테이블 외래키)
);



COMMENT ON TABLE Li_Review is  '후기 게시판 테이블';
COMMENT ON COLUMN Li_Review.review_no is '후기 게시글 번호';
COMMENT ON COLUMN Li_Review.review_name is '후기 작성자명';
COMMENT ON COLUMN Li_Review.review_content is '후기 내용';
COMMENT ON COLUMN Li_Review.review_date is '후기 작성일';
COMMENT ON COLUMN Li_Review.review_update is '후기 수정일';
COMMENT ON COLUMN Li_Review.review_status is ' 후기 상태(0,1)';
COMMENT ON COLUMN Li_Review.review_img is '후기 사진명';
COMMENT ON COLUMN Li_Review.review_thumb_file is '후기 썸네일명';
COMMENT ON COLUMN Li_Review.c_no is '클래스 번호';
COMMENT ON COLUMN Li_Review.user_no is '회원번호';

-- (회원관리) 리뷰게시글 번호
CREATE SEQUENCE Li_review_seq
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;

