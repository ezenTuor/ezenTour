/* ��Ű�� */
CREATE TABLE PACK (
	PACK_NO NUMBER NOT NULL, /* ��Ű����ȣ */
	NAME VARCHAR2(100), /* ��Ű���̸� */
	IMG_NAMES VARCHAR2(1000), /* �̹����̸�(LIST) */
	IMG_SIZES VARCHAR2(1000), /* �̹���ũ��(LIST) */
	CONUTRY VARCHAR2(40), /* ���౹�� */
	CITY VARCHAR2(100), /* ���൵�� */
	KEYWORD VARCHAR2(1000), /* Ű���� */
	AIRPORT VARCHAR2(100), /* �̿��װ� */
	DAYS VARCHAR2(60), /* ����Ⱓ */
	DAYS_WEEK VARCHAR2(60), /* ��߿��� */
	DETAIL CLOB, /* �󼼼��� */
	REGDATE DATE DEFAULT SYSDATE, /* ����� */
	AREA_NO NUMBER /* ������ȣ */
);

CREATE UNIQUE INDEX PK_PACK
	ON PACK (
		PACK_NO ASC
	);

ALTER TABLE PACK
	ADD
		CONSTRAINT PK_PACK
		PRIMARY KEY (
			PACK_NO
		);

/* ��Ű�� �� */
CREATE TABLE PACK_DETAIL (
	PACK_DNO NUMBER NOT NULL, /* ��Ű�� �Һз� ��ȣ */
	PACK_NO NUMBER NOT NULL, /* ��Ű����ȣ */
	DEP_CODE VARCHAR2(15), /* ����װ��ڵ� */
	KOREA_DEP DATE NOT NULL, /* �ѱ���߳�¥ */
	LOCAL_ENT DATE NOT NULL, /* ����������¥ */
	ENT_CODE VARCHAR2(15), /* �����װ��ڵ� */
	LOCAL_DEP DATE NOT NULL, /* ������߳�¥ */
	KOREA_ENT DATE NOT NULL, /* �ѱ�������¥ */
	MAN NUMBER, /* ���ΰ��� */
	CHILD NUMBER, /* ���ư��� */
	BABY NUMBER, /* �Ƶ����� */
	AIRLINE VARCHAR2(300), /* �װ���� */
	DAYS_DETAIL VARCHAR2(30) NOT NULL, /* ����Ⱓ */
	SHOPPING CHAR, /* ���ο��� */
	DETAILS CLOB, /* ���� */
	CAPECITY_MIN NUMBER, /* �ּ��ο� */
	CAPECITY NUMBER, /* �����ο� */
	CAPECITY_CUR NUMBER /* �����ο� */
);

CREATE UNIQUE INDEX PK_PACK_DETAIL
	ON PACK_DETAIL (
		PACK_DNO ASC
	);

ALTER TABLE PACK_DETAIL
	ADD
		CONSTRAINT PK_PACK_DETAIL
		PRIMARY KEY (
			PACK_DNO
		);
		
/* ���� */
CREATE TABLE SCHEDULE (
	SCHEDULE_NO NUMBER NOT NULL, /* ������ȣ */
	PACK_DNO NUMBER, /* �Һз� ��ȣ */
	DETAIL CLOB, /* ���� */
	DAY DATE, /* ��¥ */
	MEAL VARCHAR2(300), /* �Ļ� */
	HOTEL VARCHAR2(300) /* ���� */
);

CREATE UNIQUE INDEX PK_SCHEDULE
	ON SCHEDULE (
		SCHEDULE_NO ASC
	);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT PK_SCHEDULE
		PRIMARY KEY (
			SCHEDULE_NO
		);