create or replace procedure QUERY_RECKONING_INFO_REPORT
/**
  add by zhanhh on$20130620
  查询日结单报表存储过程
  p_userOrgId从user对象得来,其他输入参数从页面查询条件得来
*/
                (
                 p_startTime in varchar2,          --开始时间（年月日)
                 p_endTime in varchar2,            --结束时间 （年月日)
                 p_statType in number,             -- 查询类型 0 一般机构查询，1 渠道机构查询 2 超级管理员查询
                 p_orgID in varchar2,              --机构ID 具体机构
                 p_userID in varchar2,             --用户ID Admin 查所有
                 p_userOrgId in varchar2,          --用户机构
                  mycursor out sys_refcursor       --返回结果集游标
                 )
 is
       v_startTime number(8);                      --存开始日期
       v_endTime number(8);                        --存结束日期
       v_debug number(1);                          --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000);                       -- 拼接的基础SQL
begin
       v_SQL := '';
       v_debug := 0;

        --处理查询开始日期
       if p_startTime is not null  then
             v_startTime := to_number(to_char(to_date(p_startTime,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd'));
       end if;
       if p_endTime is not null then
             v_endTime := to_number(to_char(to_date(p_endTime,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd'));
       end if;

       if v_debug = 1 then
         DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime);
         DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime);
       end if;

       if p_statType = 1  then   --渠道机构统计
          v_SQL := 'select dri.daily_reckoning_id,dri.user_id,dri.user_name,dri.reckoning_date,dri.send_quantity,dri.sub_total_fee
                    from daily_reckoning_info dri
                    left join user_info u on dri.user_id=u.user_id
                    left join organization o on u.organization_id=o.user_id
                    where u.organization_id='''||p_userOrgId||'''';

           if p_userID is not null then
               v_SQL := v_SQL || ' and dri.user_id='''|| p_userID || '''';
           end if;

           if v_startTime is not null then
               v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) >= ' || v_startTime ;
           end if;

           if v_endTime is not null then
               v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' order by u.user_name,dri.reckoning_date';
      end if;


         if p_statType = 2  then --超级管理员机构统计
          v_SQL := 'select dri.daily_reckoning_id,dri.user_id,dri.user_name,dri.reckoning_date,dri.send_quantity,dri.sub_total_fee
                    from daily_reckoning_info dri
                    left join user_info u on dri.user_id=u.user_id
                    left join organization o on u.organization_id=o.user_id
                    where 1=1';
            if p_userID is not null then
                  v_SQL := v_SQL || ' and dri.user_id='''|| p_userID || '''';
           end if;

           if p_orgID is not null then
                 v_SQL := v_SQL || ' and u.organization_id='''|| p_orgID || '''';
           end if;

           if v_startTime is not null then
                  v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) >= '|| v_startTime ;
           end if;

           if v_endTime is not null then
                  v_SQL := v_SQL || ' and to_number(to_char(dri.reckoning_date,''yyyymmdd'')) <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' order by u.user_name,dri.reckoning_date';
      end if;

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;


end QUERY_RECKONING_INFO_REPORT;
/
