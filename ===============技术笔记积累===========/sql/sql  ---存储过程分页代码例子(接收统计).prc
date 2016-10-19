create or replace procedure QUERY_SMS_RECEIVE(p_startTime    in varchar2, --开始时间（年月日)
                                              p_endTime      in varchar2, --结束时间 （年月日)
                                              p_statType     in number, -- 统计类型 0 针对机构统计上行短信，1 针对用户统计上行短信
                                              p_userID       in varchar2, --机构ID Admin 查所有
                                              p_parentOrgID  in varchar2, --机构ID 父机构
                                              p_orgID        in varchar2, --机构ID 具体机构
                                              p_pageNo       in number, --当前页面，从1开始
                                              p_pageSize     in number, --每页记录数
                                              outRecordCount out number, --返回记录总条数
                                              mycursor       out sys_refcursor --返回结果集游标
                                              ) is

  v_SQL            varchar2(8000); -- 拼接的基础SQL
  v_SQL_TotalCount varchar2(8000); -- 查询记录总条数SQL
  v_SQL_Result     varchar2(8000); -- 查询结果集SQL

  v_hiRownum number(8); --当前页记录对应最大的页码
  v_loRownum number(8); --当前页记录对应最小的页码
begin
  v_SQL      := '';
  v_hiRownum := 15;
  v_loRownum := 0;

  --拼执行SQL开始
  if p_statType = 0 then
    --针对机构统计上行短信
    if p_parentOrgID is not null then
      --统计所有机构子机构
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.sys_time >= to_date(''' ||
               p_startTime||''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <=to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id where o.parentid= ''' ||
               p_parentOrgID || ''' or o.user_id = ''' || p_parentOrgID ||
               ''' group by o.user_name';
    else
      --只统计某个机构
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id  group by o.user_name';
    end if;
  else
    --针对用户统计上行短信
    if p_userID is not null then
      --统计该机构某个用户
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.user_id =''' || p_userID ||
               ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    else
      -- 统计该机构所有用户
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and  r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    end if;
  end if;
   --插入测试临时表，用来查看拼接的sql
   insert into temp_table_test (CREATE_SQL, CREATE_TIME)
     values (v_SQL,sysdate);

  dbms_output.put_line('v_SQL = ' || v_SQL);
  --查询当前条件下记录总条数
  v_SQL_TotalCount := ' SELECT count(*) FROM ( ';
  v_SQL_TotalCount := v_SQL_TotalCount || v_SQL;
  v_SQL_TotalCount := v_SQL_TotalCount || ' ) ';
  --取记录总条数
  execute immediate v_SQL_TotalCount
    into outRecordCount;
  --处理分页的页码
  v_hiRownum := p_pageNo * p_pageSize;
  v_loRownum := v_hiRownum - p_pageSize + 1;
  --拼分页的查询SQL
  v_SQL_Result := ' select * FROM (  select A.*, rownum rn From ( ';
  v_SQL_Result := v_SQL_Result || v_SQL;
  v_SQL_Result := v_SQL_Result || ' ) A   where rownum <= ' ||
                  to_char(v_hiRownum) || ' ) B  where rn >= ' ||
                  to_char(v_loRownum);
  open mycursor for v_SQL_Result;

end QUERY_SMS_RECEIVE;
/
