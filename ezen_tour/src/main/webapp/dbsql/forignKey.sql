ALTER TABLE MEMBER
	ADD
		CONSTRAINT FK_MEMBER_GRADE_TO_MEMBER
		FOREIGN KEY (
			GRADE
		)
		REFERENCES MEMBER_GRADE (
			GRADE
		);

ALTER TABLE MILEAGE
	ADD
		CONSTRAINT FK_MEMBER_TO_MILEAGE
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE COUPON
	ADD
		CONSTRAINT FK_MEMBER_TO_COUPON
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE COUPON
	ADD
		CONSTRAINT FK_CUPON_ADMIN_TO_COUPON
		FOREIGN KEY (
			CUPON_SERIAL
		)
		REFERENCES CUPON_ADMIN (
			CUPON_SERIAL
		);

ALTER TABLE PACK
	ADD
		CONSTRAINT FK_AREA_TO_PACK
		FOREIGN KEY (
			AREA_NO
		)
		REFERENCES AREA (
			AREA_NO
		);

ALTER TABLE PACK_DETAIL
	ADD
		CONSTRAINT FK_PACK_TO_PACK_DETAIL
		FOREIGN KEY (
			PACK_NO
		)
		REFERENCES PACK (
			PACK_NO
		);

ALTER TABLE HOTEL_DETAIL
	ADD
		CONSTRAINT FK_HOTEL_TO_HOTEL_DETAIL
		FOREIGN KEY (
			HOTEL_NO
		)
		REFERENCES HOTEL (
			HOTEL_NO
		);

ALTER TABLE PAYMENT
	ADD
		CONSTRAINT FK_MEMBER_TO_PAYMENT
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE WISHLIST
	ADD
		CONSTRAINT FK_MEMBER_TO_WISHLIST
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEW
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_REVIEW_TO_REPLY
		FOREIGN KEY (
			REVIEW_NO
		)
		REFERENCES REVIEW (
			REVIEW_NO
		);

ALTER TABLE REPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_REPLY
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE SUPPORT
	ADD
		CONSTRAINT FK_MEMBER_TO_SUPPORT
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES MEMBER (
			USER_NO
		);

ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_PACK_DETAIL_TO_SCHEDULE
		FOREIGN KEY (
			PACK_DNO
		)
		REFERENCES PACK_DETAIL (
			PACK_DNO
		);

ALTER TABLE AREA_DETAIL
	ADD
		CONSTRAINT FK_AREA_TO_AREA_DETAIL
		FOREIGN KEY (
			AREA_NO
		)
		REFERENCES AREA (
			AREA_NO
		);