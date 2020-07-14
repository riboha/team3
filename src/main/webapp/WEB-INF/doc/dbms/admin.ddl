-- 테이블 구조
DROP TABLE admin;
CREATE TABLE admin(
adminno             NUMBER(10)  NOT NULL  PRIMARY KEY, -- 관리자 번호
admin_id             VARCHAR2(100)  NOT NULL, -- 관리자 아이디
admin_passwd      VARCHAR2(100)  NOT NULL, -- 관리자 비밀번호
admin_mname      VARCHAR(30)   NOT NULL, -- 성명
admin_nickname   VARCHAR(30)   NOT NULL, -- 별명
admin_email        VARCHAR2(100)  NOT NULL, -- 관리자 이메일
admin_phone       VARCHAR(15)   NOT NULL, -- 관리자 전화번호
admin_mdate       DATE             NOT NULL -- 가입일    
);

COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.admin_id is '관리자 아이디';
COMMENT ON COLUMN admin.admin_passwd is '관리자 비밀번호';
COMMENT ON COLUMN admin.admin_mname is '성명';
COMMENT ON COLUMN admin.admin_nickname is '별명';
COMMENT ON COLUMN admin.admin_email is '관리자 이메일';
COMMENT ON COLUMN admin.admin_phone is '관리자 전화번호';
COMMENT ON COLUMN admin.admin_mdate is '가입일';


DROP SEQUENCE admin_seq;
CREATE SEQUENCE admin_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
 

1 등록
1) id 중복 확인
SELECT COUNT(admin_id) as cnt
FROM admin
WHERE admin_id='user1';
 
 cnt
 ---
   0   ← 중복 되지 않음.

2) 등록   
-- 관리자용 계정
INSERT INTO admin(adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate)
VALUES (admin_seq.nextval, 'qnaadmin', '1234', 'QNA관리자', 'QNA', 'QA@gmail.com', '000-0000-0000', sysdate);

INSERT INTO admin(adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate)
VALUES (admin_seq.nextval, 'crm', '1234', '고객관리자', '고객', 'crm@gmail.com', '000-0000-0001', sysdate);

INSERT INTO admin(adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate)
VALUES (admin_seq.nextval, 'notice', '1234', '공지사항관리자', '공지', 'notice@gmail.com', '000-0000-0002', sysdate);

commit;

2. 목록
-- 검색을 하지 않는 경우, 전체 목록 출력
SELECT adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate
FROM admin
ORDER BY adminno ASC;


3. 조회
1) admin1 관리자 정보 보기
SELECT adminno, admin_id, admin_passwd, admin_mname, admin_nickname, admin_email, admin_phone, admin_mdate
FROM admin
WHERE adminno = 4;

4. 수정
UPDATE admin
SET admin_nickname='QA'
WHERE adminno=4;


5. 패스워드 변경
1) 패스워드 검사
SELECT COUNT(adminno) as cnt
FROM admin
WHERE adminno=4 AND admin_passwd='1234';


2) 패스워드 수정
UPDATE admin
SET admin_passwd='0000'
WHERE adminno=4;


6. 삭제
1) 모두 삭제
DELETE FROM admin;

2) 특정 관리자 삭제
DELETE FROM admin
WHERE adminno=3;


7. 로그인
SELECT COUNT(adminno) as cnt
FROM admin
WHERE admin_id='qnaadmin' AND admin_passwd='1234';

 cnt
 ---
   0