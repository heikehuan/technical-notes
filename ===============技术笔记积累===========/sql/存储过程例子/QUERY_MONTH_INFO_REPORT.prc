create or replace procedure QUERY_MONTH_INFO_REPORT
     (
       p_startTime in varchar2,          --��ʼʱ�䣨������)
       p_endTime in varchar2,            --����ʱ�� ��������)
       p_statType in number,             -- ��ѯ���� 2 һ�������ѯ��1 ����������ѯ 0 ��������Ա��ѯ
       p_orgID in varchar2,              --����ID �������
       p_userID in varchar2,             --�û�ID Admin ������
       p_userOrgId in varchar2,          --�û�����(��user�������)   
       mycursor out sys_refcursor       --���ؽ�����α�
      )
 is
       v_debug number(1);                          --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000);                       -- ƴ�ӵĻ���SQL
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

       if p_statType = 1  then   --��������ͳ��       
           --���������ѯ����Ϊ�գ�Ĭ����ʾ������������Ա
           if p_orgID is null then
                 v_SQL := v_SQL || ' and (o.parentid='''||p_userOrgId||''' or o.user_id='''|| p_userOrgId || ''')';
           end if;           
       
           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;
           --��ѯ�������գ���ʾ��ѯ��������Ա
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

         if p_statType = 0  then --��������Ա����ͳ��
         
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
   
     --���Դ���:������ʱ���鿴sql  
       insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
       commit;
      
      
     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;
  
end QUERY_MONTH_INFO_REPORT;
/
