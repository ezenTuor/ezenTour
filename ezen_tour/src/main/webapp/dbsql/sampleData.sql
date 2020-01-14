--회원 관련--
insert into member_grade
values('C', '회원 가입시 기본으로 주어지는 일반회원 등급입니다.', '등급 혜택 해당사항 없음, 마일리지 적립 5%', 5);

insert into member
values(member_seq.nextval, 'hong', '1234', '홍길동', 13494, '경기 성남시 분당구 삼평동 681', 'A스퀘어 4층', '010', '1111', '2222', 'test', 'naver.com', 'C', '990101-1122333', 'M', sysdate, 'N', null);

--관리자 --
insert into manager
values('admin123', '123', '김관리', 'ADMIN', 'test2', 'naver.com', '010', '2222', '3333');

--패키지--
select * from pack;

insert into pack
values(pack_seq.nextval, '테스트용 패키지', '메인이미지1.jpg | 메인이미지2.jpg', '21432|31324', '프랑스', '파리', '프랑스|파리|서유럽|에펠탑', '김포공항', '6~7일', '월, 수, 금', '테스트용 대분류 내용', sysdate);

select * from pack_detail;

insert into pack_detail
values(pack_detail_seq.nextval, 1, '21321', TO_DATE('2020/01/14 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21823' , TO_DATE('2020/01/20 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/21 11:30:00','yyyy/mm/dd hh24:mi:ss'), 2900000, 2100000, 700000, '김포공항', '6일', 'Y', '내용 상세', '필요없는 컬럼(삭제예정) - 예시:파리', '필요없는 컬럼', '필요없는 컬럼', 25, 40, 12);

