/* 결제 */
CREATE TABLE PAYMENT (
	PAYMENT_NO NUMBER NOT NULL, /* 결제번호 */
	USER_NO NUMBER, /* 회원번호 */
	PD_CATE CHAR NOT NULL, /* 상품분류 */
	PD_NUMBER NUMBER NOT NULL, /* 상품번호 */
	DISCOUNT NUMBER, /* 할인금액 */
	PRICE NUMBER NOT NULL, /* 최종금액 */
	STATE CHAR, /* 결제상태 */
	TYPE VARCHAR2(300), /* 경제방법 */
	REGDATE DATE, /* 결제일 */
	DETAIL CLOB, /* 결제상세 */
	EMAIL2 VARCHAR2(30), /* 이메일1 */
	COL VARCHAR2(30), /* 이메일2 */
	HP2 VARCHAR2(3), /* 전화번호1 */
	COL2 VARCHAR2(4), /* 전화번호2 */
	COL3 VARCHAR2(4) /* 전화번호3 */
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

/* 장바구니 */
CREATE TABLE WISHLIST (
	WISH_NO NUMBER NOT NULL, /* 찜번호 */
	USER_NO NUMBER, /* 회원번호 */
	PD_CATE CHAR NOT NULL, /* 상품분류 */
	PD_NUMBER NUMBER NOT NULL, /* 상품번호 */
	DETAIL CLOB, /* 찜상세 */
	WISH_DATE DATE, /* 찜날짜 */
	START_DATE DATE, /* 해당 시작날짜 */
	END_DATE DATE, /* 해당 끝날짜 */
	EMAIL2 VARCHAR2(30), /* 이메일1 */
	COL VARCHAR2(30), /* 이메일2 */
	HP2 VARCHAR2(3), /* 전화번호1 */
	COL2 VARCHAR2(4), /* 전화번호2 */
	COL3 VARCHAR2(4) /* 전화번호3 */
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
