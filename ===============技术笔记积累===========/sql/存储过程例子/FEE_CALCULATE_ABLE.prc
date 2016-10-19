CREATE OR REPLACE PROCEDURE FEE_CALCULATE_ABLE(P_USER_ID              IN VARCHAR2,
                                               P_BIZ_TYPE             IN NUMBER,
                                               BATCH_ID               IN VARCHAR2,
                                               SEND_TYPE              IN NUMBER,
                                               SEND_MSG               IN VARCHAR2,
                                               CHANNE_GW_QUANTIY_LIST IN VARCHAR2,
                                               RUN_RESULT             OUT NUMBER,
                                               RUN_EXCEPTION          OUT VARCHAR,
                                               RUN_UNIT_PRICE         OUT VARCHAR) IS
  /**
    *发送计费
    * Author  : zxd
    * Created : 2013-6-10 16:24:35
    *
   **参数说明：
   **输入：
    *     p_user_id             用户主键
    *     p_biz_type            信息类型  0:短信 1:彩信
    *     batch_id              批次号
    *     send_type             发送类型  0:普通发送,1:批量发送,2:回复短信,3:群组发送,4:socket发送,5:webservice发送,6:手工发送,7:预警短信,8:调查问卷,9:生日祝福,10:普通彩信,11:账单彩信,20:普通email
    *     send_msg              消息内容
    *     channe_gw_quantiy_list 发送总量 格式: 通道:号段-发送总量; 如: 12:1-200;  13:2-200; 12:3-200;
    *
   **输出：
    *     run_result               返回状态：0：计费成功；1:机构彩信余额不足 2:机构的短信余额不足 3:用户短信余额不足 4:用户彩信余额不足
    *                                        5:非法的短信类型 6:用户金额不足 7:机构金额不足 8:用户不存在 9:机构不存在 10:用户所属机构未定义协议价
                                             11:其他未知异常
    *     run_exception            返回错误信息
    *     RUN_UNIT_PRICE           单价信息, 例如 1:0.05;2:0.06;3:0.06
    *
   ** 算法：
    *
  */
  QUANTIY_LIST_NO_FOUNDS EXCEPTION; --拆分通道-号段-发送量异常

  ILLEGALITY_BIZ_TYPE EXCEPTION; --非法的类型 注:仅支持短信和彩信两种类型

  NO_ORG_RECORD EXCEPTION; --机构不存在

  NO_USER_RECORD EXCEPTION; --用户不存在

  NO_UNIT_PRICE EXCEPTION; --协议价不存在

  ORG_NOT_SUFFICIENT_FUNDS EXCEPTION; --机构余额不足

  USER_NOT_SUFFICIENT_FUNDS EXCEPTION; --用户余额不足

  ORG_SMSQUOTA_NOT_ENOUGH EXCEPTION; --机构短信条数不够

  ORG_MMSQUOTA_NOT_ENOUGH EXCEPTION; --机构彩信条数不够

  USER_SMSQUOTA_NOT_ENOUGH EXCEPTION; --用户短信条数不够

  USER_MMSQUOTA_NOT_ENOUGH EXCEPTION; --用户彩信条数不够

  P_GW_TYPE VARCHAR2(200); --号段类型

  P_CHANNEL_ID VARCHAR2(200); --通道ID

  P_SEND_QUANTITY NUMBER(10); --发送总量

  /*
  *CURSOR_CHANNEL_GW_QUANTITY 游标 通过FNC_CON_STR_TO_TAB方法获得
  */
  CURSOR CURSOR_CHANNEL_GW_QUANTITY IS
    SELECT * FROM TABLE(FNC_CON_STR_TO_TAB(CHANNE_GW_QUANTIY_LIST));

  ORG_DATA ORGANIZATION%ROWTYPE; --机构信息

  USER_DATA USER_INFO%ROWTYPE; --用户信息

  P_UNIT_PRICE UNIT_PRICE_INFO.UNIT_PRICE%TYPE; --机构协议价

  COST_FEE NUMBER(10, 3); --本次短信费用

  REMAIN_BALANCE NUMBER(10, 3); --剩余金额

  REMAIN_QUOTA CONSUME_RECORD_INFO.REMAIN_QUOTA%TYPE; --剩余配额

  QUANTITY_RESULT NUMBER(10); --拆分后记录数
