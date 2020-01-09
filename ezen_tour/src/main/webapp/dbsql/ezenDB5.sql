/* ���� */
CREATE TABLE PAYMENT (
	PAYMENT_NO NUMBER NOT NULL, /* ������ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	PD_CATE CHAR NOT NULL, /* ��ǰ�з� */
	PD_NUMBER NUMBER NOT NULL, /* ��ǰ��ȣ */
	DISCOUNT NUMBER, /* ���αݾ� */
	PRICE NUMBER NOT NULL, /* �����ݾ� */
	STATE CHAR, /* �������� */
	TYPE VARCHAR2(300), /* ������� */
	REGDATE DATE, /* ������ */
	DETAIL CLOB, /* ������ */
	EMAIL1 VARCHAR2(30), /* �̸���1 */
	EMAIL2 VARCHAR2(30), /* �̸���2 */
	HP1 VARCHAR2(3), /* ��ȭ��ȣ1 */
	HP2 VARCHAR2(4), /* ��ȭ��ȣ2 */
	HP3 VARCHAR2(4) /* ��ȭ��ȣ3 */
);

CREATE UNIQUE INDEX PK_PAYMENT
	ON PAYMENT (
		PAYMENT_NO ASC
	);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT PK_PAYMENT
		PRIMARY KEY (
			PAYMENT_NO
		);

/* ��ٱ��� */
CREATE TABLE WISHLIST (
	WISH_NO NUMBER NOT NULL, /* ���ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	PD_CATE CHAR NOT NULL, /* ��ǰ�з� */
	PD_NUMBER NUMBER NOT NULL, /* ��ǰ��ȣ */
	DETAIL CLOB, /* ��� */
	WISH_DATE DATE, /* ��¥ */
	START_DATE DATE, /* �ش� ���۳�¥ */
	END_DATE DATE, /* �ش� ����¥ */
	EMAIL1 VARCHAR2(30), /* �̸���1 */
	EMAIL2 VARCHAR2(30), /* �̸���2 */
	HP1 VARCHAR2(3), /* ��ȭ��ȣ1 */
	HP2 VARCHAR2(4), /* ��ȭ��ȣ2 */
	HP3 VARCHAR2(4) /* ��ȭ��ȣ3 */
);

CREATE UNIQUE INDEX PK_WISHLIST
	ON WISHLIST (
		WISH_NO ASC
	);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT PK_WISHLIST
		PRIMARY KEY (
			WISH_NO
		);