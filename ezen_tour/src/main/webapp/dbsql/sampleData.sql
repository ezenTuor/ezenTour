--ȸ�� ����--
insert into member_grade
values('C', 'ȸ�� ���Խ� �⺻���� �־����� �Ϲ�ȸ�� ����Դϴ�.', '��� ���� �ش���� ����, ���ϸ��� ���� 5%', 5);

insert into member
values(member_seq.nextval, 'hong', '1234', 'ȫ�浿', 13494, '��� ������ �д籸 ���� 681', 'A������ 4��', '010', '1111', '2222', 'test', 'naver.com', 'C', '990101-1122333', 'M', sysdate, 'N', null, default);

insert into member
values(member_seq.nextval, 'kim', '1234', '��浿', 13494, '��� ������ �д籸 ���� 681', 'A������ 4��', '010', '1111', '2222', 'test', 'naver.com', 'C', '010101-3122333', 'M', sysdate, 'N', null, default);

insert into member
values(member_seq.nextval, 'lee', '1234', '�̱浿', 13494, '��� ������ �д籸 ���� 681', 'A������ 4��', '010', '1111', '2222', 'test', 'naver.com', 'C', '920101-2122333', 'F', sysdate, 'N', null, default);

insert into member
values(member_seq.nextval, 'park', '1234', '�ڱ浿', 13494, '��� ������ �д籸 ���� 681', 'A������ 4��', '010', '1111', '2222', 'test', 'naver.com', 'C', '040101-4122333', 'F', sysdate, 'N', null, default);

--������ --
insert into manager
values('admin123', '123', '�����', 'ADMIN', 'test2', 'naver.com', '010', '2222', '3333');


commit;

select min(man) as "minPrice", 
max(man) as "maxPrice"
from pack_detail  
where pack_no=1;


-- ���� ��з� ���� --
select * from area order by area_no;

insert into area
values(area_seq.nextval, 'EU', '����', '���� ��з�');

insert into area
values(area_seq.nextval, 'ASE', '������', '������ ��з�');

insert into area
values(area_seq.nextval, 'JP', '�Ϻ�', '�Ϻ� ��з�');

insert into area
values(area_seq.nextval,'CN', '�߱�/��ī��/ȫ��', '�߱� ��з�');

insert into area
values(area_seq.nextval,'GS', '��/������', '��/������ ��з�');

insert into area
values(area_seq.nextval,'OSN', 'ȣ��/��������', 'ȣ��/�������� ��з�');

insert into area
values(area_seq.nextval, 'USA', '�̱�/ĳ����/�߹�', '�̱�/ĳ����/�߹� ��з�');

insert into area
values(area_seq.nextval,'AF', '�ε�/������ī', '�ε�/������ī ��з�');


-- ���� �Һз� ���� --

select * from area_detail;
  
  -- ���� ��Ʈ --
insert into area_detail
values(area_detail_seq.nextval, 1 , '������', '������|����|������|���¸�');

insert into area_detail
values(area_detail_seq.nextval, 1 , '������/��ĭ', '������|��ĭ|������|�񿣳�|ũ�ξ�Ƽ��|ü��|�밡��');

insert into area_detail
values(area_detail_seq.nextval, 1 , '������/��������/�����', '������|��������|�����');

insert into area_detail
values(area_detail_seq.nextval, 1 , '��Ű/�׸���/�ι���', '��Ű|�׸���|�ι���');

insert into area_detail
values(area_detail_seq.nextval, 1 , '������/���þ�/��ƽ', '������|���þ�|��ƽ|�ɶ���');

insert into area_detail
values(area_detail_seq.nextval, 1 , '�ص�/���𺸽���', '�ص�|���𺸽���|���Ű��ź|ī���彺ź');

insert into area_detail
values(area_detail_seq.nextval, 1 , '����Ʈ/�̽���/�丣��', '����Ʈ|�̽���|�丣��');

commit;

select * from area_detail
where area_no=1;

--��Ű��--
select * from pack;

insert into pack
values(pack_seq.nextval, '�׽�Ʈ�� ��Ű��', 'https://dimgcdn.ybtour.co.kr/TN/3c/3c48dd0e2bf489ad54f6c0da2e07fa66.tn.410x280.jpg | �����̹���2.jpg', '21432|31324', '������', '�ĸ�', '������|�ĸ�|������|����ž', '��������', '6~7��', '��, ��, ��', '�׽�Ʈ�� ��з� ����', sysdate, 1);

insert into pack
values(pack_seq.nextval, '�׽�Ʈ�� ��Ű��2', 'https://dimgcdn.ybtour.co.kr/TN/ad/ad33ab1dc5d49b3bec7bb72478bd0a8b.tn.410x280.jpg | �����̹���2.jpg', '21432|31324', '������', '��¼��', '������|�ĸ�|������|����ž', '��õ����', '7~8��', 'ȭ, ��, ��', '�׽�Ʈ�� ��з� ����2', sysdate, 1);


select * from pack_detail;

insert into pack_detail
values(pack_detail_seq.nextval, 1, '21321', TO_DATE('2020/01/14 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21823' , TO_DATE('2020/01/20 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/21 11:30:00','yyyy/mm/dd hh24:mi:ss'), 2900000, 2100000, 700000, '��������', '6��', 'Y', '���� ��', 25, 40, 12);

insert into pack_detail
values(pack_detail_seq.nextval, 1, '21321', TO_DATE('2020/01/14 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21823' , TO_DATE('2020/01/20 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/21 11:30:00','yyyy/mm/dd hh24:mi:ss'), 2900000, 2100000, 700000, '��������', '5��6��', 'Y', '���� ��', 25, 40, 12);

insert into pack_detail
values(pack_detail_seq.nextval, 1, '213ka1', TO_DATE('2020/01/18 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/19 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21829' , TO_DATE('2020/01/24 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/25 11:30:00','yyyy/mm/dd hh24:mi:ss'), 350000, 230000, 800000, '��������', '6��', 'Y', '���� ��', 25, 40, 16);


insert into pack_detail
values(pack_detail_seq.nextval, 1, '213ka1', TO_DATE('2020/02/18 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/19 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21829' , TO_DATE('2020/02/24 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/25 11:30:00','yyyy/mm/dd hh24:mi:ss'), 350000, 230000, 800000, '�����', '3��4��', 'Y', '���� ��', 25, 40, 40);


insert into pack_detail
values(pack_detail_seq.nextval, 2, '434kka', TO_DATE('2020/01/29 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/30 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21829' , TO_DATE('2020/02/03 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/02/04 11:30:00','yyyy/mm/dd hh24:mi:ss'), 740000, 450000, 800000, '��������', '2��3��', 'Y', '���� ��', 25, 30, 12);

commit;