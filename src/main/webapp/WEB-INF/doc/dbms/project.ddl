/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE MEM(
		MEM_NO                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		MEM_ID                        		VARCHAR2(60)		 NOT NULL,
		MEM_PW                        		VARCHAR2(60)		 NOT NULL,
		MEM_NAME                      		VARCHAR2(20)		 NOT NULL,
		MEM_NICK                      		VARCHAR2(20)		 NULL ,
		MEM_ADDR1                     		VARCHAR2(400)		 NULL ,
		MEM_ADDR2                     		VARCHAR2(400)		 NULL ,
		MEM_ZIP                       		VARCHAR2(10)		 NULL ,
		MEM_TEL                       		VARCHAR2(20)		 NOT NULL,
		MEM_PT                        		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		MEM_DATE                      		DATE		 NOT NULL,
		MEM_STS                       		NUMBER(1)		 DEFAULT 0		 NOT NULL,
		MEM_PIC_NAME                  		VARCHAR2(100)		 NULL ,
		MEM_PIC_NAME_UP               		VARCHAR2(100)		 NULL ,
		NAME_PIC_TH                   		VARCHAR2(100)		 NULL ,
		NAME_PIC_SIZE                 		NUMBER(10)		 NULL 
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
COMMENT ON COLUMN MEM.MEM_PIC_NAME is '회원 사진 원본명';
COMMENT ON COLUMN MEM.MEM_PIC_NAME_UP is '회원 사진 업로드명';
COMMENT ON COLUMN MEM.NAME_PIC_TH is '회원 사진 썸네일';
COMMENT ON COLUMN MEM.NAME_PIC_SIZE is '회원 사진 크기';


/**********************************/
/* Table Name: 회원 위시리스트 */
/**********************************/
CREATE TABLE mem_wish(
		mem_wish_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_no                        		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
		mem_wish_seqno                		NUMBER(10)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE mem_wish is '회원 위시리스트';
COMMENT ON COLUMN mem_wish.mem_wish_no is '회원 위시 번호';
COMMENT ON COLUMN mem_wish.mem_no is '회원 번호';
COMMENT ON COLUMN mem_wish.at_no is '상품 번호';
COMMENT ON COLUMN mem_wish.mem_wish_seqno is '회원 위시 출력 번호';


/**********************************/
/* Table Name: 회원 구매이력 */
/**********************************/
CREATE TABLE MEM_HIS(
		mem_his_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_his_seqno                 		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
		mem_his_date                  		DATE		 NOT NULL,
		mem_no                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE MEM_HIS is '회원 구매이력';
COMMENT ON COLUMN MEM_HIS.mem_his_no is '회원 이력 번호';
COMMENT ON COLUMN MEM_HIS.mem_his_seqno is '회원 이력 출력 번호';
COMMENT ON COLUMN MEM_HIS.at_no is '상품 번호';
COMMENT ON COLUMN MEM_HIS.mem_his_date is '회원 구매 날짜';
COMMENT ON COLUMN MEM_HIS.mem_no is '회원 번호';


