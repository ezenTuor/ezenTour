create or replace view coupon_view
as
select a.CUPON_DETAIL, a.CUPON_KIND, a.DISCOUNT
from coupon c join cupon_admin a
on c.CUPON_SERIAL = a.CUPON_SERIAL
where c.USER_NO = 111 and c.USEDATE is null and c.DEL_FLAG is null;