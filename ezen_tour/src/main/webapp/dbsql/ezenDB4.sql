/* 건의 */
CREATE TABLE SUPPORT (
	SUPPOORT_NO NUMBER NOT NULL, /* 건의번호 */
	USER_NO NUMBER NOT NULL, /* 회원번호 */
	TITLE VARCHAR2(300), /* 글제목 */
	CONTENT CLOB, /* 글내용 */
	REGDATE DATE DEFAULT SYSDATE, /* 작성일 */
	GROUP_NO NUMBER, /* 그룹번호 */
	STEP NUMBER DEFAULT 0, /* 단계 */
	SORT NUMBER DEFAULT 0, /* 정렬번호 */
	AS_FLAG CHAR DEFAULT 'N' /* 마감플래그 */
);

CREATE UNIQUE INDEX PK_SUPPORT
	ON SUPPORT (
		SUPPOORT_NO ASC
	);

ALTER TABLE SUPPORT
	ADD
		CONSTRAINT PK_SUPPORT
		PRIMARY KEY (
			SUPPOORT_NO
		);

/* FAQ */
CREATE TABLE FAQ (
	FAQ_NO NUMBER NOT NULL, /* FAQ번호 */
	FAQ_CATE VARCHAR2(30), /* FAQ분류 */
	TITLE VARCHAR2(300), /* 글제목 */
	CONTENT CLOB /* 글내용 */
);

CREATE UNIQUE INDEX PK_FAQ
	ON FAQ (
		FAQ_NO ASC
	);

ALTER TABLE FAQ
	ADD
		CONSTRAINT PK_FAQ
		PRIMARY KEY (
			FAQ_NO
		);

/* 공지사항 */
CREATE TABLE NOTICE (
	NOTICE_NO NUMBER NOT NULL, /* 공지번호 */
	TITLE VARCHAR2(300), /* 공지제목 */
	CONTENT CLOB, /* 공지내용 */
	VISIBLE CHAR DEFAULT 'Y', /* 출력여부 */
	REGDATE DATE DEFAULT SYSDATE/* 작성일 */
);

CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE (
		NOTICE_NO ASC
	);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			NOTICE_NO
		);