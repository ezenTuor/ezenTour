create or replace view coupon_view
as
select a.CUPON_DETAIL, a.CUPON_KIND, a.DISCOUNT
from coupon c join cupon_admin a
on c.CUPON_SERIAL = a.CUPON_SERIAL
where c.USER_NO = 111 and c.USEDATE is null and c.DEL_FLAG is null;


create or replace view pack_detail_view
as
select d.*, p.name
from pack_detail d left join pack p
on d.pack_no= p.pack_no;


create or replace view history_view
as
select h.*, p.korea_dep, p.korea_ent, p.name
from history h left join pack_detail_view p
on h.pack_dno=p.pack_dno;


create or replace view review_view
as
select r.*, h.name, h.pack_dno
from review r left join history_view h
on r.history_no = h.history_no;


create or replace view wishlist_view
as
select w.*, p.name, p.korea_dep, p.korea_ent
from wishlist w left join pack_detail_view p
on w.pack_dno=p.pack_dno;


create or replace view payment_detail_view
as
select p.*, d.name
from payment_detail p left join pack_detail_view d
on p.pack_dno= d.pack_dno;


create or replace view chart_view
as
select p.price, m.gender
    , pa.area_no, to_char(p.regdate, 'yyyy') as YEAR, to_char(p.regdate, 'MM') as MONTH
    , trunc(to_char(sysdate,'yyyy')
            -(substr(m.user_ssr,1,2) + case when substr(m.user_ssr,8,1) in (1,2) then 1900
                                       else 2000 end)+1 ,-1) as AGERANGE
from payment p left join payment_detail d
on p.payment_no = d.payment_no
left join member m
on p.user_no=m.user_no
left join pack_detail pd
on d.pack_dno=pd.pack_dno
left join pack pa
on pd.pack_no=pa.pack_no;
