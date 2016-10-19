--�洢�����������ڣ���ɾ��
create or replace procedure proc_dropifexists(
    p_table in varchar2 
) is
    v_count number(10);
begin
   select count(*)
   into v_count
   from user_objects
   where object_name = upper(p_table);
   if v_count > 0 then
      execute immediate 'drop table ' || p_table ||' purge';
end if;
end proc_dropifexists;

--pl/sql��ֱ��ִ�У�
call proc_dropifexists('TEMP_TABLE_TEST');
--��Ҫ��sql-plus��ִ��,������pl/sql������(command)������ִ��
exec proc_dropifexists('TEMP_TABLE_TEST');

-- Create table
create table TEMP_TABLE_TEST
(
  CREATE_SQL  CLOB,
  CREATE_TIME DATE
);



