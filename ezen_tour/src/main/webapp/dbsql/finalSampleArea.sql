-----지역 대분류 생성-----

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