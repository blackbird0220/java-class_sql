create database kh;
show databases;
use kh;

-- member 테이블 생성 --
create table member(id varchar(12),
pw varchar(12), name varchar(20), ad varchar(100), tel varchar(20), 
reg_date datetime default current_timestamp); -- oracle

alter table member modify id varchar(12) primary key;

insert into member values('bgh', 'a1234', '배곤희', '신사동912', '010-1111-2222', '2023-09-13');
insert into member values ('yhj', 'a3421', '유정환', '강일동 128', '02-2222-3333', '2023-09-13');
insert into member values ('lmk', 'b1111', '이민규', '수유동 1004', '010-3333-4444', '2023-09-14');
insert into member values ('lsh', 'c456', '이성하', '화곡1동 37', '010-4444-5555', '2023-09-15');
insert into member values ('lyj', 'z675', '이연정', '난곡동 67', '02-4444-2222', '2023-09-11');
insert into member values ('lyl', 'q789', '이예린', '능동 13', '010-5555-6666', '2023-09-15');
insert into member values ('lws', 'g478', '이원석', '고척1동 178', '010-6666-7777', '2023-09-13');
insert into member values ('ljh', 'd666', '이정희', '독산1동 75', '010-7777-8888', '2023-09-14');
insert into member values ('ljw', 'e964', '이종우', '상계동 777', '02-5555-2222', '2023-09-05');
insert into member values ('jib', 'h369', '장인범', '쌍문3동 888', '010-8888-9999', '2023-09-16');

desc member;
select * from member;



-- book 테이블 생성 --
create table book(bid int auto_increment primary key, bkind varchar(6) not null , btitles varchar(50) not null , 
bprice int not null, bcount int not null, author varchar(40), pubcom varchar(40), pdate datetime);

desc book;

insert into book values(default, 'IT', '이것이 자바다', 30000, 10, '신용권', '한빛미디어', '2021-08-20');
insert into book values (default, 'IT', '이것이 자바다', 30000, 10, '신용권', '한빛미디어', '2021-08-20');
insert into book values (default, 'IT', '자바웹개발워크북', 31500, 19, '구멍가게코딩단', '남가람북스','2022-08-04');
insert into book values (default, 'NV', '하얼빈', 14400, 15, '김훈', '문학동네', '2022-08-03');
insert into book values (default, 'NV', '불편한 편의점', 12600, 10, '김호연', '나무옆의자', '2022-08-10');
insert into book values (default, 'DV', '역행자', 15750, 8, '웅진출판', '웅진출판', '2022-05-30');
insert into book values (default, 'DV', '자소서바이블', 18000, 15, '엔알디', '엔알디','2022-08-25');
insert into book values (default, 'HC', '벌거벗은 한국사', 17500, 10, 'tvn', '프런트페이지', '2022-08-22');
insert into book values (default, 'HC', '난중일기', 14000, 30, '이순신', '스타북스', '2022-07-27');
insert into book values (default, 'TC', '진짜쓰는실무엑셀', 20000, 10, '전진권', '제이펍', '2022-02-15');
insert into book values (default, 'TC', '빅테이터인공지능', 25000, 15, '박해선', '한빛미디어','2022-12-21');

select * from book;

create table sales (sno int auto_increment primary key, bno int not null, 
id varchar(12) not null, amount int default 1 not null, money int, 
sdate datetime default current_timestamp);

insert into sales values (default, 1, 'bgh', 1, null, sysdate);
insert into sales values (default, 2, 'lmk', 1, null, sysdate);
insert into sales values (default, 1, 'lsh', 2, null, sysdate);
insert into sales values (default, 9, 'lyj', 1, null, sysdate);
insert into sales values (default, 2, 'lyl', 5, null, sysdate);
insert into sales values (default, 2, 'ljh', 3, null, sysdate);
insert into sales values (default, 3, 'ljw', 2, null, sysdate);
insert into sales values (default, 5, 'jib', 4, null, sysdate);
insert into sales values (default, 4, 'lmk', 8, null, sysdate);
insert into sales values (default, 1, 'bgh', 3, null, sysdate);
insert into sales values (default, 2, 'lmk', 4, null, sysdate);
insert into sales values (default, 7, 'lyl', 1, null, sysdate);
insert into sales values (default, 8, 'ljw', 2, null, sysdate);
insert into sales values (default, 10, 'lib', 5, null, sysdate);
insert into sales values (default, 1, 'lmk', 3, null, sysdate);
insert into sales values (default, 2, 'jib', 2, null, sysdate);
insert into sales values (default, 2, 'lyj', 1, null, sysdate);
insert into sales values (default, 1, 'jib', 3, null, sysdate);

-- show variable like '%dir';
-- SET SQL_SAFE_UPDATE = 0;  -- update시 검색하여 갱신하는 작업을 보호하는 것 해제
-- SET SQL_SAFE_UPDATE = 1;  -- update시 검색하여 갱신하는 작업을 보호하는 것 설정

select bprice from book where bid in (select bno from sales);

select a bookprice from book a inner join sales b on a.bid=b.bno;

update sales set money=(select bprice from book where book.bid=sales.bno)*amount;

update sales inner join book on sales.bno = book.bid set sales.money = 
book.bprice * sales.amount where sales.bno = book.bid;

commit;
-- SET AUTOCOMMIT = FALSE;
-- SET AUTOCOMMIT = TRUE;

select * from sales;

desc book;