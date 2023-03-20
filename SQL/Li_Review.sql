-- select * from Li_review;
-- drop table Li_review;
-- 외래키가 잡히지 않은 테스트상태

-- 수정사항(23/03/15) : review_name 추가

CREATE TABLE Li_Review(
    review_no NUMBER(4) NOT NULL,
    review_name varchar2(60) NOT NULL,
    review_title varchar2(100) not null,
    review_content CLOB NOT NULL,
    review_date DATE NOT NULL,
    review_update DATE NULL,
    review_status NUMBER(2) NOT NULL,
    review_img VARCHAR2(50) NULL,
    review_thumb_file VARCHAR2(50) NULL,
    review_star NUMBER(1) NOT NULL,
    
    user_img varchar2(50) null,
    c_no NUMBER(8) NOT NULL,
    user_no NUMBER(8) NOT NULL
    -- CONSTRAINT fk_c_no FOREIGN KEY(review_c_no) REFERENCES li_class (c_no),   -- 클래스 번호(클래스 테이블 외래키)
    -- CONSTRAINT fk_user_no FOREIGN KEY(review_user_no) REFERENCES li_user (user_no)   -- 회원 번호  (회원 테이블 외래키)
);


-- Comment
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
COMMENT ON COLUMN Li_Review.review_star is '후기 별점';

-- Comment(외래키 잡고 수정될 부분)
COMMENT ON COLUMN Li_Review.user_img is '유저 프로필 사진';
COMMENT ON COLUMN Li_Review.c_no is '클래스 번호';
COMMENT ON COLUMN Li_Review.user_no is '회원번호';


-- Review 게시글 번호 시퀀스
CREATE SEQUENCE Li_review_seq
    INCREMENT BY 1
    START WITH 1
    MINVALUE 1
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
    NOORDER;


-- insert test
INSERT INTO LI_REVIEW(REVIEW_NO, REVIEW_NAME, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_DATE, REVIEW_UPDATE, REVIEW_STATUS, C_NO, USER_NO, USER_IMG)
VALUES(Li_review_seq.nextval, '임지민', '제목' , '안녕하세요', sysdate, NULL , 0, 12345678, 12345678, NULL);
