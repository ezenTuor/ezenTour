select * from history;

insert into history
values(2, 1, '결제완료', 5, 300, 'N');

select * from pack_detail;

insert into pack_detail
select pack_detail_seq.nextval,pack_no, dep_code, korea_dep, local_ent, ent_code, local_dep, sysdate, man, child, baby, airline, days_detail, shopping, details, capecity_min, capecity, capecity_cur
from pack_detail
where pack_dno=1;


select * from history_view;

select * from history_view
where review='N'
and korea_ent between (sysdate-7) and (sysdate)
order by history_no desc;