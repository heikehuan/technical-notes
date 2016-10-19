create or replace procedure QUERY_SMS_SEND(
                  p_startTime in varchar2,--��ʼʱ�䣨������)
                  p_endTime in varchar2,--����ʱ�� ��������)
                  p_statType in number, -- ͳ������ 0 һ�����ͳ�ƣ�1 ������������ͳ�� 2 ��������Ա����ͳ��
                  p_userID in varchar2,--�û�ID Admin ������
                  p_parentOrgID in varchar2,--����ID ������

                  p_orgID in varchar2,--����ID �������
                  p_status in varchar2,-- ״̬
                  mycursor out sys_refcursor--���ؽ�����α�
                 )
is
       v_startTime number(8);--�濪ʼ����
       v_endTime number(8);--���������
       v_char_startTime number(8);--�濪ʼ����
       v_char_endTime number(8);--���������

       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --�����ѯ��ʼ����
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
                         AND ( SS.SEND_STATUS IN (0, 1, 5, 6, 7) and ss.IS_ORIGINAL_SMS = 0 ) --����״̬��ԭʼ����,�ֶ���Ҫ����ԭʼ����
                         AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                         AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                 ) T
           WHERE T.SEND_STATUS IN (0, 1, 5, 6, 7)
           GROUP BY T.PARENT_ORG_ID, T.ORG_ID, T.USER_ID, T.SYSDAT, T.SEND_STATUS
     ';
     --ƴִ��SQL��ʼ
     if p_statType = 2  then --һ�����ͳ��
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

      if p_statType = 1  then --��������ͳ��
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

      if p_statType = 0  then --��������Ա����ͳ��
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
