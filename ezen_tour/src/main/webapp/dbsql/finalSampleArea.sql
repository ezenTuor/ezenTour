-----���� ��з� ����-----

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