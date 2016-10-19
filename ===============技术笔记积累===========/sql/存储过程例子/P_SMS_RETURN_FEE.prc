create or replace procedure P_SMS_RETURN_FEE is
   cursor c_consume is 
         select sum(s.unit_price*s.mobile_quantities) failTotalFee,
             sum(s.mobile_quantities) failTotalQuata,
             s.user_id,
             s.batch_id,
             to_char(s.send_time, 'yyyymmdd') send_time,
             u.pay_mode userPayMode,
             u.fee_mode,
             u.organization_id,
             o.pay_mode orgPayMode
        from send s
        left join user_info u on s.user_id = u.user_id
        left join organization o on s.user_organization = o.user_id  
       where to_number((to_char(s.send_time, 'yyyymmdd'))) <= to_number(to_char(sysdate - 1, 'yyyymmdd'))
         and s.send_status = 6                            --发送类型:发送失败
         and (s.return_fee=0 or s.return_fee is null)     --返回费用:未返回费用
         and o.deduct_mode=1                              --计费类型:成功计费
         and s.is_original_sms=0                          --原始短信
       group by s.user_id, s.batch_id,to_char(s.send_time, 'yyyymmdd'), u.pay_mode, u.fee_mode, u.organization_id,o.pay_mode;

      single_cursor c_consume%rowtype;  
begin
      if c_consume%isopen then
         close c_consume;
      end if;
      
      open c_consume;
           loop 
             fetch c_consume into single_cursor;
               exit when c_consume%notfound;
               
               --如果是自付费
               if single_cursor.fee_mode is not null and single_cursor.userPayMode is not null and single_cursor.user_id is not null then
                 if single_cursor.fee_mode=0 then
                   --如果是配额用户,返还短信条数
                   if single_cursor.userPayMode=0 then                 
                       update user_info u
                          set u.user_quota = u.user_quota + nvl(single_cursor.failTotalQuata,0)
                        where u.user_id = single_cursor.user_id;
                   end if;
                   --如果是金额用户,返还金额数
                   if single_cursor.userPayMode=1 then
                      update user_info u
                         set u.user_balance = u.user_balance + nvl(single_cursor.failTotalFee,0)
                       where u.user_id = single_cursor.user_id;
                   end if;
                 end if;
               end if;
               
               --如果是组付费
               if single_cursor.fee_mode is not null and single_cursor.orgPayMode is not null and single_cursor.organization_id is not null then
                  if single_cursor.fee_mode=1 then
                     --如果是配额机构,返还短信条数
                     if single_cursor.orgPayMode=0 then                 
                         update organization o
                            set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                          where o.user_id = single_cursor.organization_id;
                     end if;
                     --如果是金额机构,返还金额数
                     if single_cursor.orgPayMode=1 then
                         update organization o
                            set o.user_balance = o.user_balance + nvl(single_cursor.failTotalFee,0)
                          where o.user_id = single_cursor.organization_id;
                     end if;
                  end if;
              end if;
               
              --修改短信状态为:已返费用   
               update send s set s.return_fee=1 where s.send_id in
                 (select ss.send_id from send ss 
                   left join organization o on o.user_id=ss.user_organization
                   where ss.user_id=single_cursor.user_id
                   and o.deduct_mode=1            --计费类型:成功计费
                   and ss.send_status=6           --发送类型:发送失败
                   and ss.is_original_sms=0       --原始短信
                   and to_char(ss.send_time, 'yyyymmdd') = single_cursor.send_time
                );
                
                --插入充值记录表
                   --如果是配额机构,记录返还短信条数
                   if single_cursor.orgPayMode=0 then
                      insert into payment_record
                        (PAYMENT_ID,
                         USER_ID,
                         PAYMENT_TIME,
                         PAYMENT_MONEY,
                         PAYMENT_QUOTA,
                         OPERATOR_ID,
                         PAYMENT_TYPE,
                         IS_ONLINE,
                         USER_TYPE,
                         RECHARGE_EXPLAIN,
                         QUOTA_TYPE,
                         IS_SUCCESS)
                      values
                        (sys_guid(),
                         single_cursor.user_id,
                         sysdate,
                         0,
                         nvl(single_cursor.failTotalQuata,0),
                         'SYS_JOB_RETURN_FEE',
                         6,
                         0,
                         single_cursor.fee_mode,
                         '返还发送失败短信配额',
                         1,
                         1);           
                   end if;  
                   
                    --如果是金额机构,记录返还金额数
                     if single_cursor.orgPayMode=1 then
                        insert into payment_record
                          (PAYMENT_ID,
                           USER_ID,
                           PAYMENT_TIME,
                           PAYMENT_MONEY,
                           PAYMENT_QUOTA,
                           OPERATOR_ID,
                           PAYMENT_TYPE,
                           IS_ONLINE,
                           USER_TYPE,
                           RECHARGE_EXPLAIN,
                           QUOTA_TYPE,
                           IS_SUCCESS)
                        values
                          (sys_guid(),
                           single_cursor.user_id,
                           sysdate,
                           nvl(single_cursor.failTotalFee,0),
                           0,
                           'SYS_JOB_RETURN_FEE',
                           7,
                           0,
                           single_cursor.fee_mode,
                           '返还发送失败短信金额',
                           1,
                           1);           
                   end if;  
              
            end loop;
            
            commit;
               
      close c_consume;
          
   exception
       when others then
   rollback;     
end P_SMS_RETURN_FEE;
/
