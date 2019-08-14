--LOB(Large OBject)은 TEXT,그래픽,이미지,비디오,사운드 등 구조화되지 않은 대형 데이터를 저장시 사용한다.
--CLOB: 문자 대형 객체 (Character). Oracle Server는 CLOB과 VARCHAR2 사이에 암시적 변환을 수행한다
--BLOB: 이진 대형 객체 (Binary), 이미지, 동영상, MP3등

drop table bob; 

create table bob (
num number not null primary key, --게시물번호 
writer varchar2(50) not null, --작성자
subject varchar2(50) not null, --제목
passwd varchar2(60) not null, --수정/삭제 비번 
reg_date date default sysdate, --작성일자 
readcount number default 0,	--조회수
ref number not null,		--게시물그룹 
re_step number not null,		--게시물그룹의 순번 
re_level number not null,	--답변 단계
content varchar2(4000) not null, --본문
ip varchar2(30) not null,	--작성자 ip 
filename varchar2(200),
filesize number default 0, 
down number default 0 --다운로드 횟수
);

select * from bob;

insert into bob
(num,writer,subject,passwd,ref,re_step,re_level,content,ip) 
values
( (select nvl(max(num)+1,1) from bob)
  ,'관리자','제목','admin'
  ,(select nvl(max(num)+1,1) from bob)
  ,1,0,'내용','127.0.0.1');

select * from bob order by num desc;

commit;
--3번 게시물의 첨부파일 이름
select filename
from bob
where num=3;

--다운로드수 증가 처리
update bob set down=down+1 where num=1; 
commit;

--조회수 증가 처리
update board set readcount=readcount+1 where num=1;

commit;

--1번 게시물에 대한 조회
select * from bob where num=1;

delete from bob; 

drop table bob_comment;

--댓글 테이블
-- references 테이블(컬럼)	Foreign Key(외래키) 
create table bob_comment (
comment_num number not null primary key, --댓글 일련번호 
bob_num number not null references bob(num), --Foreign Key 
writer varchar2(50) not null,
content clob not null, --큰내용을 처리할 수 있게 clob을 써본다.
reg_date date default sysdate
);

--1번 게시물에 댓글 추가  (만약 100번에 대한 글이 없으면 에러나기 때문에 foreign key설정했었음)
insert into bob_comment
(comment_num,bob_num,writer,content) values
((select nvl(max(comment_num)+1,1) from bob_comment)
, 1, 'kim', '댓글...');
--여러번 insert해봄

commit;
--1번 게시물의 댓글 조회 
select * from bob_comment where bob_num=1
order by comment_num;

delete from bob_comment;

--1번 게시물의 댓글 갯수
select count(*) from bob_comment where bob_num=1;

--자바에서 while문 쓰지말고 쿼리문에서 서브쿼리로 처리
select num,writer,subject,reg_date,readcount
,filename,filesize,down
,(select count(*) from bob_comment 
where bob_num=num) comment_count
from bob
order by num desc;

--서브쿼리 사용
select num,writer,subject,reg_date,readcount
,(select count(*) from bob_comment where bob_num=b.num) comment_count
,filename,filesize,down ,ref,re_step,re_level from bob b
order by ref desc, re_step asc;

--첨부파일 이름 조회
select filename from bob where num=1;

--다운로드 횟수 증가 처리
update bob set down=down+1 where num=1; 
select * from bob where num=1;
delete from bob;
delete from bob_comment;

--비밀번호 체크(14번 게시물의 비밀번호 확인) 
select passwd from bob
where num=1 and passwd='1234';

--14번 게시물 수정 update board
set  writer='kim', subject='제목...', content='	'
where num=14;
select * from bob where num=14;

--affected rows : 영향을 받은 행의 수
--	insert,delete,update

--검색
select * from bob where writer like '%kim%'; 
select * from bob where subject like '%제목%'; 
select * from bob where content like '%내용%';
select * from bob
where writer like '%kim%' or content like '%park%'; 

--이름+제목+내용 
select * from bob
where writer like 'kim%' or subject like 'kim%' or content like 'kim%';

--union(합집합)
select * from bob where writer like 'kim%' union
select * from bob where subject like 'kim%' union
select * from bob where content like 'kim%';

--게시물 목록
select num,writer,subject,reg_date,readcount
,(select count(*) from bob_comment 
where bob_num=b.num) comment_count
,filename,filesize,down ,ref,re_step,re_level from bob b
order by ref desc, re_step asc;

--게시물 목록 페이지 나누기 
select * from (
select rownum as rn, A.* from (
select num,writer,subject,reg_date,readcount
,(select count(*) from bob_comment where bob_num=b.num) comment_count
,filename,filesize,down ,ref,re_step,re_level from bob b
order by ref desc, re_step asc) A
) where rn between 1 and 10;

--전체 레코드  카운트 
select count(*) from bob;

--검색된 레코드 카운트
select count(*) from bob where writer like '%kim%';


alter table bob add show char(1) default 'y';

rollback; 
commit;

