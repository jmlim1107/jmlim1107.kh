create table li_payment(            -- 결제 테이블
    merchant_uid    varchar2(50)  not null, -- 주문번호
    r_no            number        not null, -- 예약번호
    user_no         varchar2(50)  not null, -- 회원번호
    pay_pg          varchar2(50)  not null, -- pg사 구분코드
    pay_method      varchar2(50)  not null, -- 결제수단 구분코드
    pay_name        varchar2(50)  not null, -- 결제대상 제품명
    pay_price       number        not null, -- 결제금액
    pay_buyer_name  varchar2(30)  not null, -- 주문자명
    pay_buyer_tel   varchar2(50)  not null, -- 주문자 연락처
    pay_buyer_email varchar2(100) not null, -- 주문자 이메일
    pay_date        date default  sysdate,  -- 결제일자
    pay_status      number        not null,  -- 결제상태
    
    constraint li_payment_pk primary key(merchant_uid)
);

comment on table li_payment is '결제 테이블';
comment on column li_payment.merchant_uid    is '주문번호';
comment on column li_payment.r_no            is '예약번호';
comment on column li_payment.user_no         is '회원번호';
comment on column li_payment.pay_pg          is 'pg사 구분코드';
comment on column li_payment.pay_method      is '결제수단 구분코드';
comment on column li_payment.pay_name        is '결제대상 제품명';
comment on column li_payment.pay_price       is '결제금액';
comment on column li_payment.pay_buyer_name  is '주문자명';
comment on column li_payment.pay_buyer_tel   is '주문자 연락처';
comment on column li_payment.pay_buyer_email is '주문자 이메일';
comment on column li_payment.pay_date        is '결제일자';
comment on column li_payment.pay_status      is '결제상태';

create table li_refund(
    refund_no     number       not null, -- 환불번호
    merchant_uid  varchar2(50) not null, -- 주문번호
    user_no       varchar2(50) not null, -- 회원번호
    refund_date   date default sysdate,  -- 환불일자
    refund_price  number       not null, -- 환불금액
    refund_method varchar2(50) not null, -- 환불수단
    refund_status number       not null,  -- 환불상태
    
    constraint li_refund_pk primary key(refund_no),
    constraint li_refund_fk foreign key(merchant_uid) references(li_payment),
    constraint li_refund_fk foreign key(user_no) references(li_user)
);

comment on table li_refund is '환불 테이블';
comment on column li_refund.refund_no     is '환불번호';
comment on column li_refund.merchant_uid  is '주문번호';
comment on column li_refund.user_no       is '회원번호';
comment on column li_refund.refund_date   is '환불일자';
comment on column li_refund.refund_price  is '환불금액';
comment on column li_refund.refund_method is '환불수단';
comment on column li_refund.refund_status is '환불상태';
