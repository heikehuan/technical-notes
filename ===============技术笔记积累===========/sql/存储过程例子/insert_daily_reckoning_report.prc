create or replace procedure insert_daily_reckoning_report is
    cursor c_consume is
    --分组查询send表的数据,按人分组,统计一人一天发送多少短信
 select sum(t.unit_price) SUB_TOTAL_FEE,              --总费用
           sum(t.mobile_quantities) total_quantities,   --总发送量
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
              )  MOBILE_QUANTITIES,                                                               --移动号码发送量 
          (select sum(nvl(a.mobile_quantities,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=2
               and a.user_id=t.user_id
               ) UNION_MESSAGE_QUANTITY,                                                          --联通号码发送量
          (select sum(nvl(a.mobile_quantities,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=3
               and a.user_id=t.user_id
               ) OTHERS_MESSAGE_QUANTITY,                                                         --电信号码发送量
          (select sum(nvl(a.unit_price,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=1
              and a.user_id=t.user_id
              ) MOBILE_FEE,                                                                       --移动号码费用
            (select sum(nvl(a.unit_price,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=2
              and a.user_id=t.user_id
              ) UNION_FEE,                                                                        --联通号码费用
               (select sum(nvl(a.unit_price,0)) from 
              send a where 
              to_char(a.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') 
              and (a.send_status = 1 or a.send_status = 5)
              and a.mobile_com=3
              and a.user_id=t.user_id
              ) OTHER_FEE,                                                                        --电信号码费用
              (select d.remain_balance
                from daily_reckoning_info d
               where to_char(d.reckoning_date, 'yyyy-mm-dd') = to_char(sysdate-4, 'yyyy-mm-dd')
               and d.user_id=t.user_id
              )  DAYBEF_YE_RE_BALAN_SMS,                                                          --统计日期的前一天的总费用
              (select d.remain_message_quota
                from daily_reckoning_info d
               where to_char(d.reckoning_date, 'yyyy-mm-dd') = to_char(sysdate-4, 'yyyy-mm-dd')
               and d.user_id=t.user_id
              )  DAYBEF_YE_RE_QUA_SMS                                                             --统计日期的前一天的总发送量                                                                                 
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
     where  to_char(t.send_time, 'dd-mm-yyyy') = to_char(sysdate-3, 'dd-mm-yyyy') --时间限定为当天
            and (t.send_status = 1 or t.send_status = 5) --发送状态 ： 0已提交 , 5发送成功      
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


    one_record c_consume%rowtype;                                                --游标行
    remainMessageQuota daily_reckoning_info.remain_message_quota%type;           --剩余短信配额
     remainBalance     daily_reckoning_info.remain_balance%type;                 --剩余金额

begin
    remainMessageQuota :=0;  --初始值设为0
    remainBalance :=0;

    if c_consume%isopen then --防止上次游标未关闭
      close c_consume;
    end if;  
    
    --打开游标
    open c_consume;
    --循环游标
      loop
        fetch c_consume into one_record; --提取游标
          exit when c_consume%notfound;
                 
           --剩余条数:前天-昨天=剩余
           remainMessageQuota := nvl(one_record.DAYBEF_YE_RE_QUA_SMS,0)-nvl(one_record.total_quantities,0);
           
           --剩余金额:前天-昨天=剩余
           remainBalance := nvl(one_record.daybef_ye_re_balan_sms,0)-nvl(one_record.sub_total_fee,0);   
           
             --插入表数据
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
               '发送成功',
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
