/**********************************/
/* Table Name: ȸ�� */
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

COMMENT ON TABLE MEM is 'ȸ��';
COMMENT ON COLUMN MEM.MEM_NO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN MEM.MEM_ID is '���̵�';
COMMENT ON COLUMN MEM.MEM_PW is '��й�ȣ';
COMMENT ON COLUMN MEM.MEM_NAME is '�̸�';
COMMENT ON COLUMN MEM.MEM_NICK is '�г���';
COMMENT ON COLUMN MEM.MEM_ADDR1 is '�ּ�1';
COMMENT ON COLUMN MEM.MEM_ADDR2 is '�ּ�2';
COMMENT ON COLUMN MEM.MEM_ZIP is '�����ȣ';
COMMENT ON COLUMN MEM.MEM_TEL is '��ȭ��ȣ';
COMMENT ON COLUMN MEM.MEM_PT is '����Ʈ';
COMMENT ON COLUMN MEM.MEM_DATE is '������';
COMMENT ON COLUMN MEM.MEM_STS is 'ȸ�� ����';
COMMENT ON COLUMN MEM.MEM_PIC_NAME is 'ȸ�� ���� ������';
COMMENT ON COLUMN MEM.MEM_PIC_NAME_UP is 'ȸ�� ���� ���ε��';
COMMENT ON COLUMN MEM.NAME_PIC_TH is 'ȸ�� ���� �����';
COMMENT ON COLUMN MEM.NAME_PIC_SIZE is 'ȸ�� ���� ũ��';


/**********************************/
/* Table Name: ȸ�� ���ø���Ʈ */
/**********************************/
CREATE TABLE mem_wish(
		mem_wish_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_no                        		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
		mem_wish_seqno                		NUMBER(10)		 DEFAULT 1		 NOT NULL
);

COMMENT ON TABLE mem_wish is 'ȸ�� ���ø���Ʈ';
COMMENT ON COLUMN mem_wish.mem_wish_no is 'ȸ�� ���� ��ȣ';
COMMENT ON COLUMN mem_wish.mem_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN mem_wish.at_no is '��ǰ ��ȣ';
COMMENT ON COLUMN mem_wish.mem_wish_seqno is 'ȸ�� ���� ��� ��ȣ';


/**********************************/
/* Table Name: ȸ�� �����̷� */
/**********************************/
CREATE TABLE MEM_HIS(
		mem_his_no                    		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		mem_his_seqno                 		NUMBER(10)		 NOT NULL,
		at_no                         		NUMBER(10)		 NOT NULL,
		mem_his_date                  		DATE		 NOT NULL,
		mem_no                        		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE MEM_HIS is 'ȸ�� �����̷�';
COMMENT ON COLUMN MEM_HIS.mem_his_no is 'ȸ�� �̷� ��ȣ';
COMMENT ON COLUMN MEM_HIS.mem_his_seqno is 'ȸ�� �̷� ��� ��ȣ';
COMMENT ON COLUMN MEM_HIS.at_no is '��ǰ ��ȣ';
COMMENT ON COLUMN MEM_HIS.mem_his_date is 'ȸ�� ���� ��¥';
COMMENT ON COLUMN MEM_HIS.mem_no is 'ȸ�� ��ȣ';


