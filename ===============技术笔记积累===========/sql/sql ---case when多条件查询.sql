drop table BLACK
create table BLACK
(
  BLACK_ID     VARCHAR2(50) not null,
  BLACK_MOBILE VARCHAR2(20),
  BLACK_DESC   VARCHAR2(100),
  BLACK_TIME   DATE,
  BLACK_TYPE   VARCHAR2(20),
  GROUP_ID     VARCHAR2(200),
  OPER_USERID  VARCHAR2(50),
  OPER_ORGID   VARCHAR2(50)
)
insert into black (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME, BLACK_TYPE, GROUP_ID, OPER_USERID, OPER_ORGID)
values ('747', '13621104081', '2222', to_date('20-11-2012', 'dd-mm-yyyy'), 'ORG', '1.02.01', '1', '1');
insert into black (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME, BLACK_TYPE, GROUP_ID, OPER_USERID, OPER_ORGID)
values ('748', '13621104082', '2222', to_date('20-11-2012', 'dd-mm-yyyy'), 'ORG', '1.02.01', '1', '1');
insert into black (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME, BLACK_TYPE, GROUP_ID, OPER_USERID, OPER_ORGID)
values ('749', '13621104081', '11111', to_date('20-11-2012', 'dd-mm-yyyy'), 'ORG', '', '1', '1');
insert into black (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME, BLACK_TYPE, GROUP_ID, OPER_USERID, OPER_ORGID)
values ('752', '13621104087', '777', to_date('20-11-2012', 'dd-mm-yyyy'), 'ORG', '', '1', '1');
insert into black (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME, BLACK_TYPE, GROUP_ID, OPER_USERID, OPER_ORGID)
values ('761', '13621104081', '11111', to_date('20-11-2012', 'dd-mm-yyyy'), 'ORG', '1.02', '1', '1');

select * from black t --for update 

--case when查询：方法一
select   
        oper.black_id,  
        oper.black_mobile,  
       -- oper.black_desc,  
       (case  
        when oper.black_desc = '11111'  then 'System Manager'   
        when oper.black_desc = '2222'  then 'USER Manager'  
        end) a,  
        oper.oper_userid,
        (case  
        when oper.oper_orgid = '1' then 'User'  
        when oper.oper_orgid = '2' then 'Role'  
        when oper.oper_orgid = 3 then 'Broker'  
        when oper.oper_orgid = 4 then 'QM Manager'  
        when oper.oper_orgid = 5 then 'User Group'  
        end) b         
 from black oper;  
 
--case when查询：方法二 
 select   
        oper.black_id,  
        oper.black_mobile,  
       -- oper.black_desc,  
        (case  oper.black_desc
        when  '11111'  then 'System Manager'   
        when  '2222'  then 'USER Manager'  
        end) a,  
        oper.oper_userid,
        (case  oper.oper_orgid
        when  '1' then 'User'  
        when  '2' then 'Role'  
        when  '3' then 'Broker'  
        when  '4' then 'QM Manager'  
        when  '5' then 'User Group'  
        end) b         
 from black oper; 
