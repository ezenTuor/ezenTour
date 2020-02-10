create or replace view coupon_view
as
select a.CUPON_DETAIL, a.CUPON_KIND, a.DISCOUNT, c.*
from coupon c join cupon_admin a
on c.CUPON_SERIAL = a.CUPON_SERIAL;



create or replace view pack_detail_view
as
select d.*, p.name
from pack_detail d left join pack p
on d.pack_no= p.pack_no;



create or replace view history_view
as
select h.*, p.korea_dep, p.korea_ent, p.name,
    CASE
        when p.korea_ent>=(sysdate)-7 and p.korea_ent<sysdate+1
        then 'Y' else 'N'
        END AS CHECK_DATE
from history h left join pack_detail_view p
on h.pack_dno=p.pack_dno;



create or replace view review_view
as
select m.user_id, m.name, r.*, h.name as PACK_NAME, h.pack_dno
from review r left join history_view h
on r.history_no = h.history_no
left join member m
on r.USER_NO=m.USER_NO;



create or replace view wishlist_view
as
select w.*, p.name, p.korea_dep, p.korea_ent
from wishlist w left join pack_detail_view p
on w.pack_dno=p.pack_dno;



create or replace view chart_view
as
select h.price, m.gender
    , pa.area_no, to_char(h.regdate, 'yyyy') as YEAR, to_char(h.regdate, 'MM') as MONTH
    , trunc(to_char(sysdate,'yyyy')
            -(substr(m.user_ssr,1,2) + case when substr(m.user_ssr,8,1) in (1,2) then 1900
                                       else 2000 end)+1 ,-1) as AGERANGE
from history h left join member m
on h.user_no=m.user_no
left join pack_detail pd
on h.pack_dno=pd.pack_dno
left join pack pa
on pd.pack_no=pa.pack_no;



create or replace view pack_view
as
select p.*, a.name as AREA_NAME
from pack p left join area a
on p.area_no=a.area_no;

select * from pack_view;