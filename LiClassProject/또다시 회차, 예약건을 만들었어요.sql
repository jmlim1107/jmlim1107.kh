drop sequence li_episode_seq;
create sequence li_episode_seq
start with 80
increment by 1
minvalue 1
nocycle
nocache;

insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 74, 1 , 54000, to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'),6,'누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 75, 1 , 54000, to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'),6,'누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 76, 2 , 30000, to_date('2023/03/27 14:00','yyyy/mm/dd hh24:mi'),4,'홈카페의 시작, 핸드드립 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 77, 2 , 30000, to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'),4,'홈카페의 시작, 핸드드립 원데이 클래스'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 78, 3 , 25000, to_date('2023/03/22 14:00','yyyy/mm/dd hh24:mi'),4,'따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기'); 
insert into li_episode(ep_no, c_no, ep_price, ep_date, ep_cnt, c_title)
values( 79, 3 , 25000, to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'),4,'따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기'); 


insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 38, 9205045442, 74, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 39, 2304047208, 74, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 40, 2304041631, 74, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 41, 2304048567, 74, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 42, 2304049273, 74, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 43, 2304043265, 74, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 11:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 44, 2304042574, 75, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 45, 2304046623, 75, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 46, 2304046837, 75, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 47, 2304047291, 75, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 48, 2304048961, 75, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 49, 2304045019, 75, '누구나 금손이 되는 프리저브드 플라워 꽃다발 원데이 클래스', to_date('2023/03/18 15:00','yyyy/mm/dd hh24:mi'), 2, 1, 54000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 50, 2304044849, 76, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/27 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 51, 2304046834, 76, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/27 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 52, 2304049937, 76, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/27 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 53, 2304048469, 76, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/27 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 54, 2302282828, 77, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 55, 2001110723, 77, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 56, 2303290722, 77, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 57, 2303290612, 77, '홈카페의 시작, 핸드드립 원데이 클래스', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 30000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 58, 2303290612, 78, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/22 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 59, 2304044110, 78, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/22 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 60, 2304047208, 78, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/22 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 61, 2303290625, 78, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/22 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );

insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 62, 9205045442, 79, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 63, 2001110723, 79, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 64, 2302282828, 79, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
insert into li_reserve(r_no, user_no, ep_no, c_title, r_date, r_state, r_cnt, r_price)
values( 65, 2303290722, 79, '따뜻한 감성, 시나몬 캔들, 왁스타블렛 만들기', to_date('2023/03/29 14:00','yyyy/mm/dd hh24:mi'), 2, 1, 25000 );
