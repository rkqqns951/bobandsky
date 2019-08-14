--LOB(Large OBject)�� TEXT,�׷���,�̹���,����,���� �� ����ȭ���� ���� ���� �����͸� ����� ����Ѵ�.
--CLOB: ���� ���� ��ü (Character). Oracle Server�� CLOB�� VARCHAR2 ���̿� �Ͻ��� ��ȯ�� �����Ѵ�
--BLOB: ���� ���� ��ü (Binary), �̹���, ������, MP3��

drop table bob; 

create table bob (
num number not null primary key, --�Խù���ȣ 
writer varchar2(50) not null, --�ۼ���
subject varchar2(50) not null, --����
passwd varchar2(60) not null, --����/���� ��� 
reg_date date default sysdate, --�ۼ����� 
readcount number default 0,	--��ȸ��
ref number not null,		--�Խù��׷� 
re_step number not null,		--�Խù��׷��� ���� 
re_level number not null,	--�亯 �ܰ�
content varchar2(4000) not null, --����
ip varchar2(30) not null,	--�ۼ��� ip 
filename varchar2(200),
filesize number default 0, 
down number default 0 --�ٿ�ε� Ƚ��
);

select * from bob;

insert into bob
(num,writer,subject,passwd,ref,re_step,re_level,content,ip) 
values
( (select nvl(max(num)+1,1) from bob)
  ,'������','����','admin'
  ,(select nvl(max(num)+1,1) from bob)
  ,1,0,'����','127.0.0.1');

select * from bob order by num desc;

commit;
--3�� �Խù��� ÷������ �̸�
select filename
from bob
where num=3;

--�ٿ�ε�� ���� ó��
update bob set down=down+1 where num=1; 
commit;

--��ȸ�� ���� ó��
update board set readcount=readcount+1 where num=1;

commit;

--1�� �Խù��� ���� ��ȸ
select * from bob where num=1;

delete from bob; 

drop table bob_comment;

--��� ���̺�
-- references ���̺�(�÷�)	Foreign Key(�ܷ�Ű) 
create table bob_comment (
comment_num number not null primary key, --��� �Ϸù�ȣ 
bob_num number not null references bob(num), --Foreign Key 
writer varchar2(50) not null,
content clob not null, --ū������ ó���� �� �ְ� clob�� �ẻ��.
reg_date date default sysdate
);

--1�� �Խù��� ��� �߰�  (���� 100���� ���� ���� ������ �������� ������ foreign key�����߾���)
insert into bob_comment
(comment_num,bob_num,writer,content) values
((select nvl(max(comment_num)+1,1) from bob_comment)
, 1, 'kim', '���...');
--������ insert�غ�

commit;
--1�� �Խù��� ��� ��ȸ 
select * from bob_comment where bob_num=1
order by comment_num;

delete from bob_comment;

--1�� �Խù��� ��� ����
select count(*) from bob_comment where bob_num=1;

--�ڹٿ��� while�� �������� ���������� ���������� ó��
select num,writer,subject,reg_date,readcount
,filename,filesize,down
,(select count(*) from bob_comment 
where bob_num=num) comment_count
from bob
order by num desc;

--�������� ���
select num,writer,subject,reg_date,readcount
,(select count(*) from bob_comment where bob_num=b.num) comment_count
,filename,filesize,down ,ref,re_step,re_level from bob b
order by ref desc, re_step asc;

--÷������ �̸� ��ȸ
select filename from bob where num=1;

--�ٿ�ε� Ƚ�� ���� ó��
update bob set down=down+1 where num=1; 
select * from bob where num=1;
delete from bob;
delete from bob_comment;

--��й�ȣ üũ(14�� �Խù��� ��й�ȣ Ȯ��) 
select passwd from bob
where num=1 and passwd='1234';

--14�� �Խù� ���� update board
set  writer='kim', subject='����...', content='	'
where num=14;
select * from bob where num=14;

--affected rows : ������ ���� ���� ��
--	insert,delete,update

--�˻�
select * from bob where writer like '%kim%'; 
select * from bob where subject like '%����%'; 
select * from bob where content like '%����%';
select * from bob
where writer like '%kim%' or content like '%park%'; 

--�̸�+����+���� 
select * from bob
where writer like 'kim%' or subject like 'kim%' or content like 'kim%';

--union(������)
select * from bob where writer like 'kim%' union
select * from bob where subject like 'kim%' union
select * from bob where content like 'kim%';

--�Խù� ���
select num,writer,subject,reg_date,readcount
,(select count(*) from bob_comment 
where bob_num=b.num) comment_count
,filename,filesize,down ,ref,re_step,re_level from bob b
order by ref desc, re_step asc;

--�Խù� ��� ������ ������ 
select * from (
select rownum as rn, A.* from (
select num,writer,subject,reg_date,readcount
,(select count(*) from bob_comment where bob_num=b.num) comment_count
,filename,filesize,down ,ref,re_step,re_level from bob b
order by ref desc, re_step asc) A
) where rn between 1 and 10;

--��ü ���ڵ�  ī��Ʈ 
select count(*) from bob;

--�˻��� ���ڵ� ī��Ʈ
select count(*) from bob where writer like '%kim%';


alter table bob add show char(1) default 'y';

rollback; 
commit;

