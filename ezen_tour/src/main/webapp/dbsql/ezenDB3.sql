/* 패키지 */
CREATE TABLE PACK (
	PACK_NO NUMBER NOT NULL, /* 패키지번호 */
	NAME VARCHAR2(100), /* 패키지이름 */
	IMG_NAMES VARCHAR2(1000), /* 이미지이름(LIST) */
	IMG_SIZES VARCHAR2(1000), /* 이미지크기(LIST) */
	COUNTRY VARCHAR2(40), /* 여행국가 */
	CITY VARCHAR2(100), /* 여행도시 */
	KEYWORD VARCHAR2(1000), /* 키워드 */
	AIRPORT VARCHAR2(100), /* 이용항공 */
	DAYS VARCHAR2(60), /* 여행기간 */
	DAYS_WEEK VARCHAR2(60), /* 출발요일 */
	DETAIL CLOB, /* 상세설명 */
	REGDATE DATE DEFAULT SYSDATE, /* 등록일 */
	AREA_NO NUMBER /* 지역번호 */
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

/* 패키지 상세 */
CREATE TABLE PACK_DETAIL (
	PACK_DNO NUMBER NOT NULL, /* 패키지 소분류 번호 */
	PACK_NO NUMBER NOT NULL, /* 패키지번호 */
	DEP_CODE VARCHAR2(10), /* 출발항공코드 */
	KOREA_DEP DATE NOT NULL, /* 한국출발날짜 */
	LOCAL_ENT DATE NOT NULL, /* 현지도착날짜 */
	ENT_CODE VARCHAR2(10), /* 도착항공코드 */
	LOCAL_DEP DATE NOT NULL, /* 현지출발날짜 */
	KOREA_ENT DATE NOT NULL, /* 한국도착날짜 */
	MAN NUMBER, /* 성인가격 */
	CHILD NUMBER, /* 유아가격 */
	BABY NUMBER, /* 아동가격 */
	AIRLINE VARCHAR2(300), /* 항공사명 */
	DAYS_DETAIL VARCHAR2(30) NOT NULL, /* 여행기간 */
	SHOPPING CHAR, /* 쇼핑여부 */
	DETAILS CLOB, /* 내용 */
	CAPECITY_MIN NUMBER, /* 최소인원 */
	CAPECITY NUMBER, /* 수용인원 */
	CAPECITY_CUR NUMBER /* 현재인원 */
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
		
/* 일정 */
CREATE TABLE SCHEDULE (
	SCHEDULE_NO NUMBER NOT NULL, /* 일정번호 */
	PACK_DNO NUMBER, /* 소분류 번호 */
	DETAIL CLOB, /* 내용 */
	DAY NUMBER, /* 일차 */
	MEAL VARCHAR2(300), /* 식사 */
	HOTEL VARCHAR2(300), /* 숙박 */
	HOTEL_H VARCHAR2(40), /* 경도 */
	HOTEL_V VARCHAR2(40) /* 위도 */
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