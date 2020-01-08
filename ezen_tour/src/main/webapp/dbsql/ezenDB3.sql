/* ��Ű�� */
CREATE TABLE PACKAGE (
	PACKAGE_NO NUMBER NOT NULL, /* ��Ű����ȣ */
	NAME VARCHAR2(100), /* ��Ű���̸� */
	IMG_NAMES VARCHAR2(1000), /* �̹����̸�(LIST) */
	IMG_SIZES VARCHAR2(1000), /* D�̹���ũ��(LIST) */
	DESTNATION VARCHAR2(100), /* ���౹�� */
	AIRPORT VARCHAR2(100), /* �̿��װ� */
	DAYS VARCHAR2(60), /* ����Ⱓ */
	DAYS_WEEK VARCHAR2(60) /* ��߿��� */
);

CREATE UNIQUE INDEX PK_PACKAGE
	ON PACKAGE (
		PACKAGE_NO ASC
	);

ALTER TABLE PACKAGE
	ADD
		CONSTRAINT PK_PACKAGE
		PRIMARY KEY (
			PACKAGE_NO
		);
		
		
/* ��Ű�� �� */
CREATE TABLE PACKAGE_DETAIL (
	PACKAGE_DNO NUMBER NOT NULL, /* ��Ű�� �Һз� ��ȣ */
	PACKAGE_NO NUMBER NOT NULL, /* ��Ű����ȣ */
	DEP_CODE VARCHAR2(10), /* ����װ��ڵ� */
	KOREA_DEP DATE NOT NULL, /* �ѱ���߳�¥ */
	LOCAL_ENT DATE NOT NULL, /* ����������¥ */
	ENT_CODE VARCHAR2(10), /* �����װ��ڵ� */
	LOCAL_DEP DATE NOT NULL, /* ������߳�¥ */
	KOREA_ENT DATE NOT NULL, /* �ѱ�������¥ */
	MAN NUMBER, /* ���ΰ��� */
	CHILD NUMBER, /* ���ư��� */
	BABY NUMBER, /* �Ƶ����� */
	AIRLINE VARCHAR2(300), /* �װ���� */
	DAYS_DETAIL VARCHAR2(30) NOT NULL, /* ����Ⱓ */
	SHOPPING CHAR, /* ���ο��� */
	HOTEL_GRADE CHAR, /* ���ҵ�� */
	DETAILS CLOB, /* ���� */
	DESTINATIONS VARCHAR2(300), /* �ֿ俩�൵�� */
	DATES VARCHAR2(1000), /* �ð� */
	TRAVEL_FLAG VARCHAR2(30), /* ���౸�� */
	CAPECITY NUMBER, /* �����ο� */
	CAPECITY_MIN NUMBER /* �ּ��ο� */
);

CREATE UNIQUE INDEX PK_PACKAGE_DETAIL
	ON PACKAGE_DETAIL (
		PACKAGE_DNO ASC
	);

ALTER TABLE PACKAGE_DETAIL
	ADD
		CONSTRAINT PK_PACKAGE_DETAIL
		PRIMARY KEY (
			PACKAGE_DNO
		);