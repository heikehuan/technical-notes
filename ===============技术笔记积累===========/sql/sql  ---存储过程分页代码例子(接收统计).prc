create or replace procedure QUERY_SMS_RECEIVE(p_startTime    in varchar2, --��ʼʱ�䣨������)
                                              p_endTime      in varchar2, --����ʱ�� ��������)
                                              p_statType     in number, -- ͳ������ 0 ��Ի���ͳ�����ж��ţ�1 ����û�ͳ�����ж���
                                              p_userID       in varchar2, --����ID Admin ������
                                              p_parentOrgID  in varchar2, --����ID ������
                                              p_orgID        in varchar2, --����ID �������
                                              p_pageNo       in number, --��ǰҳ�棬��1��ʼ
                                              p_pageSize     in number, --ÿҳ��¼��
                                              outRecordCount out number, --���ؼ�¼������
                                              mycursor       out sys_refcursor --���ؽ�����α�
                                              ) is

  v_SQL            varchar2(8000); -- ƴ�ӵĻ���SQL
  v_SQL_TotalCount varchar2(8000); -- ��ѯ��¼������SQL
  v_SQL_Result     varchar2(8000); -- ��ѯ�����SQL

  v_hiRownum number(8); --��ǰҳ��¼��Ӧ����ҳ��
  v_loRownum number(8); --��ǰҳ��¼��Ӧ��С��ҳ��
begin
  v_SQL      := '';
  v_hiRownum := 15;
  v_loRownum := 0;

  --ƴִ��SQL��ʼ
  if p_statType = 0 then
    --��Ի���ͳ�����ж���
    if p_parentOrgID is not null then
      --ͳ�����л����ӻ���
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.sys_time >= to_date(''' ||
               p_startTime||''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <=to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id where o.parentid= ''' ||
               p_parentOrgID || ''' or o.user_id = ''' || p_parentOrgID ||
               ''' group by o.user_name';
    else
      --ֻͳ��ĳ������
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id  group by o.user_name';
    end if;
  else
    --����û�ͳ�����ж���
    if p_userID is not null then
      --ͳ�Ƹû���ĳ���û�
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.user_id =''' || p_userID ||
               ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    else
      -- ͳ�Ƹû��������û�
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and  r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    end if;
  end if;
   --���������ʱ�������鿴ƴ�ӵ�sql
   insert into temp_table_test (CREATE_SQL, CREATE_TIME)
     values (v_SQL,sysdate);

  dbms_output.put_line('v_SQL = ' || v_SQL);
  --��ѯ��ǰ�����¼�¼������
  v_SQL_TotalCount := ' SELECT count(*) FROM ( ';
  v_SQL_TotalCount := v_SQL_TotalCount || v_SQL;
  v_SQL_TotalCount := v_SQL_TotalCount || ' ) ';
  --ȡ��¼������
  execute immediate v_SQL_TotalCount
    into outRecordCount;
  --�����ҳ��ҳ��
  v_hiRownum := p_pageNo * p_pageSize;
  v_loRownum := v_hiRownum - p_pageSize + 1;
  --ƴ��ҳ�Ĳ�ѯSQL
  v_SQL_Result := ' select * FROM (  select A.*, rownum rn From ( ';
  v_SQL_Result := v_SQL_Result || v_SQL;
  v_SQL_Result := v_SQL_Result || ' ) A   where rownum <= ' ||
                  to_char(v_hiRownum) || ' ) B  where rn >= ' ||
                  to_char(v_loRownum);
  open mycursor for v_SQL_Result;

end QUERY_SMS_RECEIVE;
/
