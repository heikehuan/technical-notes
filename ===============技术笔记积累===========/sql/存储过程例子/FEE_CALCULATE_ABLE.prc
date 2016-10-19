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
    *���ͼƷ�
    * Author  : zxd
    * Created : 2013-6-10 16:24:35
    *
   **����˵����
   **���룺
    *     p_user_id             �û�����
    *     p_biz_type            ��Ϣ����  0:���� 1:����
    *     batch_id              ���κ�
    *     send_type             ��������  0:��ͨ����,1:��������,2:�ظ�����,3:Ⱥ�鷢��,4:socket����,5:webservice����,6:�ֹ�����,7:Ԥ������,8:�����ʾ�,9:����ף��,10:��ͨ����,11:�˵�����,20:��ͨemail
    *     send_msg              ��Ϣ����
    *     channe_gw_quantiy_list �������� ��ʽ: ͨ��:�Ŷ�-��������; ��: 12:1-200;  13:2-200; 12:3-200;
    *
   **�����
    *     run_result               ����״̬��0���Ʒѳɹ���1:������������ 2:�����Ķ������� 3:�û��������� 4:�û���������
    *                                        5:�Ƿ��Ķ������� 6:�û����� 7:�������� 8:�û������� 9:���������� 10:�û���������δ����Э���
                                             11:����δ֪�쳣
    *     run_exception            ���ش�����Ϣ
    *     RUN_UNIT_PRICE           ������Ϣ, ���� 1:0.05;2:0.06;3:0.06
    *
   ** �㷨��
    *
  */
  QUANTIY_LIST_NO_FOUNDS EXCEPTION; --���ͨ��-�Ŷ�-�������쳣

  ILLEGALITY_BIZ_TYPE EXCEPTION; --�Ƿ������� ע:��֧�ֶ��źͲ�����������

  NO_ORG_RECORD EXCEPTION; --����������

  NO_USER_RECORD EXCEPTION; --�û�������

  NO_UNIT_PRICE EXCEPTION; --Э��۲�����

  ORG_NOT_SUFFICIENT_FUNDS EXCEPTION; --��������

  USER_NOT_SUFFICIENT_FUNDS EXCEPTION; --�û�����

  ORG_SMSQUOTA_NOT_ENOUGH EXCEPTION; --����������������

  ORG_MMSQUOTA_NOT_ENOUGH EXCEPTION; --����������������

  USER_SMSQUOTA_NOT_ENOUGH EXCEPTION; --�û�������������

  USER_MMSQUOTA_NOT_ENOUGH EXCEPTION; --�û�������������

  P_GW_TYPE VARCHAR2(200); --�Ŷ�����

  P_CHANNEL_ID VARCHAR2(200); --ͨ��ID

  P_SEND_QUANTITY NUMBER(10); --��������

  /*
  *CURSOR_CHANNEL_GW_QUANTITY �α� ͨ��FNC_CON_STR_TO_TAB�������
  */
  CURSOR CURSOR_CHANNEL_GW_QUANTITY IS
    SELECT * FROM TABLE(FNC_CON_STR_TO_TAB(CHANNE_GW_QUANTIY_LIST));

  ORG_DATA ORGANIZATION%ROWTYPE; --������Ϣ

  USER_DATA USER_INFO%ROWTYPE; --�û���Ϣ

  P_UNIT_PRICE UNIT_PRICE_INFO.UNIT_PRICE%TYPE; --����Э���

  COST_FEE NUMBER(10, 3); --���ζ��ŷ���

  REMAIN_BALANCE NUMBER(10, 3); --ʣ����

  REMAIN_QUOTA CONSUME_RECORD_INFO.REMAIN_QUOTA%TYPE; --ʣ�����

  QUANTITY_RESULT NUMBER(10); --��ֺ��¼��
