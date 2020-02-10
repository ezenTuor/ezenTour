--회원 관련--
insert into member_grade
values('C', '회원 가입시 기본으로 주어지는 일반회원 등급입니다.', '등급 혜택 해당사항 없음, 마일리지 적립 5%', 5);

insert into member
values(member_seq.nextval, 'hong', '1234', '홍길동', 13494, '경기 성남시 분당구 삼평동 681', 'A스퀘어 4층', '010', '1111', '2222', 'test', 'naver.com', 'C', '990101-1122333', 'M', sysdate, 'N', null, default);

insert into member
values(member_seq.nextval, 'kim', '1234', '김길동', 13494, '경기 성남시 분당구 삼평동 681', 'A스퀘어 4층', '010', '1111', '2222', 'test', 'naver.com', 'C', '010101-3122333', 'M', sysdate, 'N', null, default);

insert into member
values(member_seq.nextval, 'lee', '1234', '이길동', 13494, '경기 성남시 분당구 삼평동 681', 'A스퀘어 4층', '010', '1111', '2222', 'test', 'naver.com', 'C', '920101-2122333', 'F', sysdate, 'N', null, default);

insert into member
values(member_seq.nextval, 'park', '1234', '박길동', 13494, '경기 성남시 분당구 삼평동 681', 'A스퀘어 4층', '010', '1111', '2222', 'test', 'naver.com', 'C', '040101-4122333', 'F', sysdate, 'N', null, default);

--관리자 --
insert into manager
values('admin123', '123', '김관리', 'ADMIN', 'test2', 'naver.com', '010', '2222', '3333');


commit;

select min(man) as "minPrice", 
max(man) as "maxPrice"
from pack_detail  
where pack_no=1;


-- 지역 대분류 관련 --
select * from area order by area_no;

insert into area
values(area_seq.nextval, 'EU', '유럽', '유럽 대분류');

insert into area
values(area_seq.nextval, 'ASE', '동남아', '동남아 대분류');

insert into area
values(area_seq.nextval, 'JP', '일본', '일본 대분류');

insert into area
values(area_seq.nextval,'CN', '중국/마카오/홍콩', '중국 대분류');

insert into area
values(area_seq.nextval,'GS', '괌/사이판', '괌/사이판 대분류');

insert into area
values(area_seq.nextval,'OSN', '호주/뉴질랜드', '호주/뉴질랜드 대분류');

insert into area
values(area_seq.nextval, 'USA', '미국/캐나다/중미', '미국/캐나다/중미 대분류');

insert into area
values(area_seq.nextval,'AF', '인도/아프리카', '인도/아프리카 대분류');


-- 지역 소분류 관련 --

select * from area_detail;
  
  -- 유럽 파트 --
insert into area_detail
values(area_detail_seq.nextval, 1 , '서유럽', '서유럽|영국|프랑스|이태리');

insert into area_detail
values(area_detail_seq.nextval, 1 , '동유럽/발칸', '동유럽|발칸|프라하|비엔나|크로아티아|체코|헝가리');

insert into area_detail
values(area_detail_seq.nextval, 1 , '스페인/포르투갈/모로코', '스페인|포르투갈|모로코');

insert into area_detail
values(area_detail_seq.nextval, 1 , '터키/그리스/두바이', '터키|그리스|두바이');

insert into area_detail
values(area_detail_seq.nextval, 1 , '북유럽/러시아/발틱', '북유럽|러시아|발틱|핀란드');

insert into area_detail
values(area_detail_seq.nextval, 1 , '극동/블라디보스톡', '극동|블라디보스톡|우즈베키스탄|카자흐스탄');

insert into area_detail
values(area_detail_seq.nextval, 1 , '이집트/이스라엘/요르단', '이집트|이스라엘|요르단');

commit;

select * from area_detail
where area_no=1;

--패키지--
select * from pack;

insert into pack
values(pack_seq.nextval, '테스트용 패키지', 'https://dimgcdn.ybtour.co.kr/TN/3c/3c48dd0e2bf489ad54f6c0da2e07fa66.tn.410x280.jpg | 메인이미지2.jpg', '21432|31324', '프랑스', '파리', '프랑스|파리|서유럽|에펠탑', '김포공항', '6~7일', '월, 수, 금', '테스트용 대분류 내용', sysdate, 1);

insert into pack
values(pack_seq.nextval, '테스트용 패키지2', 'https://dimgcdn.ybtour.co.kr/TN/ad/ad33ab1dc5d49b3bec7bb72478bd0a8b.tn.410x280.jpg | 메인이미지2.jpg', '21432|31324', '스웨덴', '어쩌고', '프랑스|파리|서유럽|에펠탑', '인천공항', '7~8일', '화, 수, 금', '테스트용 대분류 내용2', sysdate, 1);


select * from pack_detail;

insert into pack_detail
values(pack_detail_seq.nextval, 1, '21321', TO_DATE('2020/01/14 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21823' , TO_DATE('2020/01/20 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/21 11:30:00','yyyy/mm/dd hh24:mi:ss'), 2900000, 2100000, 700000, '김포공항', '6일', 'Y', '내용 상세', 25, 40, 12);

insert into pack_detail
values(pack_detail_seq.nextval, 1, '21321', TO_DATE('2020/01/14 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21823' , TO_DATE('2020/01/20 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/21 11:30:00','yyyy/mm/dd hh24:mi:ss'), 2900000, 2100000, 700000, '김포공항', '5박6일', 'Y', '내용 상세', 25, 40, 12);

insert into pack_detail
values(pack_detail_seq.nextval, 1, '213ka1', TO_DATE('2020/01/18 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/19 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21829' , TO_DATE('2020/01/24 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/25 11:30:00','yyyy/mm/dd hh24:mi:ss'), 350000, 230000, 800000, '김포공항', '6일', 'Y', '내용 상세', 25, 40, 16);


insert into pack_detail
values(pack_detail_seq.nextval, 1, '213ka1', TO_DATE('2020/02/18 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/19 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21829' , TO_DATE('2020/02/24 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/25 11:30:00','yyyy/mm/dd hh24:mi:ss'), 350000, 230000, 800000, '에어서울', '3박4일', 'Y', '내용 상세', 25, 40, 40);


insert into pack_detail
values(pack_detail_seq.nextval, 2, '434kka', TO_DATE('2020/01/29 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/30 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21829' , TO_DATE('2020/02/03 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/04 11:30:00','yyyy/mm/dd hh24:mi:ss'), 740000, 450000, 800000, '김포공항', '2박3일', 'Y', '내용 상세', 25, 30, 12);

commit;