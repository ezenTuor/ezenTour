/* 결제 */
CREATE TABLE PAYMENT (
	PAYMENT_NO NUMBER NOT NULL, /* 결제번호 */
	USER_NO NUMBER, /* 회원번호 */
	DISCOUNT NUMBER, /* 할인금액 */
	PRICE NUMBER NOT NULL, /* 최종금액 */
	STATE CHAR, /* 결제상태 */
	TYPE VARCHAR2(300), /* 결제방법 */
	REGDATE DATE DEFAULT SYSDATE, /* 결제일 */
	DETAIL CLOB, /* 결제상세 */
	MARCH_UID VARCHAR2(50), /* 결제체크번호 */
	IMP_UID VARCHAR2(50) /* 결체확인번호 */
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
		
/* 결제 디테일 */
CREATE TABLE PAYMENT_DETAIL (
	PD_NO NUMBER NOT NULL, /* 디테일번호 */
	PAYMENT_NO NUMBER, /* 결제번호 */
	PACK_DNO NUMBER, /* 패키지 소분류 번호 */
	MAN NUMBER, /* 성인 */
	CHILD NUMBER, /* 아동 */
	BABY NUMBER, /* 유아 */
	PRICE NUMBER /* 금액 */
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

/* 찜목록 */
CREATE TABLE WISHLIST (
	WISH_NO NUMBER NOT NULL, /* 찜번호 */
	USER_NO NUMBER, /* 회원번호 */
	PACK_DNO NUMBER NOT NULL, /* 패키지 소분류 번호 */
	MAN NUMBER, /* 성인 */
	CHILD NUMBER, /* 아동 */
	BABY NUMBER, /* 유아 */
	PRICE NUMBER, /* 총가격 */
	DETAIL CLOB, /* 찜상세 */
	WISH_DATE DATE /* 찜날짜 */
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
		