--查询正在运行的
select * from dba_jobs;

select job,
       log_user,
       to_char(last_date,'yyyy-mm-dd hh24:mi:ss') last_date,
       to_char(next_date,'yyyy-mm-dd hh24:mi:ss') next_date,
       interval,
       what
     from user_jobs;

--创建job
/*
declare
njob number; 
begin
  sys.dbms_job.submit(job => njob,
                      what => 'BEGIN P_SMSREPORT_UPDATESMS(10000,60); END;',
                      next_date => to_date('06-06-2013 11:59:36', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/(24*60*2)');
   commit;
end;
/
*/
--创建job             

declare
njob number; 
begin
  sys.dbms_job.submit(job => njob,
                      what => ' declare ret_code NUMBER;ret_string VARCHAR2(1024);ret_handle_record_num NUMBER; BEGIN PCK_BATCH_HANDLE_INTERFACE.PRC_SMS_SEND_DATA_HANDLE_INTER(ret_code,ret_string,ret_handle_record_num); END;',
                      next_date => to_date('18-06-2013 11:59:36', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/(24*60*60)');
   commit;
end;
/

-------------删除JOB-----------------
/*begin
 dbms_job.remove(47);
end;
  */



每天凌晨2点执行一次 :  'trunc(sysdate)+1+2/24'
月初第三天凌晨2点15分 :  'TRUNC(LAST_DAY(SYSDATE))+3+(2*60+15)/(24*60)'
每天午夜12点 'TRUNC(SYSDATE + 1)'
每天早上8点30分 'TRUNC(SYSDATE + 1) + (8*60+30)/(24*60)'
每星期二中午12点 'NEXT_DAY(TRUNC(SYSDATE ), ''TUESDAY'' ) + 12/24'
每个月第一天的午夜12点 'TRUNC(LAST_DAY(SYSDATE ) + 1)'
每个季度最后一天的晚上11点 'TRUNC(ADD_MONTHS(SYSDATE + 2/24, 3 ), 'Q' ) -1/24'
每星期六和日早上6点10分 'TRUNC(LEAST(NEXT_DAY(SYSDATE, ''SATURDAY"), NEXT_DAY(SYSDATE, "SUNDAY"))) + (6*60+10)/(24*60)'
在Oracle JOB间隔时间参考，其中li_jobno是它的ID,可以通过这个ID停掉这个任务，最后想说的是不要执行多次，你可以在里面管理起来，发现已经运行了就不SUBMIT
每天运行一次 'SYSDATE + 1'
每小时运行一次 'SYSDATE + 1/24'
每10分钟运行一次 'SYSDATE + 10/(60*24)'
每30秒运行一次 'SYSDATE + 30/(60*24*60)'
每隔一星期运行一次 'SYSDATE + 7'
不再运行该任务并删除它 NULL
每年1月1号零时
trunc(last_day(to_date(extract(year from sysdate)||'12'||'01','yyyy-mm-dd'))+1) 
每年7月1日和1月1日凌晨1点执行
ADD_MONTHS(TRUNC(sysdate,'yyyy'),6)+1/24


oracle JOB常见的执行时间
 
1、每分钟执行
TRUNC(sysdate,'mi')+1/(24*60)
 
2、每天定时执行
例如：
每天凌晨0点执行
TRUNC(sysdate+1)
每天凌晨1点执行
TRUNC(sysdate+1)+1/24
每天早上8点30分执行
TRUNC(SYSDATE+1)+(8*60+30)/(24*60)
 
3、每周定时执行
例如：
每周一凌晨2点执行
TRUNC(next_day(sysdate,1))+2/24
TRUNC(next_day(sysdate,'星期一'))+2/24
每周二中午12点执行
TRUNC(next_day(sysdate,2))+12/24
TRUNC(next_day(sysdate,'星期二'))+12/24
 
4、每月定时执行
例如：
每月1日凌晨0点执行
TRUNC(LAST_DAY(SYSDATE)+1)
每月1日凌晨1点执行
TRUNC(LAST_DAY(SYSDATE)+1)+1/24
 
5、每季度定时执行
每季度的第一天凌晨0点执行
TRUNC(ADD_MONTHS(SYSDATE,3),'q')
每季度的第一天凌晨2点执行
TRUNC(ADD_MONTHS(SYSDATE,3),'q')+2/24
每季度的最后一天的晚上11点执行
TRUNC(ADD_MONTHS(SYSDATE+ 2/24,3),'q')-1/24
 
6、每半年定时执行
例如：
每年7月1日和1月1日凌晨1点执行
ADD_MONTHS(TRUNC(sysdate,'yyyy'),6)+1/24
 
7、每年定时执行
例如：
每年1月1日凌晨2点执行
ADD_MONTHS(TRUNC(sysdate,'yyyy'),12)+2/24


删除oracle Job
1.删除所有用户的JOB 
begin
for v in(select job from user_jobs) loop
dbms_job.remove(v.job);
end loop;
commit;
end;



2.删除指定用户的JOB
define USER=&1

begin
for v in(select job from user_jobs where log_user='&USER') loop
dbms_job.remove(v.job);
end loop;
commit;
end;



3.删除特定内容的JOB

begin
for v in(select job from user_jobs where what 
in( 
'the_what_name;',
)
) loop
dbms_job.remove(v.job);
end loop;
commit;
end;
/

补充：
dba_jobs：
LOG_USER 提交任务的用户
PRIV_USER 赋予任务权限的用户
SCHEMA_USER 对任务作语法分析的用户模式

http://blog.chinaunix.net/u1/40226/showart_2269864.html


JOB始终没有运行问题

1.首先确认当前的Job Queue Processes的数目

SQL> select name,value from v$parameter where name ='job_queue_processes';

2.如果值为0 然后将Job Queue Processes的数目修改为大于0的数

SQL> ALTER SYSTEM SET job_queue_processes = 10;

http://blog.chinaunix.net/u/23363/showart_2228630.html