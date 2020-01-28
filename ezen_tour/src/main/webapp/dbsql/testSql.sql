select * from pack_detail
where korea_dep >= TO_DATE('14/01/2020', 'DD-MM-YYYY') AND korea_dep <= TO_DATE('2020/01/14')+1;

select * from pack_detail;
select * from pack;
select * from area;

select * from area_detail;

select * from area_detail;

select * from pack
where keyword like '%프랑스%' Or keyword like '%서유럽%';

select * from pack
where regexp_like (keyword, '프랑스|서유럽');

select * from pack
where regexp_like (keyword, '체코|서유럽');

select * from area_detail;

select 
distinct regexp_substr(A.KW, '[^|]+', 1, LEVEL) KW
FROM (SELECT keyword KW FROM area_detail where tag_no=1) A
CONNECT BY LEVEL <= length(regexp_replace(A.KW, '[^|]+',''))+1;



