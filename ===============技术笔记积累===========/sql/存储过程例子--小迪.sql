
create or replace procedure P_SEND_SMS_SUM
is
user_id sms_send_analyze.user_id%type;--发送的用户id
stat_time sms_send_analyze.stat_time%type;--发送日期
quantity sms_send_analyze.quantity%type;--短信发送总量
org_id sms_send_analyze.org_id%type;--用户所属机构
cursor sms_cursor_result is select 
 sum(MOBILE_QUANTITIES) quantity,
user_id,USER_ORGANIZATION as
 org_id,max(to_number(to_char(sysdate,'yyyymmdd')))
 as stat_time from send where sys_time<=sysdate 
 and sys_time>trunc(sysdate,'dd') group by user_id,USER_ORGANIZATION;--统计机构当天的发送量
begin
if sms_cursor_result%isopen then--防止游标上次未关闭
close sms_cursor_result;
end if;
open sms_cursor_result;
loop
fetch sms_cursor_result into quantity,user_id,org_id,stat_time;
exit when sms_cursor_result%notfound;
dbms_output.put_line('quantity:'||quantity||'user_id:'||user_id||'org_id:'||org_id||'stat_time:'||stat_time);
insert into sms_send_analyze(org_id,user_id,stat_time,status,quantity) values(org_id,user_id,stat_time,'1',quantity);
commit;
end loop;
close sms_cursor_result;


exception
 when others then
  rollback;

end P_SEND_SMS_SUM;

