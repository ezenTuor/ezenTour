--ȸ�� ����--
insert into member_grade
values('C', 'ȸ�� ���Խ� �⺻���� �־����� �Ϲ�ȸ�� ����Դϴ�.', '��� ���� �ش���� ����, ���ϸ��� ���� 5%', 5);

insert into member
values(member_seq.nextval, 'hong', '1234', 'ȫ�浿', 13494, '��� ������ �д籸 ���� 681', 'A������ 4��', '010', '1111', '2222', 'test', 'naver.com', 'C', '990101-1122333', 'M', sysdate, 'N', null);

--������ --
insert into manager
values('admin123', '123', '�����', 'ADMIN', 'test2', 'naver.com', '010', '2222', '3333');

--��Ű��--
select * from pack;

insert into pack
values(pack_seq.nextval, '�׽�Ʈ�� ��Ű��', '�����̹���1.jpg | �����̹���2.jpg', '21432|31324', '������', '�ĸ�', '������|�ĸ�|������|����ž', '��������', '6~7��', '��, ��, ��', '�׽�Ʈ�� ��з� ����', sysdate);

select * from pack_detail;

insert into pack_detail
values(pack_detail_seq.nextval, 1, '21321', TO_DATE('2020/01/14 17:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/15 13:15:00','yyyy/mm/dd hh24:mi:ss'), '21823' , TO_DATE('2020/01/20 15:30:00','yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/01/21 11:30:00','yyyy/mm/dd hh24:mi:ss'), 2900000, 2100000, 700000, '��������', '6��', 'Y', '���� ��', '�ʿ���� �÷�(��������) - ����:�ĸ�', '�ʿ���� �÷�', '�ʿ���� �÷�', 25, 40, 12);

