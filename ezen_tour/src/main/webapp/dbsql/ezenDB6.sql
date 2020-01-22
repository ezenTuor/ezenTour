/* 후기 */
CREATE TABLE REVIEW (
	REVIEW_NO NUMBER NOT NULL, /* 글번호 */
	USER_NO NUMBER, /* 회원번호 */
	HISTORY_NO NUMBER, /* 내역번호 */
	TITLE VARCHAR2(300), /* 글제목 */
	PD_NUMBER NUMBER, /* 분류번호 */
	CONTENT CLOB, /* 글내용 */
	SCORE NUMBER, /* 별점 */
	REGDATE DATE DEFAULT SYSDATE/* 작성일 */
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
		
/* 이용내역 */
CREATE TABLE HISTORY (
	HISTORY_NO NUMBER NOT NULL, /* 내역번호 */
	USER_NO NUMBER, /* 회원번호 */
	STATE VARCHAR2(20), /* 결제상태 */
	PACK_DNO NUMBER, /* 패키지 소분류 번호 */
	S_DATE DATE, /* 시작날짜 */
	E_DATE DATE, /* 끝날짜 */
	PRICE NUMBER, /* 결제금액 */
	REVIEW CHAR(4) DEFAULT 'N' /* 후기여부 */
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

/* 댓글 */
CREATE TABLE REPLY (
	REPLY_NO NUMBER NOT NULL, /* 댓글번호 */
	REVIEW_NO NUMBER, /* 글번호 */
	USER_NO NUMBER, /* 회원번호 */
	CONTENT CLOB, /* 댓글내용 */
	REGDATE DATE /* 작성일 */
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
	VISIBLE CHAR, /* 출력여부 */
	REGDATE DATE /* 작성일 */
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

/* 건의 */
CREATE TABLE SUPPORT (
	SUPPOORT_NO NUMBER NOT NULL, /* 건의번호 */
	USER_NO NUMBER NOT NULL, /* 회원번호 */
	TITLE VARCHAR2(300), /* 글제목 */
	CONTENT CLOB, /* 글내용 */
	REGDATE DATE, /* 작성일 */
	GROUP_NO NUMBER, /* 그룹번호 */
	STEP NUMBER, /* 단계 */
	SORT NUMBER, /* 정렬번호 */
	AS_FLAG CHAR /* 마감플래그 */
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