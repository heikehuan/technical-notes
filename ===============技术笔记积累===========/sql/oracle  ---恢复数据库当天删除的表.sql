/*�ָ�����ɾ���˱��û�м�ס�������*/

--�洢�������£�   
  create or replace procedure proc_databack (deletetime in varchar2)   
  as  
  --�ѵ����Ѿ�ɾ������Ϣ��ѯ���������α�   
  cursor mycursor is(select  object_name   from recyclebin  where droptime like deletetime);   
  temp_emp    varchar2(2000);   
  vflash_back   varchar2(2000);   
  begin  
    open mycursor;   
    loop   
    fetch mycursor  into temp_emp;   
    exit when mycursor%notfound;   
   --�����ָ����   
    vflash_back:='flashback table "'||temp_emp||'"  to  before drop';   
     --ѭ���ָ���ɾ���ı�ֱ��ȫ���ָ����   
    execute immediate vflash_back;   
    end loop;   
    close mycursor;   
end;   
  
--���ô洢����   
--���������2011-12-02����ôд�����£�   
/*   
declare  
time varchar2(20);   
begin  
time:='2013-12-02%';   
proc_databack (time);   
end;   
  */
 
 
1. ���ѯ����
create table xcp as (select * from b_za_bzdzkxx);
select * from xcp;
select count(1) from xcp;--22001
select count(1) from xcp t where t.dzbh like '510521%';--7011
delete from xcp t where t.dzbh like '510521%';
select count(1) from xcp;--14990
��������ָ��ʱ���ǰ������
select count(1) from xcp as of timestamp to_timestamp('2011-12-23 10:49:30','yyyy-MM-dd hh24:mi:ss');--22001

select * from xcp for update;�������һ����¼
select count(1) from xcp;--14991

--�ָ�ָ��ʱ����ǰdelete���ݣ���ɾ���ָ�ʱ����������ݣ�
alter table xcp enable row movement;--���������ƶ�����
flashback table xcp to timestamp to_timestamp('2011-12-23 10:49:30,'yyyy-MM-dd hh24:mi:ss');
select count(1) from xcp;--22001

--�ָ�ָ��ʱ����ǰdelete���ݣ��������ָ�ʱ�����������
create table xcp2 as (select * from xcp t where t.createdtime>to_timestamp('2011-12-23 10:49:30','yyyy-MM-dd hh24:mi:ss'));
select * from xcp2;--��ʱ��
alter table xcp enable row movement;--���������ƶ�����
flashback table xcp to timestamp to_timestamp('2011-12-23 10:49:30,'yyyy-MM-dd hh24:mi:ss');
select count(1) from xcp;--22001
insert into xcp select * from xcp2 --����ʱ��������ٲ��뵽Դ��
select count(1) from xcp;--22002


2.ɾ������[10g+]
    ɾ������Ϊɾ��oracle 10G�ṩ��һ�����ݿⰲȫ���ƣ����û�ɾ��һ����ʱ��oracle 10G�Ὣ�ñ�ŵ�����վ�У�����վ�еĶ���һֱ�ᱣ����ֱ���û���������ɾ�����ǻ���ֱ�ռ�Ŀռ䲻��ʱ�Żᱻɾ��������վ��һ���������������ڴ洢���б�ɾ���Ķ��������ֵ�user_tables�е���dropped��ʾ��ɾ���ı���ѯ�������£�
select table_name,dropped from user_tables;
--�������ݿ��Ƿ����û���վ
alert session set recyclebin = off;
--��ѯ����վ����

select * from recyclebin;
select * from user_recyclebin;
select * from dba_recyclebin;



drop table xcp;
select count(1) from xcp;--0
--�ָ�drop�ı�
flashback table xcp to before drop;
select count(1) from xcp;--22001 

�����֪��ԭ����������ֱ��ʹ�û���վ�е����ƽ�������..

flashback table "BIN$JiXyAUO4R+u3qNVfQK/Kiw==$0" to before drop;
�ڻ��յ�ͬʱ�����޸ı���

flashback table " BIN$JiXyAUO4R+u3qNVfQK/Kiw==$0" to before drop rename to xcp1;


--����ɾ��һ���������������վ��������ɾ����ʱ����purgeѡ��
drop table xcp1 purge;
--Ҳ���Դӻ���վ������ɾ����
purge table xcp1;
--ɾ����ǰ�û�����վ
purge recyclebin
--ɾ��ȫ���û��ڻ���վ����Դ
purge dba_resyclebin



3.���ݿ����� [10g+]
    ʹ�����ݿ����ع��ܣ�����ʹ���ݿ�ص���ȥĳһ״̬���﷨���£�
        sql: alter database flashback on;
        sql: flashback database to scn 46963;
        sql: flashback database to timestamp to_timestamp('2007-2-12 12:00:00','yyyy-MM-dd hh24:mi:ss'); 
 
 
