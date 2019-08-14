--단축키 Alt + x : 실행

drop table login;

create table login (
userid varchar2(50) not null primary key,
passwd varchar2(50) not null,
name varchar2(50) not null,
email varchar2(50),
hp varchar2(50),
zipcode varchar2(7),
address1 varchar2(200),
address2 varchar2(200),
join_date date default sysdate
);


select * from login;

delete from login;

insert into login(userid,passwd,name,email) 
values('kim','1234','김철수','kim@naver.com');
insert into login(userid,passwd,name,email) 
values('hong','1234','홍길동','hong@nate.com');
insert into login(userid,passwd,name,email) 
values('choi','1234','최민수','choi@nate.com');
insert into login(userid,passwd,name,email,hp) 
values('abcd','1234','아무개','abcd@naver.com','010-1234-5678');
insert into login(userid,passwd,name,email,hp) 
values('abcd','1234','아무개','abcd@naver.com','010-1234-5678');
commit;

update login set 
name='장진우', email='jinwoo@naver.com', 
hp='01012341234'
where userid='kim';

select * from login where userid='kim' and passwd='1234';
select name from login where userid='kim' and passwd='1111';