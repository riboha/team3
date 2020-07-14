
/**********************************/
/* Table Name: 회원 사진 */
/**********************************/

DROP TABLE mem_pic;

CREATE TABLE MEM_PIC(
		mem_pic_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_pic_name                  		VARCHAR2(100)		 NOT NULL,
		mem_pic_name_up               		VARCHAR2(100)		 NOT NULL,
		mem_pic_th                    		VARCHAR2(100)		 NOT NULL,
		mem_pic_size                  		VARCHAR2(100)		 NOT NULL,
		mem_pic_date                  		VARCHAR2(100)		 NOT NULL,
		MEM_NO                        		NUMBER(10)		 NULL ,
  FOREIGN KEY (MEM_NO) REFERENCES MEM (MEM_NO)
);

COMMENT ON TABLE MEM_PIC is '회원 사진';
COMMENT ON COLUMN MEM_PIC.mem_pic_no is '회원 사진 번호';
COMMENT ON COLUMN MEM_PIC.mem_pic_name is '회원 사진 원본명';
COMMENT ON COLUMN MEM_PIC.mem_pic_name_up is '회원 사진 업로드명';
COMMENT ON COLUMN MEM_PIC.mem_pic_th is '회원 사진 썸네일';
COMMENT ON COLUMN MEM_PIC.mem_pic_size is '회원 사진 크기';
COMMENT ON COLUMN MEM_PIC.mem_pic_date is '회원 사진 등록일';
COMMENT ON COLUMN MEM_PIC.MEM_NO is '회원 번호';



-- ▷시퀀스 삭제
DROP SEQUENCE mem_pic_seq;  
 

-- ▷SEQUENCE 시퀀스 생성
CREATE SEQUENCE mem_pic_seq
    START WITH 1                     -- 시작 번호
    INCREMENT BY 1                -- 증가값
    MAXVALUE 9999999999      --최댓값:9999999999 → NUMBER(10) 대응
    CACHE 2                              -- 2번은 메모리에서 계산 (insert가 큰 데이터의 경우 캐시 값을 크게 잡기)
    NOCYCLE;                            -- 순환 x, 다시 1부터 생성되는 것을 방지
    
    
    
    
-- 1) 등록

INSERT INTO mem_pic(mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date)
VALUES(mem_pic_seq.nextval, 2, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);

INSERT INTO mem_pic(mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date)
VALUES(mem_pic_seq.nextval, 3, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
             
INSERT INTO mem_pic(mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date)
VALUES(mem_pic_seq.nextval, 4, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        
             
             
-- 2) 목록( mem_no 기준 내림 차순, mem_pic_no 기준 오르차순)
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
ORDER BY mem_no DESC,  mem_pic_no ASC;




SELECT mem_pic_no, mem_pic_name, mem_pic_name_up, mem_pic_th
FROM mem_pic
ORDER BY mem_no DESC,  mem_pic_no ASC;

commit;
-- ▶실제 하드디스크에 저장된 파일명: mem_pic_name_up, mem_pic_th
-- ▶업로드 당시 파일명: mem_pic_name

-- 3) 글별 파일 목록(mem_no 기준 내림 차순, mem_pic_no 기준 오르차순)
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
WHERE mem_no = 2
ORDER BY mem_pic_name ASC;

 mem_pic_no CONTENTSNO mem_pic_name        mem_pic_name_up      mem_pic_th          mem_pic_size  mem_pic_date
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car1.jpg     car1_0.jpg   car1_0_t.jpg    12099 2019-12-04 15:01:20.0
            2          1 car2.jpg     car2_0.jpg   car2_0_t.jpg    10553 2019-12-04 15:01:20.0
            3          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            4          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            5          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0
            9          1 moon.zip     moon.zip     NULL           292777 2019-12-05 10:14:12.0
            6          1 spring18.jpg spring18.jpg spring18_t.jpg 444455 2019-12-05 09:55:07.0
            7          1 spring19.jpg spring19.jpg spring19_t.jpg 126983 2019-12-05 09:55:07.0
            8          1 spring20.jpg spring20.jpg spring20_t.jpg 345322 2019-12-05 09:55:07.0

-- 4) 하나의 파일 삭제
DELETE FROM mem_pic
WHERE mem_pic_no = 7;


-- 5) FK mem_no 부모키 별 조회
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
WHERE mem_no=1;

mem_pic_no CONTENTSNO mem_pic_name        mem_pic_name_up      mem_pic_th          mem_pic_size  mem_pic_date
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

-- 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM mem_pic
WHERE mem_no=1;

 CNT
 ---
   3             
             
-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM mem_pic
WHERE mem_no=1;

DELETE FROM mem_pic
WHERE mem_pic_no=6;

(3 rows affected)

commit;




   
-- 7) mem, mem_pic join
    SELECT m.mem_no, m.mem_id, m.mem_pw, m.mem_nick, m.mem_name, m.mem_addr1, m.mem_addr2, m.mem_zip, m.mem_tel, m.mem_date,
               p.mem_pic_no, p.mem_pic_name, p.mem_pic_name_up, p.mem_pic_th, p.mem_pic_size, p.mem_pic_date, p.mem_no
    FROM mem m, mem_pic p
    WHERE p.mem_no = m.mem_no AND m.mem_no = 1;
    

commit;
-- 8) 조회
SELECT mem_pic_no, mem_no, mem_pic_name, mem_pic_name_up, mem_pic_th, mem_pic_size, mem_pic_date
FROM mem_pic
WHERE mem_pic_no=1;