BEGIN

  RUN_UNIT_PRICE := NULL;

  SELECT COUNT(*)
    INTO QUANTITY_RESULT
    FROM TABLE(FNC_CON_STR_TO_TAB(CHANNE_GW_QUANTIY_LIST)); --检查是否拆分成功
  IF QUANTITY_RESULT = 0 THEN
    RAISE QUANTIY_LIST_NO_FOUNDS;
  END IF;

  IF CURSOR_CHANNEL_GW_QUANTITY%ISOPEN THEN
    --防止上次游标打开没关闭
    CLOSE CURSOR_CHANNEL_GW_QUANTITY;
  END IF;
  DBMS_OUTPUT.PUT_LINE('============开始计费==========');
  OPEN CURSOR_CHANNEL_GW_QUANTITY;
  LOOP
   SELECT U.* INTO USER_DATA FROM USER_INFO U WHERE U.USER_ID = P_USER_ID;
    IF USER_DATA.USER_ID IS NULL THEN
      RAISE NO_USER_RECORD; --用户不存在时抛出异常
    ELSE
      SELECT O.*
        INTO ORG_DATA
        FROM ORGANIZATION O
       WHERE O.USER_ID = USER_DATA.ORGANIZATION_ID;
      IF ORG_DATA.USER_ID IS NULL THEN
        RAISE NO_ORG_RECORD; --机构不存在时抛出异常
      END IF;
    END IF;
    FETCH CURSOR_CHANNEL_GW_QUANTITY
      INTO P_CHANNEL_ID, P_GW_TYPE, P_SEND_QUANTITY;
    EXIT WHEN CURSOR_CHANNEL_GW_QUANTITY%NOTFOUND;
    IF ORG_DATA.PAY_TYPE = 1 THEN
      DBMS_OUTPUT.PUT_LINE('用户所在机构属于后付费,不执行计费操作'); --机构是后付费时不执行计费操作只记录流水
      --记录流水
      BEGIN
      --如果机构属于渠道客户则查询渠道机构的协议价
      IF ORG_DATA.PARENTID != 0 and ORG_DATA.PARENTID != 1 THEN
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --根据发送类型查找对应的机构协议价
      ELSE
      --如果机构属于非渠道客户则查询当前机构的协议价
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --根据发送类型查找对应的机构协议价 
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      --构造单价的字符串
      IF RUN_UNIT_PRICE IS NULL OR LENGTH(RUN_UNIT_PRICE) = 0 THEN
        RUN_UNIT_PRICE := P_GW_TYPE || ':' || P_UNIT_PRICE;
      ELSE
        RUN_UNIT_PRICE := RUN_UNIT_PRICE || ';' || P_GW_TYPE || ':' ||
                          P_UNIT_PRICE;
      END IF;

      COST_FEE := P_SEND_QUANTITY * P_UNIT_PRICE; --发送总量乘(短信/彩信)单价
      INSERT INTO CONSUME_RECORD_INFO
        (RECORD_ID,
         CONSUMER_ID,
         CONSUMER_NAME,
         SEND_QUANTITY,
         BIZ_TYPE,
         BATCH_ID,
         COST_FEE,
         SEND_MSG,
         SEND_TYPE,
         UNIT_PRICE,
         CHANNEL_ID,
         GW_TYPE,
         FEE_MODE,
         ORGANIZATION_ID,
         PAY_TYPE)
      VALUES
        (SYS_GUID(),
         USER_DATA.USER_ID,
         USER_DATA.USER_NAME,
         P_SEND_QUANTITY,
         P_BIZ_TYPE,
         BATCH_ID,
         COST_FEE,
         SEND_MSG,
         SEND_TYPE,
         P_UNIT_PRICE,
         P_CHANNEL_ID,
         P_GW_TYPE,
         ORG_DATA.FEE_MODE,
         ORG_DATA.USER_ID,
         ORG_DATA.PAY_TYPE);
    ELSE
      --该机构是预付费
     BEGIN
      --如果机构属于渠道客户则查询渠道机构的协议价
      IF ORG_DATA.PARENTID != 0 and ORG_DATA.PARENTID != 1 THEN
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --根据发送类型查找对应的机构协议价
      ELSE
      --如果机构属于非渠道客户则查询当前机构的协议价
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --根据发送类型查找对应的机构协议价 
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      --构造单价的字符串
      IF RUN_UNIT_PRICE IS NULL OR LENGTH(RUN_UNIT_PRICE) = 0 THEN
        RUN_UNIT_PRICE := P_GW_TYPE || ':' || P_UNIT_PRICE;
      ELSE
        RUN_UNIT_PRICE := RUN_UNIT_PRICE || ';' || P_GW_TYPE || ':' ||
                          P_UNIT_PRICE;
      END IF;

      IF ORG_DATA.PAY_MODE = 1 THEN
        -- 如果机构是金额付费
        COST_FEE := P_SEND_QUANTITY * P_UNIT_PRICE; --发送总量乘(短信/彩信)单价
        IF ORG_DATA.FEE_MODE = 1 THEN
          --该机构是组付费
          IF ORG_DATA.USER_BALANCE < COST_FEE THEN
            --机构余额不足
            RAISE ORG_NOT_SUFFICIENT_FUNDS;
          END IF;
          REMAIN_BALANCE := ORG_DATA.USER_BALANCE - COST_FEE; --扣费后机构余额
          UPDATE ORGANIZATION O
             SET O.USER_BALANCE = REMAIN_BALANCE
           WHERE O.USER_ID = ORG_DATA.USER_ID; --更新机构余额
        ELSE
          --机构是自付费
          IF USER_DATA.USER_BALANCE < COST_FEE THEN
            --用户余额不足
            RAISE USER_NOT_SUFFICIENT_FUNDS;
          END IF;
          REMAIN_BALANCE := USER_DATA.USER_BALANCE - COST_FEE; --扣费后用户余额
          UPDATE USER_INFO U
             SET U.USER_BALANCE = REMAIN_BALANCE
           WHERE U.USER_ID = P_USER_ID; --更新用户余额
        END IF;
        --记录流水
        INSERT INTO CONSUME_RECORD_INFO
          (RECORD_ID,
           CONSUMER_ID,
           CONSUMER_NAME,
           SEND_QUANTITY,
           BIZ_TYPE,
           BATCH_ID,
           COST_FEE,
           SEND_MSG,
           SEND_TYPE,
           UNIT_PRICE,
           CHANNEL_ID,
           GW_TYPE,
           FEE_MODE,
           ORGANIZATION_ID,
           PAY_TYPE,
           REMAIN_BALANCE)
        VALUES
          (SYS_GUID(),
           USER_DATA.USER_ID,
           USER_DATA.USER_NAME,
           P_SEND_QUANTITY,
           P_BIZ_TYPE,
           BATCH_ID,
           COST_FEE,
           SEND_MSG,
           SEND_TYPE,
           P_UNIT_PRICE,
           P_CHANNEL_ID,
           P_GW_TYPE,
           ORG_DATA.FEE_MODE,
           ORG_DATA.USER_ID,
           ORG_DATA.PAY_TYPE,
           REMAIN_BALANCE);
      ELSE
        --机构是配额付费
        IF ORG_DATA.FEE_MODE = 1 THEN
          --该机构是组付费
          IF P_BIZ_TYPE = 0 THEN
            --类型为短信
            IF ORG_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE ORG_SMSQUOTA_NOT_ENOUGH; --机构短信条数不足
            END IF;
            REMAIN_QUOTA := ORG_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE ORGANIZATION O
               SET O.USER_QUOTA = REMAIN_QUOTA
             WHERE O.USER_ID = ORG_DATA.USER_ID; --更新机构短信条数
          ELSIF P_BIZ_TYPE = 1 THEN
            --类型为彩信
            IF ORG_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE ORG_MMSQUOTA_NOT_ENOUGH; --机构彩信条数不足
            END IF;
            REMAIN_QUOTA := ORG_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE ORGANIZATION O
               SET O.MMS_QUOTA = REMAIN_QUOTA
             WHERE O.USER_ID = ORG_DATA.USER_ID; --更新机构彩信条数
          END IF;
        ELSE
          --机构是自付费
          IF P_BIZ_TYPE = 0 THEN
            --类型为短信
            IF USER_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_SMSQUOTA_NOT_ENOUGH; --用户短信条数不足
            END IF;
            REMAIN_QUOTA := USER_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.USER_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --更新用户短信条数
          ELSIF P_BIZ_TYPE = 1 THEN
            --类型为彩信
            IF USER_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_MMSQUOTA_NOT_ENOUGH; --用户彩信条数不足
            END IF;
            REMAIN_QUOTA := USER_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.MMS_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --更新用户彩信条数
          END IF;
        END IF;
        INSERT INTO CONSUME_RECORD_INFO
          (RECORD_ID,
           CONSUMER_ID,
           CONSUMER_NAME,
           SEND_QUANTITY,
           BIZ_TYPE,
           BATCH_ID,
           SEND_MSG,
           SEND_TYPE,
           UNIT_PRICE,
           CHANNEL_ID,
           GW_TYPE,
           FEE_MODE,
           ORGANIZATION_ID,
           PAY_TYPE,
           REMAIN_QUOTA)
        VALUES
          (SYS_GUID(),
           USER_DATA.USER_ID,
           USER_DATA.USER_NAME,
           P_SEND_QUANTITY,
           P_BIZ_TYPE,
           BATCH_ID,
           SEND_MSG,
           SEND_TYPE,
           P_UNIT_PRICE,
           P_CHANNEL_ID,
           P_GW_TYPE,
           ORG_DATA.FEE_MODE,
           ORG_DATA.USER_ID,
           ORG_DATA.PAY_TYPE,
           REMAIN_QUOTA);
      END IF;
    END IF;
  END LOOP;
  COMMIT;
  RUN_RESULT    := 0;
  RUN_EXCEPTION := '计费成功';

  DBMS_OUTPUT.PUT_LINE('============计费成功==========');
