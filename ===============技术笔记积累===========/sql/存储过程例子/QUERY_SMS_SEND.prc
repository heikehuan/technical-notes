create or replace procedure QUERY_SMS_SEND(
                  p_startTime in varchar2,--开始时间（年月日)
                  p_endTime in varchar2,--结束时间 （年月日)
                  p_statType in number, -- 统计类型 0 一般机构统计，1 渠道机构发送统计 2 超级管理员发送统计
                  p_userID in varchar2,--用户ID Admin 查所有
                  p_parentOrgID in varchar2,--机构ID 父机构

                  p_orgID in varchar2,--机构ID 具体机构
                  p_status in varchar2,-- 状态
                  mycursor out sys_refcursor--返回结果集游标
                 )
is
       v_startTime number(8);--存开始日期
       v_endTime number(8);--存结束日期
       v_char_startTime number(8);--存开始日期
       v_char_endTime number(8);--存结束日期

       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000); -- 拼接的基础SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --处理查询开始日期
    if p_startTime is not null  then
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_startTime := to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD');
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
             v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
        v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;

     v_subSQL := '
          SELECT T.PARENT_ORG_ID,
                 T.ORG_ID,
                 T.USER_ID,
                 T.SEND_STATUS AS STATUS,
                 T.SYSDAT,
                 SUM(MOBILE_QUANTITIES) AS QUANTITY
            FROM (
                 SELECT  SYS_TIME AS SYSDAT,
                         O.PARENTID AS PARENT_ORG_ID,
                         SS.USER_ORGANIZATION AS ORG_ID,
                         SS.USER_ID,
                         SS.SEND_STATUS,
                         SS.MOBILE_QUANTITIES
                    FROM SEND SS
                    LEFT JOIN ORGANIZATION O
                      ON SS.USER_ORGANIZATION = O.USER_ID
                   WHERE 1=1
                         AND ( SS.SEND_STATUS IN (0, 1, 5, 6, 7) and ss.IS_ORIGINAL_SMS = 0 ) --各种状态的原始短信,分短信要更新原始短信
                         AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                         AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                 ) T
           WHERE T.SEND_STATUS IN (0, 1, 5, 6, 7)
           GROUP BY T.PARENT_ORG_ID, T.ORG_ID, T.USER_ID, T.SYSDAT, T.SEND_STATUS
     ';
     --拼执行SQL开始
     if p_statType = 2  then --一般机构统计
          v_SQL := 'select u.user_name,ssa.status,sum(ssa.quantity) from ' || '(' || v_subSQL || ') ssa
                     left join user_info u on ssa.user_id = u.user_id
                   where ssa.org_id  = ''' || p_orgID || '''' ;
           if p_userID is not null then
              v_SQL := v_SQL || ' and ssa.user_id = ''' || p_userID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by u.user_name,ssa.status';
      end if;

      if p_statType = 1  then --渠道机构统计
          v_SQL := 'select o.user_name,ssa.status,sum(ssa.quantity) from ' || '(' || v_subSQL || ') ssa
                          left join organization o on ssa.org_id = o.user_id
                   where 1=1 ' ;
                   --ssa.parent_org_id  = ''' || p_parentOrgID || '''

           if p_orgID is not null then
               v_SQL := v_SQL || ' and ssa.org_id = ''' || p_orgID || '''';
           end if;
           
           if p_parentOrgID is not null then
               v_SQL := v_SQL || ' and (ssa.parent_org_id = ''' || p_parentOrgID || ''' or ssa.org_id='''||p_parentOrgID||''')';
           end if;
           
           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by o.user_name,ssa.status';
      end if;

      if p_statType = 0  then --超级管理员机构统计
          v_SQL := 'select o.user_name,ssa.status,sum(ssa.quantity) from ' || '(' || v_subSQL || ') ssa
                          left join organization o on ssa.org_id = o.user_id
                   where 1= 1 ' ;
           if p_orgID is not null then
              v_SQL := v_SQL || ' and ssa.org_id = ''' || p_orgID || '''';
           end if;         
           
           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by o.user_name,ssa.status';
      end if;
     
     insert into temp_table_test (CREATE_SQL, CREATE_TIME)
     values (v_SQL,sysdate);

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_SMS_SEND;
/
