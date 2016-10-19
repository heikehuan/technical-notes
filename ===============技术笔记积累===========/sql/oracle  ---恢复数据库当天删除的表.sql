/*恢复当天删除了表而没有记住表的名称*/

--存储过程如下：   
  create or replace procedure proc_databack (deletetime in varchar2)   
  as  
  --把当天已经删除的信息查询出来放入游标   
  cursor mycursor is(select  object_name   from recyclebin  where droptime like deletetime);   
  temp_emp    varchar2(2000);   
  vflash_back   varchar2(2000);   
  begin  
    open mycursor;   
    loop   
    fetch mycursor  into temp_emp;   
    exit when mycursor%notfound;   
   --构建恢复语句   
    vflash_back:='flashback table "'||temp_emp||'"  to  before drop';   
     --循环恢复被删除的表，直到全部恢复完成   
    execute immediate vflash_back;   
    end loop;   
    close mycursor;   
end;   
  
--调用存储过程   
--比如今天是2011-12-02，那么写法如下：   
/*   
declare  
time varchar2(20);   
begin  
time:='2013-12-02%';   
proc_databack (time);   
end;   
  */
 
 
1. 表查询闪回
create table xcp as (select * from b_za_bzdzkxx);
select * from xcp;
select count(1) from xcp;--22001
select count(1) from xcp t where t.dzbh like '510521%';--7011
delete from xcp t where t.dzbh like '510521%';
select count(1) from xcp;--14990
－－查找指定时间点前的数据
select count(1) from xcp as of timestamp to_timestamp('2011-12-23 10:49:30','yyyy-MM-dd hh24:mi:ss');--22001

select * from xcp for update;－－添加一条记录
select count(1) from xcp;--14991

--恢复指定时间点的前delete数据（将删除恢复时间点后面的数据）
alter table xcp enable row movement;--启动的行移动功能
flashback table xcp to timestamp to_timestamp('2011-12-23 10:49:30,'yyyy-MM-dd hh24:mi:ss');
select count(1) from xcp;--22001

--恢复指定时间点的前delete数据，并保留恢复时间点后面的数据
create table xcp2 as (select * from xcp t where t.createdtime>to_timestamp('2011-12-23 10:49:30','yyyy-MM-dd hh24:mi:ss'));
select * from xcp2;--临时表
alter table xcp enable row movement;--启动的行移动功能
flashback table xcp to timestamp to_timestamp('2011-12-23 10:49:30,'yyyy-MM-dd hh24:mi:ss');
select count(1) from xcp;--22001
insert into xcp select * from xcp2 --将临时表的数据再插入到源表
select count(1) from xcp;--22002


2.删除闪回[10g+]
    删除闪回为删除oracle 10G提供了一个数据库安全机制，当用户删除一个表时，oracle 10G会将该表放到回收站中，回收站中的对象一直会保留，直到用户决定永久删除它们或出现表空间的空间不足时才会被删除。回收站是一个虚拟容器，用于存储所有被删除的对象。数据字典user_tables中的列dropped表示被删除的表，查询方法如下：
select table_name,dropped from user_tables;
--设置数据库是否启用回收站
alert session set recyclebin = off;
--查询回收站对象

select * from recyclebin;
select * from user_recyclebin;
select * from dba_recyclebin;



drop table xcp;
select count(1) from xcp;--0
--恢复drop的表
flashback table xcp to before drop;
select count(1) from xcp;--22001 

如果不知道原表名，可以直接使用回收站中的名称进行闪回..

flashback table "BIN$JiXyAUO4R+u3qNVfQK/Kiw==$0" to before drop;
在回收的同时可以修改表名

flashback table " BIN$JiXyAUO4R+u3qNVfQK/Kiw==$0" to before drop rename to xcp1;


--真正删除一个表，而不进入回收站，可以在删除表时增加purge选项
drop table xcp1 purge;
--也可以从回收站永久性删除表
purge table xcp1;
--删除当前用户回收站
purge recyclebin
--删除全体用户在回收站的资源
purge dba_resyclebin



3.数据库闪口 [10g+]
    使用数据库闪回功能，可以使数据库回到过去某一状态，语法如下：
        sql: alter database flashback on;
        sql: flashback database to scn 46963;
        sql: flashback database to timestamp to_timestamp('2007-2-12 12:00:00','yyyy-MM-dd hh24:mi:ss'); 
 
 
