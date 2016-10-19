create or replace procedure insert_month_reckoning_report is
    cursor c_consume is
    --分组查询月结单表的数据,按人分组,统计每人每月发送多少短信
    select d.user_id,
           d.user_name,                --用户名
           o.user_id COMPANY_ID,
           o.user_name COMPANY_NAME,   --公司名
           u.user_mome,
           o.pay_mode,                 --充值类型
           (select count(1)
              from user_info ui
              left join organization org on ui.organization_id = org.user_id
             where ui.organization_id = o.user_id) ACCOUNT_QUANTITY,                     --账户数量
           (select nvl(dr.remain_balance, 0)
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') =
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')) MONTH_BEGIN_BALANCE,                           --月初余额
           (select nvl(dr.remain_balance, 0)
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') =
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) MONTH_END_BALANCE,                              --月底余额  
           (select sum(nvl(dr.send_quantity, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) SEND_QUANTITY,                                 --当月发送数量
           (select sum(nvl(dr.sub_total_fee, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) COST_FEE,                                      --费用合计
           (select sum(nvl(dr.mobile_message_quantity, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) MOBILE_SEND_QUANTITY,                          --移动号码发送数量
           (select sum(nvl(dr.union_message_quantity, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) UNION_SEND_QUANTITY,                           --联通号码发送数量
           (select sum(nvl(dr.others_message_quantity, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) OTHERS_SEND_QUANTITY,                          --电信号码发送数量
           (select sum(nvl(dr.mobile_message_fee, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) MOBILE_COST_FEE,                               --移动号码费用合计
           (select sum(nvl(dr.union_message_fee, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) UNION_COST_FEE,                                --联通号码费用合计
           (select sum(nvl(dr.others_message_fee, 0))
              from daily_reckoning_info dr
             where dr.user_id = d.user_id
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') >
                   to_char(trunc(add_months(sysdate, -1), 'MM') - 1,
                           'yyyy-mm-dd')
               and to_char(dr.reckoning_date, 'yyyy-mm-dd') <=
                   to_char(trunc(add_months(sysdate, 0), 'MM') - 1,
                           'yyyy-mm-dd')) OTHERS_COST_FEE                                --电信号码费用合计
      from daily_reckoning_info d
      left join user_info u on d.user_id = u.user_id
      left join organization o on o.user_id = u.organization_id
     group by d.user_id,
              d.user_name,
              o.user_id,
              o.user_name,
              u.user_mome,
              o.pay_mode; 

     one_record c_consume%rowtype;           --游标行

begin
       if c_consume%isopen then --防止上次游标未关闭
      close c_consume;
    end if;  
    
    --打开游标
    open c_consume;
    --循环游标
      loop
        fetch c_consume into one_record; --提取游标
          exit when c_consume%notfound;
          
          insert into month_reckoning_info
            (MONTH_RECKONING_ID,
             USER_ID,
             COMPANY_NAME,
             RECKONING_DATE,
             USER_NAME,
             BEGIN_TIME,
             END_TIME,
             ACCOUNT_QUANTITY,
             MONTH_PAYMENT,
             MONTH_BEGIN_BALANCE,
             MONTH_END_BALANCE,
             SEND_QUANTITY,
             UNIT_PRICE,
             COST_FEE,
             RECORD_DATE,
             INNER_PAYMENT,
             MOBILE_SEND_QUANTITY,
             UNION_SEND_QUANTITY,
             OTHERS_SEND_QUANTITY,
             MOBILE_UNIT_PRICE,
             UNION_UNIT_PRICE,
             OTHERS_UNIT_PRICE,
             MOBILE_COST_FEE,
             UNION_COST_FEE,
             OTHERS_COST_FEE,
             PAY_MODE,
             USER_MOME)
          values
            (sys_guid(),
             one_record.user_id,
             one_record.COMPANY_NAME,
             sysdate,
             one_record.user_name,
             trunc(add_months(sysdate,-1),'MM'),
             last_day(trunc(add_months(sysdate, -1),'MM')),
             one_record.ACCOUNT_QUANTITY,
             0.00,
             one_record.month_begin_balance,
             one_record.month_end_balance,
             one_record.send_quantity,
             0.000,
             one_record.cost_fee,
             sysdate,
             0.00,
             one_record.mobile_send_quantity,
             one_record.union_send_quantity,
             one_record.others_send_quantity,
             0.000,
             0.000,
             0.000,
             one_record.mobile_cost_fee,
             one_record.union_cost_fee,
             one_record.others_cost_fee,
             one_record.pay_mode,
             one_record.user_mome);
            
      end loop;
      
      commit;
      
    close c_consume;
    
      exception
       when others then
   rollback; 

end insert_month_reckoning_report;
/
