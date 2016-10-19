--��ѯ�������е�
select * from dba_jobs;

select job,
       log_user,
       to_char(last_date,'yyyy-mm-dd hh24:mi:ss') last_date,
       to_char(next_date,'yyyy-mm-dd hh24:mi:ss') next_date,
       interval,
       what
     from user_jobs;

--����job
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
--����job             

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

-------------ɾ��JOB-----------------
/*begin
 dbms_job.remove(47);
end;
  */



ÿ���賿2��ִ��һ�� :  'trunc(sysdate)+1+2/24'
�³��������賿2��15�� :  'TRUNC(LAST_DAY(SYSDATE))+3+(2*60+15)/(24*60)'
ÿ����ҹ12�� 'TRUNC(SYSDATE + 1)'
ÿ������8��30�� 'TRUNC(SYSDATE + 1) + (8*60+30)/(24*60)'
ÿ���ڶ�����12�� 'NEXT_DAY(TRUNC(SYSDATE ), ''TUESDAY'' ) + 12/24'
ÿ���µ�һ�����ҹ12�� 'TRUNC(LAST_DAY(SYSDATE ) + 1)'
ÿ���������һ�������11�� 'TRUNC(ADD_MONTHS(SYSDATE + 2/24, 3 ), 'Q' ) -1/24'
ÿ��������������6��10�� 'TRUNC(LEAST(NEXT_DAY(SYSDATE, ''SATURDAY"), NEXT_DAY(SYSDATE, "SUNDAY"))) + (6*60+10)/(24*60)'
��Oracle JOB���ʱ��ο�������li_jobno������ID,����ͨ�����IDͣ��������������˵���ǲ�Ҫִ�ж�Σ��������������������������Ѿ������˾Ͳ�SUBMIT
ÿ������һ�� 'SYSDATE + 1'
ÿСʱ����һ�� 'SYSDATE + 1/24'
ÿ10��������һ�� 'SYSDATE + 10/(60*24)'
ÿ30������һ�� 'SYSDATE + 30/(60*24*60)'
ÿ��һ��������һ�� 'SYSDATE + 7'
�������и�����ɾ���� NULL
ÿ��1��1����ʱ
trunc(last_day(to_date(extract(year from sysdate)||'12'||'01','yyyy-mm-dd'))+1) 
ÿ��7��1�պ�1��1���賿1��ִ��
ADD_MONTHS(TRUNC(sysdate,'yyyy'),6)+1/24


oracle JOB������ִ��ʱ��
 
1��ÿ����ִ��
TRUNC(sysdate,'mi')+1/(24*60)
 
2��ÿ�춨ʱִ��
���磺
ÿ���賿0��ִ��
TRUNC(sysdate+1)
ÿ���賿1��ִ��
TRUNC(sysdate+1)+1/24
ÿ������8��30��ִ��
TRUNC(SYSDATE+1)+(8*60+30)/(24*60)
 
3��ÿ�ܶ�ʱִ��
���磺
ÿ��һ�賿2��ִ��
TRUNC(next_day(sysdate,1))+2/24
TRUNC(next_day(sysdate,'����һ'))+2/24
ÿ�ܶ�����12��ִ��
TRUNC(next_day(sysdate,2))+12/24
TRUNC(next_day(sysdate,'���ڶ�'))+12/24
 
4��ÿ�¶�ʱִ��
���磺
ÿ��1���賿0��ִ��
TRUNC(LAST_DAY(SYSDATE)+1)
ÿ��1���賿1��ִ��
TRUNC(LAST_DAY(SYSDATE)+1)+1/24
 
5��ÿ���ȶ�ʱִ��
ÿ���ȵĵ�һ���賿0��ִ��
TRUNC(ADD_MONTHS(SYSDATE,3),'q')
ÿ���ȵĵ�һ���賿2��ִ��
TRUNC(ADD_MONTHS(SYSDATE,3),'q')+2/24
ÿ���ȵ����һ�������11��ִ��
TRUNC(ADD_MONTHS(SYSDATE+ 2/24,3),'q')-1/24
 
6��ÿ���궨ʱִ��
���磺
ÿ��7��1�պ�1��1���賿1��ִ��
ADD_MONTHS(TRUNC(sysdate,'yyyy'),6)+1/24
 
7��ÿ�궨ʱִ��
���磺
ÿ��1��1���賿2��ִ��
ADD_MONTHS(TRUNC(sysdate,'yyyy'),12)+2/24


ɾ��oracle Job
1.ɾ�������û���JOB 
begin
for v in(select job from user_jobs) loop
dbms_job.remove(v.job);
end loop;
commit;
end;



2.ɾ��ָ���û���JOB
define USER=&1

begin
for v in(select job from user_jobs where log_user='&USER') loop
dbms_job.remove(v.job);
end loop;
commit;
end;



3.ɾ���ض����ݵ�JOB

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

���䣺
dba_jobs��
LOG_USER �ύ������û�
PRIV_USER ��������Ȩ�޵��û�
SCHEMA_USER ���������﷨�������û�ģʽ

http://blog.chinaunix.net/u1/40226/showart_2269864.html


JOBʼ��û����������

1.����ȷ�ϵ�ǰ��Job Queue Processes����Ŀ

SQL> select name,value from v$parameter where name ='job_queue_processes';

2.���ֵΪ0 Ȼ��Job Queue Processes����Ŀ�޸�Ϊ����0����

SQL> ALTER SYSTEM SET job_queue_processes = 10;

http://blog.chinaunix.net/u/23363/showart_2228630.html