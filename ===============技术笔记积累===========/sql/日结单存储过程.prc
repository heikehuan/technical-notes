create or replace procedure daily_reckoning_info_report
is
    --�����α�  
    cursor c_consume is
    select * from consume_record_info t where to_char(t.send_time,'yyyymmdd')=to_char(sysdate,'yyyymmdd');
  --  v_consumetable varchar2(500);--�浱ǰ�������
    one_record c_consume%rowtype;
    send_status send.send_status%type; --��ǰһ�����ŵ�״̬
begin
    if c_consume%isopen then --��ֹ�ϴ��α�δ�ر�
      close c_consume;
    end if;  
    --���α�
    open c_consume;
    --ѭ���α�
      loop
        fetch c_consume into one_record; --��ȡ�α�
          exit when c_consume%notfound;
              dbms_output.put_line('one_record >>> ' || one_record.record_id); --��ӡ����
              --��ѯ��ǰһ�����ŵ�״̬
           --    select pb.display_value into send_status from pb_list_of_value pb where pb.type_id='sendstatus' and pb.stand_code=(select a.send_status from send a where a.user_id=one_record.consumer_id);
              --�������
             insert into daily_reckoning_info
              (daily_reckoning_id, user_id, user_name, send_status, send_quantity, unit_price, sub_total_fee, remain_quota, reckoning_date, record_date, gw_type, pay_mode, remain_balance, user_mome, channel_id, biz_type)
              values
          --    (test_create_rowid, one_record.consumer_id, one_record.consumer_name, send_status, one_record.send_quantity, one_record.unit_price, one_record.send_quantity*one_record.unit_price, one_record.remain_quota, one_record.send_time, sysdate, one_record.gw_type, one_record.fee_mode, one_record.remain_balance, one_record.user_mome, one_record.channel_id, one_record.biz_type);
                (test_create_rowid, one_record.consumer_id, one_record.consumer_name, '5', one_record.send_quantity, one_record.unit_price, one_record.send_quantity*one_record.unit_price, one_record.remain_quota, one_record.send_time, sysdate, one_record.gw_type, one_record.fee_mode, one_record.remain_balance, one_record.user_mome, one_record.channel_id, one_record.biz_type);     
             commit;
          dbms_output.put_line('��¼��:'|| c_consume%rowcount);  --��ӡ����
      end loop;
   close c_consume;
   
   exception
       when others then
   rollback;

end daily_reckoning_info_report;

/**
* add by zhanhh on 20130607
* ��ѯ����,Ȼ������սᵥ��daily_reckoning_info�Ĵ洢����
*/
/
