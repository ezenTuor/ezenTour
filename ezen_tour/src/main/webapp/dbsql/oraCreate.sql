--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace eztour
datafile 'D:\myoracle\ezentour.dbf' size 48m
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user eztour
identified by ez123
default tablespace eztour;

--����� ���Ѻο�
grant connect,resource to eztour;
--grant connect, dba to herb with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to eztour;