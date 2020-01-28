/* �ı� */
CREATE TABLE REVIEW (
	REVIEW_NO NUMBER NOT NULL, /* �۹�ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	HISTORY_NO NUMBER, /* ������ȣ */
	TITLE VARCHAR2(300), /* ������ */
	CONTENT CLOB, /* �۳��� */
	SCORE NUMBER, /* ���� */
	REGDATE DATE /* �ۼ��� */
);

CREATE UNIQUE INDEX PK_REVIEW
	ON REVIEW (
		REVIEW_NO ASC
	);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT PK_REVIEW
		PRIMARY KEY (
			REVIEW_NO
		);

/* ��� */
CREATE TABLE REPLY (
	REPLY_NO NUMBER NOT NULL, /* ��۹�ȣ */
	REVIEW_NO NUMBER, /* �۹�ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	CONTENT CLOB, /* ��۳��� */
	REGDATE DATE /* �ۼ��� */
);

CREATE UNIQUE INDEX PK_REPLY
	ON REPLY (
		REPLY_NO ASC
	);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			REPLY_NO
		);
		
		
/* �̿볻�� */
CREATE TABLE HISTORY (
	HISTORY_NO NUMBER NOT NULL, /* ������ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	STATE VARCHAR2(20), /* �������� */
	PACK_DNO NUMBER, /* ��Ű�� �Һз� ��ȣ */
	PRICE NUMBER, /* �����ݾ� */
	REVIEW CHAR(4) DEFAULT 'N' /* �ı⿩�� */
);

CREATE UNIQUE INDEX PK_HISTORY
	ON HISTORY (
		HISTORY_NO ASC
	);

ALTER TABLE HISTORY
	ADD
		CONSTRAINT PK_HISTORY
		PRIMARY KEY (
			HISTORY_NO
		);
		

