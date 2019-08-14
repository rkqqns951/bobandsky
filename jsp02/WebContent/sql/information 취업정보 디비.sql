--LOB(Large OBject)�� TEXT,�׷���,�̹���,����,���� �� ����ȭ���� ���� ���� �����͸� ����� ����Ѵ�.
--CLOB: ���� ���� ��ü (Character). Oracle Server�� CLOB�� VARCHAR2 ���̿� �Ͻ��� ��ȯ�� �����Ѵ�
--BLOB: ���� ���� ��ü (Binary), �̹���, ������, MP3��

drop table information; 

--���� ���̺�
create table information (
idx int not null primary key, --�Խù� �Ϸ� ��ȣ
name varchar2(50) not null, --�̸�
email varchar2(50) not null, --�̸���
passwd varchar2(50) not null, --���������� ���
content varchar2(2000) not null, --����,
--varchar2�� 4000byte�� ��, ������ �̻� �Ѿ�� clob(4GB)�� ����ؾ��� 
-- ex)content clob not null,
post_date date default sysdate --�ۼ��Ͻ�
);

drop sequence information_seq; 
-- �Խù� �Ϸù�ȣ �ο��� ���� ������  ����
create sequence guestbook_seq
start with 1 --1���� ����
increment by 1 --1�� ����
nomaxvalue --������ ����
nocache; --ĳ�� ��� ���� (�⺻���� ��������� �Ǿ�����)
--ĳ���� ����ϸ� ��ȣ�� �߸� �Էµ� �� ����(������ �߿��� ��� nocache��� )
/* cach�ɼ��� ����ϸ� �ӵ��� ������Ű�� ���� sequence ��ȣ�� �ѹ��� 
 *  ���� ���� �޸𸮿� �÷����� �۾��� �Ѵ�. �̷��� ��쿡 DB�� ������Ű�ų� 
 *  ������ off�Ǵ� ��쿡 �޸𸮿� �ִ� ��ȣ�� �����Ǳ� ������ ��ġ�ʴ� ��ȣ�� ������ �� �ִ� */

-- ������.nextval ==> ���� ��ȣ �߱�
-- ���� �׽�Ʈ ���ڵ� �߰�
insert into information (idx, name, email, passwd, content) values
( information_seq.nextval, 'kim', 'kim@daum.net', '1234', 'ù��° �Խù�'); 
-- ���� ����Ʈ
select * from information; 
commit;
--��й�ȣ üũ
select count(*) from information where idx=1 and passwd='1234'; 

-- ���� ����/���� ȭ��
select * from INFORMATION where idx=1; -- ����
update INFORMATION
set name='��̼�', email='kim@naver.com', passwd='2222', content = '...'
where idx=1; 

--����
delete from information where idx=17; 

--��� ���ڵ� ����
delete from information;



