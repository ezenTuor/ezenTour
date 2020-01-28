/* ���� */
CREATE TABLE PAYMENT (
	PAYMENT_NO NUMBER NOT NULL, /* ������ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	DISCOUNT NUMBER, /* ���αݾ� */
	PRICE NUMBER NOT NULL, /* �����ݾ� */
	STATE CHAR, /* �������� */
	TYPE VARCHAR2(300), /* ������� */
	REGDATE DATE, /* ������ */
	DETAIL CLOB /* ������ */
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
		
/* ���� ������ */
CREATE TABLE PAYMENT_DETAIL (
	PD_NO NUMBER NOT NULL, /* �����Ϲ�ȣ */
	PAYMENT_NO NUMBER, /* ������ȣ */
	PACK_DNO NUMBER, /* ��Ű�� �Һз� ��ȣ */
	MAN NUMBER, /* ���� */
	CHILD NUMBER, /* �Ƶ� */
	BABY NUMBER, /* ���� */
	PRICE NUMBER /* �ݾ� */
);

CREATE UNIQUE INDEX PK_PAYMENT_DETAIL
	ON PAYMENT_DETAIL (
		PD_NO ASC
	);

ALTER TABLE PAYMENT_DETAIL
	ADD
		CONSTRAINT PK_PAYMENT_DETAIL
		PRIMARY KEY (
			PD_NO
		);

/* ���� */
CREATE TABLE WISHLIST (
	WISH_NO NUMBER NOT NULL, /* ���ȣ */
	USER_NO NUMBER, /* ȸ����ȣ */
	PACK_DNO NUMBER NOT NULL, /* ��Ű�� �Һз� ��ȣ */
	MAN NUMBER, /* ���� */
	CHILD NUMBER, /* �Ƶ� */
	BABY NUMBER, /* ���� */
	PRICE NUMBER, /* �Ѱ��� */
	DETAIL CLOB, /* ��� */
	WISH_DATE DATE /* ��¥ */
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