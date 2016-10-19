create or replace procedure QUERY_RECKONING_INFO_REPORT
/**
  add by zhanhh on$20130620
  ��ѯ�սᵥ����洢����
  p_userOrgId��user�������,�������������ҳ���ѯ��������
*/
                (
                 p_startTime in varchar2,          --��ʼʱ�䣨������)
                 p_endTime in varchar2,            --����ʱ�� ��������)
                 p_statType in number,             -- ��ѯ���� 0 һ�������ѯ��1 ����������ѯ 2 ��������Ա��ѯ
                 p_orgID in varchar2,              --����ID �������
                 p_userID in varchar2,             --�û�ID Admin ������
                 p_userOrgId in varchar2,          --�û�����
                  mycursor out sys_refcursor       --���ؽ�����α�
                 )
 is
       v_startTime number(8);                      --�濪ʼ����
       v_endTime number(8);                        --���������
       v_debug number(1);                          --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000);                       -- ƴ�ӵĻ���SQL
begin
       v_SQL := '';
       v_debug := 0;

        --�����ѯ��ʼ����
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

       if p_statType = 1  then   --��������ͳ��
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


         if p_statType = 2  then --��������Ա����ͳ��
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
