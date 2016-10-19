create or replace procedure insert_daily_reckoning_report is
    cursor c_consume is
    --�����ѯsend�������,���˷���,ͳ��һ��һ�췢�Ͷ��ٶ���
 select sum(t.unit_price) SUB_TOTAL_FEE,              --�ܷ���
           sum(t.mobile_quantities) total_quantities,   --�ܷ�����
           t.user_id,
           trunc(t.send_time) send_time,
           u.user_name,
           u.pay_mode,
           u.user_mome,
           u.fee_mode,
           u.user_quota,
           u.mms_quota as user_mms_quota,
       --    t.channel_id,
           c.biz_type,
           org.user_quota as org_quota,
           org.mms_quota as org_mms_quota,
          (select sum(nvl(a.mobile_quantities,0)) from                                        
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=1
              and a.user_id=t.user_id
              )  MOBILE_QUANTITIES,                                                               --�ƶ����뷢���� 
          (select sum(nvl(a.mobile_quantities,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=2
               and a.user_id=t.user_id
               ) UNION_MESSAGE_QUANTITY,                                                          --��ͨ���뷢����
          (select sum(nvl(a.mobile_quantities,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=3
               and a.user_id=t.user_id
               ) OTHERS_MESSAGE_QUANTITY,                                                         --���ź��뷢����
          (select sum(nvl(a.unit_price,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=1
              and a.user_id=t.user_id
              ) MOBILE_FEE,                                                                       --�ƶ��������
            (select sum(nvl(a.unit_price,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=2
              and a.user_id=t.user_id
              ) UNION_FEE,                                                                        --��ͨ�������
               (select sum(nvl(a.unit_price,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=3
              and a.user_id=t.user_id
              ) OTHER_FEE,                                                                        --���ź������
              (select d.remain_balance
                from daily_reckoning_info d
               where to_char(d.reckoning_date, 'yyyy-mm-dd') = to_char(sysdate-4, 'yyyy-mm-dd')
               and d.user_id=t.user_id
              )  DAYBEF_YE_RE_BALAN_SMS,                                                          --ͳ�����ڵ�ǰһ����ܷ���
              (select d.remain_message_quota
                from daily_reckoning_info d
               where to_char(d.reckoning_date, 'yyyy-mm-dd') = to_char(sysdate-4, 'yyyy-mm-dd')
               and d.user_id=t.user_id
              )  DAYBEF_YE_RE_QUA_SMS                                                             --ͳ�����ڵ�ǰһ����ܷ�����                                                                                 
      from send t
      left join user_info u on t.user_id = u.user_id
      left join consume_record_info c on t.batch_id = c.batch_id
      left join UNIT_PRICE_INFO up on (up.organization_id = t.user_organization 
                                       and up.gw_type = t.mobile_com 
                                       and up.channel_id = t.channel_id 
                                       and c.biz_type = up.biz_type)
      left join pb_list_of_value pb on (pb.type_id = 'sendStatus' 
                                       and pb.stand_code = t.send_status)
      left join organization org on org.user_id = t.user_organization
     where  to_char(t.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') --ʱ���޶�Ϊ����
            and (t.send_status = 1 or t.send_status = 5) --����״̬ �� 0���ύ , 5���ͳɹ�      
     group by t.user_id,
              trunc(t.send_time),
              u.user_name,
              u.pay_mode,
              u.user_mome,
              u.fee_mode,
              u.user_quota,
              u.mms_quota,
       --       t.channel_id,
              c.biz_type,
              org.user_quota,
              org.mms_quota;


    one_record c_consume%rowtype;                                                --�α���
    remainMessageQuota daily_reckoning_info.remain_message_quota%type;           --ʣ��������
     remainBalance     daily_reckoning_info.remain_balance%type;                 --ʣ����

begin
    remainMessageQuota :=0;  --��ʼֵ��Ϊ0
    remainBalance :=0;

    if c_consume%isopen then --��ֹ�ϴ��α�δ�ر�
      close c_consume;
    end if;  
    
    --���α�
    open c_consume;
    --ѭ���α�
      loop
        fetch c_consume into one_record; --��ȡ�α�
          exit when c_consume%notfound;
                 
           --ʣ������:ǰ��-����=ʣ��
           remainMessageQuota := nvl(one_record.DAYBEF_YE_RE_QUA_SMS,0)-nvl(one_record.total_quantities,0);
           
           --ʣ����:ǰ��-����=ʣ��
           remainBalance := nvl(one_record.daybef_ye_re_balan_sms,0)-nvl(one_record.sub_total_fee,0);   
           
             --���������
            insert into daily_reckoning_info
              (DAILY_RECKONING_ID,
               USER_ID,
               USER_NAME,
               SEND_STATUS,
               SEND_QUANTITY,
               SUB_TOTAL_FEE,
               REMAIN_MESSAGE_QUOTA,
               REMAIN_MMS_QUOTA,
               RECKONING_DATE,
               RECORD_DATE,
               PAY_MODE,
               REMAIN_BALANCE,
               USER_MOME,
               MOBILE_MESSAGE_QUANTITY,
               UNION_MESSAGE_QUANTITY,
               OTHERS_MESSAGE_QUANTITY,
               MOBILE_MMS_QUANTITY,
               UNION_MMS_QUANTITY,
               OTHERS_MMS_QUANTITY,
               MOBILE_MESSAGE_FEE,
               UNION_MESSAGE_FEE,
               OTHERS_MESSAGE_FEE,
               MOBILE_MMS_FEE,
               UNION_MMS_FEE,
               OTHERS_MMS_FEE,
               MESSGE_TOTAL_FEE,
               MMS_TOTAL_FEE,
               TOTAL_FEE)
            values
              (sys_guid(),
               one_record.user_id,
               one_record.user_name,
               '���ͳɹ�',
               one_record.total_quantities,
               one_record.SUB_TOTAL_FEE,
               remainMessageQuota,
               0,
               trunc(one_record.send_time),
               sysdate,
               0,
               remainBalance,
               '1',
               nvl(one_record.mobile_quantities, 0),
               nvl(one_record.union_message_quantity, 0),
               nvl(one_record.others_message_quantity, 0),
               0,
               0,
               0,
               nvl(one_record.mobile_fee, 0),
               nvl(one_record.union_fee, 0),
               nvl(one_record.other_fee, 0),
               0.00,
               0.00,
               0.00,
               nvl(one_record.SUB_TOTAL_FEE,0),
               0.00,
               0.00);                             
      end loop;
      
        commit;
        
   close c_consume;
   
   exception
       when others then
   rollback;

end insert_daily_reckoning_report;
/
