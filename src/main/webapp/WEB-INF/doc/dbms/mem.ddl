/**********************************/
/* Table Name: 회원 */
/**********************************/



-- ▷ 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE mem CASCADE CONSTRAINTS; 
 
-- ▷ 생성
CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_ID                        		VARCHAR2(60)		 NOT NULL UNIQUE,
		MEM_PW                        		VARCHAR2(60)		 NOT NULL,
		MEM_NAME                      		VARCHAR2(20)		 NOT NULL,
		MEM_NICK                      		VARCHAR2(20)		 NOT NULL UNIQUE,
		MEM_ADDR1                     		VARCHAR2(400)		 NULL ,
		MEM_ADDR2                     		VARCHAR2(400)		 NULL ,
		MEM_ZIP                       		VARCHAR2(10)		 NULL ,
		MEM_TEL                       		VARCHAR2(20)		 NOT NULL UNIQUE,
		MEM_PT                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		MEM_DATE                      		DATE		 NOT NULL,
		MEM_STS                       		NUMBER(1)		 DEFAULT 0		 NOT NULL,

		MEM_PIC_NAME_UP               		VARCHAR2(100)		 NULL ,
		MEM_PIC_TH                   		VARCHAR2(100)		 NULL ,
		MEM_PIC_SIZE                 		NUMBER(10)		 DEFAULT 0     NULL 
);

COMMENT ON TABLE MEM is '회원';
COMMENT ON COLUMN MEM.MEM_NO is '회원 번호';
COMMENT ON COLUMN MEM.MEM_ID is '아이디';
COMMENT ON COLUMN MEM.MEM_PW is '비밀번호';
COMMENT ON COLUMN MEM.MEM_NAME is '이름';
COMMENT ON COLUMN MEM.MEM_NICK is '닉네임';
COMMENT ON COLUMN MEM.MEM_ADDR1 is '주소1';
COMMENT ON COLUMN MEM.MEM_ADDR2 is '주소2';
COMMENT ON COLUMN MEM.MEM_ZIP is '우편번호';
COMMENT ON COLUMN MEM.MEM_TEL is '전화번호';
COMMENT ON COLUMN MEM.MEM_PT is '포인트';
COMMENT ON COLUMN MEM.MEM_DATE is '가입일';
COMMENT ON COLUMN MEM.MEM_STS is '회원 상태';
COMMENT ON COLUMN MEM.MEM_PIC_NAME_UP is '회원 사진 업로드명';
COMMENT ON COLUMN MEM.MEM_PIC_TH is '회원 사진 썸네일';
COMMENT ON COLUMN MEM.MEM_PIC_SIZE is '회원 사진 크기';


 
 -- ▷시퀀스 삭제
DROP SEQUENCE mem_seq;  
 

-- ▷ 시퀀스 생성
CREATE SEQUENCE mem_seq
    START WITH 1                     -- 시작 번호
    INCREMENT BY 1                -- 증가값
    MAXVALUE 9999999999      --최댓값:9999999999 → NUMBER(10) 대응
    CACHE 2                              -- 2번은 메모리에서 계산 (insert가 큰 데이터의 경우 캐시 값을 크게 잡기)
    NOCYCLE;                            -- 순환 x, 다시 1부터 생성되는 것을 방지
    



-- ▶ 등록
 
-- ▷ id 중복 확인

SELECT COUNT(mem_id) as cnt
FROM mem
WHERE mem_id='user1';
 
 cnt
 ---
   0   ← 중복 X
   
   delete * from mem;
   
-- ▷ 등록
 
INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user1', '1234', '고길동', '희동아빠', '12345', '서울시 종로구', '관철동', '010-4511-4757', 0, 0, sysdate);

INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user2', '1234', '밍키', '요술공주', '12345', '서울시 종로구', '관철동', '010-5511-4757',  '0', '0', sysdate);
             
INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user3', '1234', '앤', '빨간머리', '12345', '서울시 종로구', '관철동', '010-5571-4733', 0, 0, sysdate);
			 
INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user4', '1234', '체리', '카드캡터', '12345', '서울시 종로구', '관철동', '010-8511-4757',  '0', '0', sysdate );

INSERT INTO mem(mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date)
VALUES (mem_seq.nextval, 'user5', '1234', '푸', '곰돌이', '12345', '서울시 종로구', '관철동', '010-8585-4757',  '0', '0', sysdate );
 
 
 
 
-- ▶ 목록( mem_no 기준 내림 차순)

SELECT mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date, 
							mem_pic_name_up, mem_pic_th, mem_pic_size
FROM mem
ORDER BY mem_no DESC;



-- ▶ 목록( contentsno 기준 내림 차순, attachfileno 기준 오르차순)

SELECT mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date, 
							mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size
FROM mem
WHERE mem_no=9;



-- ▶삭제

-- ▷특정 멤버 삭제
DELETE FROM mem
WHERE mem_no = 9;

-- ▷전체 레코드 삭제
DELETE FROM mem;

COMMIT;
 

-- ▶패스워드 수정

SELECT COUNT(mem_no) as cnt
FROM mem
WHERE mem_no=7 AND mem_pw='1234' ;


-- ▶로그인

SELECT COUNT(*) as cnt
FROM mem
WHERE mem_id='user1' AND mem_pw='1234';

--ALTER TABLE mem ADD UNIQUE (mem_id);
--SELECT * FROM user_constraints WHERE table_name = 'MEM';

 
-- ▶ mem_id 이용 회원 정보 조회

SELECT mem_no, mem_id, mem_pw, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, mem_date, 
							mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size
FROM mem
WHERE mem_id = 'user1'



-- ▶ 검색 +  페이징
-- step 1
SELECT  mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
FROM mem
WHERE mem_id LIKE '%user%' 
ORDER BY mem_no DESC;

-- step 2
SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, rownum as r
FROM (
            SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
            FROM mem
            WHERE mem_id LIKE '%user%' 
            ORDER BY mem_no DESC
);

-- step 3, 1 page
SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, r
FROM (
            SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, rownum as r
            FROM (
                        SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
                        FROM mem
                        WHERE mem_id LIKE '%user%' 
                        ORDER BY mem_no DESC
            )      
)
WHERE r >= 1 AND r <= 10;

-- step 3, 2 page
SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, r
FROM (
            SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts, rownum as r
            FROM (
                        SELECT mem_no, mem_id, mem_name, mem_nick, mem_zip, mem_addr1, mem_addr2, mem_tel, mem_pt, mem_sts
                        FROM mem
                        WHERE mem_id LIKE '%user%' 
                        ORDER BY mem_no DESC
            )      
)
WHERE r >= 11 AND r <= 20;


-- ▶ 수정
  UPDATE mem 
  SET mem_pw=1234, mem_tel='010-1111-1234', mem_zip=1235
  WHERE mem_no=1;
  
  commit;
   

