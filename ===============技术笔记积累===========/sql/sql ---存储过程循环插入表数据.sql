--�鿴���������
select count(*) from v$session; 

Oracle����sql��ѯ��ȡ���ݿ�����д����������д洢���̣�������ͼ�����б�  

Select object_name From user_objects Where object_type='TRIGGER';  --���д�����  
  
Select object_name From user_objects Where object_type='PROCEDURE';  --���д洢����  
  
Select object_name From user_objects Where object_type='VIEW';  --������ͼ  
  
Select object_name From user_objects Where object_type='TABLE'; --���б�  

oracleһ�㲻���ִ�Сд��������ϵͳ����д�Сд������ 


--����
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
--��ѯ��
SELECT * FROM ESB_ADMIN_USER_INFO a order by a.word2
--�����������
insert into ESB_ADMIN_USER_INFO values('zhouhaitao','password','User','haitao@126.com','0',to_char(sysdate,'yyyy-MM-dd hh24:mi:ss'),'0',sysdate,'100');  

--#########����ѭ���������ݵĴ洢����!#######  
create or replace procedure pro_test_for   
is  
i number;  --�������;  
begin  
i:=0;      --��ʼ��Ϊ0;    
--ѭ��10000��.  
for i in 1..10000 loop  
  --�������ݵ�����.  
  insert into ESB_ADMIN_USER_INFO values('zhouhaitao'||i,'password','User','haitao'||i||'@126.com','0',to_char(sysdate,'yyyy-MM-dd hh24:mi:ss'),i,sysdate,'100');  
end loop;    
--�ύ.  
commit;     
end pro_test_for;  



--######�������Ĵ洢����#######
create procedure update_sal(name varchar2,newsal number) is
begin
   --�������USER_NAME��������Ĳ���name�����޸�CORDEֵΪ����Ĳ���newsal
    update ESB_ADMIN_USER_INFO set CORDE=newsal where USER_NAME=name;
end;


--ִ�д洢����(�������ִ�д洢����)
exec procedure pro_test_for;  

exec update_sal('User',123);
�� call update_sal('User',600);  

--��ձ�����
truncate table ESB_ADMIN_USER_INFO 
--ɾ����
drop table ESB_ADMIN_USER_INFO
--ɾ���洢����
drop procedure pro_test_for 
