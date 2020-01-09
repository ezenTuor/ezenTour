CREATE TABLE MANAGER (
	ADMIN_ID VARCHAR2(60) NOT NULL, /* 아이디 */
	ADMIN_PWD VARCHAR2(60) NOT NULL, /* 비밀번호 */
	NAME VARCHAR2(30), /* 이름 */
	POSITION VARCHAR2(10) DEFAULT 'STEP' NOT NULL, /* 관리자구분 */
	EMAIL1 VARCHAR2(30), /* 이메일1 */
	EMAIL2 VARCHAR2(30), /* 이메일2 */
	HP1 VARCHAR2(3), /* 전화번호1 */
	HP2 VARCHAR2(4), /* 전화번호2 */
	HP3 VARCHAR2(4) /* 전화번호3 */
);

CREATE UNIQUE INDEX PK_MANAGER
	ON MANAGER (
		ADMIN_ID ASC
	);

ALTER TABLE MANAGER
	ADD
		CONSTRAINT PK_MANAGER
		PRIMARY KEY (
			ADMIN_ID
		);

/* 회원 */
CREATE TABLE MEMBER (
	USER_NO NUMBER NOT NULL, /* 회원번호 */
	USER_ID VARCHAR2(60) NOT NULL, /* 아이디 */
	USER_PWD VARCHAR2(60) NOT NULL, /* 비밀번호 */
	NAME VARCHAR2(30) NOT NULL, /* 이름 */
	ZIPCODE NUMBER, /* 우편번호 */
	ADDRESS VARCHAR2(200), /* 주소 */
	ADDRESS_DETAIL VARCHAR2(200), /* 상세주소 */
	HP1 VARCHAR2(3), /* 전화번호1 */
	HP2 VARCHAR2(4), /* 전화번호2 */
	HP3 VARCHAR2(4), /* 전화번호3 */
	EMAIL1 VARCHAR2(30), /* 이메일1 */
	EMAIL2 VARCHAR2(30), /* 이메일2 */
	GRADE CHAR NOT NULL, /* 회원등급 */
	USER_SSR VARCHAR2(15), /* 주민번호 */
	GENDER CHAR NOT NULL, /* 성별 */
	REGDATE DATE NOT NULL, /* 가입일자 */
	DEL_FLAG CHAR, /* 탈퇴여부 */
	DELDATE DATE /* 탈퇴일자 */
);

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		USER_NO ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			USER_NO
		);

/* 회원등급 */
CREATE TABLE MEMBER_GRADE (
	GRADE CHAR NOT NULL, /* 회원등급 */
	DETAIL CLOB, /* 등급기준 */
	BENEFIT VARCHAR2(60), /* 혜택내용 */
	POINT NUMBER NOT NULL /* 적립퍼센트 */
);

CREATE UNIQUE INDEX PK_MEMBER_GRADE
	ON MEMBER_GRADE (
		GRADE ASC
	);

ALTER TABLE MEMBER_GRADE
	ADD
		CONSTRAINT PK_MEMBER_GRADE
		PRIMARY KEY (
			GRADE
		);
		
/* 통계 */
CREATE TABLE CHART (
	CHART_NO NUMBER NOT NULL, /* 통계번호 */
	AREA VARCHAR2(300), /* 지역대분류 */
	SEASON VARCHAR2(300), /* 분기(월) */
	SALES NUMBER NOT NULL, /* 매출 */
	GENDER CHAR, /* 성별 */
	AGE NUMBER /* 나이 */
);

CREATE UNIQUE INDEX PK_CHART
	ON CHART (
		CHART_NO ASC
	);

ALTER TABLE CHART
	ADD
		CONSTRAINT PK_CHART
		PRIMARY KEY (
			CHART_NO
		);