EXCEPTION
  WHEN ORG_MMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('机构彩信余额不足');
    RUN_RESULT    := 1;
    RUN_EXCEPTION := '机构彩信余额不足';
    ROLLBACK;
  WHEN ORG_SMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('机构的短信余额不足');
    RUN_RESULT    := 2;
    RUN_EXCEPTION := '机构的短信余额不足';
    ROLLBACK;
  WHEN USER_SMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('用户短信余额不足');
    RUN_RESULT    := 3;
    RUN_EXCEPTION := '用户短信余额不足';
    ROLLBACK;
  WHEN USER_MMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('用户彩信余额不足');
    RUN_RESULT    := 4;
    RUN_EXCEPTION := '用户彩信余额不足';
    ROLLBACK;
  WHEN ILLEGALITY_BIZ_TYPE THEN
    DBMS_OUTPUT.PUT_LINE('非法的短信类型');
    RUN_RESULT    := 5;
    RUN_EXCEPTION := '非法的短信类型';
    ROLLBACK;
  WHEN USER_NOT_SUFFICIENT_FUNDS THEN
    DBMS_OUTPUT.PUT_LINE('用户余额不足');
    RUN_RESULT    := 6;
    RUN_EXCEPTION := '用户余额不足';
    ROLLBACK;
  WHEN ORG_NOT_SUFFICIENT_FUNDS THEN
    DBMS_OUTPUT.PUT_LINE('机构余额不足');
    RUN_RESULT    := 7;
    RUN_EXCEPTION := '机构余额不足';
    ROLLBACK;
  WHEN NO_USER_RECORD THEN
    DBMS_OUTPUT.PUT_LINE('计费错误提示:用户不存在!');
    RUN_RESULT    := 8;
    RUN_EXCEPTION := '计费错误提示:用户不存在!';
    ROLLBACK;
  WHEN NO_ORG_RECORD THEN
    DBMS_OUTPUT.PUT_LINE('计费错误提示:用户所属的机构不存在!');
    RUN_RESULT    := 9;
    RUN_EXCEPTION := '计费错误提示:用户所属的机构不存在!';
    ROLLBACK;
  WHEN NO_UNIT_PRICE THEN
    DBMS_OUTPUT.PUT_LINE('用户所属机构未定义协议价');
    RUN_RESULT    := 10;
    RUN_EXCEPTION := '用户所属机构未定义协议价';
    ROLLBACK;
  WHEN QUANTIY_LIST_NO_FOUNDS THEN
    DBMS_OUTPUT.PUT_LINE('通道-号段-发送量拆分失败,请检查格式');
    RUN_RESULT    := 12;
    RUN_EXCEPTION := '通道-号段-发送量拆分失败,请检查格式';
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE || '----' || SQLERRM);
    RUN_RESULT    := 11;
    RUN_EXCEPTION := SQLCODE || '----' || SQLERRM;
    ROLLBACK;
END FEE_CALCULATE_ABLE;
/
