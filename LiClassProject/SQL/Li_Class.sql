-- 클래스(Li_Class)생성 (update 23.03.23)                                                     
create table li_class (
	c_no number not null,                   --클래스 번호
    ct_bizno varchar2(30) not null,         --사업자 등록번호
    c_title varchar2(1000) not null,        --클래스 제목
    c_content clob not null,                --클래스 소개글
    c_category varchar2(10) not null,       --클래스 카테고리 ( 0.공예, 1.요리, 2.미술, 3.플라워, 4.뷰티, 5.체험및기타 )
    c_level varchar2(3) not null,           --클래스 난이도
    c_area varchar2(100) not null,          --클래스 지역
    c_luv number default 0 not null,        --클래스 관심수
    c_leadtime number not null,             --클래스 소요시간
    c_maxcnt number not null,               --클래스 최대인원
    c_mincnt number default 1 not null,     --클래스 최소인원
    c_date date default sysdate not null,   --클래스 등록일자
    c_state number default 0 not null,      --클래스 상태 ( 0:등록완료/예약가능, 1:삭제/예약불가 )
   	constraint li_class_pk primary key(c_no),
   	constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno)
);
comment on table li_class is '클래스 테이블';
comment on column li_class.c_no is '클래스 번호';
comment on column li_class.c_title is '클래스 제목';
comment on column li_class.c_content is '클래스 소개글';
comment on column li_class.c_category is '클래스 카테고리';
comment on column li_class.c_level is '클래스 난이도';
comment on column li_class.c_area is '클래스 지역';
comment on column li_class.c_luv is '클래스 관심수';
comment on column li_class.c_leadtime is '클래스 소요시간';
comment on column li_class.c_maxcnt is '클래스 최대인원';
comment on column li_class.c_mincnt is '클래스 최소인원';
comment on column li_class.c_date is '클래스 등록일자';

--클래스 번호 시퀀스
create sequence li_class_seq
increment by 1
start with 1
minvalue 1
nocycle
nocache;

--********** 테이블 변경내용 : DDL문에 모두 반영해놓았습니다! **********
--컬럼 변경(update 23.03.15)
--alter table li_class modify c_title varchar2(1000);
--alter table li_class modify c_level varchar2(3);
--alter table li_class modify c_area varchar2(100);
--alter table li_class modify c_luv number default 0;
--alter table li_class modify ct_bizno varchar2(30);
--칼럼 삭제(update 23.03.18)
--alter table li_class drop column c_state;
--제약조건 추가(update 23.03.19)
--alter table li_class add constraint li_class_fk foreign key(ct_bizno) references li_center(ct_bizno);
--************************************************************************

--********** sample data **********--
create or replace procedure class_insert1
is
begin
    for cnt in 1..30 loop
        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
        values( li_class_seq.nextval, 8584400500, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', '선물하기도 좋고 웨딩촬영, 브라이덜 샤워 등 사진촬영 소품으로도 쓰임새가 많은 꽃다발을 만들어요.
        시들지 않도록 보존처리된 프리저브드 플라워 꽃다발은 물을 주거나 번거로운 관리 없이도 오랜기간 이쁘게 볼 수 있어서 인테리어 소품으로도 좋고요 특별한 의미의 선물이라면 시들거나 변하지 않아서 받는 분이 
        오래오래 간직할 수 있습니다. 누군가에게 특별한 선물을 주고 싶다면 만드는 과정의 정성까지 담아 직접 만들어 보세요. 브라이덜 샤워나 우정 촬영 소품으로 친구들과 함께 준비하시면 좋은 추억이 되겠지요?',
        3, '중', '경기 수원시', 1, 6);
    end loop;
    commit;
end;
/
show error;
EXECUTE class_insert1;

create or replace procedure class_insert2
is
begin
    for cnt in 1..30 loop
        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
        values( li_class_seq.nextval, 8466400320, '홈카페의 시작, 핸드드립 원데이 클래스', 
        '홈카페의 시작.. 원두고르기 부터 맛있게 추출하는 방법까지 핸드드립 원데이 클래스! 지금 시작해 보세요~!
        남녀, 다양한 연령의, 커피에 관심있는 분들은 누구나 참여하실 수 있습니다!
        뜨거운 물을 다루어야 하고 커피의 특성상 고등학생 이상 수업이 가능합니다. 반려동물과 함께 수업참여는 불가합니다.
        다른날짜에 수업을 원하시는 경우 언제든 메세지로 문의해 주세요~가능한 시간에 최대한 맞춰드리고 있습니다~!
        (주말수업을 원하실 경우 메세지로 문의주세요)',
        1, '하', '경기 용인시', 2, 4);
    end loop;
    commit;
end;
/
show error;
EXECUTE class_insert2;


create or replace procedure class_insert3
is
begin
    for cnt in 1..30 loop
        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
        values( li_class_seq.nextval, 1304758832, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', 
        '자연스러운 멋이 있는 시나몬캔들, 왁스타블렛 클래스를 소개해 드립니다.
        -시나몬 캔들
        식물성 소이왁스로 캔들을 만들고 시나몬 스틱과 드라이플라워를 사용해 캔들을 원하는대로 꾸며보실 수 있는 클래스입니다. 
        유리 컨테이너에 만들어 사용하시기에도 편한 캔들이예요. :)
        
        -시나몬 왁스타블렛
        천연 왁스인 밀랍(비즈왁스)로 왁스 타블렛을 만들고 시나몬 스틱과 드라이플라워로 예쁘게 꾸며봅니다.
        왁스타블렛은 원하는 곳에 걸어두고 방향제로도 사용할 수 있어요. 좋은 향이 나는 예쁜 인테리어 소품 역할을 톡톡히 한답니다. :)',
        0, '하', '경기 부천시', 2, 4);
    end loop;
    commit;
end;
/
show error;
EXECUTE class_insert3;

create or replace procedure class_insert4
is
begin
    for cnt in 1..30 loop
        insert into li_class ( c_no, ct_bizno, c_title, c_content, c_category, c_level, c_area, c_leadtime, c_maxcnt)
        values( li_class_seq.nextval, 6306200298, '오래 기억되고싶은 향 나만의 명품 향수만들기 (퍼스널 50미리)', 
        '세상에 하나밖에 없는 명품 나만의향기를 선물하세요..
        - 명품향수를 베이스로 할용하고 나만의 향 30가지 중에 추가하여 세상에서 하나뿐인 향수를 만들 수 있습니다.
        + 향수 시향 후 페이퍼로 샤쉐처럼 이용할 수 있게 만들어드려요
        + 클래스 수강시 쿠폰 도장 꾹꾹꾹 방문하실때마다 혜택이 쏟아집니다.
        + 클래스 수강 후 똑같은 향을 또 즐기고싶다면, 택배로 발송 가능하다는 점!',
        4, '하', '경기 안양시', 1, 4);
    end loop;
    commit;
end;
/
show error;
EXECUTE class_insert4;
--*************************************************************************************************

select count(*) from li_class;
select * from li_class order by c_no desc;

