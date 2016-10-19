create or replace procedure P_SMS_SEND_ANALYZE(p_date varchar2)
is
       v_sendTime date;--存开始日期
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- 拼接的基础SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --删除三天前发送短信的统计的数据 开始
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time >= to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --删除三天前发送短信的统计的数据 结束
          -- commit;
           --预统计三天前发送短信数量

           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id  where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id  where  ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')' ;
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id,t.org_id, t.user_id,t.send_status, t.sysdat, sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.parent_org_id,t.org_id,t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --删除当天发送短信的统计的数据 开始
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date 格式 ：2012-11-08 14:00:00
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.org_id, ss.user_id, ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o  where ss.MOBILE_QUANTITIES = 1 and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.org_id as parent_org_id,ss.org_id, ss.user_id, ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o  where ss.MOBILE_QUANTITIES = 1 and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id, t.org_id, t.user_id, t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (0,1,5,6,7) group by t.parent_org_id,t.org_id, t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_SMS_SEND_ANALYZE;

 
 
/