BEGIN

  RUN_UNIT_PRICE := NULL;

  SELECT COUNT(*)
    INTO QUANTITY_RESULT
    FROM TABLE(FNC_CON_STR_TO_TAB(CHANNE_GW_QUANTIY_LIST)); --����Ƿ��ֳɹ�
  IF QUANTITY_RESULT = 0 THEN
    RAISE QUANTIY_LIST_NO_FOUNDS;
  END IF;

  IF CURSOR_CHANNEL_GW_QUANTITY%ISOPEN THEN
    --��ֹ�ϴ��α��û�ر�
    CLOSE CURSOR_CHANNEL_GW_QUANTITY;
  END IF;
  DBMS_OUTPUT.PUT_LINE('============��ʼ�Ʒ�==========');
  OPEN CURSOR_CHANNEL_GW_QUANTITY;
  LOOP
   SELECT U.* INTO USER_DATA FROM USER_INFO U WHERE U.USER_ID = P_USER_ID;
    IF USER_DATA.USER_ID IS NULL THEN
      RAISE NO_USER_RECORD; --�û�������ʱ�׳��쳣
    ELSE
      SELECT O.*
        INTO ORG_DATA
        FROM ORGANIZATION O
       WHERE O.USER_ID = USER_DATA.ORGANIZATION_ID;
      IF ORG_DATA.USER_ID IS NULL THEN
        RAISE NO_ORG_RECORD; --����������ʱ�׳��쳣
      END IF;
    END IF;
    FETCH CURSOR_CHANNEL_GW_QUANTITY
      INTO P_CHANNEL_ID, P_GW_TYPE, P_SEND_QUANTITY;
    EXIT WHEN CURSOR_CHANNEL_GW_QUANTITY%NOTFOUND;
    IF ORG_DATA.PAY_TYPE = 1 THEN
      DBMS_OUTPUT.PUT_LINE('�û����ڻ������ں󸶷�,��ִ�мƷѲ���'); --�����Ǻ󸶷�ʱ��ִ�мƷѲ���ֻ��¼��ˮ
      --��¼��ˮ
      BEGIN
      --����������������ͻ����ѯ����������Э���
      IF ORG_DATA.PARENTID != 0 and ORG_DATA.PARENTID != 1 THEN
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      ELSE
      --����������ڷ������ͻ����ѯ��ǰ������Э���
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э��� 
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      --���쵥�۵��ַ���
      IF RUN_UNIT_PRICE IS NULL OR LENGTH(RUN_UNIT_PRICE) = 0 THEN
        RUN_UNIT_PRICE := P_GW_TYPE || ':' || P_UNIT_PRICE;
      ELSE
        RUN_UNIT_PRICE := RUN_UNIT_PRICE || ';' || P_GW_TYPE || ':' ||
                          P_UNIT_PRICE;
      END IF;

      COST_FEE := P_SEND_QUANTITY * P_UNIT_PRICE; --����������(����/����)����
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
      --�û�����Ԥ����
     BEGIN
      --����������������ͻ����ѯ����������Э���
      IF ORG_DATA.PARENTID != 0 and ORG_DATA.PARENTID != 1 THEN
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      ELSE
      --����������ڷ������ͻ����ѯ��ǰ������Э���
      SELECT UI.UNIT_PRICE
          INTO P_UNIT_PRICE
          FROM UNIT_PRICE_INFO UI
         WHERE UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE
            OR UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0; --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э��� 
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      --���쵥�۵��ַ���
      IF RUN_UNIT_PRICE IS NULL OR LENGTH(RUN_UNIT_PRICE) = 0 THEN
        RUN_UNIT_PRICE := P_GW_TYPE || ':' || P_UNIT_PRICE;
      ELSE
        RUN_UNIT_PRICE := RUN_UNIT_PRICE || ';' || P_GW_TYPE || ':' ||
                          P_UNIT_PRICE;
      END IF;

      IF ORG_DATA.PAY_MODE = 1 THEN
        -- ��������ǽ���
        COST_FEE := P_SEND_QUANTITY * P_UNIT_PRICE; --����������(����/����)����
        IF ORG_DATA.FEE_MODE = 1 THEN
          --�û������鸶��
          IF ORG_DATA.USER_BALANCE < COST_FEE THEN
            --��������
            RAISE ORG_NOT_SUFFICIENT_FUNDS;
          END IF;
          REMAIN_BALANCE := ORG_DATA.USER_BALANCE - COST_FEE; --�۷Ѻ�������
          UPDATE ORGANIZATION O
             SET O.USER_BALANCE = REMAIN_BALANCE
           WHERE O.USER_ID = ORG_DATA.USER_ID; --���»������
        ELSE
          --�������Ը���
          IF USER_DATA.USER_BALANCE < COST_FEE THEN
            --�û�����
            RAISE USER_NOT_SUFFICIENT_FUNDS;
          END IF;
          REMAIN_BALANCE := USER_DATA.USER_BALANCE - COST_FEE; --�۷Ѻ��û����
          UPDATE USER_INFO U
             SET U.USER_BALANCE = REMAIN_BALANCE
           WHERE U.USER_ID = P_USER_ID; --�����û����
        END IF;
        --��¼��ˮ
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
        --����������
        IF ORG_DATA.FEE_MODE = 1 THEN
          --�û������鸶��
          IF P_BIZ_TYPE = 0 THEN
            --����Ϊ����
            IF ORG_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE ORG_SMSQUOTA_NOT_ENOUGH; --����������������
            END IF;
            REMAIN_QUOTA := ORG_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE ORGANIZATION O
               SET O.USER_QUOTA = REMAIN_QUOTA
             WHERE O.USER_ID = ORG_DATA.USER_ID; --���»�����������
          ELSIF P_BIZ_TYPE = 1 THEN
            --����Ϊ����
            IF ORG_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE ORG_MMSQUOTA_NOT_ENOUGH; --����������������
            END IF;
            REMAIN_QUOTA := ORG_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE ORGANIZATION O
               SET O.MMS_QUOTA = REMAIN_QUOTA
             WHERE O.USER_ID = ORG_DATA.USER_ID; --���»�����������
          END IF;
        ELSE
          --�������Ը���
          IF P_BIZ_TYPE = 0 THEN
            --����Ϊ����
            IF USER_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_SMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.USER_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
          ELSIF P_BIZ_TYPE = 1 THEN
            --����Ϊ����
            IF USER_DATA.MMS_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_MMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.MMS_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.MMS_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
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
  RUN_EXCEPTION := '�Ʒѳɹ�';

  DBMS_OUTPUT.PUT_LINE('============�Ʒѳɹ�==========');
