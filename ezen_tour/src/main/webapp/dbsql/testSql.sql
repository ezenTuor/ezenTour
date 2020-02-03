select * from pack_detail
where korea_dep >= TO_DATE('14/01/2020', 'DD-MM-YYYY') AND korea_dep <= TO_DATE('2020/01/14')+1;

select * from pack_detail;
select * from pack;
select * from area;

select * from area_detail;

select p2.*,
    (
        select max(man)
        from pack_detail p1
        where p1.pack_no = p2.pack_no
    ) manmax
from pack p2
where regexp_like (keyword, 'À¯·´');
