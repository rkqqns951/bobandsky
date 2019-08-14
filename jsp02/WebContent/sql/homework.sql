CREATE OR REPLACE PACKAGE PACK_ENCRYPTION_DECRYPTION
IS
FUNCTION FUNC_ENCRYPT -- 암호화를 위한 함수
(V_INPUT_STRING IN VARCHAR2, KEY_DATA IN VARCHAR2:='java1234$!')
RETURN RAW;
FUNCTION FUNC_DECRYPT -- 복호화를 위한 함수
(V_INPUT_STRING IN VARCHAR2, KEY_DATA IN VARCHAR2:='java1234$!')
RETURN VARCHAR2;
END PACK_ENCRYPTION_DECRYPTION;
/

--3. 패키지 구현
CREATE OR REPLACE PACKAGE BODY PACK_ENCRYPTION_DECRYPTION
IS
FUNCTION FUNC_ENCRYPT
( V_INPUT_STRING IN VARCHAR2,
KEY_DATA IN VARCHAR2 := 'java1234$!'
) RETURN RAW
IS
V_ORIGINAL_RAW RAW(64);
V_KEY_DATA_RAW RAW(64);
ENCRYTED_RAW RAW(64);
BEGIN
-- INPUT값을 RAW 타입으로 변경
V_ORIGINAL_RAW := UTL_I18N.STRING_TO_RAW(V_INPUT_STRING,
'AL32UTF8');
--키 또한 RAW 타입으로 변경.
V_KEY_DATA_RAW := UTL_I18N.STRING_TO_RAW(KEY_DATA, 'AL32UTF8');
ENCRYTED_RAW := DBMS_CRYPTO.ENCRYPT(
SRC => V_ORIGINAL_RAW,
TYP => DBMS_CRYPTO.DES_CBC_PKCS5,
KEY => V_KEY_DATA_RAW,
IV => NULL);
RETURN ENCRYTED_RAW;
END FUNC_ENCRYPT;
FUNCTION FUNC_DECRYPT
( V_INPUT_STRING IN VARCHAR2,
KEY_DATA IN VARCHAR2 := 'java1234$!'
) RETURN VARCHAR2
IS
V_KEY_DATA_RAW RAW(64);
DECRYPTED_RAW RAW(64);
CONVERTED_STRING VARCHAR2(64);
BEGIN
V_KEY_DATA_RAW := UTL_I18N.STRING_TO_RAW(KEY_DATA, 'AL32UTF8');
DECRYPTED_RAW := DBMS_CRYPTO.DECRYPT(
SRC => V_INPUT_STRING,
TYP => DBMS_CRYPTO.DES_CBC_PKCS5,
KEY => V_KEY_DATA_RAW,
IV => NULL);
CONVERTED_STRING := UTL_I18N.RAW_TO_CHAR(DECRYPTED_RAW,
'AL32UTF8');
RETURN CONVERTED_STRING;
END FUNC_DECRYPT;
END PACK_ENCRYPTION_DECRYPTION;
/

--4. java 계정,hr계정으로 로그인하여 회원 테이블 생성(기존 테이블은 삭제)
drop table homework;

create table homework (
userid varchar2(50) not null primary key,
passwd varchar(64) not null, --varchar2가 아닌 varchar로 설정
name varchar2(50) not null,
email varchar2(50),
hp varchar2(50),
zipcode varchar2(7),
address1 varchar2(200),
address2 varchar2(200),
join_date date default sysdate
);

insert into homework (userid,passwd,name) values
('kim',PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'),'김숙제');
insert into homework (userid,passwd,name) values
('park',PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'),'최숙제');
insert into homework (userid,passwd,name) values
('hong',PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234'),'홍숙제');

--6. 회원정보 확인
select * from homework;

--7. 로그인 테스트
select * from homework where userid='kim'
and passwd=PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT('1234');

select * from homework where userid='kim' and passwd='1234'; --안나옴

--8. 복호화 테스트
select userid, PACK_ENCRYPTION_DECRYPTION.FUNC_DECRYPT(passwd) from
homework;
