--查看最大连接数
select count(*) from v$session; 

Oracle中用sql查询获取数据库的所有触发器，所有存储过程，所有视图，所有表  

Select object_name From user_objects Where object_type='TRIGGER';  --所有触发器  
  
Select object_name From user_objects Where object_type='PROCEDURE';  --所有存储过程  
  
Select object_name From user_objects Where object_type='VIEW';  --所有视图  
  
Select object_name From user_objects Where object_type='TABLE'; --所有表  

oracle一般不区分大小写，但对于系统表会有大小写的区分 


--建表
create table ESB_ADMIN_USER_INFO
(
  USER_ID     VARCHAR2(50) not null,
  PASS VARCHAR2(20),
  USER_NAME  VARCHAR2(20),
  EMAIL   VARCHAR2(100),
  WORD   VARCHAR2(100),
  DATE_TIME   VARCHAR2(100),
  WORD2     VARCHAR2(200),
  DATE_TIME2  DATE,
  CORDE   VARCHAR2(50)     
)
--查询表
SELECT * FROM ESB_ADMIN_USER_INFO a order by a.word2
--插入测试数据
insert into ESB_ADMIN_USER_INFO values('zhouhaitao','password','User','haitao@126.com','0',to_char(sysdate,'yyyy-MM-dd hh24:mi:ss'),'0',sysdate,'100');  

--#########创建循环插入数据的存储过程!#######  
create or replace procedure pro_test_for   
is  
i number;  --定义变量;  
begin  
i:=0;      --初始化为0;    
--循环10000次.  
for i in 1..10000 loop  
  --插入数据到表中.  
  insert into ESB_ADMIN_USER_INFO values('zhouhaitao'||i,'password','User','haitao'||i||'@126.com','0',to_char(sysdate,'yyyy-MM-dd hh24:mi:ss'),i,sysdate,'100');  
end loop;    
--提交.  
commit;     
end pro_test_for;  



--######带参数的存储过程#######
create procedure update_sal(name varchar2,newsal number) is
begin
   --如果表中USER_NAME等于输入的参数name，则修改CORDE值为输入的参数newsal
    update ESB_ADMIN_USER_INFO set CORDE=newsal where USER_NAME=name;
end;


--执行存储过程(在命令窗口执行存储过程)
exec procedure pro_test_for;  

exec update_sal('User',123);
或 call update_sal('User',600);  

--清空表数据
truncate table ESB_ADMIN_USER_INFO 
--删除表
drop table ESB_ADMIN_USER_INFO
--删除存储过程
drop procedure pro_test_for 
