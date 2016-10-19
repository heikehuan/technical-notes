create or replace procedure QUERY_MONTH_INFO_REPORT
     (
       p_startTime in varchar2,          --开始时间（年月日)
       p_endTime in varchar2,            --结束时间 （年月日)
       p_statType in number,             -- 查询类型 2 一般机构查询，1 渠道机构查询 0 超级管理员查询
       p_orgID in varchar2,              --机构ID 具体机构
       p_userID in varchar2,             --用户ID Admin 查所有
       p_userOrgId in varchar2,          --用户机构(从user对象的来)   
       mycursor out sys_refcursor       --返回结果集游标
      )
 is
       v_debug number(1);                          --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000);                       -- 拼接的基础SQL
begin
       v_SQL := '';
       v_debug := 0;
    
        v_SQL := 'select mri.user_id,
                     mri.user_name,                    
                     mri.month_begin_balance,
                     mri.month_end_balance,
                     mri.send_quantity,
                     mri.mobile_send_quantity,
                     mri.union_send_quantity,
                     mri.others_send_quantity,
                     mri.cost_fee,
                     mri.mobile_cost_fee,
                     mri.union_cost_fee,
                     mri.others_cost_fee,
                     mri.user_mome
                from month_reckoning_info mri
                left join user_info ui on ui.user_id=mri.user_id
                left join organization o on o.user_id=ui.organization_id
                where 1=1';

       if p_statType = 1  then   --渠道机构统计       
           --如果机构查询条件为空，默认显示本机构所有人员
           if p_orgID is null then
                 v_SQL := v_SQL || ' and (o.parentid='''||p_userOrgId||''' or o.user_id='''|| p_userOrgId || ''')';
           end if;           
       
           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;
           --查询条件不空，显示查询条件的人员
           if p_orgID is not null then
                 v_SQL := v_SQL || ' and ui.organization_id='''|| p_orgID || '''';
           end if;
           
           if p_startTime is not null then
               v_SQL := v_SQL || ' and to_date(to_char(mri.begin_time,''yyyy-mm-dd''),''yyyy-mm-dd'') >= ' || 'to_date('''||p_startTime||''',''yyyy-mm-dd'')';
           end if;

           if p_endTime is not null then
               v_SQL := v_SQL || ' and to_date(to_char(mri.end_time,''yyyy-mm-dd''),''yyyy-mm-dd'') <= ' || 'to_date('''||p_endTime||''',''yyyy-mm-dd'')';
           end if ;

      end if;

         if p_statType = 0  then --超级管理员机构统计
         
           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;
           
           if p_orgID is not null then
                 v_SQL := v_SQL || ' and ui.organization_id='''|| p_orgID || '''';
           end if;
           
           if p_startTime is not null then
               v_SQL := v_SQL || ' and to_date(to_char(mri.begin_time,''yyyy-mm-dd''),''yyyy-mm-dd'') >= ' || 'to_date('''||p_startTime||''',''yyyy-mm-dd'')';
           end if;

           if p_endTime is not null then
               v_SQL := v_SQL || ' and to_date(to_char(mri.end_time,''yyyy-mm-dd''),''yyyy-mm-dd'') <= ' || 'to_date('''||p_endTime||''',''yyyy-mm-dd'')';
           end if ;
           
      end if; 
   
     --调试代码:插入临时表，查看sql  
       insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
       commit;
      
      
     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;
  
end QUERY_MONTH_INFO_REPORT;
/