EXCEPTION
  WHEN ORG_MMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('������������');
    RUN_RESULT    := 1;
    RUN_EXCEPTION := '������������';
    ROLLBACK;
  WHEN ORG_SMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('�����Ķ�������');
    RUN_RESULT    := 2;
    RUN_EXCEPTION := '�����Ķ�������';
    ROLLBACK;
  WHEN USER_SMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('�û���������');
    RUN_RESULT    := 3;
    RUN_EXCEPTION := '�û���������';
    ROLLBACK;
  WHEN USER_MMSQUOTA_NOT_ENOUGH THEN
    DBMS_OUTPUT.PUT_LINE('�û���������');
    RUN_RESULT    := 4;
    RUN_EXCEPTION := '�û���������';
    ROLLBACK;
  WHEN ILLEGALITY_BIZ_TYPE THEN
    DBMS_OUTPUT.PUT_LINE('�Ƿ��Ķ�������');
    RUN_RESULT    := 5;
    RUN_EXCEPTION := '�Ƿ��Ķ�������';
    ROLLBACK;
  WHEN USER_NOT_SUFFICIENT_FUNDS THEN
    DBMS_OUTPUT.PUT_LINE('�û�����');
    RUN_RESULT    := 6;
    RUN_EXCEPTION := '�û�����';
    ROLLBACK;
  WHEN ORG_NOT_SUFFICIENT_FUNDS THEN
    DBMS_OUTPUT.PUT_LINE('��������');
    RUN_RESULT    := 7;
    RUN_EXCEPTION := '��������';
    ROLLBACK;
  WHEN NO_USER_RECORD THEN
    DBMS_OUTPUT.PUT_LINE('�ƷѴ�����ʾ:�û�������!');
    RUN_RESULT    := 8;
    RUN_EXCEPTION := '�ƷѴ�����ʾ:�û�������!';
    ROLLBACK;
  WHEN NO_ORG_RECORD THEN
    DBMS_OUTPUT.PUT_LINE('�ƷѴ�����ʾ:�û������Ļ���������!');
    RUN_RESULT    := 9;
    RUN_EXCEPTION := '�ƷѴ�����ʾ:�û������Ļ���������!';
    ROLLBACK;
  WHEN NO_UNIT_PRICE THEN
    DBMS_OUTPUT.PUT_LINE('�û���������δ����Э���');
    RUN_RESULT    := 10;
    RUN_EXCEPTION := '�û���������δ����Э���';
    ROLLBACK;
  WHEN QUANTIY_LIST_NO_FOUNDS THEN
    DBMS_OUTPUT.PUT_LINE('ͨ��-�Ŷ�-���������ʧ��,�����ʽ');
    RUN_RESULT    := 12;
    RUN_EXCEPTION := 'ͨ��-�Ŷ�-���������ʧ��,�����ʽ';
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE || '----' || SQLERRM);
    RUN_RESULT    := 11;
    RUN_EXCEPTION := SQLCODE || '----' || SQLERRM;
    ROLLBACK;
END FEE_CALCULATE_ABLE;
/
