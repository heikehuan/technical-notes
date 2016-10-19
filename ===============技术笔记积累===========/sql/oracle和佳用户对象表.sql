----------------------------------------------------
-- Export file for user MESSAGECHANNEL            --
-- Created by Administrator on 2014/7/3, 15:22:37 --
----------------------------------------------------

spool �ͼ��û������.log

prompt
prompt Creating table ADDRESS_GROUP_INFO
prompt =================================
prompt
create table ADDRESS_GROUP_INFO
(
  GROUP_ID        VARCHAR2(50) not null,
  GROUP_NAME      VARCHAR2(30),
  GROUP_REMARK    VARCHAR2(200),
  CREATE_USER_ID  VARCHAR2(200),
  ORGANIZATION_ID VARCHAR2(200),
  CREATE_TIME     DATE default sysdate,
  MODIFY_TIME     DATE default sysdate
)
;
alter table ADDRESS_GROUP_INFO
  add primary key (GROUP_ID);

prompt
prompt Creating table ADDRESS_BOOK_INFO
prompt ================================
prompt
create table ADDRESS_BOOK_INFO
(
  ID              VARCHAR2(50) not null,
  NAME            VARCHAR2(30),
  PHONE_NUMBER    VARCHAR2(20),
  POSITION        VARCHAR2(20),
  BIRTHDAY        DATE,
  EMAIL           VARCHAR2(50),
  REMARK          VARCHAR2(200),
  ORGANIZATION_ID VARCHAR2(200),
  CREATE_USER_ID  VARCHAR2(200),
  CREATE_TIME     DATE default sysdate,
  MODIFY_TIME     DATE,
  GROUP_ID        VARCHAR2(50)
)
;
alter table ADDRESS_BOOK_INFO
  add primary key (ID);
alter table ADDRESS_BOOK_INFO
  add constraint FK7309B5999E4DF9FB foreign key (GROUP_ID)
  references ADDRESS_GROUP_INFO (GROUP_ID);

prompt
prompt Creating table BLACK
prompt ====================
prompt
create table BLACK
(
  BLACK_ID     VARCHAR2(50) not null,
  BLACK_MOBILE VARCHAR2(20),
  BLACK_DESC   VARCHAR2(100),
  BLACK_TIME   DATE,
  BLACK_TYPE   VARCHAR2(20),
  GROUP_ID     VARCHAR2(200) default -1,
  OPER_USERID  VARCHAR2(50),
  OPER_ORGID   VARCHAR2(50),
  SYS_ID       VARCHAR2(50)
)
;
alter table BLACK
  add primary key (BLACK_ID);

prompt
prompt Creating table BLACK_CSMD
prompt =========================
prompt
create table BLACK_CSMD
(
  BLACK_MOBILIE VARCHAR2(20) not null,
  BLACK_TIME    DATE,
  BLACK_DESC    VARCHAR2(100)
)
;
comment on table BLACK_CSMD
  is '��������������';
alter table BLACK_CSMD
  add constraint PK_BLACK_CSMD primary key (BLACK_MOBILIE);

prompt
prompt Creating table BLACK_LOG
prompt ========================
prompt
create table BLACK_LOG
(
  BLACK_LOG_ID      VARCHAR2(200) not null,
  OPERATE_USER_ID   VARCHAR2(200),
  OPERATE_ORG_ID    VARCHAR2(200),
  OPERATE_TYPE      VARCHAR2(20),
  MOBILE            VARCHAR2(255),
  REMARK            VARCHAR2(255),
  OPERATE_TIME      DATE,
  OPERATE_USER_NAME VARCHAR2(255),
  OPERATE_ORG_NAME  VARCHAR2(255)
)
;
alter table BLACK_LOG
  add primary key (BLACK_LOG_ID);

prompt
prompt Creating table BLACK_ZHUOWANG
prompt =============================
prompt
create table BLACK_ZHUOWANG
(
  BLACK_MOBILIE VARCHAR2(20) not null
)
;
comment on table BLACK_ZHUOWANG
  is '׿��������';
alter table BLACK_ZHUOWANG
  add constraint PK_BLACK_ZHUOWANG primary key (BLACK_MOBILIE);

prompt
prompt Creating table CHANNEL_CFG_META_DATA
prompt ====================================
prompt
create table CHANNEL_CFG_META_DATA
(
  LINK_MODE            VARCHAR2(50) not null,
  MESSAGE_TYPE         VARCHAR2(50),
  PARAM_NAME           VARCHAR2(50) not null,
  PARAM_SHORT_NAME     VARCHAR2(50),
  PARAM_DATA_TYPE      VARCHAR2(50),
  PARAM_DATA_UNIT_TYPE VARCHAR2(50),
  PARAM_DATA_SCOPE     VARCHAR2(50),
  PARAM_DATA_REG_EXP   VARCHAR2(1000),
  PARAM_DATA_HINT      VARCHAR2(200),
  PARAM_DEFAULT_VALUE  VARCHAR2(200),
  PARAM_DESCRIPTION    VARCHAR2(2000),
  HIDDEN_ME            NUMBER(2),
  RELATION_FIELD       VARCHAR2(50),
  DISPLAY_INDEX        NUMBER(2),
  TAG_NAME             VARCHAR2(50),
  REQUIRED             NUMBER(2)
)
;
comment on table CHANNEL_CFG_META_DATA
  is '����ͨ������Ԫ���ݱ�';
comment on column CHANNEL_CFG_META_DATA.LINK_MODE
  is '��������';
comment on column CHANNEL_CFG_META_DATA.MESSAGE_TYPE
  is '��Ϣ����, SMS-����, MMS-����';
comment on column CHANNEL_CFG_META_DATA.PARAM_NAME
  is '��������';
comment on column CHANNEL_CFG_META_DATA.PARAM_SHORT_NAME
  is '������������';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_TYPE
  is '��������������';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_UNIT_TYPE
  is '��λ';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_SCOPE
  is '������ֵ��,���鷽ʽ, REGEXP:������ʽ, JS:javascript, ENUM:�б�ö��';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_REG_EXP
  is '������ֵ���������ʽ';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_HINT
  is '������ʾ';
comment on column CHANNEL_CFG_META_DATA.PARAM_DEFAULT_VALUE
  is '������ȱʡֵ';
comment on column CHANNEL_CFG_META_DATA.PARAM_DESCRIPTION
  is '������˵��';
comment on column CHANNEL_CFG_META_DATA.HIDDEN_ME
  is '�Ƿ���ʾ';
comment on column CHANNEL_CFG_META_DATA.RELATION_FIELD
  is '��ҵ�����ݵ��ĸ��ֶ�ȡֵ';
comment on column CHANNEL_CFG_META_DATA.DISPLAY_INDEX
  is '������˵��';
comment on column CHANNEL_CFG_META_DATA.TAG_NAME
  is '�˲���Ӧ�õ��ĸ������ļ�';
comment on column CHANNEL_CFG_META_DATA.REQUIRED
  is '����';
alter table CHANNEL_CFG_META_DATA
  add constraint PK_CHANNEL_CFG_META_DATA primary key (LINK_MODE, PARAM_NAME);

prompt
prompt Creating table CHANNEL_CHANGE_FEE_DETAIL
prompt ========================================
prompt
create table CHANNEL_CHANGE_FEE_DETAIL
(
  ID VARCHAR2(200) not null
)
;

prompt
prompt Creating table CHANNEL_CHANGE_MQLIST
prompt ====================================
prompt
create table CHANNEL_CHANGE_MQLIST
(
  ROW_ID   VARCHAR2(200) not null,
  BATCH_ID VARCHAR2(200),
  USER_ID  VARCHAR2(200),
  ORG_ID   VARCHAR2(200),
  CONTENT  VARCHAR2(2000)
)
;
comment on table CHANNEL_CHANGE_MQLIST
  is 'ͨ���л�list��';

prompt
prompt Creating table CHANNEL_CHECK_CONFIG
prompt ===================================
prompt
create table CHANNEL_CHECK_CONFIG
(
  CHANNEL_ID               NUMBER(4) not null,
  CHANNEL_NAME             VARCHAR2(200),
  BACKUP_CHANNEL_ID        NUMBER(4),
  BACKUP_CHANNEL_NAME      VARCHAR2(200),
  BACKUP_MOBILE_CHANNEL_ID NUMBER(4),
  BACKUP_UNION_CHANNEL_ID  NUMBER(4),
  BACKUP_DX_CHANNEL_ID     NUMBER(4),
  CHECK_FREQUENCE          NUMBER(10),
  FAULT_REPORT_DELAY       NUMBER(10),
  CHECK_TYPE               VARCHAR2(20),
  STATUS                   VARCHAR2(20),
  MAX_SWITCH_QUANTITY      NUMBER(10),
  MIN_SMS_THREDHOLD        NUMBER(10),
  MAX_SMS_THREDHOLD        NUMBER(10),
  SEND_RATE                NUMBER(10),
  MAX_DELAY_MINUTE         NUMBER(10),
  DO_SEND_SMS_ALARM        VARCHAR2(20),
  DO_SEND_EMAIL_ALARM      VARCHAR2(20),
  SMS_ALARM_TEMPLAT        VARCHAR2(20),
  EMAIL_ALARM_TEMPLATE     VARCHAR2(20)
)
;
comment on table CHANNEL_CHECK_CONFIG
  is 'ͨ���л�����';
comment on column CHANNEL_CHECK_CONFIG.CHANNEL_ID
  is 'ͨ�����';
comment on column CHANNEL_CHECK_CONFIG.CHANNEL_NAME
  is 'ͨ������';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_CHANNEL_ID
  is '����ͨ�����';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_CHANNEL_NAME
  is '����ͨ������';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_MOBILE_CHANNEL_ID
  is '�ƶ�����ͨ�����';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_UNION_CHANNEL_ID
  is '��ͨ����ͨ�����';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_DX_CHANNEL_ID
  is '���ű���ͨ�����';
comment on column CHANNEL_CHECK_CONFIG.CHECK_FREQUENCE
  is '���Ƶ��, ��λ:��';
comment on column CHANNEL_CHECK_CONFIG.FAULT_REPORT_DELAY
  is '���ϱ����ӳ�ʱ��, ��λ:��, Ϊ������, ������������ʱ����ٱ���,Ȼ���ȡ��ʩ';
comment on column CHANNEL_CHECK_CONFIG.CHECK_TYPE
  is '��������, QUANTITY:���ѻ����ż��, TIME:����ʱЧ���';
comment on column CHANNEL_CHECK_CONFIG.STATUS
  is '״̬, Y:��Ч,N:δ��Ч';
comment on column CHANNEL_CHECK_CONFIG.MAX_SWITCH_QUANTITY
  is '����л�����';
comment on column CHANNEL_CHECK_CONFIG.MIN_SMS_THREDHOLD
  is '��ѹ���ŵ���С��ֵ, �����������������ڸ�ֵʱ, ����ͨ��������';
comment on column CHANNEL_CHECK_CONFIG.MAX_SMS_THREDHOLD
  is '��ѹ���ŵ����ֵ, �����������������ڸ�ֵʱ, ��Ҫ�л�ͨ��';
comment on column CHANNEL_CHECK_CONFIG.SEND_RATE
  is '���ŵķ����ٶ�, ��λ:��/��';
comment on column CHANNEL_CHECK_CONFIG.MAX_DELAY_MINUTE
  is '��ӳ�ʱ��, ��λ:����';
comment on column CHANNEL_CHECK_CONFIG.DO_SEND_SMS_ALARM
  is '�Ƿ��Ͷ��Ÿ澯, Y:����, N:������';
comment on column CHANNEL_CHECK_CONFIG.DO_SEND_EMAIL_ALARM
  is '�Ƿ����ʼ��澯, Y:����, N:������';
comment on column CHANNEL_CHECK_CONFIG.SMS_ALARM_TEMPLAT
  is '���Ÿ澯ģ��';
comment on column CHANNEL_CHECK_CONFIG.EMAIL_ALARM_TEMPLATE
  is '�ʼ��澯ģ��';
alter table CHANNEL_CHECK_CONFIG
  add constraint PK_CHANNEL_CHECK_CONFIG primary key (CHANNEL_ID);

prompt
prompt Creating table CHANNEL_CONSOLE_CONFIG
prompt =====================================
prompt
create table CHANNEL_CONSOLE_CONFIG
(
  CHANNEL_TYPE   VARCHAR2(20) not null,
  STATUS         VARCHAR2(20),
  CHECK_INTERVAL NUMBER(4)
)
;
comment on table CHANNEL_CONSOLE_CONFIG
  is 'ͨ���������';
comment on column CHANNEL_CONSOLE_CONFIG.CHANNEL_TYPE
  is 'ͨ������, SMS:����, MMS:����';
comment on column CHANNEL_CONSOLE_CONFIG.STATUS
  is '״̬, N:������, Y:����';
comment on column CHANNEL_CONSOLE_CONFIG.CHECK_INTERVAL
  is '������, ��λ:��';
alter table CHANNEL_CONSOLE_CONFIG
  add constraint PK_CHANNEL_CONSOLE_CONFIG primary key (CHANNEL_TYPE);

prompt
prompt Creating table CHANNEL_INFO
prompt ===========================
prompt
create table CHANNEL_INFO
(
  CHANNEL_ID             NUMBER(4) not null,
  CHANNEL_NAME           VARCHAR2(500),
  SP_NO_LT               VARCHAR2(50),
  SP_NO_YD               VARCHAR2(50),
  SP_NO_DX               VARCHAR2(50),
  CHANNEL_STATUS         NUMBER(1) default 0,
  CHANNEL_CLZ            VARCHAR2(2000),
  CHANNEL_REMARK         VARCHAR2(2000),
  SORT_ID                NUMBER(3),
  CHANNEL_STATE          NUMBER(2),
  COM_TYPE               NUMBER(1),
  IS_WHITE               VARCHAR2(50),
  MOST_SPEED             VARCHAR2(50),
  NORMAL_STATUS          VARCHAR2(50),
  WARN_STATUS            VARCHAR2(50),
  BUSY_STATUS            VARCHAR2(50),
  MAIN_CHANNEL           VARCHAR2(50),
  CH_SIGNATURE           VARCHAR2(50),
  EN_SIGNATURE           VARCHAR2(50),
  GATEWAY                VARCHAR2(50),
  LOWEST_SEND            VARCHAR2(50),
  LINK_MODE              VARCHAR2(50),
  PARAMETERS             VARCHAR2(4000),
  DEPLOY_STATUS          NUMBER(1) default 0,
  USER_NAME              VARCHAR2(200),
  IS_RECEIVED            NUMBER(1) default 1,
  IS_SENDSTATUS          NUMBER(1) default 1,
  IS_EXTENDED            NUMBER(1) default 1,
  IS_LONGSMS             NUMBER(1) default 1,
  SPNUMBER_YD_TYPE       VARCHAR2(50),
  SPNUMBER_LT_TYPE       VARCHAR2(50),
  SPNUMBER_DX_TYPE       VARCHAR2(50),
  SP_NO_LT_UP            VARCHAR2(50),
  SP_NO_YD_UP            VARCHAR2(50),
  SP_NO_YD_DW            VARCHAR2(50),
  SP_NO_LT_DW            VARCHAR2(50),
  SMS_MAX_LENGTH_EN      NUMBER,
  LONG_SMS_PER_LENGTH_EN NUMBER,
  LONG_SMS_MAX_LENGTH_EN NUMBER,
  IS_COMPLAINT           NUMBER(5),
  SMS_MAX_LENGTH_CH      NUMBER,
  LONG_SMS_PER_LENGTH_CH NUMBER,
  LONG_SMS_MAX_LENGTH_CH NUMBER,
  UNSUBSCRIBE_KEYWORD    VARCHAR2(50)
)
;
comment on table CHANNEL_INFO
  is '����ͨ����Ϣ��';
comment on column CHANNEL_INFO.CHANNEL_ID
  is 'ͨ��ID';
comment on column CHANNEL_INFO.CHANNEL_NAME
  is 'ͨ������';
comment on column CHANNEL_INFO.SP_NO_LT
  is '��ͨ�ط���';
comment on column CHANNEL_INFO.SP_NO_YD
  is '�ƶ��ط���';
comment on column CHANNEL_INFO.SP_NO_DX
  is '�����ط���';
comment on column CHANNEL_INFO.CHANNEL_STATUS
  is 'ͨ��״̬,0:��Ч, 1:��Ч';
comment on column CHANNEL_INFO.CHANNEL_CLZ
  is 'ͨ�����õ���Ͳ�����';
comment on column CHANNEL_INFO.CHANNEL_REMARK
  is '��ע';
comment on column CHANNEL_INFO.SORT_ID
  is 'ͨ������id';
comment on column CHANNEL_INFO.CHANNEL_STATE
  is 'ͨ������״̬';
comment on column CHANNEL_INFO.COM_TYPE
  is '֧�ֺŶ�����,1:ֻ�ƶ�, 2:ֻ��ͨ,3:ֻ����,0:ȫ֧��';
comment on column CHANNEL_INFO.IS_WHITE
  is '�Ƿ��������� 0-���� ��1������';
comment on column CHANNEL_INFO.MOST_SPEED
  is '����ٶ�';
comment on column CHANNEL_INFO.NORMAL_STATUS
  is '����״̬, ��λΪ����';
comment on column CHANNEL_INFO.WARN_STATUS
  is '����״̬, ��λΪ����';
comment on column CHANNEL_INFO.BUSY_STATUS
  is '��æ״̬, ��λΪ����';
comment on column CHANNEL_INFO.MAIN_CHANNEL
  is '��ͨ��, 1:��,0:��';
comment on column CHANNEL_INFO.CH_SIGNATURE
  is '����ǩ��';
comment on column CHANNEL_INFO.EN_SIGNATURE
  is 'Ӣ��ǩ��';
comment on column CHANNEL_INFO.GATEWAY
  is 'ǩ����ʽ, 0����ǩ����1:����ǩ����2:�Զ����ǩ��';
comment on column CHANNEL_INFO.LOWEST_SEND
  is '��ͷ�����';
comment on column CHANNEL_INFO.LINK_MODE
  is '�������ͣ�CMPP��SGIP��SMGP...';
comment on column CHANNEL_INFO.PARAMETERS
  is '�������ݣ�JSON��ʽ����';
comment on column CHANNEL_INFO.DEPLOY_STATUS
  is '����״̬, 0-δ����,1-�Ѳ���';
comment on column CHANNEL_INFO.USER_NAME
  is '�����û�';
comment on column CHANNEL_INFO.IS_RECEIVED
  is '�Ƿ�֧������,0:��,1:��';
comment on column CHANNEL_INFO.IS_SENDSTATUS
  is '�Ƿ�֧��״̬����,0:��,1:��';
comment on column CHANNEL_INFO.IS_EXTENDED
  is '�Ƿ�֧����չ��,0:��,1:��';
comment on column CHANNEL_INFO.IS_LONGSMS
  is '�Ƿ�֧�ֳ�����,0:��,1:��';
comment on column CHANNEL_INFO.SPNUMBER_YD_TYPE
  is '�ƶ��ط�������';
comment on column CHANNEL_INFO.SPNUMBER_LT_TYPE
  is '��ͨ�ط�������';
comment on column CHANNEL_INFO.SPNUMBER_DX_TYPE
  is '�����ط�������';
comment on column CHANNEL_INFO.SMS_MAX_LENGTH_EN
  is '��ͨ���ŵ���󳤶�,һ�����Ϊ70(Ӣ��)';
comment on column CHANNEL_INFO.LONG_SMS_PER_LENGTH_EN
  is '��������ÿ���ֶ��ŵĳ���,һ��Ϊ67(Ӣ��)';
comment on column CHANNEL_INFO.LONG_SMS_MAX_LENGTH_EN
  is '�����ŵ���󳤶�,����250,300(Ӣ��)';
comment on column CHANNEL_INFO.SMS_MAX_LENGTH_CH
  is '��ͨ���ŵ���󳤶�,һ�����Ϊ70(����)';
comment on column CHANNEL_INFO.LONG_SMS_PER_LENGTH_CH
  is '��������ÿ���ֶ��ŵĳ���,һ��Ϊ67(����)';
comment on column CHANNEL_INFO.LONG_SMS_MAX_LENGTH_CH
  is '�����ŵ���󳤶�,����250,300(����)';
comment on column CHANNEL_INFO.UNSUBSCRIBE_KEYWORD
  is '�˶��ؼ���';
alter table CHANNEL_INFO
  add constraint PK_CHANNEL_INFO primary key (CHANNEL_ID);

prompt
prompt Creating table CHANNEL_PRICE_POLICY
prompt ===================================
prompt
create table CHANNEL_PRICE_POLICY
(
  POLICY_ID           VARCHAR2(200) not null,
  CHANNEL_ID          NUMBER(2),
  POLICY_TYPE         VARCHAR2(30),
  DIRECT_NUMBER       VARCHAR2(30),
  DIRECT_PRICE        VARCHAR2(30),
  DIRECT_ADD_PRICE    VARCHAR2(20),
  INDIRECT_MIN_NUMBER NUMBER(18),
  INDIRECT_MAX_NUMBER VARCHAR2(30),
  INDIRECT_PRICE      VARCHAR2(30)
)
;
comment on table CHANNEL_PRICE_POLICY
  is 'ͨ���۸���Ա����ڷ���ͳ��';
comment on column CHANNEL_PRICE_POLICY.POLICY_ID
  is '�۸���Ե�ID';
comment on column CHANNEL_PRICE_POLICY.CHANNEL_ID
  is 'ͨ�����';
comment on column CHANNEL_PRICE_POLICY.POLICY_TYPE
  is '�������ͣ�1--��ֱ��ͨ����2--���õ�����ͨ��';
comment on column CHANNEL_PRICE_POLICY.DIRECT_NUMBER
  is 'ֱ��ʱ���»�������';
comment on column CHANNEL_PRICE_POLICY.DIRECT_PRICE
  is 'ֱ��ʱ���»��������ļ۸�';
comment on column CHANNEL_PRICE_POLICY.DIRECT_ADD_PRICE
  is 'ֱ��ʱ����ֵҵ���ÿ���۸�';
comment on column CHANNEL_PRICE_POLICY.INDIRECT_MIN_NUMBER
  is 'ʹ�õ�����ͨ��ʱ����С������';
comment on column CHANNEL_PRICE_POLICY.INDIRECT_MAX_NUMBER
  is 'ʹ�õ�����ͨ��ʱ���������';
comment on column CHANNEL_PRICE_POLICY.INDIRECT_PRICE
  is 'ʹ�õ�����ͨ��ʱ������ÿ���ĵ���';
alter table CHANNEL_PRICE_POLICY
  add constraint PK_CHANNEL_PRICE_POLICY primary key (POLICY_ID);

prompt
prompt Creating table CHANNEL_SWITCH_CONFIG
prompt ====================================
prompt
create table CHANNEL_SWITCH_CONFIG
(
  PID                VARCHAR2(200) not null,
  CHANNEL_ID         NUMBER(10) not null,
  IP                 VARCHAR2(200) not null,
  PORT               NUMBER(10) not null,
  HEARTBEAT_ENABLED  NUMBER(1) not null,
  DIR                VARCHAR2(500),
  HEARTBEAT_INTERVAL NUMBER(19)
)
;
alter table CHANNEL_SWITCH_CONFIG
  add primary key (PID);

prompt
prompt Creating table CHANNEL_SWITCH_LOG
prompt =================================
prompt
create table CHANNEL_SWITCH_LOG
(
  PID                   VARCHAR2(200) not null,
  RULE_ID               VARCHAR2(200),
  MATCH_USER_ID         VARCHAR2(200),
  MATCH_ORG_ID          VARCHAR2(200),
  DEST_CHANNEL_ID       NUMBER(10) not null,
  ORIGINAL_CHANNEL_ID   NUMBER(10) not null,
  OPERATOR_ID           VARCHAR2(200),
  MATCH_QUANTITY        NUMBER(19),
  MATCH_MOBILE          VARCHAR2(100),
  MATCH_BATCH_ID        VARCHAR2(200),
  MATCH_CONTENT         VARCHAR2(200),
  MATCH_OPERATOR        NUMBER(3) not null,
  DIRECTION             NUMBER(3) not null,
  OPERATION_DATE        DATE not null,
  OPERATION_RESULT      NUMBER(3),
  OPERATION_RESULT_DESC VARCHAR2(500)
)
;
alter table CHANNEL_SWITCH_LOG
  add primary key (PID);

prompt
prompt Creating table CHANNEL_SWITCH_RULE
prompt ==================================
prompt
create table CHANNEL_SWITCH_RULE
(
  PID                 VARCHAR2(200) not null,
  ORIGINAL_CHANNEL_ID NUMBER(10) not null,
  MATCH_ORG_ID        VARCHAR2(200),
  MATCH_USER_ID       VARCHAR2(200),
  MATCH_QUANTITY      NUMBER(19),
  MATCH_MOBILE        VARCHAR2(100),
  MATCH_BATCH_ID      VARCHAR2(200),
  MATCH_CONTENT       VARCHAR2(200),
  MATCH_OPERATOR      NUMBER(3) not null,
  DIRECTION           NUMBER(3) not null,
  DEST_CHANNEL_ID     NUMBER(10)
)
;
alter table CHANNEL_SWITCH_RULE
  add primary key (PID);

prompt
prompt Creating table CHANNEL_TEST
prompt ===========================
prompt
create table CHANNEL_TEST
(
  CHANNEL_TEST_ID VARCHAR2(200) not null,
  MOBILE_TO       VARCHAR2(2000) not null,
  SEND_MSG        VARCHAR2(4000),
  SEND_TIME       VARCHAR2(30) default sysdate,
  CHANNEL_ID      NUMBER(4) default 1,
  CREATE_TIME     DATE default sysdate,
  REMARK          VARCHAR2(500),
  TRIGGER_NAME    VARCHAR2(80) not null,
  EXT_NUM         VARCHAR2(80)
)
;
comment on table CHANNEL_TEST
  is 'ͨ�����Զ�ʱ�����';
comment on column CHANNEL_TEST.CHANNEL_TEST_ID
  is '����';
comment on column CHANNEL_TEST.MOBILE_TO
  is 'Ŀ���ֻ���';
comment on column CHANNEL_TEST.SEND_MSG
  is '��������';
comment on column CHANNEL_TEST.SEND_TIME
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column CHANNEL_TEST.CHANNEL_ID
  is 'ͨ��ID';
comment on column CHANNEL_TEST.CREATE_TIME
  is '������ʱ����ʱ��';
comment on column CHANNEL_TEST.REMARK
  is '��ע��Ϣ����Ϊ�ⲿϵͳ��չ�ã�CC����ϵͳ���ֶ���д�����˺�';
comment on column CHANNEL_TEST.TRIGGER_NAME
  is '��ʱ������';
comment on column CHANNEL_TEST.EXT_NUM
  is '�Զ�����չ��';
alter table CHANNEL_TEST
  add constraint PK_CHANNEL_TEST primary key (CHANNEL_TEST_ID);

prompt
prompt Creating table USER_INFO
prompt ========================
prompt
create table USER_INFO
(
  USER_ID              VARCHAR2(200) not null,
  USER_NAME            VARCHAR2(200),
  USER_PASS            VARCHAR2(200),
  USER_STAT            NUMBER(1),
  USER_MOME            VARCHAR2(200),
  USER_DEF_ROLE        VARCHAR2(200),
  USER_TYPE            NUMBER(1),
  USER_BALANCE         NUMBER(20,3),
  CREATE_TIME          DATE,
  ORGANIZATION_ID      VARCHAR2(200),
  ENG_SIGNATURE        VARCHAR2(20),
  CHN_SIGNATURE        VARCHAR2(40),
  USE_USER_SIGNATURE   NUMBER(1),
  EXTEND_NUMBER        VARCHAR2(20),
  USER_QUOTA           NUMBER(22) default 0,
  PAY_TYPE             NUMBER(1),
  PAY_MODE             NUMBER(1),
  FEE_MODE             NUMBER(1),
  CHANNEL_TYPE         NUMBER(1),
  MOBILE_TYPE          NUMBER(1),
  EMAIL                VARCHAR2(200),
  MOBILE               VARCHAR2(200),
  SMS_ALERT            NUMBER(1),
  MMS_QUOTA            NUMBER(22) default 0,
  RECHARGE_EXPLAIN     VARCHAR2(200),
  NICK_NAME            VARCHAR2(200),
  USER_KIND            NUMBER(1),
  IS_INSTEAD_SEND      NUMBER(1),
  LOGIN_ERROR_NUM      NUMBER(1) default 0,
  LAST_UPDATE_PSW_DATE DATE default sysdate,
  VALID_IP             VARCHAR2(2000),
  VALID_MOBILE         VARCHAR2(200),
  IP_STATUS            NUMBER(1) default 0,
  MOBILE_STATUS        NUMBER(1) default 0
)
;
comment on table USER_INFO
  is '�û���';
comment on column USER_INFO.USER_ID
  is '�û����';
comment on column USER_INFO.USER_NAME
  is '�û�����';
comment on column USER_INFO.USER_PASS
  is '����';
comment on column USER_INFO.USER_STAT
  is '״̬, 1:��Ч, 0:��Ч,2:��ɾ��';
comment on column USER_INFO.USER_MOME
  is '��ע';
comment on column USER_INFO.USER_DEF_ROLE
  is '�û�Ĭ�Ͻ�ɫ';
comment on column USER_INFO.USER_TYPE
  is '�û�����, 2:��ͨԱ��, 1:�����Ա';
comment on column USER_INFO.USER_BALANCE
  is '�û����÷���';
comment on column USER_INFO.CREATE_TIME
  is '����ʱ��';
comment on column USER_INFO.ORGANIZATION_ID
  is '����ID';
comment on column USER_INFO.ENG_SIGNATURE
  is '�û���Ӣ��ǩ��';
comment on column USER_INFO.CHN_SIGNATURE
  is '�û�������ǩ��';
comment on column USER_INFO.USE_USER_SIGNATURE
  is '�Ƿ���Ҫ�û�ǩ��, 0:��Ҫ, 1:����Ҫ';
comment on column USER_INFO.EXTEND_NUMBER
  is '�û���չ��';
comment on column USER_INFO.USER_QUOTA
  is '�������';
comment on column USER_INFO.PAY_TYPE
  is '��ֵ����, 0:Ԥ����, 1:�󸶷�';
comment on column USER_INFO.PAY_MODE
  is '�Ʒѵ�λ, 0:����, 1:����';
comment on column USER_INFO.FEE_MODE
  is '�۷ѷ�ʽ, 0:�Ը���, 1:�鸶��';
comment on column USER_INFO.CHANNEL_TYPE
  is '�Ƿ�����ͨ��, 0:������, 1:����';
comment on column USER_INFO.MOBILE_TYPE
  is '�Ƿ����ֺŶ�, 0:������, 1:����';
comment on column USER_INFO.EMAIL
  is 'E-mail';
comment on column USER_INFO.MOBILE
  is '�ֻ�����';
comment on column USER_INFO.SMS_ALERT
  is '������������, 0:��, 1:��';
comment on column USER_INFO.MMS_QUOTA
  is '�������';
comment on column USER_INFO.RECHARGE_EXPLAIN
  is '��ֵ˵��';
comment on column USER_INFO.USER_KIND
  is '�û����ࣺ1��Webƽ̨�û���2��WebService�ӿ��û���3��CMPP�ӿ��û���4��HTTP�ӿ��û�';
comment on column USER_INFO.IS_INSTEAD_SEND
  is '�Ƿ����������Ϣ';
comment on column USER_INFO.LOGIN_ERROR_NUM
  is '��¼�������';
comment on column USER_INFO.LAST_UPDATE_PSW_DATE
  is '�ϴ��޸�����ʱ��';
comment on column USER_INFO.VALID_IP
  is '�û��󶨵�IP��ַ';
comment on column USER_INFO.VALID_MOBILE
  is '�û��󶨵��ֻ�����';
comment on column USER_INFO.IP_STATUS
  is '�û�IP�󶨵�״̬, 0:���� , 1:�� ';
comment on column USER_INFO.MOBILE_STATUS
  is '�û��ֻ�����󶨵�״̬, 0:���� , 1:�� ';
alter table USER_INFO
  add constraint PK_USER_INFO primary key (USER_ID);

prompt
prompt Creating table CHANNEL_USER
prompt ===========================
prompt
create table CHANNEL_USER
(
  ID              VARCHAR2(100) not null,
  USER_ID         VARCHAR2(200) not null,
  CHANNEL_ID      NUMBER(4) not null,
  CREATE_USER     VARCHAR2(200),
  CREATE_TIME     DATE,
  COM_TYPE        NUMBER(1),
  CASCADE_ID      VARCHAR2(1000),
  DEFALUT_CHANNEL NUMBER(1)
)
;
comment on column CHANNEL_USER.ID
  is '����';
comment on column CHANNEL_USER.USER_ID
  is '�û�id';
comment on column CHANNEL_USER.CHANNEL_ID
  is 'ͨ��id';
comment on column CHANNEL_USER.CREATE_USER
  is '������';
comment on column CHANNEL_USER.CREATE_TIME
  is '����ʱ��';
comment on column CHANNEL_USER.COM_TYPE
  is '1:�ƶ�, 2:��ͨ,3:����,0:ȫ֧��';
comment on column CHANNEL_USER.CASCADE_ID
  is '����id:���ڶԱ���ɾ�������';
alter table CHANNEL_USER
  add constraint PK_ID primary key (ID);
alter table CHANNEL_USER
  add constraint FK_CID foreign key (CHANNEL_ID)
  references CHANNEL_INFO (CHANNEL_ID) on delete cascade;
alter table CHANNEL_USER
  add constraint FK_UID foreign key (USER_ID)
  references USER_INFO (USER_ID) on delete cascade
  disable;

prompt
prompt Creating table COMMON_MODULE_INFO
prompt =================================
prompt
create table COMMON_MODULE_INFO
(
  MODULE_ID     NUMBER(18) not null,
  P_MODULE_ID   NUMBER(18),
  MODULE_NAME   VARCHAR2(50),
  MODULE_URL    VARCHAR2(200),
  MODULE_REMARK VARCHAR2(500),
  MODULE_SORT   NUMBER(4),
  MODULE_LEVEL  NUMBER(2),
  MODULE_STATUS CHAR(1) default '1'
)
;
comment on table COMMON_MODULE_INFO
  is '��������ƽ̨ģ���';
comment on column COMMON_MODULE_INFO.MODULE_ID
  is 'ģ��ID';
comment on column COMMON_MODULE_INFO.P_MODULE_ID
  is '��ģ��ID';
comment on column COMMON_MODULE_INFO.MODULE_NAME
  is 'ģ������';
comment on column COMMON_MODULE_INFO.MODULE_URL
  is 'ģ��URL';
comment on column COMMON_MODULE_INFO.MODULE_REMARK
  is 'ģ�鱸ע';
comment on column COMMON_MODULE_INFO.MODULE_SORT
  is '��ʾ˳��';
comment on column COMMON_MODULE_INFO.MODULE_LEVEL
  is 'ģ�鼶��';
comment on column COMMON_MODULE_INFO.MODULE_STATUS
  is 'ģ��״̬ 0:ͣ��, 1:����';
alter table COMMON_MODULE_INFO
  add constraint PK_COMMON_MODULE_INFO primary key (MODULE_ID);

prompt
prompt Creating table CONSUME_RECORD_INFO
prompt ==================================
prompt
create table CONSUME_RECORD_INFO
(
  RECORD_ID       VARCHAR2(200) not null,
  CONSUMER_ID     VARCHAR2(200),
  CONSUMER_NAME   VARCHAR2(200),
  SEND_TIME       DATE default sysdate,
  SEND_QUANTITY   NUMBER(10),
  SEND_TYPE       NUMBER(10) default 0,
  REMAIN_QUOTA    NUMBER(10),
  UNIT_PRICE      NUMBER(10,3),
  COST_FEE        NUMBER(10,3),
  REMARK          VARCHAR2(200),
  SEND_MSG        VARCHAR2(2000),
  GW_TYPE         NUMBER(10) default 0,
  BIZ_TYPE        NUMBER(3) default 0,
  CHANNEL_ID      NUMBER(10) default 0,
  USER_MOME       VARCHAR2(200),
  BATCH_ID        VARCHAR2(200),
  REMAIN_BALANCE  NUMBER(10,3) default 0.00,
  ORGANIZATION_ID VARCHAR2(200),
  FEE_MODE        NUMBER(1),
  PAY_TYPE        NUMBER(1)
)
;
comment on table CONSUME_RECORD_INFO
  is '������ˮ��¼';
comment on column CONSUME_RECORD_INFO.RECORD_ID
  is 'id';
comment on column CONSUME_RECORD_INFO.CONSUMER_ID
  is '�û�id';
comment on column CONSUME_RECORD_INFO.CONSUMER_NAME
  is '�û���¼��';
comment on column CONSUME_RECORD_INFO.SEND_TIME
  is '����ʱ��';
comment on column CONSUME_RECORD_INFO.SEND_QUANTITY
  is '������';
comment on column CONSUME_RECORD_INFO.SEND_TYPE
  is '�������͡�0��ͨ����,1��������,2�ظ�����,3Ⱥ�鷢��,4socket����,5webservice����,6�ֹ�����,7Ԥ������,8�����ʾ�,9����ף��,10��ͨ����,11�˵�����,20��ͨemail';
comment on column CONSUME_RECORD_INFO.REMAIN_QUOTA
  is 'ʣ�����';
comment on column CONSUME_RECORD_INFO.UNIT_PRICE
  is '����';
comment on column CONSUME_RECORD_INFO.COST_FEE
  is '���ζ��ŷ���';
comment on column CONSUME_RECORD_INFO.REMARK
  is '��ע';
comment on column CONSUME_RECORD_INFO.SEND_MSG
  is '�����ζ��ŵ�����(�������ͷ�ʽֻ��¼��һ�����ŵ�����)';
comment on column CONSUME_RECORD_INFO.GW_TYPE
  is '�Ŷ����͡�0-ȫ��·��1-�ƶ��ŶΣ�2-��ͨ�ŶΣ�3-С��ͨ�Ŷ�';
comment on column CONSUME_RECORD_INFO.BIZ_TYPE
  is 'ҵ�����͡�0-��ͨ����ҵ��1-����ҵ��2-emailҵ��';
comment on column CONSUME_RECORD_INFO.CHANNEL_ID
  is '����ͨ����0-����ͨ��';
comment on column CONSUME_RECORD_INFO.USER_MOME
  is '�û����';
comment on column CONSUME_RECORD_INFO.BATCH_ID
  is '���κ�';
comment on column CONSUME_RECORD_INFO.REMAIN_BALANCE
  is 'ʣ����';
comment on column CONSUME_RECORD_INFO.ORGANIZATION_ID
  is '����id ';
comment on column CONSUME_RECORD_INFO.FEE_MODE
  is '�����ĸ������� 0:�Ը���, 1:�鸶��';
comment on column CONSUME_RECORD_INFO.PAY_TYPE
  is '��ֵ����, 0:Ԥ����, 1:�󸶷�';
alter table CONSUME_RECORD_INFO
  add primary key (RECORD_ID);

prompt
prompt Creating table COUNT_SEND_STATUS
prompt ================================
prompt
create table COUNT_SEND_STATUS
(
  ID            VARCHAR2(200) not null,
  ALL_COUNT     VARCHAR2(50),
  SENDING_COUNT VARCHAR2(50),
  CREATE_TIME   DATE,
  SENT_COUNT    VARCHAR2(50),
  RECEIVE_COUNT VARCHAR2(50),
  SUC_COUNT     VARCHAR2(50),
  CHANNEL_ID    VARCHAR2(50)
)
;
comment on table COUNT_SEND_STATUS
  is '��״̬��������';
comment on column COUNT_SEND_STATUS.ID
  is '����';
comment on column COUNT_SEND_STATUS.ALL_COUNT
  is '����';
comment on column COUNT_SEND_STATUS.SENDING_COUNT
  is '����������';
comment on column COUNT_SEND_STATUS.CREATE_TIME
  is '������ʱ��';
comment on column COUNT_SEND_STATUS.SENT_COUNT
  is '���ύ����';
comment on column COUNT_SEND_STATUS.RECEIVE_COUNT
  is '��������';
comment on column COUNT_SEND_STATUS.SUC_COUNT
  is '�ɹ�����';
comment on column COUNT_SEND_STATUS.CHANNEL_ID
  is '0Ϊ����ͨ��';
alter table COUNT_SEND_STATUS
  add constraint PK_COUNT_SEND_STATUS primary key (ID);

prompt
prompt Creating table CUSTOMER
prompt =======================
prompt
create table CUSTOMER
(
  CUSTOMER_ID      VARCHAR2(50) not null,
  MOBILE           VARCHAR2(50),
  MOBILE_USER_NAME VARCHAR2(200),
  BIRTHDAY         DATE,
  EMAIL            VARCHAR2(200),
  MOBILE_REMARK    VARCHAR2(200),
  CREATE_USER_ID   VARCHAR2(50),
  ORGANIZATION_ID  VARCHAR2(200),
  CREATE_TIME      DATE,
  MODIFY_TIME      DATE,
  CUSTOMER_TYPE_ID VARCHAR2(100),
  DEFINE_COLUMN_1  VARCHAR2(100),
  DEFINE_COLUMN_2  VARCHAR2(100),
  DEFINE_COLUMN_3  VARCHAR2(100),
  DEFINE_COLUMN_4  VARCHAR2(100),
  DEFINE_COLUMN_5  VARCHAR2(100),
  DEFINE_COLUMN_6  VARCHAR2(100),
  DEFINE_COLUMN_7  VARCHAR2(100),
  DEFINE_COLUMN_8  VARCHAR2(100),
  DEFINE_COLUMN_9  VARCHAR2(100),
  DEFINE_COLUMN_10 VARCHAR2(100),
  DEFINE_COLUMN_11 VARCHAR2(100),
  DEFINE_COLUMN_12 VARCHAR2(100),
  DEFINE_COLUMN_13 VARCHAR2(100),
  DEFINE_COLUMN_14 VARCHAR2(100),
  DEFINE_COLUMN_15 VARCHAR2(100)
)
;
alter table CUSTOMER
  add primary key (CUSTOMER_ID);

prompt
prompt Creating table GROUP_INFO
prompt =========================
prompt
create table GROUP_INFO
(
  GROUP_ID        VARCHAR2(50) not null,
  USER_ID         VARCHAR2(200) not null,
  GROUP_NAME      VARCHAR2(30),
  GROUP_REMARK    VARCHAR2(100),
  CREATE_TIME     DATE,
  MODIFY_TIME     DATE,
  ORGANIZATION_ID VARCHAR2(200),
  CREATE_USER_ID  VARCHAR2(200),
  IS_SHARE        NUMBER(1) default 0
)
;
comment on column GROUP_INFO.IS_SHARE
  is '0������ 1������';
alter table GROUP_INFO
  add primary key (GROUP_ID, USER_ID);

prompt
prompt Creating table CUSTOMER_GROUP
prompt =============================
prompt
create table CUSTOMER_GROUP
(
  GROUP_ID    VARCHAR2(50) not null,
  USER_ID     VARCHAR2(200) not null,
  CUSTOMER_ID VARCHAR2(50) not null
)
;
alter table CUSTOMER_GROUP
  add primary key (CUSTOMER_ID, GROUP_ID, USER_ID);
alter table CUSTOMER_GROUP
  add constraint FK3B0AF2BE327A2DB0 foreign key (GROUP_ID, USER_ID)
  references GROUP_INFO (GROUP_ID, USER_ID);
alter table CUSTOMER_GROUP
  add constraint FK3B0AF2BED11A972F foreign key (CUSTOMER_ID)
  references CUSTOMER (CUSTOMER_ID);

prompt
prompt Creating table CUSTOMER_INFO
prompt ============================
prompt
create table CUSTOMER_INFO
(
  CUSTOMER_ID      VARCHAR2(50) not null,
  MOBILE_USER_NAME VARCHAR2(50),
  MOBILE           VARCHAR2(50),
  GROUP_ID         VARCHAR2(50),
  CREATE_TIME      DATE
)
;
comment on table CUSTOMER_INFO
  is '�ͻ���';
comment on column CUSTOMER_INFO.CUSTOMER_ID
  is '�ͻ��������';
comment on column CUSTOMER_INFO.MOBILE_USER_NAME
  is '�ͻ�������';
comment on column CUSTOMER_INFO.MOBILE
  is '�ͻ��ֻ���';
comment on column CUSTOMER_INFO.GROUP_ID
  is '�ͻ���������';
comment on column CUSTOMER_INFO.CREATE_TIME
  is '��ӿͻ�ʱ��ʱ��';
alter table CUSTOMER_INFO
  add constraint PK_CUSTOMER_INFO primary key (CUSTOMER_ID);
create unique index IDX_CU_MOBILE on CUSTOMER_INFO (MOBILE, MOBILE_USER_NAME, GROUP_ID);

prompt
prompt Creating table CUSTOMER_LOG
prompt ===========================
prompt
create table CUSTOMER_LOG
(
  LOG_ID           VARCHAR2(50) not null,
  MOBILE           VARCHAR2(200),
  OPER_USER        VARCHAR2(50),
  OPER_GROUP       VARCHAR2(50),
  TYPE             NUMBER(1),
  CREATETIME       DATE,
  MODIFYTIME       VARCHAR2(200),
  RESERVEDINT      NUMBER(1),
  RESERVEDCHAR     VARCHAR2(200),
  PRODUCTID        VARCHAR2(200),
  ORGANIZATIONID   VARCHAR2(200),
  MESSAGE          VARCHAR2(2000),
  ORDER_START_DATE DATE,
  ORDER_DU_DATE    DATE
)
;
comment on table CUSTOMER_LOG
  is '�ͻ���Ϣ��';
alter table CUSTOMER_LOG
  add constraint PK_CUSTOMER_LOG primary key (LOG_ID);

prompt
prompt Creating table CUSTOMER_TYPE
prompt ============================
prompt
create table CUSTOMER_TYPE
(
  CUSTOMER_TYPE_ID   VARCHAR2(100) not null,
  CUSTOMER_TYPE_NAME VARCHAR2(100),
  CREATE_USER        VARCHAR2(50),
  CREATE_TIME        DATE,
  MODIFY_TIME        DATE,
  DESCRIPTION        VARCHAR2(200),
  ORGANIZATION_ID    VARCHAR2(100)
)
;
alter table CUSTOMER_TYPE
  add primary key (CUSTOMER_TYPE_ID);

prompt
prompt Creating table CUSTOMER_TYPE_ATTR
prompt =================================
prompt
create table CUSTOMER_TYPE_ATTR
(
  CUSTOMER_TYPE_ID VARCHAR2(100) not null,
  ATTR_NAME        VARCHAR2(100) not null,
  DEFINE_COLUMN    NUMBER(10),
  DESCRIPTION      VARCHAR2(200),
  JS_VALIDATE      VARCHAR2(500),
  ATTR_TYPE        NUMBER(10),
  ID               VARCHAR2(100),
  CREATE_TIME      DATE
)
;
alter table CUSTOMER_TYPE_ATTR
  add primary key (CUSTOMER_TYPE_ID, ATTR_NAME);

prompt
prompt Creating table DAILY_RECKONING_INFO
prompt ===================================
prompt
create table DAILY_RECKONING_INFO
(
  DAILY_RECKONING_ID   VARCHAR2(200) not null,
  USER_ID              VARCHAR2(200) not null,
  USER_NAME            VARCHAR2(200),
  SEND_STATUS          VARCHAR2(200),
  SEND_QUANTITY        INTEGER,
  SUB_TOTAL_FEE        NUMBER(13,3),
  REMAIN_MESSAGE_QUOTA NUMBER(10),
  REMAIN_MMS_QUOTA     NUMBER(10),
  RECKONING_DATE       DATE,
  RECORD_DATE          DATE default sysdate,
  PAY_MODE             NUMBER(1) default 0,
  REMAIN_BALANCE       NUMBER(10,3) default 0.000,
  USER_MOME            VARCHAR2(200),
  MOBILE_COM           NUMBER(2),
  CHANNEL_ID           NUMBER(4),
  UNIT_PRICE           NUMBER(10,3)
)
;
comment on table DAILY_RECKONING_INFO
  is '�սᵥ��';
comment on column DAILY_RECKONING_INFO.DAILY_RECKONING_ID
  is 'id';
comment on column DAILY_RECKONING_INFO.USER_ID
  is '�˻�id';
comment on column DAILY_RECKONING_INFO.USER_NAME
  is '�˻���';
comment on column DAILY_RECKONING_INFO.SEND_STATUS
  is '����״̬(��ֻ���ύ�ͷ��ͳɹ���)';
comment on column DAILY_RECKONING_INFO.SEND_QUANTITY
  is '�ƷѶ��ŵ�����';
comment on column DAILY_RECKONING_INFO.SUB_TOTAL_FEE
  is '���ŷ���';
comment on column DAILY_RECKONING_INFO.REMAIN_MESSAGE_QUOTA
  is 'ʣ��������';
comment on column DAILY_RECKONING_INFO.REMAIN_MMS_QUOTA
  is 'ʣ��������';
comment on column DAILY_RECKONING_INFO.RECKONING_DATE
  is '���ŷ��͵�����';
comment on column DAILY_RECKONING_INFO.RECORD_DATE
  is '��¼����';
comment on column DAILY_RECKONING_INFO.PAY_MODE
  is '�Ʒ�ģʽ';
comment on column DAILY_RECKONING_INFO.REMAIN_BALANCE
  is 'ʣ����';
comment on column DAILY_RECKONING_INFO.USER_MOME
  is '�˻�����';
comment on column DAILY_RECKONING_INFO.MOBILE_COM
  is '��Ӫ��ID��1Ϊ�ƶ���2Ϊ��ͨ,3Ϊ����,0Ϊȫ�� ';
comment on column DAILY_RECKONING_INFO.CHANNEL_ID
  is 'ͨ��ID';
comment on column DAILY_RECKONING_INFO.UNIT_PRICE
  is '���ŵ���';
alter table DAILY_RECKONING_INFO
  add constraint PK_DAILY_RECKONING_INFO primary key (DAILY_RECKONING_ID);

prompt
prompt Creating table DB_INTERFACE_INFO
prompt ================================
prompt
create table DB_INTERFACE_INFO
(
  DB_INTERFACE_ID   VARCHAR2(200) not null,
  ZHANG_HAO         VARCHAR2(200),
  PASS_WORD         VARCHAR2(200),
  SEND_SELECT_LIMIT VARCHAR2(30),
  SEND_INSERT_LIMIT VARCHAR2(30),
  RECEIVE_LIMIT     VARCHAR2(30),
  PRO_CLASS_LIMIT   VARCHAR2(30),
  PRO_LIMIT         VARCHAR2(30)
)
;
comment on table DB_INTERFACE_INFO
  is '���ݿ�ӿ�';
comment on column DB_INTERFACE_INFO.DB_INTERFACE_ID
  is '���ݿ�ӿڵ�ID';
comment on column DB_INTERFACE_INFO.ZHANG_HAO
  is '�˺�';
comment on column DB_INTERFACE_INFO.PASS_WORD
  is '����';
comment on column DB_INTERFACE_INFO.SEND_SELECT_LIMIT
  is 'sms_send���Ȩ��:select--��ѯȨ��';
comment on column DB_INTERFACE_INFO.SEND_INSERT_LIMIT
  is 'sms_send���Ȩ��:insert--����Ȩ��';
comment on column DB_INTERFACE_INFO.RECEIVE_LIMIT
  is 'sms_receive���Ȩ�ޣ�select--��ѯȨ��';
comment on column DB_INTERFACE_INFO.PRO_CLASS_LIMIT
  is '����Υ���ʷ����Ȩ�ޣ�select--��ѯȨ��';
comment on column DB_INTERFACE_INFO.PRO_LIMIT
  is '����Υ���ʵ�Ȩ�ޣ�select--��ѯȨ��';
alter table DB_INTERFACE_INFO
  add constraint PK_DB_INTERFACE_INFO primary key (DB_INTERFACE_ID);

prompt
prompt Creating table DIC_ALL_KIND
prompt ===========================
prompt
create table DIC_ALL_KIND
(
  KIND_CODE      VARCHAR2(32) not null,
  KIND_NAME      VARCHAR2(128) not null,
  MEMO           VARCHAR2(128),
  OPERATION_KIND VARCHAR2(32) not null,
  OPERATION_NAME VARCHAR2(128) not null
)
;
comment on table DIC_ALL_KIND
  is 'ϵͳ�ֵ��';
comment on column DIC_ALL_KIND.KIND_CODE
  is '�ֵ����';
comment on column DIC_ALL_KIND.KIND_NAME
  is '�ֵ�����';
comment on column DIC_ALL_KIND.MEMO
  is '��ע';
comment on column DIC_ALL_KIND.OPERATION_KIND
  is '��������';
comment on column DIC_ALL_KIND.OPERATION_NAME
  is '������������';
alter table DIC_ALL_KIND
  add constraint PK_DIC_ALL_KIND primary key (KIND_CODE, OPERATION_KIND);

prompt
prompt Creating table DRAFT_INFO
prompt =========================
prompt
create table DRAFT_INFO
(
  DRAFT_ID    VARCHAR2(200) not null,
  CONTEXT     VARCHAR2(4000),
  MOBILE_TO   VARCHAR2(4000),
  USER_ID     VARCHAR2(200),
  CREATE_DATE DATE,
  CONTENT     VARCHAR2(2000),
  GROUP_IDS   CLOB,
  GROUP_NAMES CLOB,
  MOBILE      CLOB,
  CREATE_TIME TIMESTAMP(6)
)
;
comment on table DRAFT_INFO
  is '���Ųݸ�';
comment on column DRAFT_INFO.DRAFT_ID
  is '�ݸ���';
comment on column DRAFT_INFO.CONTEXT
  is '��������';
comment on column DRAFT_INFO.MOBILE_TO
  is '�ֻ���';
comment on column DRAFT_INFO.USER_ID
  is '�û����';
comment on column DRAFT_INFO.CREATE_DATE
  is '��������';
alter table DRAFT_INFO
  add constraint PK_DRAFT_INFO primary key (DRAFT_ID);

prompt
prompt Creating table D_ORG_INFO
prompt =========================
prompt
create table D_ORG_INFO
(
  ORG_ID        VARCHAR2(200) not null,
  ORG_NAME      VARCHAR2(200),
  ORG_FULL_NAME VARCHAR2(200),
  ORG_STS       VARCHAR2(200),
  ORG_TYPE_CODE VARCHAR2(200),
  SUPER_ORG_NO  VARCHAR2(200),
  IS_FRZ        VARCHAR2(200),
  EXTEND_STR    VARCHAR2(200)
)
;
comment on table D_ORG_INFO
  is '��ʱ������Ϣ��';
comment on column D_ORG_INFO.ORG_ID
  is '�������';
comment on column D_ORG_INFO.ORG_NAME
  is '��������';
comment on column D_ORG_INFO.ORG_FULL_NAME
  is '����ȫ��';
comment on column D_ORG_INFO.ORG_STS
  is '����״̬0 ����,9 ע��';
comment on column D_ORG_INFO.ORG_TYPE_CODE
  is '�������ʹ��룬01:������02��Ӫҵ��';
comment on column D_ORG_INFO.SUPER_ORG_NO
  is '�ϼ��������';
comment on column D_ORG_INFO.IS_FRZ
  is '�Ƿ񶳽� 0 δ����,1 ����';
comment on column D_ORG_INFO.EXTEND_STR
  is 'Ԥ��';
alter table D_ORG_INFO
  add constraint PK_D_ORG_INFO primary key (ORG_ID);

prompt
prompt Creating table D_SYS_CODE
prompt =========================
prompt
create table D_SYS_CODE
(
  SUBSYS_CODE_ID   VARCHAR2(20) not null,
  SUBSYS_CODE_NAME VARCHAR2(200),
  DESCRIPTION      VARCHAR2(200),
  SYS_ID           NUMBER(2)
)
;
comment on table D_SYS_CODE
  is '��ʱ��Ϣ��Դ�����ֵ�';
comment on column D_SYS_CODE.SUBSYS_CODE_ID
  is '��Ϣ��Դ���';
comment on column D_SYS_CODE.SUBSYS_CODE_NAME
  is '��Ϣ��Դ����';
comment on column D_SYS_CODE.DESCRIPTION
  is '��ע';
comment on column D_SYS_CODE.SYS_ID
  is '��Ϣ��Դ��չ��';
alter table D_SYS_CODE
  add constraint PK_D_SYS_CODE primary key (SUBSYS_CODE_ID);

prompt
prompt Creating table ENTITY_GROUP
prompt ===========================
prompt
create table ENTITY_GROUP
(
  ENTITY_GROUP_ID       VARCHAR2(20) not null,
  ENTITY_GROUP_NAME     VARCHAR2(100),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENTITY_GROUP
  add constraint PK_ENTITY_GROUP primary key (ENTITY_GROUP_ID);
create index ENTT_GRP_TXCRTS on ENTITY_GROUP (CREATED_TX_STAMP);
create index ENTT_GRP_TXSTMP on ENTITY_GROUP (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENTITY_GROUP_ENTRY
prompt =================================
prompt
create table ENTITY_GROUP_ENTRY
(
  ENTITY_GROUP_ID       VARCHAR2(20) not null,
  ENTITY_OR_PACKAGE     VARCHAR2(255) not null,
  APPL_ENUM_ID          VARCHAR2(20),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENTITY_GROUP_ENTRY
  add constraint PK_ENTITY_GROUP_ENTRY primary key (ENTITY_GROUP_ID, ENTITY_OR_PACKAGE);
alter table ENTITY_GROUP_ENTRY
  add constraint ENTGRP_GRP foreign key (ENTITY_GROUP_ID)
  references ENTITY_GROUP (ENTITY_GROUP_ID);
create index ENTGRP_GRP on ENTITY_GROUP_ENTRY (ENTITY_GROUP_ID);
create index ENT_GRP_ENR_TXCRTS on ENTITY_GROUP_ENTRY (CREATED_TX_STAMP);
create index ENT_GRP_ENR_TXSTMP on ENTITY_GROUP_ENTRY (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENTITY_KEY_STORE
prompt ===============================
prompt
create table ENTITY_KEY_STORE
(
  KEY_NAME              VARCHAR2(255) not null,
  KEY_TEXT              VARCHAR2(255),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENTITY_KEY_STORE
  add constraint PK_ENTITY_KEY_STORE primary key (KEY_NAME);
create index ENTT_K_STR_TXCRTS on ENTITY_KEY_STORE (CREATED_TX_STAMP);
create index ENTT_K_STR_TXSTMP on ENTITY_KEY_STORE (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENTITY_SYNC
prompt ==========================
prompt
create table ENTITY_SYNC
(
  ENTITY_SYNC_ID               VARCHAR2(20) not null,
  RUN_STATUS_ID                VARCHAR2(20),
  LAST_SUCCESSFUL_SYNCH_TIME   TIMESTAMP(6),
  LAST_HISTORY_START_DATE      TIMESTAMP(6),
  PRE_OFFLINE_SYNCH_TIME       TIMESTAMP(6),
  OFFLINE_SYNC_SPLIT_MILLIS    NUMBER(18),
  SYNC_SPLIT_MILLIS            NUMBER(18),
  SYNC_END_BUFFER_MILLIS       NUMBER(18),
  MAX_RUNNING_NO_UPDATE_MILLIS NUMBER(18),
  TARGET_SERVICE_NAME          VARCHAR2(255),
  TARGET_DELEGATOR_NAME        VARCHAR2(255),
  KEEP_REMOVE_INFO_HOURS       NUMBER(18,6),
  FOR_PULL_ONLY                CHAR(1),
  FOR_PUSH_ONLY                CHAR(1),
  LAST_UPDATED_STAMP           TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP        TIMESTAMP(6),
  CREATED_STAMP                TIMESTAMP(6),
  CREATED_TX_STAMP             TIMESTAMP(6)
)
;
alter table ENTITY_SYNC
  add constraint PK_ENTITY_SYNC primary key (ENTITY_SYNC_ID);
create index ENTITY_SYNC_TXCRTS on ENTITY_SYNC (CREATED_TX_STAMP);
create index ENTITY_SYNC_TXSTMP on ENTITY_SYNC (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENTITY_SYNC_HISTORY
prompt ==================================
prompt
create table ENTITY_SYNC_HISTORY
(
  ENTITY_SYNC_ID             VARCHAR2(20) not null,
  START_DATE                 TIMESTAMP(6) not null,
  RUN_STATUS_ID              VARCHAR2(20),
  BEGINNING_SYNCH_TIME       TIMESTAMP(6),
  LAST_SUCCESSFUL_SYNCH_TIME TIMESTAMP(6),
  LAST_CANDIDATE_END_TIME    TIMESTAMP(6),
  LAST_SPLIT_START_TIME      NUMBER(18),
  TO_CREATE_INSERTED         NUMBER(18),
  TO_CREATE_UPDATED          NUMBER(18),
  TO_CREATE_NOT_UPDATED      NUMBER(18),
  TO_STORE_INSERTED          NUMBER(18),
  TO_STORE_UPDATED           NUMBER(18),
  TO_STORE_NOT_UPDATED       NUMBER(18),
  TO_REMOVE_DELETED          NUMBER(18),
  TO_REMOVE_ALREADY_DELETED  NUMBER(18),
  TOTAL_ROWS_EXPORTED        NUMBER(18),
  TOTAL_ROWS_TO_CREATE       NUMBER(18),
  TOTAL_ROWS_TO_STORE        NUMBER(18),
  TOTAL_ROWS_TO_REMOVE       NUMBER(18),
  TOTAL_SPLITS               NUMBER(18),
  TOTAL_STORE_CALLS          NUMBER(18),
  RUNNING_TIME_MILLIS        NUMBER(18),
  PER_SPLIT_MIN_MILLIS       NUMBER(18),
  PER_SPLIT_MAX_MILLIS       NUMBER(18),
  PER_SPLIT_MIN_ITEMS        NUMBER(18),
  PER_SPLIT_MAX_ITEMS        NUMBER(18),
  LAST_UPDATED_STAMP         TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP      TIMESTAMP(6),
  CREATED_STAMP              TIMESTAMP(6),
  CREATED_TX_STAMP           TIMESTAMP(6)
)
;
alter table ENTITY_SYNC_HISTORY
  add constraint PK_ENTITY_SYNC_HISTORY primary key (ENTITY_SYNC_ID, START_DATE);
alter table ENTITY_SYNC_HISTORY
  add constraint ENTSYNC_HSTSNC foreign key (ENTITY_SYNC_ID)
  references ENTITY_SYNC (ENTITY_SYNC_ID);
create index ENTSYNC_HSTSNC on ENTITY_SYNC_HISTORY (ENTITY_SYNC_ID);
create index ENT_SNC_HSR_TXCRTS on ENTITY_SYNC_HISTORY (CREATED_TX_STAMP);
create index ENT_SNC_HSR_TXSTMP on ENTITY_SYNC_HISTORY (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENTITY_SYNC_INCLUDE
prompt ==================================
prompt
create table ENTITY_SYNC_INCLUDE
(
  ENTITY_SYNC_ID        VARCHAR2(20) not null,
  ENTITY_OR_PACKAGE     VARCHAR2(255) not null,
  APPL_ENUM_ID          VARCHAR2(20),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENTITY_SYNC_INCLUDE
  add constraint PK_ENTITY_SYNC_INCLUDE primary key (ENTITY_SYNC_ID, ENTITY_OR_PACKAGE);
alter table ENTITY_SYNC_INCLUDE
  add constraint ENTSYNC_INCSNC foreign key (ENTITY_SYNC_ID)
  references ENTITY_SYNC (ENTITY_SYNC_ID);
create index ENTSYNC_INCSNC on ENTITY_SYNC_INCLUDE (ENTITY_SYNC_ID);
create index ENT_SNC_INCD_TXCRS on ENTITY_SYNC_INCLUDE (CREATED_TX_STAMP);
create index ENT_SNC_INCD_TXSTP on ENTITY_SYNC_INCLUDE (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENTITY_SYNC_INCLUDE_GROUP
prompt ========================================
prompt
create table ENTITY_SYNC_INCLUDE_GROUP
(
  ENTITY_SYNC_ID        VARCHAR2(20) not null,
  ENTITY_GROUP_ID       VARCHAR2(20) not null,
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENTITY_SYNC_INCLUDE_GROUP
  add constraint PK_ENTITY_SYNC_INCLUDE_GROUP primary key (ENTITY_SYNC_ID, ENTITY_GROUP_ID);
alter table ENTITY_SYNC_INCLUDE_GROUP
  add constraint ENTSNCGU_GRP foreign key (ENTITY_GROUP_ID)
  references ENTITY_GROUP (ENTITY_GROUP_ID);
alter table ENTITY_SYNC_INCLUDE_GROUP
  add constraint ENTSNCGU_SNC foreign key (ENTITY_SYNC_ID)
  references ENTITY_SYNC (ENTITY_SYNC_ID);
create index ENTSNCGU_GRP on ENTITY_SYNC_INCLUDE_GROUP (ENTITY_GROUP_ID);
create index ENTSNCGU_SNC on ENTITY_SYNC_INCLUDE_GROUP (ENTITY_SYNC_ID);
create index ENT_SNC_IND_GRP_TP on ENTITY_SYNC_INCLUDE_GROUP (LAST_UPDATED_TX_STAMP);
create index ENT_SNC_IND_GRP_TS on ENTITY_SYNC_INCLUDE_GROUP (CREATED_TX_STAMP);

prompt
prompt Creating table ENTITY_SYNC_REMOVE
prompt =================================
prompt
create table ENTITY_SYNC_REMOVE
(
  ENTITY_SYNC_REMOVE_ID VARCHAR2(20) not null,
  PRIMARY_KEY_REMOVED   CLOB,
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENTITY_SYNC_REMOVE
  add constraint PK_ENTITY_SYNC_REMOVE primary key (ENTITY_SYNC_REMOVE_ID);
create index ENT_SNC_RMV_TXCRTS on ENTITY_SYNC_REMOVE (CREATED_TX_STAMP);
create index ENT_SNC_RMV_TXSTMP on ENTITY_SYNC_REMOVE (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table ENUMERATION_TYPE
prompt ===============================
prompt
create table ENUMERATION_TYPE
(
  ENUM_TYPE_ID          VARCHAR2(60) not null,
  PARENT_TYPE_ID        VARCHAR2(20),
  HAS_TABLE             CHAR(1),
  DESCRIPTION           VARCHAR2(255),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENUMERATION_TYPE
  add constraint PK_ENUMERATION_TYPE primary key (ENUM_TYPE_ID);
alter table ENUMERATION_TYPE
  add constraint ENUM_TYPE_PARENT foreign key (PARENT_TYPE_ID)
  references ENUMERATION_TYPE (ENUM_TYPE_ID);
create index ENMRTN_TP_TXCRTS on ENUMERATION_TYPE (CREATED_TX_STAMP);
create index ENMRTN_TP_TXSTMP on ENUMERATION_TYPE (LAST_UPDATED_TX_STAMP);
create index ENUM_TYPE_PARENT on ENUMERATION_TYPE (PARENT_TYPE_ID);

prompt
prompt Creating table ENUMERATION
prompt ==========================
prompt
create table ENUMERATION
(
  ENUM_ID               VARCHAR2(60) not null,
  ENUM_TYPE_ID          VARCHAR2(60),
  ENUM_CODE             VARCHAR2(60),
  SEQUENCE_ID           VARCHAR2(20),
  DESCRIPTION           VARCHAR2(255),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table ENUMERATION
  add constraint PK_ENUMERATION primary key (ENUM_ID);
alter table ENUMERATION
  add constraint ENUM_TO_TYPE foreign key (ENUM_TYPE_ID)
  references ENUMERATION_TYPE (ENUM_TYPE_ID);
create index ENUMERATION_TXCRTS on ENUMERATION (CREATED_TX_STAMP);
create index ENUMERATION_TXSTMP on ENUMERATION (LAST_UPDATED_TX_STAMP);
create index ENUM_TO_TYPE on ENUMERATION (ENUM_TYPE_ID);

prompt
prompt Creating table EXCEL
prompt ====================
prompt
create table EXCEL
(
  EXCEL_ID      VARCHAR2(50) not null,
  EXCEL_NAME    VARCHAR2(50),
  MOBILE_TO     VARCHAR2(2000),
  SEND_MSG      VARCHAR2(600),
  PRIOR_ID      VARCHAR2(10),
  PRE_SEND_TIME VARCHAR2(50),
  REMARK        VARCHAR2(500),
  CHANNEL_ID    VARCHAR2(10),
  USER_ID       VARCHAR2(200)
)
;
alter table EXCEL
  add constraint PK_EXCEL primary key (EXCEL_ID);

prompt
prompt Creating table GROUPINFO
prompt ========================
prompt
create table GROUPINFO
(
  GROUP_ID        VARCHAR2(50) not null,
  GROUP_NAME      VARCHAR2(30),
  STATUS          NUMBER(1),
  GROUP_TYPE      NUMBER(1),
  IS_PUBLIC       VARCHAR2(10),
  CREATE_TIME     DATE,
  MODIFY_TIME     DATE,
  USER_ID         VARCHAR2(200),
  ORGANIZATION_ID VARCHAR2(200),
  PARENT_ID       VARCHAR2(50),
  GROUP_REMARK    VARCHAR2(50),
  SORT            NUMBER(1),
  RESERVEDINT     NUMBER(1),
  RESERVEDCHAR    VARCHAR2(50)
)
;
comment on table GROUPINFO
  is '�ͻ�����ģ������Ϣ��';
alter table GROUPINFO
  add constraint PK_GROUPINFO primary key (GROUP_ID);

prompt
prompt Creating table GROUP_EXCEL_INFO
prompt ===============================
prompt
create table GROUP_EXCEL_INFO
(
  EXCEL_ID         VARCHAR2(200) not null,
  EXCEL_NAME       VARCHAR2(200),
  MOBILE           VARCHAR2(24),
  MOBILE_USER_NAME VARCHAR2(50),
  GROUP_ID         VARCHAR2(200),
  MOBILE_REMARK    VARCHAR2(200),
  BIRTHDAY         DATE
)
;
comment on table GROUP_EXCEL_INFO
  is 'Ⱥ��EXCEL�����ֻ�����';
comment on column GROUP_EXCEL_INFO.EXCEL_ID
  is '���';
comment on column GROUP_EXCEL_INFO.EXCEL_NAME
  is 'Excel����';
comment on column GROUP_EXCEL_INFO.MOBILE
  is '�ֻ���';
comment on column GROUP_EXCEL_INFO.MOBILE_USER_NAME
  is '�û���';
comment on column GROUP_EXCEL_INFO.GROUP_ID
  is '��������';
comment on column GROUP_EXCEL_INFO.MOBILE_REMARK
  is '��ע';
comment on column GROUP_EXCEL_INFO.BIRTHDAY
  is '����';
alter table GROUP_EXCEL_INFO
  add constraint PK_GROUP_EXCEL_INFO primary key (EXCEL_ID);

prompt
prompt Creating table GROUP_ORDER_INFO
prompt ===============================
prompt
create table GROUP_ORDER_INFO
(
  ORDER_ID              VARCHAR2(200) not null,
  PRODUCT_ID            VARCHAR2(200),
  ORGANIZATION_ID       VARCHAR2(200),
  ORDER_TYPE            NUMBER(1) default 0,
  ORDER_ADDRESS         VARCHAR2(200),
  GROUP_ID              VARCHAR2(200),
  ORDER_PARAMS          VARCHAR2(200),
  BEGIN_TIME            DATE default sysdate,
  END_TIME              DATE default sysdate,
  ORDER_STATUS          NUMBER(1) default 0,
  ORDER_TIME            DATE default sysdate,
  ORDER_DEPRECATED_FLAG VARCHAR2(200),
  PRODUCT_NAME          VARCHAR2(200),
  CUSTOMER_ID           VARCHAR2(200),
  NOTIFY_STATUS         NUMBER(1) default 0,
  USER_NAME             VARCHAR2(200),
  PRORITY               NUMBER(1) default 0
)
;
comment on table GROUP_ORDER_INFO
  is '�ͻ��鶩�Ĳ�Ʒ��ģ��';
comment on column GROUP_ORDER_INFO.ORDER_ID
  is '�������';
comment on column GROUP_ORDER_INFO.PRODUCT_ID
  is '��Ʒ���';
comment on column GROUP_ORDER_INFO.ORGANIZATION_ID
  is '�������';
comment on column GROUP_ORDER_INFO.ORDER_TYPE
  is '���Ʒ�ʽ��0�����š�1������';
comment on column GROUP_ORDER_INFO.ORDER_ADDRESS
  is '���Ƶĵ�ַ:	�ֻ��Ż�email';
comment on column GROUP_ORDER_INFO.GROUP_ID
  is '��������';
comment on column GROUP_ORDER_INFO.ORDER_PARAMS
  is '���Ʋ���:��Ʊ���룬�ɶ�ֻ';
comment on column GROUP_ORDER_INFO.BEGIN_TIME
  is '���ƿ�ʼʱ��';
comment on column GROUP_ORDER_INFO.END_TIME
  is '���ƽ���ʱ��';
comment on column GROUP_ORDER_INFO.ORDER_STATUS
  is '������Ч״̬��0��������1��δ��ʼ��2���ڡ�3�����ϡ�4����ͣ��5���˶�';
comment on column GROUP_ORDER_INFO.ORDER_TIME
  is '��������';
comment on column GROUP_ORDER_INFO.ORDER_DEPRECATED_FLAG
  is '���ڡ�ɾ����ǡ���������״̬�¸�ֵΪ�ա��������ϡ����ڡ���ͣ��δ��ʼ״̬ʱ���������һ����ǣ������������������Ƶ�ַ����(��Ҫ�������ݿ�����)';
comment on column GROUP_ORDER_INFO.PRODUCT_NAME
  is '�����Ʒ����';
comment on column GROUP_ORDER_INFO.CUSTOMER_ID
  is '�ͻ���š��ɿͻ�����ά��';
comment on column GROUP_ORDER_INFO.NOTIFY_STATUS
  is '���͸�֪���ŵ�״̬��0��δ���͡�1���ѷ���';
comment on column GROUP_ORDER_INFO.USER_NAME
  is '������ǰ��¼�ͻ�����';
comment on column GROUP_ORDER_INFO.PRORITY
  is '�������ȼ�ԽСԽ����';
alter table GROUP_ORDER_INFO
  add constraint PK_GROUP_ORDER_INFO primary key (ORDER_ID);

prompt
prompt Creating table LOGIN_SMS_VERCODE
prompt ================================
prompt
create table LOGIN_SMS_VERCODE
(
  VERCODE_ID   VARCHAR2(200) not null,
  VERCODE      VARCHAR2(100) not null,
  MOBILE_TO    VARCHAR2(20) not null,
  USER_ID      VARCHAR2(200) not null,
  SEND_MSG     VARCHAR2(200),
  SEND_TIME    DATE default sysdate,
  REMARK       VARCHAR2(200),
  VERCODE_TYPE NUMBER(10) not null,
  STATUS       NUMBER(10)
)
;
comment on column LOGIN_SMS_VERCODE.VERCODE
  is '6λ������֤��';
comment on column LOGIN_SMS_VERCODE.MOBILE_TO
  is '������֤����ֻ���';
comment on column LOGIN_SMS_VERCODE.USER_ID
  is '�����ֻ���֤����û�ID';
comment on column LOGIN_SMS_VERCODE.VERCODE_TYPE
  is '��֤������  0�һ�����  1�ֻ���֤���¼';
comment on column LOGIN_SMS_VERCODE.STATUS
  is '�Ƿ���Ч״̬   0��Ч  1��Ч';
alter table LOGIN_SMS_VERCODE
  add primary key (VERCODE_ID);

prompt
prompt Creating table LOGON_TABLE
prompt ==========================
prompt
create table LOGON_TABLE
(
  LOGON_USER  VARCHAR2(128),
  CREATE_TIME DATE
)
;
comment on table LOGON_TABLE
  is '��¼��¼���ݿ���û��͵�¼ʱ��';
comment on column LOGON_TABLE.LOGON_USER
  is '��¼���ݿ���û�';
comment on column LOGON_TABLE.CREATE_TIME
  is '��¼��ʱ��';

prompt
prompt Creating table MMS_CHANNEL_ANALYZE
prompt ==================================
prompt
create table MMS_CHANNEL_ANALYZE
(
  CHANNEL_ID    NUMBER(5),
  ORG_ID        VARCHAR2(200),
  STAT_TIME     NUMBER(10),
  STATUS        NUMBER(5),
  QUANTITY      NUMBER(10),
  PARENT_ORG_ID VARCHAR2(200)
)
;

prompt
prompt Creating table MMS_CHANNEL_INFO
prompt ===============================
prompt
create table MMS_CHANNEL_INFO
(
  CHANNEL_ID     NUMBER(10) not null,
  CHANNEL_NAME   VARCHAR2(500),
  CHANNEL_STATUS NUMBER(10),
  CHANNEL_REMARK VARCHAR2(2000),
  SORT_ID        NUMBER(10),
  CHANNEL_STATE  NUMBER(2),
  COM_TYPE       NUMBER(1),
  SP_NO_YD       VARCHAR2(50),
  SP_NO_LT       VARCHAR2(50),
  SP_NO_DX       VARCHAR2(50)
)
;
comment on table MMS_CHANNEL_INFO
  is '����ͨ����';
comment on column MMS_CHANNEL_INFO.CHANNEL_ID
  is 'ͨ��ID';
comment on column MMS_CHANNEL_INFO.CHANNEL_NAME
  is 'ͨ������';
comment on column MMS_CHANNEL_INFO.CHANNEL_STATUS
  is 'ͨ��״̬��0����,1,ֹͣ,2δ����';
comment on column MMS_CHANNEL_INFO.CHANNEL_REMARK
  is '��ע';
comment on column MMS_CHANNEL_INFO.SORT_ID
  is 'ͨ������id';
comment on column MMS_CHANNEL_INFO.CHANNEL_STATE
  is 'ͨ������״̬(���ֶ���Ч)';
comment on column MMS_CHANNEL_INFO.COM_TYPE
  is '֧�ֺŶ����ͣ�1-ֻ�ƶ�,2-ֻ��ͨ,3-����  0-ȫ֧��';
comment on column MMS_CHANNEL_INFO.SP_NO_YD
  is '�ƶ��ط���';
comment on column MMS_CHANNEL_INFO.SP_NO_LT
  is '��ͨ�ط���';
comment on column MMS_CHANNEL_INFO.SP_NO_DX
  is '�����ط���';
alter table MMS_CHANNEL_INFO
  add constraint PK_MMS_CHANNEL_INFO primary key (CHANNEL_ID);

prompt
prompt Creating table MMS_CHANNEL_RULE_SET
prompt ===================================
prompt
create table MMS_CHANNEL_RULE_SET
(
  RULE_SET_ID       VARCHAR2(20) not null,
  RULE_SET_NAME     VARCHAR2(200),
  RULE_SET_TYPE     VARCHAR2(20),
  DC_FILE_PATH      VARCHAR2(200),
  RULE_STATUS       VARCHAR2(20),
  USER_ORGANIZATION VARCHAR2(20),
  USER_ORG_NAME     VARCHAR2(20),
  USER_ID           VARCHAR2(20),
  USER_NAME         VARCHAR2(20),
  DESCRIPTIONS      VARCHAR2(200)
)
;
comment on table MMS_CHANNEL_RULE_SET
  is '����ͨ�������';
comment on column MMS_CHANNEL_RULE_SET.RULE_SET_ID
  is '������';
comment on column MMS_CHANNEL_RULE_SET.RULE_SET_NAME
  is '��������';
comment on column MMS_CHANNEL_RULE_SET.RULE_SET_TYPE
  is '��������, ITEMS:�ֹ�����Ĺ���, DECISIONTABLE:���߱�';
comment on column MMS_CHANNEL_RULE_SET.DC_FILE_PATH
  is '���߱���·��';
comment on column MMS_CHANNEL_RULE_SET.RULE_STATUS
  is '״̬, -1:�ݸ�״̬, 0:��ѡ, 1:��Ч';
comment on column MMS_CHANNEL_RULE_SET.USER_ORGANIZATION
  is '�������';
comment on column MMS_CHANNEL_RULE_SET.USER_ORG_NAME
  is '��������';
comment on column MMS_CHANNEL_RULE_SET.USER_ID
  is '�û����';
comment on column MMS_CHANNEL_RULE_SET.USER_NAME
  is '�û�����';
comment on column MMS_CHANNEL_RULE_SET.DESCRIPTIONS
  is '��ע';
alter table MMS_CHANNEL_RULE_SET
  add constraint PK_MMS_CHANNEL_RULE_SET primary key (RULE_SET_ID);

prompt
prompt Creating table MMS_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create table MMS_CHANNEL_RULE_SET_ITEM
(
  RULE_SET_ID               VARCHAR2(20),
  RULE_SET_ITEM_ID          VARCHAR2(200) not null,
  RULE_SET_ITEM_NAME        VARCHAR2(200),
  SALIENCE                  NUMBER(7),
  MESSAGE_TYPE              VARCHAR2(4000),
  ORG_ID                    VARCHAR2(4000),
  USER_ID                   VARCHAR2(4000),
  MOBILE_COM                NUMBER(4),
  NUM_SCOPE                 VARCHAR2(2000),
  NUM_REGION                VARCHAR2(2000),
  MOBILE                    CLOB,
  CHANNEL_ID                VARCHAR2(200),
  MSG_TYPE                  VARCHAR2(40),
  DAY_START_TIME            DATE,
  DAY_END_TIME              DATE,
  NIGHT_START_TIME          DATE,
  NIGHT_END_TIME            DATE,
  DEFAULT_CHANNEL_ID        NUMBER(4),
  DEFAULT_MOBILE_CHANNEL_ID NUMBER(4),
  DEFAULT_UNION_CHANNEL_ID  NUMBER(4),
  DEFAULT_DX_CHANNEL_ID     NUMBER(4),
  USE_CHANNEL_ID            NUMBER(4),
  USE_STATUS                NUMBER(4)
)
;
comment on table MMS_CHANNEL_RULE_SET_ITEM
  is '����ͨ���������ϸ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ID
  is '������';
comment on column MMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_ID
  is '������ϸ���';
comment on column MMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_NAME
  is '������ϸ����';
comment on column MMS_CHANNEL_RULE_SET_ITEM.SALIENCE
  is '���ȼ�';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MESSAGE_TYPE
  is '��Ϣ����, ���Զ�ѡ';
comment on column MMS_CHANNEL_RULE_SET_ITEM.ORG_ID
  is '�������, ���Զ�ѡ';
comment on column MMS_CHANNEL_RULE_SET_ITEM.USER_ID
  is '�û����, ���Զ�ѡ';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MOBILE_COM
  is '��Ӫ��, ���Զ�ѡ';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NUM_SCOPE
  is '�Ŷ�, ������д���, ��Ӣ�Ķ��ŷָ�';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NUM_REGION
  is '�ֻ���������, ������д���, ��Ӣ�Ķ��ŷ�';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MOBILE
  is '�ֻ�����, ������д���';
comment on column MMS_CHANNEL_RULE_SET_ITEM.CHANNEL_ID
  is '��ѡͨ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MSG_TYPE
  is '��Ϣ����';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DAY_START_TIME
  is '���쿪ʼʱ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DAY_END_TIME
  is '�������ʱ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NIGHT_START_TIME
  is 'ҹ�俪ʼʱ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NIGHT_END_TIME
  is 'ҹ�����ʱ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_CHANNEL_ID
  is 'ȱʡʹ�õ�ͨ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_MOBILE_CHANNEL_ID
  is 'ȱʡʹ�õ��ƶ�ͨ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_UNION_CHANNEL_ID
  is 'ȱʡʹ�õ���ͨͨ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_DX_CHANNEL_ID
  is 'ȱʡʹ�õĵ���ͨ��';
comment on column MMS_CHANNEL_RULE_SET_ITEM.USE_CHANNEL_ID
  is '����ʹ�õ�ͨ�����';
comment on column MMS_CHANNEL_RULE_SET_ITEM.USE_STATUS
  is '���ŵ�ȱʡ״̬';
alter table MMS_CHANNEL_RULE_SET_ITEM
  add constraint PK_MMS_CHANNEL_RULE_SET_ITEM primary key (RULE_SET_ITEM_ID);

prompt
prompt Creating table MMS_HIS
prompt ======================
prompt
create table MMS_HIS
(
  MMS_HIS_ID        VARCHAR2(200) not null,
  SEND_STATUS       NUMBER(2),
  USER_ORGANIZATION VARCHAR2(200),
  CHANNEL_ID        NUMBER(4),
  MOBILE_COM        NUMBER(2),
  SYS_ID            VARCHAR2(200),
  MESSAGE_TYPE      VARCHAR2(200),
  BATCH_ID          VARCHAR2(200),
  MOBILE_QUANTITIES NUMBER(4),
  SEND_TIME         DATE
)
;
comment on table MMS_HIS
  is '���Ź鵵��';
comment on column MMS_HIS.MMS_HIS_ID
  is 'id';
comment on column MMS_HIS.SEND_STATUS
  is '����״̬';
comment on column MMS_HIS.USER_ORGANIZATION
  is '����';
comment on column MMS_HIS.CHANNEL_ID
  is 'ͨ��';
comment on column MMS_HIS.MOBILE_COM
  is '��Ӫ��';
comment on column MMS_HIS.SYS_ID
  is '��Ϣ��Դ';
comment on column MMS_HIS.MESSAGE_TYPE
  is '��Ϣ����';
comment on column MMS_HIS.BATCH_ID
  is '���κ�';
comment on column MMS_HIS.MOBILE_QUANTITIES
  is '��������';
comment on column MMS_HIS.SEND_TIME
  is '����ʱ��';
alter table MMS_HIS
  add constraint PK_MMS_HIS primary key (MMS_HIS_ID);

prompt
prompt Creating table MMS_RECEIVE
prompt ==========================
prompt
create table MMS_RECEIVE
(
  RECEIVE_ID      VARCHAR2(200) not null,
  MOBILE_FROM     VARCHAR2(30),
  SUBJECT         VARCHAR2(40),
  RECEIVE_MSG     BLOB,
  RECEIVE_TIME    DATE,
  SP_NO           VARCHAR2(20),
  SP_SERV_NO      VARCHAR2(20),
  RECEIVE_STATUS  NUMBER(1),
  READ_TIME       DATE,
  CHANNEL_ID      NUMBER(2),
  ORGANIZATION_ID VARCHAR2(200)
)
;
comment on table MMS_RECEIVE
  is '����������Ϣ��';
comment on column MMS_RECEIVE.RECEIVE_ID
  is '���в��ű��';
comment on column MMS_RECEIVE.MOBILE_FROM
  is '�����ֻ���';
comment on column MMS_RECEIVE.SUBJECT
  is '���ű���';
comment on column MMS_RECEIVE.RECEIVE_MSG
  is '��������';
comment on column MMS_RECEIVE.RECEIVE_TIME
  is '����ʱ��';
comment on column MMS_RECEIVE.SP_NO
  is '�ط���';
comment on column MMS_RECEIVE.SP_SERV_NO
  is 'ҵ����';
comment on column MMS_RECEIVE.RECEIVE_STATUS
  is '����״̬';
comment on column MMS_RECEIVE.READ_TIME
  is '�Ķ�ʱ��';
comment on column MMS_RECEIVE.CHANNEL_ID
  is 'ͨ�����';
comment on column MMS_RECEIVE.ORGANIZATION_ID
  is '��������';
alter table MMS_RECEIVE
  add constraint PK_MMS_RECEIVE primary key (RECEIVE_ID);

prompt
prompt Creating table MMS_SCHED_MOBILE_TEMP
prompt ====================================
prompt
create table MMS_SCHED_MOBILE_TEMP
(
  SCHEDULE_ID VARCHAR2(200) not null,
  MOBILE      VARCHAR2(20) not null,
  IMPORT_TYPE VARCHAR2(200),
  BATCH_ID    VARCHAR2(200)
)
;
comment on table MMS_SCHED_MOBILE_TEMP
  is '���ŷ��͵����ֻ��ŵ���ʱ��';
comment on column MMS_SCHED_MOBILE_TEMP.SCHEDULE_ID
  is '���ŷ��ͼ�¼���';
comment on column MMS_SCHED_MOBILE_TEMP.MOBILE
  is '�ֻ�����';
comment on column MMS_SCHED_MOBILE_TEMP.IMPORT_TYPE
  is '���뷽ʽ';
comment on column MMS_SCHED_MOBILE_TEMP.BATCH_ID
  is '��������, ����ͳ�Ƶ�������';
alter table MMS_SCHED_MOBILE_TEMP
  add constraint PK_MMS_SCHED_MOBILE_TEMP primary key (SCHEDULE_ID, MOBILE);

prompt
prompt Creating table MMS_SEND
prompt =======================
prompt
create table MMS_SEND
(
  MMS_SEND_ID          NUMBER(32) not null,
  SUBJECT              VARCHAR2(100),
  MOBILE_TO            VARCHAR2(20),
  EXT_NUM              VARCHAR2(20),
  PRIOR_ID             NUMBER(1) default 8,
  SEND_STATUS          NUMBER(1),
  SYS_TIME             DATE default sysdate,
  SYS_DATE_ID          NUMBER(18),
  PRE_SEND_TIME        DATE,
  EVENT_LATEST_TIME    DATE,
  MORNING_EARLEST_TIME DATE,
  MORNING_LATEST_TIME  DATE,
  SEND_TIME            DATE default sysdate,
  SEND_DATE_ID         NUMBER(18),
  COM_RTN_TIME         DATE,
  ERR_MSG              VARCHAR2(100),
  FAIL_RESEND_TIMES    NUMBER(1) default 0,
  ERR_ID               VARCHAR2(20),
  REPORT_TIME          DATE,
  GW_SEND_TIME         DATE,
  GW_REPORT_TIME       DATE,
  CHANNEL_ID           NUMBER(4),
  MOBILE_QUANTITIES    NUMBER(4),
  RESEND_TIMES         NUMBER(1) default 0,
  ORG_NAME             VARCHAR2(40),
  ORG_ID               VARCHAR2(20),
  USER_ID              VARCHAR2(40),
  USER_NAME            VARCHAR2(40),
  BATCH_ID             VARCHAR2(40),
  GW_BATCH             VARCHAR2(40),
  SEQUENCE             VARCHAR2(40),
  SEND_TYPE            NUMBER(4),
  MOBILE_COM           NUMBER(2),
  MESSAGE_TYPE         VARCHAR2(20),
  SYS_ID               VARCHAR2(10),
  MSG_ID               VARCHAR2(80),
  SENDER_ID            VARCHAR2(100),
  REMARK               VARCHAR2(500)
)
;
comment on table MMS_SEND
  is '���в�����Ϣ��';
comment on column MMS_SEND.MMS_SEND_ID
  is '���ű��';
comment on column MMS_SEND.SUBJECT
  is '���ű���';
comment on column MMS_SEND.MOBILE_TO
  is '�ֻ���';
comment on column MMS_SEND.EXT_NUM
  is '��չ����';
comment on column MMS_SEND.PRIOR_ID
  is '���ȼ�';
comment on column MMS_SEND.SEND_STATUS
  is '����״̬, -2:������, 0,δ����, 1:���ύ, 2:������, 5:���ͳɹ�, 6:����ʧ��, 7:ϵͳ������';
comment on column MMS_SEND.SYS_TIME
  is '���ʱ��';
comment on column MMS_SEND.SYS_DATE_ID
  is '�����������';
comment on column MMS_SEND.PRE_SEND_TIME
  is 'Ԥ�Ʒ���ʱ��';
comment on column MMS_SEND.EVENT_LATEST_TIME
  is '���������ʱ��';
comment on column MMS_SEND.MORNING_EARLEST_TIME
  is '�糿���緢��ʱ��';
comment on column MMS_SEND.MORNING_LATEST_TIME
  is '�糿������ʱ��';
comment on column MMS_SEND.SEND_TIME
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column MMS_SEND.SEND_DATE_ID
  is 'ƽ̨���Ͳ��ŵ�����';
comment on column MMS_SEND.COM_RTN_TIME
  is '���ͺ��ƶ�����ͨ���ط��ؽ����ʱ��';
comment on column MMS_SEND.ERR_MSG
  is '����ʧ��ʱ����Ӫ�����ط��صĴ�����Ϣ��ֻ���ڷ���ʧ��ʱ�����ֶ���ֵ������ʱ��δ��';
comment on column MMS_SEND.FAIL_RESEND_TIMES
  is '����ʧ�ܴ���';
comment on column MMS_SEND.ERR_ID
  is '������룬������Ϣƽ̨�������Ͳ������ش������';
comment on column MMS_SEND.REPORT_TIME
  is '�ֻ�����״̬���淵��ʱ��';
comment on column MMS_SEND.GW_SEND_TIME
  is '���ط��Ͳ���ʱ��';
comment on column MMS_SEND.GW_REPORT_TIME
  is '���ؽ���״̬����ʱ��';
comment on column MMS_SEND.CHANNEL_ID
  is 'ͨ�����';
comment on column MMS_SEND.MOBILE_QUANTITIES
  is '������Ϣ���ֻ�����';
comment on column MMS_SEND.RESEND_TIMES
  is '�ط�����';
comment on column MMS_SEND.ORG_NAME
  is '��������';
comment on column MMS_SEND.ORG_ID
  is '�������';
comment on column MMS_SEND.USER_ID
  is '�û����';
comment on column MMS_SEND.USER_NAME
  is '�û�����';
comment on column MMS_SEND.BATCH_ID
  is '��������';
comment on column MMS_SEND.GW_BATCH
  is '�������ط��ص�����';
comment on column MMS_SEND.SEQUENCE
  is '�������ط��صĲ��ű��';
comment on column MMS_SEND.SEND_TYPE
  is '��������';
comment on column MMS_SEND.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ,3:����,0:�������';
comment on column MMS_SEND.MESSAGE_TYPE
  is '��Ϣ����';
comment on column MMS_SEND.SYS_ID
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column MMS_SEND.MSG_ID
  is '���ɲ��ŵ�ҵ��ϵͳ�Ĳ��ű��';
comment on column MMS_SEND.SENDER_ID
  is '�ӿ��û����';
comment on column MMS_SEND.REMARK
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
alter table MMS_SEND
  add constraint PK_MMS_SEND primary key (MMS_SEND_ID);
create index IDX_MMSSEND_SEND_TIME on MMS_SEND (SEND_TIME);

prompt
prompt Creating table MMS_SEND_ANALYZE
prompt ===============================
prompt
create table MMS_SEND_ANALYZE
(
  ORG_ID        VARCHAR2(200),
  USER_ID       VARCHAR2(200),
  STAT_TIME     NUMBER(10),
  STATUS        NUMBER(5),
  QUANTITY      NUMBER(10),
  PARENT_ORG_ID VARCHAR2(200)
)
;

prompt
prompt Creating table MMS_SEND_CONTENT
prompt ===============================
prompt
create table MMS_SEND_CONTENT
(
  BATCH_ID          VARCHAR2(200) not null,
  SUBJECT           VARCHAR2(200),
  SYS_TIME          DATE,
  SEND_MSG          CLOB,
  USER_ORGANIZATION VARCHAR2(200),
  USER_ORG_NAME     VARCHAR2(200),
  USER_ID           VARCHAR2(200),
  USER_NAME         VARCHAR2(200),
  SENDER_ID         VARCHAR2(200),
  GW_MMS_ID         VARCHAR2(200),
  GW_MMS_ID1        VARCHAR2(200),
  GW_MMS_ID2        VARCHAR2(200),
  GW_MMS_ID3        VARCHAR2(200),
  GW_MMS_ID4        VARCHAR2(200),
  GW_MMS_ID5        VARCHAR2(200),
  GW_MMS_ID6        VARCHAR2(200),
  GW_MMS_ID7        VARCHAR2(200),
  GW_MMS_ID8        VARCHAR2(200),
  GW_MMS_ID9        VARCHAR2(200)
)
;
comment on table MMS_SEND_CONTENT
  is '���ŷ������ݱ�';
comment on column MMS_SEND_CONTENT.BATCH_ID
  is '����';
comment on column MMS_SEND_CONTENT.SUBJECT
  is '���ű���';
comment on column MMS_SEND_CONTENT.SYS_TIME
  is '���ʱ��';
comment on column MMS_SEND_CONTENT.SEND_MSG
  is '��������';
comment on column MMS_SEND_CONTENT.USER_ORGANIZATION
  is '�������';
comment on column MMS_SEND_CONTENT.USER_ORG_NAME
  is '��������';
comment on column MMS_SEND_CONTENT.USER_ID
  is '�û����';
comment on column MMS_SEND_CONTENT.USER_NAME
  is '�û�����';
comment on column MMS_SEND_CONTENT.SENDER_ID
  is '�ӿ��û����';
comment on column MMS_SEND_CONTENT.GW_MMS_ID
  is '���ط��صĲ��ű��';
comment on column MMS_SEND_CONTENT.GW_MMS_ID1
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID2
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID3
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID4
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID5
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID6
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID7
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID8
  is '���ط��صĲ��ű��(�����ֶ�)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID9
  is '���ط��صĲ��ű��(�����ֶ�)';
alter table MMS_SEND_CONTENT
  add constraint PK_MMS_SEND_CONTENT primary key (BATCH_ID);

prompt
prompt Creating table MMS_SEND_HIS
prompt ===========================
prompt
create table MMS_SEND_HIS
(
  MMS_SEND_ID          NUMBER(32) not null,
  SUBJECT              VARCHAR2(100),
  MOBILE_TO            VARCHAR2(20),
  EXT_NUM              VARCHAR2(20),
  PRIOR_ID             NUMBER(1) default 8,
  SEND_STATUS          NUMBER(1),
  SYS_TIME             DATE default sysdate,
  SYS_DATE_ID          NUMBER(18),
  PRE_SEND_TIME        DATE,
  EVENT_LATEST_TIME    DATE,
  MORNING_EARLEST_TIME DATE,
  MORNING_LATEST_TIME  DATE,
  SEND_TIME            DATE default sysdate,
  SEND_DATE_ID         NUMBER(18),
  COM_RTN_TIME         DATE,
  ERR_MSG              VARCHAR2(100),
  FAIL_RESEND_TIMES    NUMBER(1) default 0,
  ERR_ID               VARCHAR2(20),
  REPORT_TIME          DATE,
  GW_SEND_TIME         DATE,
  GW_REPORT_TIME       DATE,
  CHANNEL_ID           NUMBER(4),
  MOBILE_QUANTITIES    NUMBER(4),
  RESEND_TIMES         NUMBER(1) default 0,
  ORG_NAME             VARCHAR2(40),
  ORG_ID               VARCHAR2(20),
  USER_ID              VARCHAR2(40),
  USER_NAME            VARCHAR2(40),
  BATCH_ID             VARCHAR2(40),
  GW_BATCH             VARCHAR2(40),
  SEQUENCE             VARCHAR2(40),
  SEND_TYPE            NUMBER(4),
  MOBILE_COM           NUMBER(2),
  MESSAGE_TYPE         VARCHAR2(20),
  SYS_ID               VARCHAR2(10),
  MSG_ID               VARCHAR2(80),
  SENDER_ID            VARCHAR2(100),
  REMARK               VARCHAR2(500)
)
;
comment on table MMS_SEND_HIS
  is '���в�����Ϣ��';
comment on column MMS_SEND_HIS.MMS_SEND_ID
  is '���ű��';
comment on column MMS_SEND_HIS.SUBJECT
  is '���ű���';
comment on column MMS_SEND_HIS.MOBILE_TO
  is '�ֻ���';
comment on column MMS_SEND_HIS.EXT_NUM
  is '��չ����';
comment on column MMS_SEND_HIS.PRIOR_ID
  is '���ȼ�';
comment on column MMS_SEND_HIS.SEND_STATUS
  is '����״̬, -2:������, 0,δ����, 1:���ύ, 2:������, 5:���ͳɹ�, 6:����ʧ��, 7:ϵͳ������';
comment on column MMS_SEND_HIS.SYS_TIME
  is '���ʱ��';
comment on column MMS_SEND_HIS.SYS_DATE_ID
  is '�����������';
comment on column MMS_SEND_HIS.PRE_SEND_TIME
  is 'Ԥ�Ʒ���ʱ��';
comment on column MMS_SEND_HIS.EVENT_LATEST_TIME
  is '���������ʱ��';
comment on column MMS_SEND_HIS.MORNING_EARLEST_TIME
  is '�糿���緢��ʱ��';
comment on column MMS_SEND_HIS.MORNING_LATEST_TIME
  is '�糿������ʱ��';
comment on column MMS_SEND_HIS.SEND_TIME
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column MMS_SEND_HIS.SEND_DATE_ID
  is 'ƽ̨���Ͳ��ŵ�����';
comment on column MMS_SEND_HIS.COM_RTN_TIME
  is '���ͺ��ƶ�����ͨ���ط��ؽ����ʱ��';
comment on column MMS_SEND_HIS.ERR_MSG
  is '����ʧ��ʱ����Ӫ�����ط��صĴ�����Ϣ��ֻ���ڷ���ʧ��ʱ�����ֶ���ֵ������ʱ��δ��';
comment on column MMS_SEND_HIS.FAIL_RESEND_TIMES
  is '����ʧ�ܴ���';
comment on column MMS_SEND_HIS.ERR_ID
  is '������룬������Ϣƽ̨�������Ͳ������ش������';
comment on column MMS_SEND_HIS.REPORT_TIME
  is '�ֻ�����״̬���淵��ʱ��';
comment on column MMS_SEND_HIS.GW_SEND_TIME
  is '���ط��Ͳ���ʱ��';
comment on column MMS_SEND_HIS.GW_REPORT_TIME
  is '���ؽ���״̬����ʱ��';
comment on column MMS_SEND_HIS.CHANNEL_ID
  is 'ͨ�����';
comment on column MMS_SEND_HIS.MOBILE_QUANTITIES
  is '������Ϣ���ֻ�����';
comment on column MMS_SEND_HIS.RESEND_TIMES
  is '�ط�����';
comment on column MMS_SEND_HIS.ORG_NAME
  is '��������';
comment on column MMS_SEND_HIS.ORG_ID
  is '�������';
comment on column MMS_SEND_HIS.USER_ID
  is '�û����';
comment on column MMS_SEND_HIS.USER_NAME
  is '�û�����';
comment on column MMS_SEND_HIS.BATCH_ID
  is '��������';
comment on column MMS_SEND_HIS.GW_BATCH
  is '�������ط��ص�����';
comment on column MMS_SEND_HIS.SEQUENCE
  is '�������ط��صĲ��ű��';
comment on column MMS_SEND_HIS.SEND_TYPE
  is '��������';
comment on column MMS_SEND_HIS.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ,3:����,0:�������';
comment on column MMS_SEND_HIS.MESSAGE_TYPE
  is '��Ϣ����';
comment on column MMS_SEND_HIS.SYS_ID
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column MMS_SEND_HIS.MSG_ID
  is '���ɲ��ŵ�ҵ��ϵͳ�Ĳ��ű��';
comment on column MMS_SEND_HIS.SENDER_ID
  is '�ӿ��û����';
comment on column MMS_SEND_HIS.REMARK
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
alter table MMS_SEND_HIS
  add constraint PK_MMS_SEND_HIS primary key (MMS_SEND_ID);
create index IDX_MMSSENDHIS_SEND_TIME on MMS_SEND_HIS (SEND_TIME);

prompt
prompt Creating table MMS_SEND_SCHEDULE
prompt ================================
prompt
create table MMS_SEND_SCHEDULE
(
  MMS_SEND_SCHEDULE_ID VARCHAR2(200) not null,
  MMS_TEMPLATE_ID      VARCHAR2(200),
  SUBJECT              VARCHAR2(200),
  MOBILE_TO            CLOB,
  GROUPS               CLOB,
  GROUPS_NAME          CLOB,
  DATA_FILE            BLOB,
  DATA_FILE_TYPE       VARCHAR2(20),
  SEND_MSG             CLOB,
  PRIOR_ID             NUMBER(1),
  SEND_STATUS          NUMBER(1),
  SYS_TIME             DATE,
  PRE_SEND_TIME        DATE,
  CHANNEL_ID           NUMBER(4),
  MOBILE_QUANTITIES    NUMBER(7),
  TEMP_TEMP            BLOB,
  TEMP_MSG             BLOB,
  PARAM_MAP            BLOB,
  MOBILE_LIST_ID       VARCHAR2(200),
  USER_ORGANIZATION    VARCHAR2(200),
  USER_ORG_NAME        VARCHAR2(200),
  USER_ID              VARCHAR2(200),
  USER_NAME            VARCHAR2(200)
)
;
comment on table MMS_SEND_SCHEDULE
  is '���ŷ��ͼ�¼��';
comment on column MMS_SEND_SCHEDULE.MMS_SEND_SCHEDULE_ID
  is '���';
comment on column MMS_SEND_SCHEDULE.MMS_TEMPLATE_ID
  is 'ģ����';
comment on column MMS_SEND_SCHEDULE.SUBJECT
  is '���ű���';
comment on column MMS_SEND_SCHEDULE.MOBILE_TO
  is '�ֻ���,�Զ��ŷָ�';
comment on column MMS_SEND_SCHEDULE.GROUPS
  is '�ͻ�Ⱥ��, ��Ӣ�ķֺŷָ�';
comment on column MMS_SEND_SCHEDULE.GROUPS_NAME
  is '�ͻ�������, ��Ӣ�ķֺŷָ�';
comment on column MMS_SEND_SCHEDULE.DATA_FILE
  is '�ֻ������ļ�';
comment on column MMS_SEND_SCHEDULE.DATA_FILE_TYPE
  is '�����ļ�����';
comment on column MMS_SEND_SCHEDULE.SEND_MSG
  is '��������';
comment on column MMS_SEND_SCHEDULE.PRIOR_ID
  is '���ȼ�';
comment on column MMS_SEND_SCHEDULE.SEND_STATUS
  is '����״̬, -2:������, 0:������, 1:�ѷ���, 2:������, 5:���ͳɹ�, 6:����ʧ��, 7:������';
comment on column MMS_SEND_SCHEDULE.SYS_TIME
  is '���ʱ��';
comment on column MMS_SEND_SCHEDULE.PRE_SEND_TIME
  is 'Ԥ������ʱ��';
comment on column MMS_SEND_SCHEDULE.CHANNEL_ID
  is 'ͨ�����';
comment on column MMS_SEND_SCHEDULE.MOBILE_QUANTITIES
  is '������Ϣ���ֻ�����';
comment on column MMS_SEND_SCHEDULE.TEMP_TEMP
  is '����ģ������';
comment on column MMS_SEND_SCHEDULE.TEMP_MSG
  is '�����������';
comment on column MMS_SEND_SCHEDULE.PARAM_MAP
  is '�ύ��Ϣʱ��Ĳ���';
comment on column MMS_SEND_SCHEDULE.MOBILE_LIST_ID
  is '�����ֻ�����Ķ���';
comment on column MMS_SEND_SCHEDULE.USER_ORGANIZATION
  is '�������';
comment on column MMS_SEND_SCHEDULE.USER_ORG_NAME
  is '��������';
comment on column MMS_SEND_SCHEDULE.USER_ID
  is '�û����';
comment on column MMS_SEND_SCHEDULE.USER_NAME
  is '�û�����';
alter table MMS_SEND_SCHEDULE
  add constraint PK_MMS_SEND_SCHEDULE primary key (MMS_SEND_SCHEDULE_ID);

prompt
prompt Creating table MMS_STOCK_PAPER
prompt ==============================
prompt
create table MMS_STOCK_PAPER
(
  MMS_STOCK_PAPER_ID  NUMBER(18) not null,
  PRODUCT_ID          VARCHAR2(50),
  STATUS              NUMBER(18),
  USER_ID             VARCHAR2(50),
  USER_NAME           VARCHAR2(50),
  ORGANIZATION_ID     VARCHAR2(50),
  ORGANIZATION_NAME   VARCHAR2(50),
  CREATE_TIME         DATE,
  AUDIT_TIME          DATE,
  SEND_TIME           DATE,
  TITLE               VARCHAR2(50),
  SEND_MSG            CLOB,
  MMS_CONTENT         CLOB,
  SUBSCRIBE_NUMBER    NUMBER(18),
  EDIT_HEADTAIL_FRAME VARCHAR2(50)
)
;
alter table MMS_STOCK_PAPER
  add constraint PK_MMS_STOCK_PAPER primary key (MMS_STOCK_PAPER_ID);

prompt
prompt Creating table MMS_TEMPLATE
prompt ===========================
prompt
create table MMS_TEMPLATE
(
  MMS_TEMPLATE_ID   VARCHAR2(200) not null,
  SUBJECT           VARCHAR2(200),
  FRAME_SIZE        NUMBER(19),
  CONTENT_SIZE      NUMBER(19),
  DURATION          NUMBER(19),
  USER_ORGANIZATION VARCHAR2(200),
  USER_ORG_NAME     VARCHAR2(200),
  USER_ID           VARCHAR2(200),
  USER_NAME         VARCHAR2(200),
  IS_DEFAULT        VARCHAR2(10)
)
;
comment on table MMS_TEMPLATE
  is '����ģ��';
comment on column MMS_TEMPLATE.MMS_TEMPLATE_ID
  is 'ģ����';
comment on column MMS_TEMPLATE.SUBJECT
  is '���ű���';
comment on column MMS_TEMPLATE.FRAME_SIZE
  is '֡��';
comment on column MMS_TEMPLATE.CONTENT_SIZE
  is '���Ŵ�С';
comment on column MMS_TEMPLATE.DURATION
  is '����ʱ��, ��λ:��';
comment on column MMS_TEMPLATE.USER_ORGANIZATION
  is '�������';
comment on column MMS_TEMPLATE.USER_ORG_NAME
  is '��������';
comment on column MMS_TEMPLATE.USER_ID
  is '�û����';
comment on column MMS_TEMPLATE.USER_NAME
  is '�û�����';
comment on column MMS_TEMPLATE.IS_DEFAULT
  is '�Ƿ���ȱʡģ��';
alter table MMS_TEMPLATE
  add constraint PK_MMS_TEMPLATE primary key (MMS_TEMPLATE_ID);

prompt
prompt Creating table MMS_TMPL_FRAME
prompt =============================
prompt
create table MMS_TMPL_FRAME
(
  MMS_TMPL_FRAME_ID VARCHAR2(200) not null,
  MMS_TEMPLATE_ID   VARCHAR2(200),
  SEQUENCE_ID       VARCHAR2(20),
  DURATION          NUMBER(19),
  FRAME_SIZE        NUMBER(19),
  PICTURE_NAME      VARCHAR2(200),
  PICTURE_TYPE      VARCHAR2(8),
  PICTURE_SIZE      NUMBER(19),
  PICTURE_FILE      BLOB,
  AUDIO_NAME        VARCHAR2(200),
  AUDIO_TYPE        VARCHAR2(8),
  AUDIO_SIZE        NUMBER(19),
  AUDIO_FILE        BLOB,
  MESSAGE_CONTENT   VARCHAR2(4000),
  MESSAGE_SIZE      NUMBER(19),
  MESSAGE_LOCATION  VARCHAR2(8)
)
;
comment on table MMS_TMPL_FRAME
  is '����ģ���е�֡';
comment on column MMS_TMPL_FRAME.MMS_TMPL_FRAME_ID
  is '֡���';
comment on column MMS_TMPL_FRAME.MMS_TEMPLATE_ID
  is 'ģ����';
comment on column MMS_TMPL_FRAME.SEQUENCE_ID
  is '˳���';
comment on column MMS_TMPL_FRAME.DURATION
  is '����ʱ��, ��λ:��';
comment on column MMS_TMPL_FRAME.FRAME_SIZE
  is '֡�Ĵ�С';
comment on column MMS_TMPL_FRAME.PICTURE_NAME
  is 'ͼƬ����';
comment on column MMS_TMPL_FRAME.PICTURE_TYPE
  is 'ͼƬ����';
comment on column MMS_TMPL_FRAME.PICTURE_SIZE
  is 'ͼƬ��С';
comment on column MMS_TMPL_FRAME.PICTURE_FILE
  is 'ͼƬ�ļ�';
comment on column MMS_TMPL_FRAME.AUDIO_NAME
  is '��������';
comment on column MMS_TMPL_FRAME.AUDIO_TYPE
  is '��������';
comment on column MMS_TMPL_FRAME.AUDIO_SIZE
  is '���ִ�С';
comment on column MMS_TMPL_FRAME.AUDIO_FILE
  is '�����ļ�';
comment on column MMS_TMPL_FRAME.MESSAGE_CONTENT
  is '��������';
comment on column MMS_TMPL_FRAME.MESSAGE_SIZE
  is '���ִ�С';
comment on column MMS_TMPL_FRAME.MESSAGE_LOCATION
  is '����λ��, TOP:�Ϸ�, BOTTOM:�·�';
alter table MMS_TMPL_FRAME
  add constraint PK_MMS_TMPL_FRAME primary key (MMS_TMPL_FRAME_ID);
alter table MMS_TMPL_FRAME
  add constraint FK_MMS_TMPL_FRAME foreign key (MMS_TEMPLATE_ID)
  references MMS_TEMPLATE (MMS_TEMPLATE_ID);

prompt
prompt Creating table MOBILENUM_REGION
prompt ===============================
prompt
create table MOBILENUM_REGION
(
  NUMSCOPE   VARCHAR2(20) not null,
  PROVINCE   VARCHAR2(60),
  CITY       VARCHAR2(50),
  CARD_TYPE  VARCHAR2(200),
  REGION_NUM VARCHAR2(2000)
)
;
comment on table MOBILENUM_REGION
  is '�ֻ��Ŷι����ر�';
comment on column MOBILENUM_REGION.NUMSCOPE
  is '�ֻ��Ŷ�';
comment on column MOBILENUM_REGION.PROVINCE
  is '�ֻ��Ŷ�����ʡ';
comment on column MOBILENUM_REGION.CITY
  is '�ֻ��Ŷ���������';
comment on column MOBILENUM_REGION.CARD_TYPE
  is '�ֻ�������';
comment on column MOBILENUM_REGION.REGION_NUM
  is '��������';
alter table MOBILENUM_REGION
  add constraint PK_MOBILENUM_REGION primary key (NUMSCOPE);

prompt
prompt Creating table MOBILE_COM
prompt =========================
prompt
create table MOBILE_COM
(
  NUMSCOPE   VARCHAR2(50) not null,
  MOBILE_COM NUMBER(4)
)
;
comment on table MOBILE_COM
  is '�ֻ��Ŷ�������Ӫ�̱�������ֵ��';
comment on column MOBILE_COM.NUMSCOPE
  is '�ֻ��Ŷ�';
comment on column MOBILE_COM.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
alter table MOBILE_COM
  add constraint PK_MOBILE_COM primary key (NUMSCOPE);

prompt
prompt Creating table MOBILE_EXCEL_INFO
prompt ================================
prompt
create table MOBILE_EXCEL_INFO
(
  EXCEL_ID   VARCHAR2(200) not null,
  EXCEL_NAME VARCHAR2(200),
  MOBILE     VARCHAR2(2000) not null
)
;
comment on table MOBILE_EXCEL_INFO
  is '�ֻ��ŵ������ʱ��';
comment on column MOBILE_EXCEL_INFO.EXCEL_ID
  is 'Excel���';
comment on column MOBILE_EXCEL_INFO.EXCEL_NAME
  is 'Excel����';
comment on column MOBILE_EXCEL_INFO.MOBILE
  is '�ֻ���';
alter table MOBILE_EXCEL_INFO
  add primary key (EXCEL_ID);
create unique index PK_MOBILE_EXCEL_INFO on MOBILE_EXCEL_INFO (EXCEL_ID, MOBILE);

prompt
prompt Creating table MOBILE_INVALID
prompt =============================
prompt
create table MOBILE_INVALID
(
  MOBILE_ID     VARCHAR2(50) not null,
  MOBILE        VARCHAR2(50),
  MOBILE_TYPE   VARCHAR2(50),
  MOBILE_REMARK VARCHAR2(50),
  CREATE_TIME   DATE
)
;
comment on table MOBILE_INVALID
  is '��Ч�ֻ�����';
comment on column MOBILE_INVALID.MOBILE_ID
  is '��Ч�ֻ��ű������';
comment on column MOBILE_INVALID.MOBILE
  is '��Ч�ֻ���';
comment on column MOBILE_INVALID.MOBILE_TYPE
  is '����, 1:����, 2:����';
comment on column MOBILE_INVALID.MOBILE_REMARK
  is '��Ч�ֻ��ŵ�ע��';
comment on column MOBILE_INVALID.CREATE_TIME
  is '�����Ч�ֻ���ʱ��ʱ��';
alter table MOBILE_INVALID
  add constraint PK_MOBILE_INVALID primary key (MOBILE_ID);

prompt
prompt Creating table MOBILE_TEMP
prompt ==========================
prompt
create table MOBILE_TEMP
(
  MOBILE VARCHAR2(2000) not null,
  TYPE   VARCHAR2(2000)
)
;
comment on table MOBILE_TEMP
  is '�ֻ�������ʱ��ű�';
comment on column MOBILE_TEMP.MOBILE
  is '�ֻ���';
comment on column MOBILE_TEMP.TYPE
  is '����';
alter table MOBILE_TEMP
  add constraint PK_MOBILE_TEMP primary key (MOBILE);

prompt
prompt Creating table MOBILE_TO_OPERATORS
prompt ==================================
prompt
create table MOBILE_TO_OPERATORS
(
  MOBILE     VARCHAR2(20) not null,
  MOBILE_COM NUMBER(2)
)
;
comment on table MOBILE_TO_OPERATORS
  is 'ά������ת�������';
comment on column MOBILE_TO_OPERATORS.MOBILE
  is '�ֻ���';
comment on column MOBILE_TO_OPERATORS.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�,2:��ͨ, 3:����';
alter table MOBILE_TO_OPERATORS
  add constraint PK_MOBILE_TO_OPERATORS primary key (MOBILE);

prompt
prompt Creating table MOBILE_VERCODE
prompt =============================
prompt
create table MOBILE_VERCODE
(
  MOBILE_VERCODE_ID VARCHAR2(200) not null,
  CODE              VARCHAR2(200) not null,
  LAST_SEND_TIME    DATE,
  USER_NAME         VARCHAR2(200),
  MOBILE_TO         VARCHAR2(20)
)
;
comment on table MOBILE_VERCODE
  is '�ֻ���½��֤��';
comment on column MOBILE_VERCODE.MOBILE_VERCODE_ID
  is '����';
comment on column MOBILE_VERCODE.CODE
  is '��֤��';
comment on column MOBILE_VERCODE.LAST_SEND_TIME
  is '���һ�εķ���ʱ��';
comment on column MOBILE_VERCODE.USER_NAME
  is '�յ����ŵ��û�����';
comment on column MOBILE_VERCODE.MOBILE_TO
  is 'Ŀ���ֻ���';
alter table MOBILE_VERCODE
  add constraint MOBILE_VERCODE_ID primary key (MOBILE_VERCODE_ID);

prompt
prompt Creating table MOBILE_WHITE_LIST
prompt ================================
prompt
create table MOBILE_WHITE_LIST
(
  WHITE_LIST_ID VARCHAR2(200) not null,
  MOBILE        VARCHAR2(200),
  MOBILE_COM    NUMBER(2),
  BATCH_ID      VARCHAR2(200),
  CREATE_TIME   DATE
)
;
comment on table MOBILE_WHITE_LIST
  is '���еİ�����';
comment on column MOBILE_WHITE_LIST.WHITE_LIST_ID
  is '���������';
comment on column MOBILE_WHITE_LIST.MOBILE
  is '�ֻ�����';
comment on column MOBILE_WHITE_LIST.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
comment on column MOBILE_WHITE_LIST.BATCH_ID
  is '����';
comment on column MOBILE_WHITE_LIST.CREATE_TIME
  is 'ʱ��';
alter table MOBILE_WHITE_LIST
  add constraint PK_MOBILE_WHITE_LIST primary key (WHITE_LIST_ID);
create unique index IDX_WHITE_MOBILE on MOBILE_WHITE_LIST (MOBILE);

prompt
prompt Creating table MOBILE_WHITE_LIST_CHANNEL
prompt ========================================
prompt
create table MOBILE_WHITE_LIST_CHANNEL
(
  WHITE_LIST_CHANNEL_ID VARCHAR2(200) not null,
  MOBILE                VARCHAR2(200),
  CHANNEL_ID            NUMBER(4),
  STATUS                NUMBER(4),
  CREATE_TIME           DATE
)
;
comment on table MOBILE_WHITE_LIST_CHANNEL
  is 'ͨ���İ�����';
comment on column MOBILE_WHITE_LIST_CHANNEL.WHITE_LIST_CHANNEL_ID
  is '���������';
comment on column MOBILE_WHITE_LIST_CHANNEL.MOBILE
  is '�ֻ�����';
comment on column MOBILE_WHITE_LIST_CHANNEL.CHANNEL_ID
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
comment on column MOBILE_WHITE_LIST_CHANNEL.STATUS
  is '״̬, 0:δͬ�����ƶ���ͨ��, 1:ͬ���ɹ�, -1:ͬ��ʧ��';
comment on column MOBILE_WHITE_LIST_CHANNEL.CREATE_TIME
  is '����ʱ��';
alter table MOBILE_WHITE_LIST_CHANNEL
  add constraint PK_MOBILE_WHITE_LIST_CHANNEL primary key (WHITE_LIST_CHANNEL_ID);
create unique index IDX_WHITE_MOBILE_CHANNEL on MOBILE_WHITE_LIST_CHANNEL (MOBILE, CHANNEL_ID);

prompt
prompt Creating table MOBILE_WHITE_LIST_CONFIG
prompt =======================================
prompt
create table MOBILE_WHITE_LIST_CONFIG
(
  CONFIG_KEY   VARCHAR2(200) not null,
  CONFIG_VALUE VARCHAR2(200)
)
;
comment on table MOBILE_WHITE_LIST_CONFIG
  is '������������ñ�';
comment on column MOBILE_WHITE_LIST_CONFIG.CONFIG_KEY
  is '������';
comment on column MOBILE_WHITE_LIST_CONFIG.CONFIG_VALUE
  is '����ֵ';
alter table MOBILE_WHITE_LIST_CONFIG
  add constraint PK_MOBILE_WHITE_LIST_CONFIG primary key (CONFIG_KEY);

prompt
prompt Creating table MONITOR_DETAIL
prompt =============================
prompt
create table MONITOR_DETAIL
(
  ID             VARCHAR2(200) not null,
  NOT_SENDCOUNT  VARCHAR2(20),
  SUBMITEDCOUNT  VARCHAR2(20),
  SEND_SUCCOUNT  VARCHAR2(20),
  SEND_FAILCOUNT VARCHAR2(20),
  SYS_TIME       VARCHAR2(50),
  MO_COUNT       VARCHAR2(20),
  CHANNEL        VARCHAR2(20),
  SPEED          VARCHAR2(20),
  CREATE_TIME    DATE default sysdate
)
;
comment on table MONITOR_DETAIL
  is '���������ϸ��,��Ҫ���ڲ�ѯ֮ǰ������ͼ��ѯ';
comment on column MONITOR_DETAIL.ID
  is 'ϵͳid';
comment on column MONITOR_DETAIL.NOT_SENDCOUNT
  is '������������(״̬����0,2)';
comment on column MONITOR_DETAIL.SUBMITEDCOUNT
  is '���ύ��������';
comment on column MONITOR_DETAIL.SEND_SUCCOUNT
  is '�ɹ���������';
comment on column MONITOR_DETAIL.SEND_FAILCOUNT
  is 'ʧ�ܶ�������(״̬����6,7,8)';
comment on column MONITOR_DETAIL.SYS_TIME
  is '��ȡ��Ϣ��ʱ��';
comment on column MONITOR_DETAIL.MO_COUNT
  is '���ж��ŵ�����';
comment on column MONITOR_DETAIL.CHANNEL
  is 'ͨ������';
comment on column MONITOR_DETAIL.SPEED
  is '�ٶ�';
comment on column MONITOR_DETAIL.CREATE_TIME
  is '����ʱ��';
alter table MONITOR_DETAIL
  add constraint PK_MONITOR_DETAIL primary key (ID);

prompt
prompt Creating table MONTH_MAIN_INFO
prompt ==============================
prompt
create table MONTH_MAIN_INFO
(
  MONTH_MAIN_INFO_ID VARCHAR2(200) not null,
  USER_ID            VARCHAR2(200),
  USER_TYPE          NUMBER(1),
  REMAIN_QUOTA       NUMBER(9),
  REMAIN_FEE         NUMBER(9,2),
  MONTH_PAYMENT      VARCHAR2(200),
  TIME               VARCHAR2(200)
)
;
comment on table MONTH_MAIN_INFO
  is '���˵��м������¼��';
comment on column MONTH_MAIN_INFO.MONTH_MAIN_INFO_ID
  is '����';
comment on column MONTH_MAIN_INFO.USER_ID
  is '�û������id';
comment on column MONTH_MAIN_INFO.USER_TYPE
  is '����¼���û����� 1:����(true) 0:�û�(false)';
comment on column MONTH_MAIN_INFO.REMAIN_QUOTA
  is 'ʣ������';
comment on column MONTH_MAIN_INFO.REMAIN_FEE
  is 'ʣ����';
comment on column MONTH_MAIN_INFO.MONTH_PAYMENT
  is '���³�ֵ(��������)';
comment on column MONTH_MAIN_INFO.TIME
  is '�·ݱ�ǣ���201312';
alter table MONTH_MAIN_INFO
  add constraint PK_MONTH_MAIN_INFO primary key (MONTH_MAIN_INFO_ID);

prompt
prompt Creating table MONTH_RECKONING_INFO
prompt ===================================
prompt
create table MONTH_RECKONING_INFO
(
  MONTH_RECKONING_ID  VARCHAR2(200) not null,
  USER_ID             VARCHAR2(200),
  ORGANIZATION_ID     VARCHAR2(200),
  MONTH_PAYMENT       NUMBER(9,2),
  MONTH_BEGIN_BALANCE NUMBER(9,2),
  MONTH_END_BALANCE   NUMBER(9,2),
  SEND_QUANTITY       NUMBER(9),
  COST_FEE            NUMBER(9,2),
  RECORD_DATE         DATE default sysdate,
  INNER_PAYMENT       NUMBER(9,2) default 0.00,
  MOBILE_COM          NUMBER(2),
  CHANNEL_ID          NUMBER(4),
  ACCOUNT_TIME        VARCHAR2(20),
  UNIT_PRICE          NUMBER(10,3)
)
;
comment on table MONTH_RECKONING_INFO
  is '�½ᵥ��';
comment on column MONTH_RECKONING_INFO.MONTH_RECKONING_ID
  is 'id';
comment on column MONTH_RECKONING_INFO.USER_ID
  is '�˻�id';
comment on column MONTH_RECKONING_INFO.ORGANIZATION_ID
  is '��������';
comment on column MONTH_RECKONING_INFO.MONTH_PAYMENT
  is '���ڳ�ֵ';
comment on column MONTH_RECKONING_INFO.MONTH_BEGIN_BALANCE
  is '����˻����';
comment on column MONTH_RECKONING_INFO.MONTH_END_BALANCE
  is '��ĩ�˻����';
comment on column MONTH_RECKONING_INFO.SEND_QUANTITY
  is '���·�������';
comment on column MONTH_RECKONING_INFO.COST_FEE
  is '���úϼ�';
comment on column MONTH_RECKONING_INFO.RECORD_DATE
  is '��¼ʱ��';
comment on column MONTH_RECKONING_INFO.INNER_PAYMENT
  is '�����˻���ֵ';
comment on column MONTH_RECKONING_INFO.MOBILE_COM
  is '��Ӫ��ID��1Ϊ�ƶ���2Ϊ��ͨ,3Ϊ����,0Ϊȫ�� ';
comment on column MONTH_RECKONING_INFO.CHANNEL_ID
  is 'ͨ��ID';
comment on column MONTH_RECKONING_INFO.ACCOUNT_TIME
  is '��������';
comment on column MONTH_RECKONING_INFO.UNIT_PRICE
  is '���ŵ���';
alter table MONTH_RECKONING_INFO
  add constraint PK_MONTH_RECKONING_INFO primary key (MONTH_RECKONING_ID);

prompt
prompt Creating table MO_LAST_EXPORT_TIME
prompt ==================================
prompt
create table MO_LAST_EXPORT_TIME
(
  ID               VARCHAR2(60) not null,
  ORG_ID           VARCHAR2(60) not null,
  USER_ID          VARCHAR2(60) not null,
  LAST_EXPORT_TIME DATE,
  STATUS           NUMBER,
  CREATE_TIME      DATE,
  DESCRIPTION      VARCHAR2(200)
)
;
comment on table MO_LAST_EXPORT_TIME
  is '�������ж��ŵĵ���ʱ��ļ�¼��';
comment on column MO_LAST_EXPORT_TIME.ID
  is '����id';
comment on column MO_LAST_EXPORT_TIME.ORG_ID
  is '����id';
comment on column MO_LAST_EXPORT_TIME.USER_ID
  is '�û�id';
comment on column MO_LAST_EXPORT_TIME.LAST_EXPORT_TIME
  is '�ϴε���ʱ��';
comment on column MO_LAST_EXPORT_TIME.STATUS
  is '�Ƿ�ʹ��״̬ 0 ����  1 ʹ��';
comment on column MO_LAST_EXPORT_TIME.CREATE_TIME
  is '������������';
comment on column MO_LAST_EXPORT_TIME.DESCRIPTION
  is '������Ϣ';
alter table MO_LAST_EXPORT_TIME
  add constraint PK_MO_LAST_EXPORT_TIME primary key (ID);

prompt
prompt Creating table NOTICE
prompt =====================
prompt
create table NOTICE
(
  ID             VARCHAR2(100) not null,
  CONTENT        VARCHAR2(4000),
  UPLOAD_DATE    DATE,
  OPERATOR_ID    VARCHAR2(100),
  TITLE          VARCHAR2(200),
  VIABLE_DATE    DATE,
  SEND_USER_TYPE NUMBER(3),
  IS_PASTDUE     NUMBER(1)
)
;
alter table NOTICE
  add primary key (ID);

prompt
prompt Creating table NOTICE_USER
prompt ==========================
prompt
create table NOTICE_USER
(
  ID          VARCHAR2(100) not null,
  USER_ID     VARCHAR2(200) not null,
  NOTICE_ID   VARCHAR2(100) not null,
  SELECT_DATE DATE,
  IS_READ     NUMBER(1)
)
;
alter table NOTICE_USER
  add primary key (ID);
alter table NOTICE_USER
  add constraint FK596518D2871E1EFE foreign key (NOTICE_ID)
  references NOTICE (ID);
alter table NOTICE_USER
  add constraint FK596518D2D5594142 foreign key (USER_ID)
  references USER_INFO (USER_ID);

prompt
prompt Creating table ORDER_INFO
prompt =========================
prompt
create table ORDER_INFO
(
  ID            VARCHAR2(50) not null,
  ORDERID       VARCHAR2(30) not null,
  SUBJECT       VARCHAR2(50),
  PRICE         NUMBER(10,3),
  TOTAL_FEE     NUMBER not null,
  QUANTITY      NUMBER,
  GIFT_QUANTITY NUMBER,
  ORGID         VARCHAR2(100) not null,
  CREATER       VARCHAR2(50),
  TYPE          CHAR(2) not null,
  INFOTYPE      CHAR(2),
  TRADE_STATE   CHAR(2),
  CREATETIME    DATE,
  TRADETIME     DATE,
  ENDTIME       DATE,
  STATE         CHAR(2),
  REMARK        VARCHAR2(200)
)
;
comment on table ORDER_INFO
  is '����֧��������';
comment on column ORDER_INFO.ID
  is 'id';
comment on column ORDER_INFO.ORDERID
  is '������� ϵͳΨһ';
comment on column ORDER_INFO.SUBJECT
  is '��Ʒ����';
comment on column ORDER_INFO.PRICE
  is '�۸񣨽���ֵ�޸��';
comment on column ORDER_INFO.TOTAL_FEE
  is '��ֵ���';
comment on column ORDER_INFO.QUANTITY
  is '��ֵ������������ֵ�޸��';
comment on column ORDER_INFO.GIFT_QUANTITY
  is '��������������ֵ�޸��';
comment on column ORDER_INFO.ORGID
  is '��ֵ����id';
comment on column ORDER_INFO.CREATER
  is '��ֵ��';
comment on column ORDER_INFO.TYPE
  is '����ֵ / ����ֵ �� 0/1';
comment on column ORDER_INFO.INFOTYPE
  is '���� / ���� �� 0/1  ������ֵ�޸��';
comment on column ORDER_INFO.TRADE_STATE
  is '����״̬ 0�������1����ֵ�У�2����ֵ�ɹ���3����ֵʧ��;4:���׹ر�';
comment on column ORDER_INFO.CREATETIME
  is '��������ʱ��';
comment on column ORDER_INFO.TRADETIME
  is '���׶���ʱ��';
comment on column ORDER_INFO.ENDTIME
  is '���׽���ʱ��';
comment on column ORDER_INFO.STATE
  is '����״̬   ��Ĭ��0����ʾ��1�����׳ɹ���ҳ��ɾ������(����)��';
comment on column ORDER_INFO.REMARK
  is '��ע';
alter table ORDER_INFO
  add constraint ORDER_INFO_PK primary key (ID);

prompt
prompt Creating table ORGANIZATION
prompt ===========================
prompt
create table ORGANIZATION
(
  USER_ID             VARCHAR2(200) not null,
  USER_NAME           VARCHAR2(200),
  USER_MOME           VARCHAR2(200),
  USER_BALANCE        NUMBER(20,3) default 0,
  CREATE_TIME         DATE,
  USER_STAT           NUMBER(1),
  EXTEND_NUMBER       VARCHAR2(8),
  ENG_SIGNATURE       VARCHAR2(20),
  CHN_SIGNATURE       VARCHAR2(40),
  USER_QUOTA          NUMBER(22) default 0,
  PAY_TYPE            NUMBER(1),
  PAY_MODE            NUMBER(1),
  FEE_MODE            NUMBER(1),
  CHANNEL_TYPE        NUMBER(1),
  MOBILE_TYPE         NUMBER(1),
  SUPER_ORG_NO        VARCHAR2(200),
  PARENTID            VARCHAR2(200),
  ORGAN_TYPE          VARCHAR2(20),
  MO_TYPE             NUMBER(1) default 0,
  RECHARGE_EXPLAIN    VARCHAR2(200),
  MMS_QUOTA           NUMBER(22) default 0,
  CUSTOMER_MANAGER_ID VARCHAR2(200),
  DEDUCT_MODE         NUMBER(1) default 0
)
;
comment on table ORGANIZATION
  is '������Ϣ��';
comment on column ORGANIZATION.USER_ID
  is '�������';
comment on column ORGANIZATION.USER_NAME
  is '��������';
comment on column ORGANIZATION.USER_MOME
  is 'ע��';
comment on column ORGANIZATION.USER_BALANCE
  is '���÷���';
comment on column ORGANIZATION.CREATE_TIME
  is '����ʱ��';
comment on column ORGANIZATION.USER_STAT
  is '״̬, 1:��Ч, 0:��Ч';
comment on column ORGANIZATION.EXTEND_NUMBER
  is '��չ��';
comment on column ORGANIZATION.ENG_SIGNATURE
  is 'Ӣ��ǩ��';
comment on column ORGANIZATION.CHN_SIGNATURE
  is '����ǩ��';
comment on column ORGANIZATION.USER_QUOTA
  is '�������';
comment on column ORGANIZATION.PAY_TYPE
  is '��ֵ����, 0:Ԥ����, 1:�󸶷�';
comment on column ORGANIZATION.PAY_MODE
  is '�Ʒѵ�λ, 0:����, 1:����';
comment on column ORGANIZATION.FEE_MODE
  is '�۷ѷ�ʽ, 0:�Ը���, 1:�鸶��';
comment on column ORGANIZATION.CHANNEL_TYPE
  is '�Ƿ�����ͨ��, 0:������, 1:����';
comment on column ORGANIZATION.MOBILE_TYPE
  is '�Ƿ����ֺŶ�, 0:������, 1:����';
comment on column ORGANIZATION.SUPER_ORG_NO
  is '�������࣬������ϵ����״��ʾ��6000��Ӫҵ����7000��������8000��������9000���ӹ�˾';
comment on column ORGANIZATION.ORGAN_TYPE
  is '0:���� 1:ֱ��';
comment on column ORGANIZATION.MO_TYPE
  is '0:���������� 1:���е����� 2:���е��û�';
comment on column ORGANIZATION.RECHARGE_EXPLAIN
  is '��ֵ˵��';
comment on column ORGANIZATION.MMS_QUOTA
  is '�������';
comment on column ORGANIZATION.DEDUCT_MODE
  is '�۷ѷ�ʽ 0:�ύ�۷� 1:�ɹ��۷�';
alter table ORGANIZATION
  add constraint PK_ORGANIZATION primary key (USER_ID);

prompt
prompt Creating table ORG_CONFIG
prompt =========================
prompt
create table ORG_CONFIG
(
  ID              VARCHAR2(20) not null,
  ORGANIZATION_ID VARCHAR2(50) not null,
  LOGO            VARCHAR2(200),
  DOMAIN_NAME     VARCHAR2(200),
  COPYRIGHT       VARCHAR2(200),
  COMPANY_TEL     VARCHAR2(50),
  COMPANY_CN      VARCHAR2(100),
  COMPANY_EN      VARCHAR2(100),
  COMPANY_EMAIL   VARCHAR2(200),
  SERVICE_QQ      VARCHAR2(200)
)
;
alter table ORG_CONFIG
  add primary key (ID);

prompt
prompt Creating table ORG_MMS_SEND_CONFIG
prompt ==================================
prompt
create table ORG_MMS_SEND_CONFIG
(
  CONFIG_ID     VARCHAR2(200) not null,
  ORG_ID        VARCHAR2(500),
  ORG_NAME      VARCHAR2(500),
  PRIORITY_CODE NUMBER(10),
  CREATE_TIME   TIMESTAMP(6),
  START_TIME    TIMESTAMP(6),
  END_TIME      TIMESTAMP(6)
)
;
comment on table ORG_MMS_SEND_CONFIG
  is '�������ŷ��͵����';
alter table ORG_MMS_SEND_CONFIG
  add constraint PK_ORG_MMS_SEND_CONFIG primary key (CONFIG_ID);

prompt
prompt Creating table ORG_REMAIN_BALANCE
prompt =================================
prompt
create table ORG_REMAIN_BALANCE
(
  ROW_ID                 VARCHAR2(200) not null,
  USER_ID                VARCHAR2(200) not null,
  STATUS                 NUMBER(1),
  SMS_QUOTA              NUMBER(22),
  UNIT_PRICE             NUMBER(5,3),
  GW_TYPE                NUMBER(1),
  UPDATE_UNITPRICE_DATE  DATE,
  UPDATE_USER            VARCHAR2(200),
  REMARK                 VARCHAR2(200),
  LAST_UPDATE_QUOTA_DATE DATE,
  USER_TYPE              NUMBER(1),
  MMS_QUOTA              NUMBER(22)
)
;
comment on table ORG_REMAIN_BALANCE
  is '����������';
comment on column ORG_REMAIN_BALANCE.ROW_ID
  is '����';
comment on column ORG_REMAIN_BALANCE.USER_ID
  is '����ID';
comment on column ORG_REMAIN_BALANCE.STATUS
  is '״̬, 1:��Ч, 0:��Ч';
comment on column ORG_REMAIN_BALANCE.SMS_QUOTA
  is '���ö�������';
comment on column ORG_REMAIN_BALANCE.UNIT_PRICE
  is '����';
comment on column ORG_REMAIN_BALANCE.GW_TYPE
  is '�Ŷ����͡�0-ȫ��·��1-�ƶ��ŶΣ�2-��ͨ�ŶΣ�3-С��ͨ�Ŷ�';
comment on column ORG_REMAIN_BALANCE.UPDATE_UNITPRICE_DATE
  is '�޸�Э���ʱ��';
comment on column ORG_REMAIN_BALANCE.UPDATE_USER
  is '�޸���';
comment on column ORG_REMAIN_BALANCE.REMARK
  is '��ע';
comment on column ORG_REMAIN_BALANCE.LAST_UPDATE_QUOTA_DATE
  is '���һ���޸����ʱ��';
comment on column ORG_REMAIN_BALANCE.USER_TYPE
  is '�û�����: 0�û�  1����';
comment on column ORG_REMAIN_BALANCE.MMS_QUOTA
  is '���ò�������';
alter table ORG_REMAIN_BALANCE
  add constraint PK_ROW_ID primary key (ROW_ID);

prompt
prompt Creating table PAYMENT_RECORD
prompt =============================
prompt
create table PAYMENT_RECORD
(
  PAYMENT_ID       VARCHAR2(200) not null,
  USER_ID          VARCHAR2(200) not null,
  PAYMENT_TIME     DATE,
  PAYMENT_MONEY    NUMBER(20,3) default 0,
  PAYMENT_QUOTA    NUMBER(22) default 0,
  OPERATOR_ID      VARCHAR2(200),
  PAYMENT_TYPE     NUMBER(1),
  IS_ONLINE        NUMBER(1),
  USER_TYPE        NUMBER(1),
  RECHARGE_EXPLAIN VARCHAR2(200),
  QUOTA_TYPE       NUMBER(1) default 1,
  IS_SUCCESS       NUMBER(1) default 1
)
;
comment on column PAYMENT_RECORD.PAYMENT_ID
  is '����';
comment on column PAYMENT_RECORD.USER_ID
  is '��ֵ���û����߻���';
comment on column PAYMENT_RECORD.PAYMENT_TIME
  is '��ֵʱ��';
comment on column PAYMENT_RECORD.PAYMENT_MONEY
  is '��ֵ�Ľ��';
comment on column PAYMENT_RECORD.PAYMENT_QUOTA
  is '��ֵ�����';
comment on column PAYMENT_RECORD.OPERATOR_ID
  is '��ֵ������';
comment on column PAYMENT_RECORD.PAYMENT_TYPE
  is '��ֵ���� 1:���  0:��� 2:������ 3:���� 4:������ 5:���� 6:����ʧ�ܶ������ 7:����ʧ�ܶ��Ž��';
comment on column PAYMENT_RECORD.IS_ONLINE
  is '�Ƿ������߳�ֵ 1:�� 0:��';
comment on column PAYMENT_RECORD.USER_TYPE
  is '����¼���û����� 1:����(true) 0:�û�(false)';
comment on column PAYMENT_RECORD.RECHARGE_EXPLAIN
  is '��¼��ֵ˵��';
comment on column PAYMENT_RECORD.QUOTA_TYPE
  is '������� 1:���� 0:����';
comment on column PAYMENT_RECORD.IS_SUCCESS
  is '�Ƿ��ֵ�ɹ� 1:�ɹ� 0:ʧ��';
alter table PAYMENT_RECORD
  add constraint PK_PAYMENTID primary key (PAYMENT_ID);

prompt
prompt Creating table PB_LIST_OF_VALUE
prompt ===============================
prompt
create table PB_LIST_OF_VALUE
(
  ROW_ID        VARCHAR2(40) not null,
  STATUS        VARCHAR2(40),
  STAND_CODE    VARCHAR2(40),
  TYPE_ID       VARCHAR2(40),
  TYPE_NAME     VARCHAR2(40),
  DISPLAY_VALUE VARCHAR2(40),
  VALUE_DESC    VARCHAR2(40)
)
;
comment on column PB_LIST_OF_VALUE.ROW_ID
  is '����';
comment on column PB_LIST_OF_VALUE.STATUS
  is '״̬:0��Ч,1,��Ч';
comment on column PB_LIST_OF_VALUE.STAND_CODE
  is '�ֶα���';
comment on column PB_LIST_OF_VALUE.TYPE_ID
  is '����';
comment on column PB_LIST_OF_VALUE.TYPE_NAME
  is '������';
comment on column PB_LIST_OF_VALUE.DISPLAY_VALUE
  is '��ʾ��';
comment on column PB_LIST_OF_VALUE.VALUE_DESC
  is 'ֵע��';
alter table PB_LIST_OF_VALUE
  add constraint PK_PB_LIST_OF_VALUE primary key (ROW_ID);

prompt
prompt Creating table PERMIT_WORD
prompt ==========================
prompt
create table PERMIT_WORD
(
  ID                 NUMBER(18) not null,
  PERMIT_WORD        VARCHAR2(50) not null,
  DESCRIPTION        VARCHAR2(200),
  CREATETIME         DATE default SYSDATE,
  MODIFYTIME         DATE,
  CREATE_USER_ID     VARCHAR2(200),
  PERMIT_WORD_STATUS CHAR(1) default '1'
)
;
comment on table PERMIT_WORD
  is '��ɴʱ�';
comment on column PERMIT_WORD.ID
  is '����';
comment on column PERMIT_WORD.PERMIT_WORD
  is '��ɴ�';
comment on column PERMIT_WORD.DESCRIPTION
  is '��ע';
comment on column PERMIT_WORD.CREATETIME
  is '����ʱ��';
comment on column PERMIT_WORD.MODIFYTIME
  is '�޸�ʱ��';
comment on column PERMIT_WORD.CREATE_USER_ID
  is '������';
comment on column PERMIT_WORD.PERMIT_WORD_STATUS
  is '״̬, 0:ͣ��, 1:����';
alter table PERMIT_WORD
  add constraint PK_PERMIT_WORD primary key (ID);
create unique index UDX_PERMIT_WORD on PERMIT_WORD (PERMIT_WORD);

prompt
prompt Creating table PHRASE_GROUP
prompt ===========================
prompt
create table PHRASE_GROUP
(
  GROUP_ID     VARCHAR2(50) not null,
  GROUP_NAME   VARCHAR2(200),
  GROUP_REMARK VARCHAR2(200),
  USER_ID      VARCHAR2(200),
  CREATE_TIME  DATE
)
;
comment on table PHRASE_GROUP
  is '���ö�����';
comment on column PHRASE_GROUP.GROUP_ID
  is '���ö�������';
comment on column PHRASE_GROUP.GROUP_NAME
  is '���ö���������';
comment on column PHRASE_GROUP.GROUP_REMARK
  is '��ע';
comment on column PHRASE_GROUP.USER_ID
  is '�û����';
comment on column PHRASE_GROUP.CREATE_TIME
  is '����ʱ��';
alter table PHRASE_GROUP
  add constraint PK_PHRASE_GROUP primary key (GROUP_ID);

prompt
prompt Creating table PHRASE_INFO
prompt ==========================
prompt
create table PHRASE_INFO
(
  PHRASE_ID      VARCHAR2(50) not null,
  PHRASE_NAME    VARCHAR2(1000),
  PHRASE_CONTENT VARCHAR2(1000),
  PHRASE_REMARK  VARCHAR2(1000),
  GROUP_ID       VARCHAR2(50),
  CREATE_TIME    DATE
)
;
comment on table PHRASE_INFO
  is '���ö���';
comment on column PHRASE_INFO.PHRASE_ID
  is '������';
comment on column PHRASE_INFO.PHRASE_NAME
  is '��������';
comment on column PHRASE_INFO.PHRASE_CONTENT
  is '��������';
comment on column PHRASE_INFO.PHRASE_REMARK
  is '��ע';
comment on column PHRASE_INFO.GROUP_ID
  is '���ö�������';
comment on column PHRASE_INFO.CREATE_TIME
  is '����ʱ��';
alter table PHRASE_INFO
  add constraint PK_PHRASE_INFO primary key (PHRASE_ID);

prompt
prompt Creating table PLAT_LOG
prompt =======================
prompt
create table PLAT_LOG
(
  PLAT_LOG_ID            VARCHAR2(200) not null,
  USER_ID                VARCHAR2(200),
  USER_NAME              VARCHAR2(200),
  USER_ORGANIZATION      VARCHAR2(200),
  USER_ORGANIZATION_NAME VARCHAR2(200),
  LOG_TYPE               VARCHAR2(20),
  DESCRIPTION            VARCHAR2(500),
  LOG_TIME               DATE
)
;
comment on table PLAT_LOG
  is '����ƽ̨��־��';
comment on column PLAT_LOG.PLAT_LOG_ID
  is '��־���';
comment on column PLAT_LOG.USER_ID
  is '�����߱��';
comment on column PLAT_LOG.USER_NAME
  is '�������û���';
comment on column PLAT_LOG.USER_ORGANIZATION
  is '�����������������';
comment on column PLAT_LOG.USER_ORGANIZATION_NAME
  is '������������������';
comment on column PLAT_LOG.LOG_TYPE
  is '��־����, 1:����\�ǳ�, 4:ϵͳ����\�ر�, 8���ճ���Ϣ, 9��������Ϣ';
comment on column PLAT_LOG.DESCRIPTION
  is '��ϸ��Ϣ';
comment on column PLAT_LOG.LOG_TIME
  is '��־ʱ��';
alter table PLAT_LOG
  add constraint PK_PLAT_LOG primary key (PLAT_LOG_ID);

prompt
prompt Creating table PRICING_PACKAGE_INFO
prompt ===================================
prompt
create table PRICING_PACKAGE_INFO
(
  ID          VARCHAR2(200) not null,
  PACKAGENAME VARCHAR2(100) not null,
  TYPE        VARCHAR2(2) not null,
  RULE        VARCHAR2(2) not null,
  INFONUM1    NUMBER(10),
  INFONUM2    NUMBER(10),
  PRICE       NUMBER(10,3),
  COUPON      VARCHAR2(2),
  INFONUM3    NUMBER(10),
  INFONUM4    NUMBER(10),
  CREATEDATE  DATE,
  CREATER     VARCHAR2(100),
  REMARK      VARCHAR2(200),
  STATE       VARCHAR2(2)
)
;
comment on table PRICING_PACKAGE_INFO
  is '�ײͱ�';
comment on column PRICING_PACKAGE_INFO.ID
  is '����id';
comment on column PRICING_PACKAGE_INFO.PACKAGENAME
  is '�ײ�����';
comment on column PRICING_PACKAGE_INFO.TYPE
  is '�ײ����ͣ�0������/1�����ţ�';
comment on column PRICING_PACKAGE_INFO.RULE
  is '�ײ͹����־  0������һ�£�1�����������������䣻2������������';
comment on column PRICING_PACKAGE_INFO.INFONUM1
  is '�ײ�����1';
comment on column PRICING_PACKAGE_INFO.INFONUM2
  is '�ײ�����2';
comment on column PRICING_PACKAGE_INFO.PRICE
  is '����';
comment on column PRICING_PACKAGE_INFO.COUPON
  is '�Ƿ��Ż�(0:�ǣ�1:��)';
comment on column PRICING_PACKAGE_INFO.INFONUM3
  is '�Ż�����1';
comment on column PRICING_PACKAGE_INFO.INFONUM4
  is '�Ż�����2';
comment on column PRICING_PACKAGE_INFO.CREATEDATE
  is '��������';
comment on column PRICING_PACKAGE_INFO.CREATER
  is '������';
comment on column PRICING_PACKAGE_INFO.REMARK
  is '��ע';
comment on column PRICING_PACKAGE_INFO.STATE
  is '״̬ 0������;1:ͣ��';
alter table PRICING_PACKAGE_INFO
  add constraint PRICING_PACKAGE_INFO_PK primary key (ID);

prompt
prompt Creating table PRODUCT
prompt ======================
prompt
create table PRODUCT
(
  PRODUCTID    VARCHAR2(50) not null,
  PRODUCTNAME  VARCHAR2(50),
  CATALOGID    VARCHAR2(50) default 10000,
  DESCRIPTION  VARCHAR2(500),
  RESERVEDINT  NUMBER(1),
  RESERVEDCHAR VARCHAR2(2000),
  STAUTUS      NUMBER(1) default 0,
  CREATETIME   DATE default sysdate,
  MODIFYTIME   DATE default sysdate,
  USER_ID      VARCHAR2(50)
)
;
comment on table PRODUCT
  is '��Ʒ��Ϣ';
comment on column PRODUCT.PRODUCTID
  is '���룬�����ƷΨһ��ʶ���ñ���ɹ���Ա�ֹ���д�����ű��ΪD001�������Ų�ƷΪC001�����ֶ�Ϊ����';
comment on column PRODUCT.PRODUCTNAME
  is '���룬�����Ʒ��Ҫ����';
comment on column PRODUCT.CATALOGID
  is '����Ŀ¼��ID';
comment on column PRODUCT.DESCRIPTION
  is '�����Ʒ���Եȵ�˵������';
comment on column PRODUCT.RESERVEDINT
  is '����';
comment on column PRODUCT.RESERVEDCHAR
  is 'JSON��ʽ����¼���ܷ�����Ʒ���ݵĻ���ID��ʽ';
comment on column PRODUCT.STAUTUS
  is '0:���ã�1:���᣻�ݱ�������';
comment on column PRODUCT.CREATETIME
  is '��Ʒ����ʱ��';
comment on column PRODUCT.MODIFYTIME
  is '��Ʒ�޸�ʱ��';
comment on column PRODUCT.USER_ID
  is '�û����';
alter table PRODUCT
  add constraint PK_PRODUCT primary key (PRODUCTID);

prompt
prompt Creating table PRODUCT_ORGANIZATION_ITEMS
prompt =========================================
prompt
create table PRODUCT_ORGANIZATION_ITEMS
(
  ID             VARCHAR2(50) not null,
  PRODUCTID      VARCHAR2(50),
  ORGANIZATIONID VARCHAR2(200),
  STATUS         NUMBER(1) default 0,
  ITEMSJSON      VARCHAR2(2000),
  CREATETIME     DATE default sysdate,
  MODIFYTIME     DATE default sysdate,
  RESERVEDINT    NUMBER(1),
  RESERVEDCHAR   VARCHAR2(200),
  ISEXTENDS      NUMBER(1) default 0,
  GROUPID        VARCHAR2(200)
)
;
comment on table PRODUCT_ORGANIZATION_ITEMS
  is 'Ϊ�������ò�Ʒ��������';
comment on column PRODUCT_ORGANIZATION_ITEMS.ID
  is 'ID';
comment on column PRODUCT_ORGANIZATION_ITEMS.PRODUCTID
  is '��Ʒ���';
comment on column PRODUCT_ORGANIZATION_ITEMS.ORGANIZATIONID
  is '�������';
comment on column PRODUCT_ORGANIZATION_ITEMS.STATUS
  is '��¼״̬';
comment on column PRODUCT_ORGANIZATION_ITEMS.ITEMSJSON
  is '��ǰ������Ե�ǰ��Ʒ����������Ϣ';
comment on column PRODUCT_ORGANIZATION_ITEMS.CREATETIME
  is '����ʱ��';
comment on column PRODUCT_ORGANIZATION_ITEMS.MODIFYTIME
  is '�޸�ʱ��';
comment on column PRODUCT_ORGANIZATION_ITEMS.RESERVEDINT
  is 'INT�����ֶ�,��¼�˵�ǰ���õ����ȼ�1-8����Խ�����ȼ�Խ��';
comment on column PRODUCT_ORGANIZATION_ITEMS.RESERVEDCHAR
  is 'CHAR�����ֶ�';
comment on column PRODUCT_ORGANIZATION_ITEMS.ISEXTENDS
  is '��Ӧ���Ƿ���Լ̳����ڻ�����Ӧ��Ʒ��������Ϣ��0:�����棻1���̳�';
comment on column PRODUCT_ORGANIZATION_ITEMS.GROUPID
  is '��ID';
alter table PRODUCT_ORGANIZATION_ITEMS
  add constraint PK_PRODUCT_ORGANIZATION_ITEMS primary key (ID);

prompt
prompt Creating table PROHIBITEDWORD
prompt =============================
prompt
create table PROHIBITEDWORD
(
  ID             VARCHAR2(50) not null,
  PROHIBITEDWORD VARCHAR2(200),
  DESCRIPTION    VARCHAR2(200),
  CREATETIME     DATE,
  MODIFYTIME     DATE,
  CREATE_USER    VARCHAR2(200),
  CLASS_ID       VARCHAR2(200),
  STATUS         NUMBER(4)
)
;
comment on table PROHIBITEDWORD
  is 'Υ���ʱ�';
comment on column PROHIBITEDWORD.ID
  is '����';
comment on column PROHIBITEDWORD.PROHIBITEDWORD
  is 'Υ����';
comment on column PROHIBITEDWORD.DESCRIPTION
  is '��ע';
comment on column PROHIBITEDWORD.CREATETIME
  is '����ʱ��';
comment on column PROHIBITEDWORD.MODIFYTIME
  is '�޸�ʱ��';
comment on column PROHIBITEDWORD.CREATE_USER
  is '������';
comment on column PROHIBITEDWORD.CLASS_ID
  is 'Υ���ʷ���Id';
comment on column PROHIBITEDWORD.STATUS
  is 'Υ����״̬, 0:ͣ��, 1:����';
alter table PROHIBITEDWORD
  add constraint PK_PROHIBITEDWORD primary key (ID);

prompt
prompt Creating table PROHIBITEDWORD_CLASS
prompt ===================================
prompt
create table PROHIBITEDWORD_CLASS
(
  ID          VARCHAR2(50) not null,
  NAME        VARCHAR2(200),
  DESCRIPTION VARCHAR2(200),
  CREATETIME  DATE,
  CREATE_USER VARCHAR2(200)
)
;
comment on table PROHIBITEDWORD_CLASS
  is 'Υ���ʷ����';
comment on column PROHIBITEDWORD_CLASS.ID
  is '����';
comment on column PROHIBITEDWORD_CLASS.NAME
  is '��������';
comment on column PROHIBITEDWORD_CLASS.DESCRIPTION
  is '��ע';
comment on column PROHIBITEDWORD_CLASS.CREATETIME
  is '����ʱ��';
comment on column PROHIBITEDWORD_CLASS.CREATE_USER
  is '������';
alter table PROHIBITEDWORD_CLASS
  add constraint PK_PROHIBITEDWORD_CLASS primary key (ID);

prompt
prompt Creating table PROHIBITED_CHANNEL_TYPE_INFO
prompt ===========================================
prompt
create table PROHIBITED_CHANNEL_TYPE_INFO
(
  CHANNEL_TYPE_ID   VARCHAR2(50) not null,
  CHANNEL_TYPE_NAME VARCHAR2(50),
  DESCRIPTION       VARCHAR2(200)
)
;
alter table PROHIBITED_CHANNEL_TYPE_INFO
  add primary key (CHANNEL_TYPE_ID);
alter table PROHIBITED_CHANNEL_TYPE_INFO
  add unique (CHANNEL_TYPE_NAME);

prompt
prompt Creating table PROHIBITED_WORD
prompt ==============================
prompt
create table PROHIBITED_WORD
(
  ID                VARCHAR2(50) not null,
  PROHIBITED_WORD   VARCHAR2(200),
  DESCRIPTION       VARCHAR2(200),
  STATUS            NUMBER(10),
  CREATE_TIME       DATE,
  MODIFY_TIME       DATE,
  RESERVED_INT      NUMBER(10) default -1,
  RESERVED_CHAR     VARCHAR2(4),
  CHANNEL_TYPE_CODE VARCHAR2(50),
  CHANNEL_ID        NUMBER(10) default -1,
  CREATE_USER       VARCHAR2(50),
  CHANNEL_TYPE_ID   VARCHAR2(50)
)
;
alter table PROHIBITED_WORD
  add primary key (ID);
alter table PROHIBITED_WORD
  add unique (CHANNEL_TYPE_ID);
alter table PROHIBITED_WORD
  add constraint FKBB08CBEB1147B70E foreign key (CHANNEL_TYPE_ID)
  references PROHIBITED_CHANNEL_TYPE_INFO (CHANNEL_TYPE_ID);

prompt
prompt Creating table PROHIBIT_WORD
prompt ============================
prompt
create table PROHIBIT_WORD
(
  ID                     VARCHAR2(50) not null,
  PROHIBIT_WORD          VARCHAR2(200) not null,
  DESCRIPTION            VARCHAR2(200),
  CREATETIME             DATE default SYSDATE,
  MODIFYTIME             DATE,
  CREATE_USER_ID         VARCHAR2(200),
  PROHIBITED_WORD_STATUS CHAR(1) default '1'
)
;
comment on table PROHIBIT_WORD
  is 'Υ���ʱ�';
comment on column PROHIBIT_WORD.ID
  is '����';
comment on column PROHIBIT_WORD.PROHIBIT_WORD
  is 'Υ����';
comment on column PROHIBIT_WORD.DESCRIPTION
  is '��ע';
comment on column PROHIBIT_WORD.CREATETIME
  is '����ʱ��';
comment on column PROHIBIT_WORD.MODIFYTIME
  is '�޸�ʱ��';
comment on column PROHIBIT_WORD.CREATE_USER_ID
  is '������ID';
comment on column PROHIBIT_WORD.PROHIBITED_WORD_STATUS
  is 'Υ����״̬, 0:ͣ��, 1:����';
alter table PROHIBIT_WORD
  add constraint PK_PROHIBIT_WORD primary key (ID);
create unique index IDX_PROHIBITWORD on PROHIBIT_WORD (PROHIBIT_WORD);

prompt
prompt Creating table QRTZ_BLOB_TRIGGERS
prompt =================================
prompt
create table QRTZ_BLOB_TRIGGERS
(
  TRIGGER_NAME  VARCHAR2(80) not null,
  TRIGGER_GROUP VARCHAR2(80) not null,
  BLOB_DATA     BLOB
)
;
alter table QRTZ_BLOB_TRIGGERS
  add constraint PK_QRTZ_BLOB_TRIGGERS primary key (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_CALENDARS
prompt =============================
prompt
create table QRTZ_CALENDARS
(
  CALENDAR_NAME VARCHAR2(80) not null,
  CALENDAR      BLOB
)
;
alter table QRTZ_CALENDARS
  add constraint PK_QRTZ_CALENDARS primary key (CALENDAR_NAME);

prompt
prompt Creating table QRTZ_CRON_TRIGGERS
prompt =================================
prompt
create table QRTZ_CRON_TRIGGERS
(
  TRIGGER_NAME    VARCHAR2(80) not null,
  TRIGGER_GROUP   VARCHAR2(80) not null,
  CRON_EXPRESSION VARCHAR2(80),
  TIME_ZONE_ID    VARCHAR2(80)
)
;
alter table QRTZ_CRON_TRIGGERS
  add constraint PK_QRTZ_CRON_TRIGGERS primary key (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_FIRED_TRIGGERS
prompt ==================================
prompt
create table QRTZ_FIRED_TRIGGERS
(
  ENTRY_ID          VARCHAR2(95) not null,
  TRIGGER_NAME      VARCHAR2(80),
  TRIGGER_GROUP     VARCHAR2(80),
  IS_VOLATILE       VARCHAR2(1),
  INSTANCE_NAME     VARCHAR2(80),
  FIRED_TIME        NUMBER(13),
  PRIORITY          NUMBER(13),
  STATE             VARCHAR2(16),
  JOB_NAME          VARCHAR2(80),
  JOB_GROUP         VARCHAR2(80),
  IS_STATEFUL       VARCHAR2(1),
  REQUESTS_RECOVERY VARCHAR2(1)
)
;
alter table QRTZ_FIRED_TRIGGERS
  add constraint PK_QRTZ_FIRED_TRIGGERS primary key (ENTRY_ID);

prompt
prompt Creating table QRTZ_JOB_DETAILS
prompt ===============================
prompt
create table QRTZ_JOB_DETAILS
(
  JOB_NAME          VARCHAR2(80) not null,
  JOB_GROUP         VARCHAR2(80) not null,
  DESCRIPTION       VARCHAR2(120),
  JOB_CLASS_NAME    VARCHAR2(128),
  IS_DURABLE        VARCHAR2(1),
  IS_VOLATILE       VARCHAR2(1),
  IS_STATEFUL       VARCHAR2(1),
  REQUESTS_RECOVERY VARCHAR2(1),
  JOB_DATA          BLOB
)
;
alter table QRTZ_JOB_DETAILS
  add constraint PK_QRTZ_JOB_DETAILS primary key (JOB_NAME, JOB_GROUP);

prompt
prompt Creating table QRTZ_JOB_LISTENERS
prompt =================================
prompt
create table QRTZ_JOB_LISTENERS
(
  JOB_NAME     VARCHAR2(80) not null,
  JOB_GROUP    VARCHAR2(80) not null,
  JOB_LISTENER VARCHAR2(80) not null
)
;
alter table QRTZ_JOB_LISTENERS
  add constraint PK_QRTZ_JOB_LISTENERS primary key (JOB_NAME, JOB_GROUP, JOB_LISTENER);

prompt
prompt Creating table QRTZ_LOCKS
prompt =========================
prompt
create table QRTZ_LOCKS
(
  LOCK_NAME VARCHAR2(40) not null
)
;
alter table QRTZ_LOCKS
  add constraint PK_QRTZ_LOCKS primary key (LOCK_NAME);

prompt
prompt Creating table QRTZ_PAUSED_TRIGGER_GRPS
prompt =======================================
prompt
create table QRTZ_PAUSED_TRIGGER_GRPS
(
  TRIGGER_GROUP VARCHAR2(80) not null
)
;
alter table QRTZ_PAUSED_TRIGGER_GRPS
  add constraint PK_QRTZ_PAUSED_TRIGGER_GRPS primary key (TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_SCHEDULER_STATE
prompt ===================================
prompt
create table QRTZ_SCHEDULER_STATE
(
  INSTANCE_NAME     VARCHAR2(80) not null,
  LAST_CHECKIN_TIME NUMBER(13),
  CHECKIN_INTERVAL  NUMBER(13)
)
;
alter table QRTZ_SCHEDULER_STATE
  add constraint PK_QRTZ_SCHEDULER_STATE primary key (INSTANCE_NAME);

prompt
prompt Creating table QRTZ_SIMPLE_TRIGGERS
prompt ===================================
prompt
create table QRTZ_SIMPLE_TRIGGERS
(
  TRIGGER_NAME    VARCHAR2(80) not null,
  TRIGGER_GROUP   VARCHAR2(80) not null,
  REPEAT_COUNT    NUMBER(7),
  REPEAT_INTERVAL NUMBER(12),
  TIMES_TRIGGERED NUMBER(7)
)
;
alter table QRTZ_SIMPLE_TRIGGERS
  add constraint PK_QRTZ_SIMPLE_TRIGGERS primary key (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_TRIGGERS
prompt ============================
prompt
create table QRTZ_TRIGGERS
(
  TRIGGER_NAME   VARCHAR2(80) not null,
  TRIGGER_GROUP  VARCHAR2(80) not null,
  JOB_NAME       VARCHAR2(80),
  JOB_GROUP      VARCHAR2(80),
  IS_VOLATILE    VARCHAR2(1),
  DESCRIPTION    VARCHAR2(120),
  NEXT_FIRE_TIME NUMBER(13),
  PREV_FIRE_TIME NUMBER(13),
  PRIORITY       NUMBER(13),
  TRIGGER_STATE  VARCHAR2(16),
  TRIGGER_TYPE   VARCHAR2(8),
  START_TIME     NUMBER(13),
  END_TIME       NUMBER(13),
  CALENDAR_NAME  VARCHAR2(80),
  MISFIRE_INSTR  NUMBER(2),
  JOB_DATA       BLOB
)
;
alter table QRTZ_TRIGGERS
  add constraint PK_QRTZ_TRIGGERS primary key (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_TRIGGER_LISTENERS
prompt =====================================
prompt
create table QRTZ_TRIGGER_LISTENERS
(
  TRIGGER_NAME     VARCHAR2(80) not null,
  TRIGGER_GROUP    VARCHAR2(80) not null,
  TRIGGER_LISTENER VARCHAR2(80) not null
)
;
alter table QRTZ_TRIGGER_LISTENERS
  add constraint PK_QRTZ_TRIGGER_LISTENERS primary key (TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_LISTENER);

prompt
prompt Creating table RECBIZ_DB
prompt ========================
prompt
create table RECBIZ_DB
(
  DB_ID           VARCHAR2(50) not null,
  DB_NAME         VARCHAR2(50),
  DB_CONTENT      VARCHAR2(100),
  DB_CHANNEL      VARCHAR2(200),
  DB_USER         VARCHAR2(4000),
  DB_SERVICE      VARCHAR2(4000),
  REMARK          VARCHAR2(4000),
  ORGANIZATION_ID VARCHAR2(200)
)
;
comment on table RECBIZ_DB
  is '�㲥���Ź���';
comment on column RECBIZ_DB.DB_ID
  is '���';
comment on column RECBIZ_DB.DB_NAME
  is '�㲥������';
comment on column RECBIZ_DB.DB_CONTENT
  is '�㲥������';
comment on column RECBIZ_DB.DB_CHANNEL
  is '�㲥��ͨ��';
comment on column RECBIZ_DB.DB_USER
  is '��ӵ㲥�Ļ���';
comment on column RECBIZ_DB.DB_SERVICE
  is '�㲥���ط���';
comment on column RECBIZ_DB.REMARK
  is '��ע';
alter table RECBIZ_DB
  add constraint PK_RECBIZ_DB primary key (DB_ID);

prompt
prompt Creating table RESOURCE_INFO
prompt ============================
prompt
create table RESOURCE_INFO
(
  RESOURCE_ID        VARCHAR2(200) not null,
  RESOURCE_NAME      VARCHAR2(200),
  RESOURCE_CONTENT   VARCHAR2(500),
  RESOURCE_TYPE_ID   VARCHAR2(200),
  RESOURCE_REMARK    VARCHAR2(500),
  RESOURCE_PARENTID  VARCHAR2(200),
  RESOURCE_ACCESS    VARCHAR2(100),
  RESOURCE_IMAGE     VARCHAR2(40),
  RESOURCE_SORT      VARCHAR2(50),
  IS_DEFAULT         VARCHAR2(10),
  RESOURCE_ROLE_TYPE VARCHAR2(200),
  RESOURCE_PATH      VARCHAR2(200)
)
;
comment on table RESOURCE_INFO
  is '��Դ��';
comment on column RESOURCE_INFO.RESOURCE_ID
  is '��Դ���';
comment on column RESOURCE_INFO.RESOURCE_NAME
  is '��Դ����';
comment on column RESOURCE_INFO.RESOURCE_CONTENT
  is '��Դ����';
comment on column RESOURCE_INFO.RESOURCE_TYPE_ID
  is '��Դ����';
comment on column RESOURCE_INFO.RESOURCE_REMARK
  is '��Դ��ע';
comment on column RESOURCE_INFO.RESOURCE_PARENTID
  is '����Դid';
comment on column RESOURCE_INFO.RESOURCE_ACCESS
  is '��Դ��������,0:��ͨ��Դ, 1:ϵͳ��Դ';
comment on column RESOURCE_INFO.RESOURCE_IMAGE
  is '��ʾͼƬ';
comment on column RESOURCE_INFO.RESOURCE_SORT
  is '��ʾ˳��';
comment on column RESOURCE_INFO.IS_DEFAULT
  is '�Ƿ���Ĭ����ʾ';
comment on column RESOURCE_INFO.RESOURCE_ROLE_TYPE
  is '��ԴȨ�����ͣ�SYSTEM:ϵͳȨ�ޣ�ORGADMIN����������Ա��COMMON����ͨȨ��';
alter table RESOURCE_INFO
  add constraint PK_RESOURCE_INFO primary key (RESOURCE_ID);

prompt
prompt Creating table RT_ACQUIRE_TIMESTAMP
prompt ===================================
prompt
create table RT_ACQUIRE_TIMESTAMP
(
  ID                VARCHAR2(200) not null,
  ORG_ID            VARCHAR2(2000),
  USER_ID           VARCHAR2(2000),
  QCQUIRE_URL       VARCHAR2(2000),
  QCQUIRE_TIMESTAMP DATE
)
;
alter table RT_ACQUIRE_TIMESTAMP
  add primary key (ID);

prompt
prompt Creating table RT_RECEIVE
prompt =========================
prompt
create table RT_RECEIVE
(
  RT_RECEIVE_ID  VARCHAR2(200) not null,
  ORG_ID         VARCHAR2(200),
  SP_NO          VARCHAR2(20),
  SP_SERV_NO     VARCHAR2(20),
  MOBILE         VARCHAR2(20),
  RECEIVE_MSG    VARCHAR2(200),
  RECEIVE_TIME   DATE,
  PUSHED_TIME    DATE,
  IS_PUSHED      NUMBER(10),
  RESERVED_CHAR1 VARCHAR2(200),
  RESERVED_CHAR2 VARCHAR2(200),
  USER_ID        VARCHAR2(200)
)
;
alter table RT_RECEIVE
  add primary key (RT_RECEIVE_ID);

prompt
prompt Creating table RT_RECEIVE_BACKUP
prompt ================================
prompt
create table RT_RECEIVE_BACKUP
(
  RT_RECEIVE_ID  VARCHAR2(200) not null,
  ORG_ID         VARCHAR2(200),
  SP_NO          VARCHAR2(20),
  SP_SERV_NO     VARCHAR2(20),
  MOBILE         VARCHAR2(20),
  RECEIVE_MSG    VARCHAR2(200),
  RECEIVE_TIME   DATE,
  PUSHED_TIME    DATE,
  IS_PUSHED      NUMBER(10),
  RESERVED_CHAR1 VARCHAR2(200),
  RESERVED_CHAR2 VARCHAR2(200),
  USER_ID        VARCHAR2(200),
  BACKUP_TIME    DATE
)
;
alter table RT_RECEIVE_BACKUP
  add primary key (RT_RECEIVE_ID);

prompt
prompt Creating table RT_RECEIVE_REPORT_CONFIG
prompt =======================================
prompt
create table RT_RECEIVE_REPORT_CONFIG
(
  CONFIG_ID             VARCHAR2(200) not null,
  TYPE                  NUMBER(10),
  PUSH_MAX_NUMS         NUMBER(10),
  PUSH_FREQUSNCY        NUMBER(10),
  PUSH_TIMEOUT          NUMBER(10),
  PUSH_MARGIN           NUMBER(10),
  MAX_NO_RESPONSE_TIMES NUMBER(10),
  CPU_USERED            FLOAT,
  SMS_SEND_NUMS         NUMBER(10),
  PUSH_FREQUENCY        NUMBER(10),
  STATUS                NUMBER(10)
)
;
alter table RT_RECEIVE_REPORT_CONFIG
  add primary key (CONFIG_ID);

prompt
prompt Creating table RT_RECEIVE_REPORT_URL
prompt ====================================
prompt
create table RT_RECEIVE_REPORT_URL
(
  URL_ID           VARCHAR2(200) not null,
  ORG_ID           VARCHAR2(200),
  USER_ID          VARCHAR2(200),
  PUSH_CHANNEL     VARCHAR2(200),
  FORMAT_STR       NUMBER(10),
  PUSH_URL         VARCHAR2(200),
  PUSH_URL_TYPE    NUMBER(10),
  CREATE_TIME      DATE,
  STATUS           NUMBER(10),
  IS_CERTIFICATION NUMBER(10),
  USER_NAME        VARCHAR2(200),
  PASS_WORD        VARCHAR2(200),
  UANSWER_TIMES    NUMBER(10),
  NEXT_PUSH_TIME   DATE,
  USERNAME         VARCHAR2(200)
)
;
alter table RT_RECEIVE_REPORT_URL
  add primary key (URL_ID);

prompt
prompt Creating table RT_REPORT
prompt ========================
prompt
create table RT_REPORT
(
  SMS_ID      VARCHAR2(200) not null,
  SEQ_ID      VARCHAR2(200),
  ORG_ID      VARCHAR2(200),
  USER_ID     VARCHAR2(200),
  MOBILE      VARCHAR2(200),
  REPORT_TIME DATE,
  PUSHED_TIME DATE,
  SEND_STATUS NUMBER(10),
  ERROR_MSG   VARCHAR2(200),
  IS_PUSHED   NUMBER(10),
  CHANNEL_ID  NUMBER(10)
)
;
alter table RT_REPORT
  add primary key (SMS_ID);

prompt
prompt Creating table RT_REPORT_BACKUP
prompt ===============================
prompt
create table RT_REPORT_BACKUP
(
  SMS_ID      VARCHAR2(200) not null,
  SEQ_ID      VARCHAR2(200),
  ORG_ID      VARCHAR2(200),
  USER_ID     VARCHAR2(200),
  MOBILE      VARCHAR2(200),
  REPORT_TIME DATE,
  PUSHED_TIME DATE,
  BACKUP_TIME DATE,
  SEND_STATUS NUMBER(10),
  ERROR_MSG   VARCHAR2(200),
  IS_PUSHED   NUMBER(10),
  CHANNEL_ID  NUMBER(10)
)
;
alter table RT_REPORT_BACKUP
  add primary key (SMS_ID);

prompt
prompt Creating table RT_SNAPSHOT
prompt ==========================
prompt
create table RT_SNAPSHOT
(
  SNAPSHOT_ID      VARCHAR2(200) not null,
  TYPE             NUMBER(10),
  STATUS           NUMBER(10),
  CREATE_TIME      DATE,
  MODIFY_TIME      DATE,
  PRE_STOP_TIME    DATE,
  TOTAL_PUSH_COUNT NUMBER(10),
  OPERATOR         VARCHAR2(200)
)
;
alter table RT_SNAPSHOT
  add primary key (SNAPSHOT_ID);

prompt
prompt Creating table SEC_ACL
prompt ======================
prompt
create table SEC_ACL
(
  RESOURCE_ID           VARCHAR2(100) not null,
  RESOURCE_TYPE         VARCHAR2(20) not null,
  ROLE_ID               VARCHAR2(200) not null,
  PARTY_ID              VARCHAR2(100) not null,
  PARTY_TYPE            VARCHAR2(20) not null,
  CREATED_BY            VARCHAR2(100),
  CREATED_BY_NAME       VARCHAR2(100),
  IS_DEFAULT            VARCHAR2(10),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
comment on table SEC_ACL
  is '���ʿ����б������û���ĳ��Դ��ĳ��ɫ����һ��Ȩ�ޣ�';
comment on column SEC_ACL.RESOURCE_ID
  is '��Դ���';
comment on column SEC_ACL.RESOURCE_TYPE
  is '��Դ����,ColumnCategoryΪ��Ŀ��ColumnInfoΪ��Ŀ����';
comment on column SEC_ACL.ROLE_ID
  is '��ɫ���';
comment on column SEC_ACL.PARTY_ID
  is '����Ȩ��';
comment on column SEC_ACL.PARTY_TYPE
  is '����Ȩ����';
comment on column SEC_ACL.CREATED_BY
  is '������';
comment on column SEC_ACL.CREATED_BY_NAME
  is '����������';
comment on column SEC_ACL.IS_DEFAULT
  is '�Ƿ�ȱʡ�û�';
alter table SEC_ACL
  add constraint PK_SEC_ACL primary key (RESOURCE_ID, RESOURCE_TYPE, ROLE_ID, PARTY_ID, PARTY_TYPE);
create index SEC_ACL_TXCRTS on SEC_ACL (CREATED_TX_STAMP);
create index SEC_ACL_TXSTMP on SEC_ACL (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SEC_PARTY_ROLE
prompt =============================
prompt
create table SEC_PARTY_ROLE
(
  PARTY_TYPE VARCHAR2(100) not null,
  PARTY_ID   VARCHAR2(200) not null,
  ROLE_ID    VARCHAR2(200) not null,
  IS_DEFAULT VARCHAR2(10)
)
;
comment on table SEC_PARTY_ROLE
  is 'Party�ͽ�ɫ';
comment on column SEC_PARTY_ROLE.PARTY_TYPE
  is 'Party����';
comment on column SEC_PARTY_ROLE.PARTY_ID
  is 'Party���';
comment on column SEC_PARTY_ROLE.ROLE_ID
  is '��ɫ���';
comment on column SEC_PARTY_ROLE.IS_DEFAULT
  is '�Ƿ�ȱʡ�û�';
alter table SEC_PARTY_ROLE
  add constraint PK_SEC_PARTY_ROLE primary key (PARTY_TYPE, PARTY_ID, ROLE_ID);

prompt
prompt Creating table SEC_PERMISSION
prompt =============================
prompt
create table SEC_PERMISSION
(
  RESOURCE_TYPE   VARCHAR2(100) not null,
  PERMISSION_TYPE VARCHAR2(200) not null,
  DESCRIPTION     VARCHAR2(200)
)
;
comment on table SEC_PERMISSION
  is 'Ȩ�޵������ֵ�';
comment on column SEC_PERMISSION.RESOURCE_TYPE
  is '��Դ���ͣ��˵�����Ŀ����Ŀ���ࡢ�ͻ�';
comment on column SEC_PERMISSION.PERMISSION_TYPE
  is '����Ȩ�ޣ�����VIEW��CREATE......';
comment on column SEC_PERMISSION.DESCRIPTION
  is '��ע';
alter table SEC_PERMISSION
  add constraint PK_SEC_PERMISSION primary key (RESOURCE_TYPE, PERMISSION_TYPE);

prompt
prompt Creating table SEC_RESOURCE_TYPE
prompt ================================
prompt
create table SEC_RESOURCE_TYPE
(
  RESOURCE_TYPE      VARCHAR2(100) not null,
  SEQUENCE_ID        NUMBER(2),
  RESOURCE_TYPE_CODE VARCHAR2(100),
  RESOURCE_TYPE_NAME VARCHAR2(200),
  IS_FOR_INSTANCE    VARCHAR2(10),
  DESCRIPTION        VARCHAR2(200)
)
;
comment on table SEC_RESOURCE_TYPE
  is '��Դ���ͱ�';
comment on column SEC_RESOURCE_TYPE.RESOURCE_TYPE
  is '��Դ����, �˵�����Ŀ����Ŀ���ࡢ�ͻ�';
comment on column SEC_RESOURCE_TYPE.SEQUENCE_ID
  is '���';
comment on column SEC_RESOURCE_TYPE.RESOURCE_TYPE_CODE
  is '��Դ���ͱ��';
comment on column SEC_RESOURCE_TYPE.RESOURCE_TYPE_NAME
  is '��Դ��������';
comment on column SEC_RESOURCE_TYPE.IS_FOR_INSTANCE
  is '������Դ�Ƿ���Ҫ����Դʵ����Ȩ��Y�򲻿���ֱ����Ȩ���û�������Դ�Ľ�ɫ��N�����';
comment on column SEC_RESOURCE_TYPE.DESCRIPTION
  is '��ע';
alter table SEC_RESOURCE_TYPE
  add constraint PK_SEC_RESOURCE_TYPE primary key (RESOURCE_TYPE);

prompt
prompt Creating table SEC_ROLE
prompt =======================
prompt
create table SEC_ROLE
(
  ROLE_ID        VARCHAR2(100) not null,
  ROLE_TYPE      VARCHAR2(100),
  RESOURCE_TYPE  VARCHAR2(100),
  ROLE_NAME      VARCHAR2(200),
  DESCRIPTION    VARCHAR2(200),
  ORGANIZATIONID VARCHAR2(200),
  IS_PUBLIC      NUMBER(1)
)
;
comment on table SEC_ROLE
  is '��ɫʵ��';
comment on column SEC_ROLE.ROLE_ID
  is 'ϵͳ���';
comment on column SEC_ROLE.ROLE_TYPE
  is '��ɫ���ͣ�����������SYSTEM�Ľ�ɫҳ�治�ɼ������ɱ༭�����Ǻ�̨��ʹ�ã�COMMON�����';
comment on column SEC_ROLE.RESOURCE_TYPE
  is '��Դ���ͣ��˵�����Ŀ����Ŀ���ࡢ�ͻ�';
comment on column SEC_ROLE.ROLE_NAME
  is '��ɫ����';
comment on column SEC_ROLE.DESCRIPTION
  is '��ע';
alter table SEC_ROLE
  add constraint PK_SEC_ROLE primary key (ROLE_ID);

prompt
prompt Creating table SEC_ROLE_PERMISSION
prompt ==================================
prompt
create table SEC_ROLE_PERMISSION
(
  ROLE_ID        VARCHAR2(100) not null,
  RESOURCE_TYPE  VARCHAR2(200),
  RESOURCE_ID    VARCHAR2(200) not null,
  PARENT_ROLE_ID VARCHAR2(200) not null,
  ID             VARCHAR2(400) not null
)
;
comment on table SEC_ROLE_PERMISSION
  is '��ɫӵ�е�Ȩ��';
comment on column SEC_ROLE_PERMISSION.ROLE_ID
  is '��ɫ�ı��';
comment on column SEC_ROLE_PERMISSION.RESOURCE_TYPE
  is '��Դ����';
comment on column SEC_ROLE_PERMISSION.RESOURCE_ID
  is 'Ȩ��';
alter table SEC_ROLE_PERMISSION
  add constraint PK_SEC_ROLE_PERMISSION primary key (ID);

prompt
prompt Creating table SEC_ROLE_TYPE
prompt ============================
prompt
create table SEC_ROLE_TYPE
(
  ROLE_TYPE   VARCHAR2(100) not null,
  ROLE_NAME   VARCHAR2(200),
  DESCRIPTION VARCHAR2(200)
)
;
comment on table SEC_ROLE_TYPE
  is '��ɫ����';
comment on column SEC_ROLE_TYPE.ROLE_TYPE
  is '��ɫ���ͣ�����������SYSTEM�Ľ�ɫҳ�治�ɼ������ɱ༭�����Ǻ�̨��ʹ�ã�COMMON�����';
comment on column SEC_ROLE_TYPE.ROLE_NAME
  is '��ɫ����';
comment on column SEC_ROLE_TYPE.DESCRIPTION
  is '��ע';
alter table SEC_ROLE_TYPE
  add constraint PK_SEC_ROLE_TYPE primary key (ROLE_TYPE);

prompt
prompt Creating table SEND
prompt ===================
prompt
create table SEND
(
  SEND_ID                VARCHAR2(200) not null,
  MOBILE_TO              VARCHAR2(20) not null,
  SEND_MSG               VARCHAR2(4000),
  SP_SERV_NO             VARCHAR2(20),
  SYS_TIME               TIMESTAMP(6) default sysdate,
  PRIOR_ID               NUMBER(1) default 3,
  PRE_SEND_TIME          TIMESTAMP(6) default sysdate,
  SEND_STATUS            NUMBER(2) default 0,
  SEND_TIME              TIMESTAMP(6) default sysdate,
  COM_RTN_TIME           TIMESTAMP(6),
  ERR_MSG                VARCHAR2(500),
  REPORT                 VARCHAR2(100),
  REPORT_TIME            TIMESTAMP(6),
  CHANNEL_ID             NUMBER(4) default 1,
  MOBILE_COM             NUMBER(2),
  REMARK                 VARCHAR2(500),
  USER_ID                VARCHAR2(200),
  SEQUENCE               VARCHAR2(128),
  MOBILE_QUANTITIES      NUMBER(4) default 1,
  RESEND_TIMES           NUMBER(1) default 0,
  SIGNATURE              VARCHAR2(40),
  USER_ORGANIZATION      VARCHAR2(200),
  BATCH_ID               VARCHAR2(200),
  MSG_TYPE               VARCHAR2(50),
  CONSUME_SEND_ID        VARCHAR2(200),
  IS_LONGSMS             NUMBER(3) default 0,
  IS_ORIGINAL_SMS        NUMBER(3) default 0,
  ORIGINALSMS_SENDID     VARCHAR2(200),
  CURRENT_PAGENO         NUMBER(3),
  ORIGINALSMS_TOTALPAGES NUMBER(3),
  LONGSMS_TAG            NUMBER(4),
  LONGSMS_SPLITED        NUMBER(1) default 0,
  GW_SUBMIT_TIME         TIMESTAMP(6),
  GW_DONE_TIME           TIMESTAMP(6),
  UNIT_PRICE             NUMBER(10,3),
  RETURN_FEE             NUMBER(1) default 0,
  RECEIVE_ID             VARCHAR2(200),
  OPERATOR_ID            VARCHAR2(200),
  DEDUCT_FEE_STATUS      NUMBER(1) default 1,
  EXTRA_KEYWORD_NUM      VARCHAR2(200)
)
;
comment on table SEND
  is '���ж�����Ϣ��';
comment on column SEND.SEND_ID
  is '���ж�����ţ����ж��ŵ�Ψһ��ʶ';
comment on column SEND.MOBILE_TO
  is 'Ŀ���ֻ���';
comment on column SEND.SEND_MSG
  is '��������';
comment on column SEND.SP_SERV_NO
  is '��չ��';
comment on column SEND.SYS_TIME
  is '���ʱ��';
comment on column SEND.PRIOR_ID
  is '���ȼ���ֻ��3�����ȼ���3Ϊ��� ,8Ϊ��ͣ�5Ϊ�е����ȼ�';
comment on column SEND.PRE_SEND_TIME
  is 'Ԥ�Ʒ���ʱ��';
comment on column SEND.SEND_STATUS
  is '����״̬ -2δ�Ʒ�, 0����, 1���ύ, 2������, 4��ɾ��, 5���ͳɹ�, 6����ʧ��, 7ϵͳ������.8 Υ���ʱ�������״̬��-1�ƻ����� 3�ط��� 8�����ط�ʧ�ܡ���������';
comment on column SEND.SEND_TIME
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column SEND.COM_RTN_TIME
  is '���ͺ��ƶ�����ͨ���ط��ؽ����ʱ��';
comment on column SEND.ERR_MSG
  is '����ʧ��ʱ���ƶ���ͨ���ط��صĴ�����Ϣ��ֻ���ڷ���ʧ��ʱ�����ֶ���ֵ������ʱ��δ��';
comment on column SEND.REPORT
  is '�ֻ�����״̬���档�����ֶ�';
comment on column SEND.REPORT_TIME
  is '�ֻ�����״̬���淵��ʱ��';
comment on column SEND.CHANNEL_ID
  is 'ͨ��ID';
comment on column SEND.MOBILE_COM
  is '��Ӫ��ID��1Ϊ�ƶ���2Ϊ��ͨ,3Ϊ����';
comment on column SEND.REMARK
  is '��ע��Ϣ����Ϊ�ⲿϵͳ��չ�ã�CC����ϵͳ���ֶ���д�����˺�';
comment on column SEND.USER_ID
  is '���û�id����Ϊ����������';
comment on column SEND.SEQUENCE
  is '��������';
comment on column SEND.MOBILE_QUANTITIES
  is '������Ϣ������';
comment on column SEND.RESEND_TIMES
  is 'ƽ̨�������ύ�ö��ŵĴ���';
comment on column SEND.SIGNATURE
  is 'ǩ��';
comment on column SEND.USER_ORGANIZATION
  is '�û���id';
comment on column SEND.BATCH_ID
  is '���κ�';
comment on column SEND.MSG_TYPE
  is '��Ϣ����,��¼���Ų����ķ�ʽ';
comment on column SEND.CONSUME_SEND_ID
  is '�ͻ��˶���id��';
comment on column SEND.IS_LONGSMS
  is '�ö����Ƿ��ǳ�����,0:���ǳ�����,1:�ǳ�����';
comment on column SEND.IS_ORIGINAL_SMS
  is '�ö����Ƿ���ԭʼ����,��ԭʼ����ָ�����ŷ���ʱ��ֳ��Ķ���,0:��ԭʼ����, 1:����ԭʼ����';
comment on column SEND.ORIGINALSMS_SENDID
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column SEND.CURRENT_PAGENO
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column SEND.ORIGINALSMS_TOTALPAGES
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column SEND.LONGSMS_TAG
  is '�����Ŷ���ʶ����ͬһ�������ŵĶ̶��Ÿñ�ʶ��ͬ';
comment on column SEND.LONGSMS_SPLITED
  is '�������Ƿ񱻲�֣�0û�б���ֻ�������ͨ���ţ�1�Ѿ�����֡�����ֵĶ��Ų�ѯͳ��ʱ��Ӧ����������Ĭ��0';
comment on column SEND.GW_SUBMIT_TIME
  is '�ύ�����ص�ʱ��';
comment on column SEND.GW_DONE_TIME
  is '�ֻ��յ����ŵ�ʱ��';
comment on column SEND.UNIT_PRICE
  is '���ŵ���';
comment on column SEND.RETURN_FEE
  is '�Ƿ��Ѹ��������ŷ�������,0:û����,1:�ѷ���';
comment on column SEND.RECEIVE_ID
  is 'CMPP�˺�';
comment on column SEND.OPERATOR_ID
  is '���ŷ�����(���ŷ��͵Ĳ�����)';
comment on column SEND.DEDUCT_FEE_STATUS
  is '�۳�����״̬:0-�۷�ʧ��,1-�۷ѳɹ���(��ʱΪCMPP�ӿڶ���ʹ��,������վ���Ķ��Ų��ô��ֶ�)';
comment on column SEND.EXTRA_KEYWORD_NUM
  is '�������˶��ؼ��ֺ����ӵ�����';
alter table SEND
  add constraint MOBILEINFOPLAT_PK_PARAMY_1 primary key (SEND_ID);
create index IDX_ALL_SCAN_NEW_1 on SEND (CHANNEL_ID, SEND_STATUS, SYS_TIME, RESEND_TIMES, PRIOR_ID, PRE_SEND_TIME);
create index IDX_SEND_MOBILE_NEW_1 on SEND (MOBILE_TO);
create index IDX_SEND_PRIOR_ID_NEW_1 on SEND (PRIOR_ID);
create index IDX_SEND_SEND_STATUS_NEW_1 on SEND (SEND_STATUS);
create index IDX_SEND_SEQUENCE_NEW_1 on SEND (SEQUENCE);
create index IDX_SEND_SYS_TIME_NEW_1 on SEND (SYS_TIME);
create index IDX_SEQ_STATS_CHAN_NEW_1 on SEND (SEQUENCE, SEND_STATUS, CHANNEL_ID);
create index IIDX_SEND_BATCH_ID_NEW_1 on SEND (BATCH_ID);

prompt
prompt Creating table SEND_SPEED_TIME
prompt ==============================
prompt
create table SEND_SPEED_TIME
(
  ID            VARCHAR2(200) not null,
  NOT_SENDCOUNT VARCHAR2(20),
  CHANNEL       VARCHAR2(20),
  SPEED         VARCHAR2(20),
  TIME          VARCHAR2(100),
  STATUS        NUMBER(2),
  SYS_TIME      VARCHAR2(50),
  CREATE_TIME   DATE default sysdate
)
;
comment on table SEND_SPEED_TIME
  is '����ÿ�μ��㷢���������Ҫ����ʱ���¼';
comment on column SEND_SPEED_TIME.ID
  is 'ϵͳid';
comment on column SEND_SPEED_TIME.NOT_SENDCOUNT
  is '������������(״̬����0,2)';
comment on column SEND_SPEED_TIME.CHANNEL
  is 'ͨ������';
comment on column SEND_SPEED_TIME.SPEED
  is '�ٶ�';
comment on column SEND_SPEED_TIME.TIME
  is '��Ҫ���ѵ�ʱ��,��λ����';
comment on column SEND_SPEED_TIME.STATUS
  is '1����,2��æ,3�쳣';
comment on column SEND_SPEED_TIME.SYS_TIME
  is '��ȡ��Ϣ��ʱ��';
comment on column SEND_SPEED_TIME.CREATE_TIME
  is '����ʱ��';
alter table SEND_SPEED_TIME
  add constraint PK_SEND_SPEED_TIME primary key (ID);

prompt
prompt Creating table SEND_STATICS_QUANTITY
prompt ====================================
prompt
create table SEND_STATICS_QUANTITY
(
  CHANNEL_ID          NUMBER(18) not null,
  TOTAL_QUANTITY      NUMBER(18) default 0,
  WAIT_SEND_QUANTITY  NUMBER(18) default 0,
  SENDING_QUANTITY    NUMBER(18) default 0,
  SENT_QUANTITY       NUMBER(18) default 0,
  SUCCESS_QUANTITY    NUMBER(18) default 0,
  FAILED_QUANTITY     NUMBER(18) default 0,
  BLACK_QUANTITY      NUMBER(18) default 0,
  PROHIBITED_QUANTITY NUMBER(18) default 0,
  RECEIVE_QUANTITY    NUMBER(18) default 0,
  CREATE_TIME         DATE not null
)
;
comment on table SEND_STATICS_QUANTITY
  is '��״̬��������';
comment on column SEND_STATICS_QUANTITY.CHANNEL_ID
  is '0Ϊ����ͨ��';
comment on column SEND_STATICS_QUANTITY.TOTAL_QUANTITY
  is '����';
comment on column SEND_STATICS_QUANTITY.WAIT_SEND_QUANTITY
  is '����������,״̬Ϊ0';
comment on column SEND_STATICS_QUANTITY.SENDING_QUANTITY
  is '����������,״̬Ϊ2';
comment on column SEND_STATICS_QUANTITY.SENT_QUANTITY
  is '���ύ����';
comment on column SEND_STATICS_QUANTITY.SUCCESS_QUANTITY
  is '�ɹ�����';
comment on column SEND_STATICS_QUANTITY.FAILED_QUANTITY
  is 'ʧ������';
comment on column SEND_STATICS_QUANTITY.BLACK_QUANTITY
  is '����������';
comment on column SEND_STATICS_QUANTITY.PROHIBITED_QUANTITY
  is 'Υ��������';
comment on column SEND_STATICS_QUANTITY.RECEIVE_QUANTITY
  is '��������';
comment on column SEND_STATICS_QUANTITY.CREATE_TIME
  is '������ʱ��';
alter table SEND_STATICS_QUANTITY
  add constraint PK_SEND_STATICS_QUANTITY primary key (CHANNEL_ID, CREATE_TIME);

prompt
prompt Creating table SEND_STATICS_QUANTITY_TEMP
prompt =========================================
prompt
create table SEND_STATICS_QUANTITY_TEMP
(
  CHANNEL_ID          NUMBER(18) not null,
  TOTAL_QUANTITY      NUMBER(18) default 0,
  WAIT_SEND_QUANTITY  NUMBER(18) default 0,
  SENDING_QUANTITY    NUMBER(18) default 0,
  SENT_QUANTITY       NUMBER(18) default 0,
  SUCCESS_QUANTITY    NUMBER(18) default 0,
  FAILED_QUANTITY     NUMBER(18) default 0,
  BLACK_QUANTITY      NUMBER(18) default 0,
  PROHIBITED_QUANTITY NUMBER(18) default 0,
  RECEIVE_QUANTITY    NUMBER(18) default 0,
  CREATE_TIME         DATE
)
;
comment on table SEND_STATICS_QUANTITY_TEMP
  is '��״̬��������';
comment on column SEND_STATICS_QUANTITY_TEMP.CHANNEL_ID
  is '0Ϊ����ͨ��';
comment on column SEND_STATICS_QUANTITY_TEMP.TOTAL_QUANTITY
  is '����';
comment on column SEND_STATICS_QUANTITY_TEMP.WAIT_SEND_QUANTITY
  is '����������,״̬Ϊ0';
comment on column SEND_STATICS_QUANTITY_TEMP.SENDING_QUANTITY
  is '����������,״̬Ϊ2';
comment on column SEND_STATICS_QUANTITY_TEMP.SENT_QUANTITY
  is '���ύ����';
comment on column SEND_STATICS_QUANTITY_TEMP.SUCCESS_QUANTITY
  is '�ɹ�����';
comment on column SEND_STATICS_QUANTITY_TEMP.FAILED_QUANTITY
  is 'ʧ������';
comment on column SEND_STATICS_QUANTITY_TEMP.BLACK_QUANTITY
  is '����������';
comment on column SEND_STATICS_QUANTITY_TEMP.PROHIBITED_QUANTITY
  is 'Υ��������';
comment on column SEND_STATICS_QUANTITY_TEMP.RECEIVE_QUANTITY
  is '��������';
comment on column SEND_STATICS_QUANTITY_TEMP.CREATE_TIME
  is '������ʱ��';
alter table SEND_STATICS_QUANTITY_TEMP
  add constraint PK_SEND_STATICS_QUANTITY_TEMP primary key (CHANNEL_ID);

prompt
prompt Creating table SEQUENCE_VALUE_ITEM
prompt ==================================
prompt
create table SEQUENCE_VALUE_ITEM
(
  SEQ_NAME              VARCHAR2(60) not null,
  SEQ_ID                NUMBER(18),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
alter table SEQUENCE_VALUE_ITEM
  add constraint PK_SEQUENCE_VALUE_ITEM primary key (SEQ_NAME);
create index SQNC_VL_ITM_TXCRTS on SEQUENCE_VALUE_ITEM (CREATED_TX_STAMP);
create index SQNC_VL_ITM_TXSTMP on SEQUENCE_VALUE_ITEM (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SGW_ACCOUNT_CHANNEL
prompt ==================================
prompt
create table SGW_ACCOUNT_CHANNEL
(
  ID                NUMBER(18) not null,
  SGW_ID            NUMBER(18),
  SP_NUMBER         VARCHAR2(20) not null,
  CHANNEL_ID        NUMBER(4) not null,
  SUB_EXTEND_NUMBER VARCHAR2(5),
  MOBILE_COM        NUMBER(1) not null,
  CHANNEL_STATUS    CHAR(1) default '1' not null,
  SYS_TIME          DATE default SYSDATE not null
)
;
comment on table SGW_ACCOUNT_CHANNEL
  is 'CMPP�˻�ͨ����';
comment on column SGW_ACCOUNT_CHANNEL.ID
  is '����';
comment on column SGW_ACCOUNT_CHANNEL.SGW_ID
  is '����ID';
comment on column SGW_ACCOUNT_CHANNEL.SP_NUMBER
  is '�ط���';
comment on column SGW_ACCOUNT_CHANNEL.CHANNEL_ID
  is 'ͨ��ID';
comment on column SGW_ACCOUNT_CHANNEL.SUB_EXTEND_NUMBER
  is '����չ��';
comment on column SGW_ACCOUNT_CHANNEL.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�, 2:��ͨ, 3:����';
comment on column SGW_ACCOUNT_CHANNEL.CHANNEL_STATUS
  is 'ͨ��״̬ 0:ͣ��, 1:����';
comment on column SGW_ACCOUNT_CHANNEL.SYS_TIME
  is '���ʱ��';
alter table SGW_ACCOUNT_CHANNEL
  add constraint PK_SGW_ACCOUNT_CHANNEL primary key (ID);

prompt
prompt Creating table SGW_ACCOUNT_INFO
prompt ===============================
prompt
create table SGW_ACCOUNT_INFO
(
  SGW_ID               NUMBER(18) not null,
  USER_ID              VARCHAR2(200),
  ACCOUNT_PASS         VARCHAR2(16),
  REGISTED_IP          VARCHAR2(200),
  PRIOR_ID             CHAR(1),
  FLUX_LIMIT           NUMBER(4),
  MT_WORKER_NUM        NUMBER(4),
  MT_CACHE_NUM         NUMBER(10),
  SERVER_ACTIVE_TEST   CHAR(1),
  IS_CHANNEL_ACCOUNT   CHAR(1),
  SIGNATURE_TYPE       CHAR(1),
  CHECK_PROHIBITEDWORD CHAR(1),
  COMMENTS             VARCHAR2(200),
  SYS_TIME             DATE default SYSDATE
)
;
comment on table SGW_ACCOUNT_INFO
  is 'CMPP������Ϣ��';
comment on column SGW_ACCOUNT_INFO.SGW_ID
  is '����ID';
comment on column SGW_ACCOUNT_INFO.USER_ID
  is '�û�UUID';
comment on column SGW_ACCOUNT_INFO.ACCOUNT_PASS
  is 'CMPP�˻���������';
comment on column SGW_ACCOUNT_INFO.REGISTED_IP
  is '��֤IP';
comment on column SGW_ACCOUNT_INFO.PRIOR_ID
  is '���ȼ�';
comment on column SGW_ACCOUNT_INFO.FLUX_LIMIT
  is '����';
comment on column SGW_ACCOUNT_INFO.MT_WORKER_NUM
  is '���д����߳�����';
comment on column SGW_ACCOUNT_INFO.MT_CACHE_NUM
  is '���л�����г���';
comment on column SGW_ACCOUNT_INFO.SERVER_ACTIVE_TEST
  is '����˷�����·��� 0:������, 1:����';
comment on column SGW_ACCOUNT_INFO.IS_CHANNEL_ACCOUNT
  is '�Ƿ������˺ţ� 0:��, 1:��';
comment on column SGW_ACCOUNT_INFO.SIGNATURE_TYPE
  is 'ǩ�����ͣ�1����ͨ����ǩ����2���Ӷ˿�����ǩ����3������ǩ������Ҫͨ��ǩ���ع��˼�飩';
comment on column SGW_ACCOUNT_INFO.CHECK_PROHIBITEDWORD
  is '�Ƿ���Υ���ʣ� 0:��, 1:��';
comment on column SGW_ACCOUNT_INFO.COMMENTS
  is '��ע';
comment on column SGW_ACCOUNT_INFO.SYS_TIME
  is '���ʱ��';
alter table SGW_ACCOUNT_INFO
  add constraint PK_SGW_ACCOUNT_INFO primary key (SGW_ID);
alter table SGW_ACCOUNT_INFO
  add constraint FK_SGW_ACCO_REFERENCE_USER_INF foreign key (USER_ID)
  references USER_INFO (USER_ID);

prompt
prompt Creating table SGW_CUSTOMER
prompt ===========================
prompt
create table SGW_CUSTOMER
(
  CUSTOMER_ID       NUMBER(18) not null,
  CUSTOMER_NAME     VARCHAR2(100),
  P_CUSTOMER_ID     NUMBER(18) not null,
  USER_ID           VARCHAR2(200) not null,
  ORG_ID            VARCHAR2(200) not null,
  SUB_EXTEND_NUMBER VARCHAR2(5),
  COMMENTS          VARCHAR2(200),
  CUSTOMER_STATUS   CHAR(1),
  SYS_TIME          DATE default SYSDATE
)
;
comment on table SGW_CUSTOMER
  is '���ؿͻ���';
comment on column SGW_CUSTOMER.CUSTOMER_ID
  is '�ͻ�ID';
comment on column SGW_CUSTOMER.CUSTOMER_NAME
  is '�ͻ�����';
comment on column SGW_CUSTOMER.P_CUSTOMER_ID
  is '���ͻ�ID������Ϊ0';
comment on column SGW_CUSTOMER.USER_ID
  is '�û�UUID';
comment on column SGW_CUSTOMER.ORG_ID
  is '�������';
comment on column SGW_CUSTOMER.SUB_EXTEND_NUMBER
  is '����չ��';
comment on column SGW_CUSTOMER.COMMENTS
  is '��ע';
comment on column SGW_CUSTOMER.CUSTOMER_STATUS
  is '�˺�״̬ 0:ͣ��, 1:����';
comment on column SGW_CUSTOMER.SYS_TIME
  is '���ʱ��';
alter table SGW_CUSTOMER
  add constraint PK_SGW_CHANNEL_CUSTOMER primary key (CUSTOMER_ID);

prompt
prompt Creating table SGW_MO_TASK
prompt ==========================
prompt
create table SGW_MO_TASK
(
  RECEIVE_ID         NUMBER(18) not null,
  MOBILE_FROM        VARCHAR2(30),
  RECEIVE_MSG        VARCHAR2(200),
  SP_NO              VARCHAR2(20),
  READ_USER_GROUP_ID VARCHAR2(200),
  USER_ID            VARCHAR2(50),
  CHANNEL_ID         NUMBER(2),
  RECEIVE_TIME       DATE,
  RECEIVE_STATUS     CHAR(1),
  NEXT_PUSH_TIME     DATE,
  PUSH_TIMES         NUMBER(18)
)
;
comment on table SGW_MO_TASK
  is '���ж��������HTTP���ʹ����';
comment on column SGW_MO_TASK.MOBILE_FROM
  is '�����ֻ�����';
alter table SGW_MO_TASK
  add constraint PK_SGW_MO_TASK primary key (RECEIVE_ID);

prompt
prompt Creating table SGW_REPORT_TASK
prompt ==============================
prompt
create table SGW_REPORT_TASK
(
  TASK_ID           NUMBER(18) not null,
  SEND_ID           VARCHAR2(200),
  MOBILE_TO         VARCHAR2(30),
  DESTNATION_ID     VARCHAR2(30),
  STAT              VARCHAR2(20),
  MSG_ID            VARCHAR2(20),
  USER_ORGANIZATION VARCHAR2(200),
  USER_ID           VARCHAR2(50),
  CHANNEL_ID        NUMBER(2),
  SYS_TIME          DATE,
  SUBMIT_TIME       DATE,
  DONE_TIME         DATE,
  REPORT_TIME       DATE,
  PUSH_STATUS       CHAR(1),
  NEXT_PUSH_TIME    DATE,
  PUSH_TIMES        NUMBER(18)
)
;
comment on table SGW_REPORT_TASK
  is '��������״̬���������';
comment on column SGW_REPORT_TASK.TASK_ID
  is '������';
comment on column SGW_REPORT_TASK.SEND_ID
  is '���ű��';
comment on column SGW_REPORT_TASK.MOBILE_TO
  is '�ֻ���';
comment on column SGW_REPORT_TASK.DESTNATION_ID
  is '�ط���';
comment on column SGW_REPORT_TASK.STAT
  is '״̬��';
comment on column SGW_REPORT_TASK.MSG_ID
  is '������ͻ��˵Ķ��ű��';
comment on column SGW_REPORT_TASK.USER_ORGANIZATION
  is '�������';
comment on column SGW_REPORT_TASK.USER_ID
  is '�û����';
comment on column SGW_REPORT_TASK.CHANNEL_ID
  is 'ͨ�����';
comment on column SGW_REPORT_TASK.SYS_TIME
  is '���ʱ��';
comment on column SGW_REPORT_TASK.SUBMIT_TIME
  is '�����ύʱ��';
comment on column SGW_REPORT_TASK.DONE_TIME
  is '���ŷ���ʱ��';
comment on column SGW_REPORT_TASK.REPORT_TIME
  is '״̬����ʱ��';
comment on column SGW_REPORT_TASK.PUSH_STATUS
  is '����״̬��0�������ͣ�2�������У�5�����ͳɹ���6������ʧ��';
comment on column SGW_REPORT_TASK.NEXT_PUSH_TIME
  is '�´�����ʱ��';
comment on column SGW_REPORT_TASK.PUSH_TIMES
  is '���ʹ���';
alter table SGW_REPORT_TASK
  add constraint PK_SGW_REPORT_TASK primary key (TASK_ID);
create index IDX_SGW_REPORT_TASK_SENDID on SGW_REPORT_TASK (SEND_ID);

prompt
prompt Creating table SGW_REPORT_TASK_HIS
prompt ==================================
prompt
create table SGW_REPORT_TASK_HIS
(
  TASK_ID           NUMBER(18) not null,
  SEND_ID           VARCHAR2(200),
  MOBILE_TO         VARCHAR2(30),
  DESTNATION_ID     VARCHAR2(30),
  STAT              VARCHAR2(20),
  MSG_ID            VARCHAR2(20),
  USER_ORGANIZATION VARCHAR2(200),
  USER_ID           VARCHAR2(50),
  CHANNEL_ID        NUMBER(2),
  SYS_TIME          DATE,
  SUBMIT_TIME       DATE,
  DONE_TIME         DATE,
  REPORT_TIME       DATE,
  PUSH_STATUS       CHAR(1),
  NEXT_PUSH_TIME    DATE,
  PUSH_TIMES        NUMBER(18),
  LOG_TIME          DATE
)
;
comment on table SGW_REPORT_TASK_HIS
  is '����״̬������������ʷ��';
comment on column SGW_REPORT_TASK_HIS.TASK_ID
  is '������';
comment on column SGW_REPORT_TASK_HIS.SEND_ID
  is '���ű��';
comment on column SGW_REPORT_TASK_HIS.MOBILE_TO
  is '�ֻ���';
comment on column SGW_REPORT_TASK_HIS.DESTNATION_ID
  is '�ط���';
comment on column SGW_REPORT_TASK_HIS.STAT
  is '״̬��';
comment on column SGW_REPORT_TASK_HIS.MSG_ID
  is '������ͻ��˵Ķ��ű��';
comment on column SGW_REPORT_TASK_HIS.USER_ORGANIZATION
  is '�������';
comment on column SGW_REPORT_TASK_HIS.USER_ID
  is '�û����';
comment on column SGW_REPORT_TASK_HIS.CHANNEL_ID
  is 'ͨ�����';
comment on column SGW_REPORT_TASK_HIS.SYS_TIME
  is '���ʱ��';
comment on column SGW_REPORT_TASK_HIS.SUBMIT_TIME
  is '�����ύʱ��';
comment on column SGW_REPORT_TASK_HIS.DONE_TIME
  is '���ŷ���ʱ��';
comment on column SGW_REPORT_TASK_HIS.REPORT_TIME
  is '״̬����ʱ��';
comment on column SGW_REPORT_TASK_HIS.PUSH_STATUS
  is '����״̬';
comment on column SGW_REPORT_TASK_HIS.NEXT_PUSH_TIME
  is '�´�����ʱ��';
comment on column SGW_REPORT_TASK_HIS.PUSH_TIMES
  is '���ʹ���';
alter table SGW_REPORT_TASK_HIS
  add constraint PK_SGW_REPORT_TASK_HIS primary key (TASK_ID);
create index IDX_SGW_REPORT_TASK_HIS_SENDID on SGW_REPORT_TASK_HIS (SEND_ID);

prompt
prompt Creating table SGW_SIGNATURE_POOL
prompt =================================
prompt
create table SGW_SIGNATURE_POOL
(
  SIGNATURE_ID     NUMBER(18) not null,
  CUSTOMER_ID      NUMBER(18),
  SIGNATURE        VARCHAR2(40) not null,
  DESCRIPTION      VARCHAR2(200),
  SORT_INDEX       NUMBER(4),
  DO_APPEND_MSG    CHAR(1),
  APPEND_MSG       VARCHAR2(100),
  BLACK_LEVEL      CHAR(1) default '0' not null,
  COMMENTS         VARCHAR2(200),
  SIGNATURE_STATUS CHAR(1) default '1',
  SYS_TIME         DATE default SYSDATE
)
;
comment on table SGW_SIGNATURE_POOL
  is '���ؿͻ�ǩ���ر�';
comment on column SGW_SIGNATURE_POOL.SIGNATURE_ID
  is 'ǩ��ID';
comment on column SGW_SIGNATURE_POOL.CUSTOMER_ID
  is '�ͻ�ID';
comment on column SGW_SIGNATURE_POOL.SIGNATURE
  is 'ǩ��';
comment on column SGW_SIGNATURE_POOL.DESCRIPTION
  is '����';
comment on column SGW_SIGNATURE_POOL.SORT_INDEX
  is '������';
comment on column SGW_SIGNATURE_POOL.DO_APPEND_MSG
  is '�Ƿ��Զ���Ӷ������� 0:�����, 1:���';
comment on column SGW_SIGNATURE_POOL.APPEND_MSG
  is '�Զ���ӵĶ�������';
comment on column SGW_SIGNATURE_POOL.BLACK_LEVEL
  is '����������0��ֻ���BLACK��������1�����BLACK��BLACK_CSMD��������2�����BLACK��BLACK_CSMD��BLACK_ZHUOYUE������';
comment on column SGW_SIGNATURE_POOL.COMMENTS
  is '��ע';
comment on column SGW_SIGNATURE_POOL.SIGNATURE_STATUS
  is '״̬ 0:ͣ��, 1:����';
comment on column SGW_SIGNATURE_POOL.SYS_TIME
  is '���ʱ��';
alter table SGW_SIGNATURE_POOL
  add constraint PK_SGW_SIGNATURE_POOL primary key (SIGNATURE_ID);
create unique index UDX_SGW_SIGNATURE on SGW_SIGNATURE_POOL (SIGNATURE);

prompt
prompt Creating table SMS_BIR_CONFIG
prompt =============================
prompt
create table SMS_BIR_CONFIG
(
  SMS_BIR_CONFIG_ID      VARCHAR2(200) not null,
  USER_GROUP_ID          VARCHAR2(200) not null,
  USER_GROUP_NAME        VARCHAR2(200),
  DO_CONGRATULATIONS     VARCHAR2(20),
  SOURCE_ENTITY_NAME     VARCHAR2(40),
  ACCOUNT_NAME_FIELD     VARCHAR2(200),
  ACCOUNT_BIRTHDAY_FIELD VARCHAR2(200),
  MOBILE_NUMBER_FIELD    VARCHAR2(200),
  MESSAGE_TEMPLATE       VARCHAR2(200),
  SEND_TIME              DATE,
  USE_ACCOUNT_INFO       VARCHAR2(20),
  USE_ODS                VARCHAR2(20),
  GROUP_IDS              VARCHAR2(2000),
  USER_ID                VARCHAR2(200),
  USER_NAME              VARCHAR2(200)
)
;
comment on column SMS_BIR_CONFIG.USER_GROUP_ID
  is '�����û���';
comment on column SMS_BIR_CONFIG.USER_GROUP_NAME
  is ' �����û�������';
comment on column SMS_BIR_CONFIG.DO_CONGRATULATIONS
  is '�Ƿ��������ף��';
comment on column SMS_BIR_CONFIG.SOURCE_ENTITY_NAME
  is '����Դ����';
comment on column SMS_BIR_CONFIG.ACCOUNT_NAME_FIELD
  is '�ͻ������ֶ�';
comment on column SMS_BIR_CONFIG.ACCOUNT_BIRTHDAY_FIELD
  is '�����ֶ�';
comment on column SMS_BIR_CONFIG.MOBILE_NUMBER_FIELD
  is '�ֻ������ֶ�';
comment on column SMS_BIR_CONFIG.MESSAGE_TEMPLATE
  is '����ģ��';
comment on column SMS_BIR_CONFIG.SEND_TIME
  is '���ŷ���ʱ��';
comment on column SMS_BIR_CONFIG.GROUP_IDS
  is 'Ⱥ��ID';
comment on column SMS_BIR_CONFIG.USER_ID
  is ' �����û�';
comment on column SMS_BIR_CONFIG.USER_NAME
  is ' �����û�����';
alter table SMS_BIR_CONFIG
  add primary key (SMS_BIR_CONFIG_ID);

prompt
prompt Creating table SMS_BIR_RECORD
prompt =============================
prompt
create table SMS_BIR_RECORD
(
  SMS_BIR_RECORD_ID VARCHAR2(200) not null,
  USER_GROUP_ID     VARCHAR2(200),
  USER_GROUP_NAME   VARCHAR2(200),
  USER_ID           VARCHAR2(200),
  SEND_TIME         DATE,
  STATUS            VARCHAR2(20),
  SEND_QUANTITY     VARCHAR2(40),
  TEMPLATE          VARCHAR2(200),
  USER_NAME         VARCHAR2(200)
)
;
comment on column SMS_BIR_RECORD.USER_ID
  is '����ʱ��';
comment on column SMS_BIR_RECORD.SEND_TIME
  is '���ŷ���ʱ��';
comment on column SMS_BIR_RECORD.STATUS
  is '2:�ѷ���';
comment on column SMS_BIR_RECORD.SEND_QUANTITY
  is '��������';
comment on column SMS_BIR_RECORD.TEMPLATE
  is '����ģ��';
comment on column SMS_BIR_RECORD.USER_NAME
  is '�û���';
alter table SMS_BIR_RECORD
  add primary key (SMS_BIR_RECORD_ID);

prompt
prompt Creating table SMS_BIR_RECORD_DETAIL
prompt ====================================
prompt
create table SMS_BIR_RECORD_DETAIL
(
  SMS_BIR_RECORD_DETAIL_ID VARCHAR2(200) not null,
  SMS_BIR_RECORD_ID        VARCHAR2(200),
  USER_GROUP_ID            VARCHAR2(200),
  USER_GROUP_NAME          VARCHAR2(200),
  USER_ID                  VARCHAR2(200),
  MOBILE_NUMBER            VARCHAR2(200),
  ACCOUNT_NAME             VARCHAR2(200),
  MESSAGE_CONTENT          VARCHAR2(200)
)
;
alter table SMS_BIR_RECORD_DETAIL
  add primary key (SMS_BIR_RECORD_DETAIL_ID);

prompt
prompt Creating table SMS_CHANNEL_ANALYZE
prompt ==================================
prompt
create table SMS_CHANNEL_ANALYZE
(
  CHANNEL_ID    NUMBER(5),
  ORG_ID        VARCHAR2(200),
  STAT_TIME     NUMBER(10),
  STATUS        NUMBER(5),
  QUANTITY      NUMBER(10),
  PARENT_ORG_ID VARCHAR2(200)
)
;

prompt
prompt Creating table SMS_CHANNEL_RULE_SET
prompt ===================================
prompt
create table SMS_CHANNEL_RULE_SET
(
  RULE_SET_ID       VARCHAR2(20) not null,
  RULE_SET_NAME     VARCHAR2(200),
  RULE_SET_TYPE     VARCHAR2(20),
  DC_FILE_PATH      VARCHAR2(200),
  RULE_STATUS       VARCHAR2(20),
  USER_ORGANIZATION VARCHAR2(20),
  USER_ORG_NAME     VARCHAR2(20),
  USER_ID           VARCHAR2(20),
  USER_NAME         VARCHAR2(20),
  DESCRIPTIONS      VARCHAR2(200)
)
;
comment on table SMS_CHANNEL_RULE_SET
  is '����ͨ�������';
comment on column SMS_CHANNEL_RULE_SET.RULE_SET_ID
  is '������';
comment on column SMS_CHANNEL_RULE_SET.RULE_SET_NAME
  is '��������';
comment on column SMS_CHANNEL_RULE_SET.RULE_SET_TYPE
  is '��������, ITEMS:�ֹ�����Ĺ���, DECISIONTABLE:���߱�';
comment on column SMS_CHANNEL_RULE_SET.DC_FILE_PATH
  is '���߱���·��';
comment on column SMS_CHANNEL_RULE_SET.RULE_STATUS
  is '״̬, -1:�ݸ�״̬, 0:��ѡ, 1:��Ч';
comment on column SMS_CHANNEL_RULE_SET.USER_ORGANIZATION
  is '�������';
comment on column SMS_CHANNEL_RULE_SET.USER_ORG_NAME
  is '��������';
comment on column SMS_CHANNEL_RULE_SET.USER_ID
  is '�û����';
comment on column SMS_CHANNEL_RULE_SET.USER_NAME
  is '�û�����';
comment on column SMS_CHANNEL_RULE_SET.DESCRIPTIONS
  is '��ע';
alter table SMS_CHANNEL_RULE_SET
  add constraint PK_SMS_CHANNEL_RULE_SET primary key (RULE_SET_ID);

prompt
prompt Creating table SMS_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create table SMS_CHANNEL_RULE_SET_ITEM
(
  RULE_SET_ID               VARCHAR2(20),
  RULE_SET_ITEM_ID          VARCHAR2(200) not null,
  RULE_SET_ITEM_NAME        VARCHAR2(200),
  SALIENCE                  NUMBER(7),
  MESSAGE_CLASS             VARCHAR2(4000),
  SYS_ID                    VARCHAR2(4000),
  MESSAGE_TYPE              VARCHAR2(4000),
  ORG_ID                    VARCHAR2(4000),
  USER_ID                   VARCHAR2(4000),
  MOBILE_COM                NUMBER(4),
  IS_WAPPUSH                VARCHAR2(10),
  NUM_SCOPE                 VARCHAR2(200),
  NUM_REGION                VARCHAR2(2000),
  MOBILE                    VARCHAR2(4000),
  IS_LONG_SMS               VARCHAR2(10),
  CHANNEL_ID                VARCHAR2(200),
  MSG_TYPE                  VARCHAR2(4000),
  DAY_START_TIME            DATE,
  DAY_END_TIME              DATE,
  NIGHT_START_TIME          DATE,
  NIGHT_END_TIME            DATE,
  DEFAULT_CHANNEL_ID        NUMBER(4),
  DEFAULT_MOBILE_CHANNEL_ID NUMBER(4),
  DEFAULT_UNION_CHANNEL_ID  NUMBER(4),
  DEFAULT_DX_CHANNEL_ID     NUMBER(4),
  USE_CHANNEL_ID            NUMBER(4),
  USE_LONG_SMS              VARCHAR2(10)
)
;
comment on table SMS_CHANNEL_RULE_SET_ITEM
  is '����ͨ���������ϸ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ID
  is '������';
comment on column SMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_ID
  is '������ϸ���';
comment on column SMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_NAME
  is '��������';
comment on column SMS_CHANNEL_RULE_SET_ITEM.SALIENCE
  is '���ȼ�';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MESSAGE_CLASS
  is '��Ϣ����, ���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.SYS_ID
  is '��Ϣ��Դ, ���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MESSAGE_TYPE
  is '��Ϣ����, ���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.ORG_ID
  is '�������, ���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.USER_ID
  is '�û����, ���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MOBILE_COM
  is '��Ӫ��, ���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.IS_WAPPUSH
  is '�Ƿ���WAPPUSH����, true:��, false:����';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NUM_SCOPE
  is '�Ŷ�';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NUM_REGION
  is '�ֻ���������';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MOBILE
  is '�ֻ����룬���Զ�ѡ';
comment on column SMS_CHANNEL_RULE_SET_ITEM.IS_LONG_SMS
  is '�Ƿ��ǳ����ţ�������ѡ�����ʱ�����ж�';
comment on column SMS_CHANNEL_RULE_SET_ITEM.CHANNEL_ID
  is '��ѡͨ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MSG_TYPE
  is '��Ϣ����';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DAY_START_TIME
  is '���쿪ʼʱ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DAY_END_TIME
  is '�������ʱ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NIGHT_START_TIME
  is 'ҹ�俪ʼʱ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NIGHT_END_TIME
  is 'ҹ�����ʱ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_CHANNEL_ID
  is 'ȱʡʹ�õ�ͨ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_MOBILE_CHANNEL_ID
  is 'ȱʡʹ�õ��ƶ�ͨ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_UNION_CHANNEL_ID
  is 'ȱʡʹ�õ���ͨͨ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_DX_CHANNEL_ID
  is 'ȱʡʹ�õĵ���ͨ��';
comment on column SMS_CHANNEL_RULE_SET_ITEM.USE_CHANNEL_ID
  is '����ʹ�õ�ͨ�����';
comment on column SMS_CHANNEL_RULE_SET_ITEM.USE_LONG_SMS
  is '�Ƿ�ʹ�ó����ŷ�ʽ����';
alter table SMS_CHANNEL_RULE_SET_ITEM
  add constraint PK_SMS_CHANNEL_RULE_SET_ITEM primary key (RULE_SET_ITEM_ID);

prompt
prompt Creating table SMS_ERR_CODE
prompt ===========================
prompt
create table SMS_ERR_CODE
(
  CHANNEL_ID  NUMBER(4) not null,
  ERR_CODE    VARCHAR2(200) not null,
  ERR_DESC    VARCHAR2(200),
  SUGGESTION  VARCHAR2(200),
  DESCRIPTION VARCHAR2(200)
)
;
comment on table SMS_ERR_CODE
  is '����ͨ��״̬�����';
comment on column SMS_ERR_CODE.CHANNEL_ID
  is 'ͨ�����';
comment on column SMS_ERR_CODE.ERR_CODE
  is '������';
comment on column SMS_ERR_CODE.ERR_DESC
  is '˵��';
comment on column SMS_ERR_CODE.SUGGESTION
  is '������';
comment on column SMS_ERR_CODE.DESCRIPTION
  is '��ע';
alter table SMS_ERR_CODE
  add constraint PK_SMS_ERR_CODE primary key (CHANNEL_ID, ERR_CODE);

prompt
prompt Creating table SMS_HIS
prompt ======================
prompt
create table SMS_HIS
(
  SMS_HIS_ID        VARCHAR2(200) not null,
  SEND_STATUS       NUMBER(2),
  USER_ORGANIZATION VARCHAR2(200),
  CHANNEL_ID        NUMBER(4),
  MOBILE_COM        NUMBER(2),
  SYS_ID            VARCHAR2(200),
  MESSAGE_TYPE      VARCHAR2(200),
  MESSAGE_CLASS     VARCHAR2(20),
  BATCH_ID          VARCHAR2(200),
  MOBILE_QUANTITIES NUMBER(4),
  SEND_TIME         DATE
)
;
comment on table SMS_HIS
  is '���Ź鵵��';
comment on column SMS_HIS.SMS_HIS_ID
  is 'id';
comment on column SMS_HIS.SEND_STATUS
  is '����״̬';
comment on column SMS_HIS.USER_ORGANIZATION
  is '����';
comment on column SMS_HIS.CHANNEL_ID
  is 'ͨ��';
comment on column SMS_HIS.MOBILE_COM
  is '��Ӫ��';
comment on column SMS_HIS.SYS_ID
  is '��Ϣ��Դ';
comment on column SMS_HIS.MESSAGE_TYPE
  is '��Ϣ����';
comment on column SMS_HIS.MESSAGE_CLASS
  is '��Ϣ����';
comment on column SMS_HIS.BATCH_ID
  is '���κ�';
comment on column SMS_HIS.MOBILE_QUANTITIES
  is '��������';
comment on column SMS_HIS.SEND_TIME
  is '����ʱ��';
alter table SMS_HIS
  add constraint PK_SMS_HIS primary key (SMS_HIS_ID);

prompt
prompt Creating table SMS_MESSAGE_CLASS
prompt ================================
prompt
create table SMS_MESSAGE_CLASS
(
  SMS_MESSAGE_CLASS_ID   VARCHAR2(200) not null,
  SMS_MESSAGE_CLASS_NAME VARCHAR2(200),
  DESCRIPTION            VARCHAR2(200)
)
;
comment on table SMS_MESSAGE_CLASS
  is '��Ϣ���������ֵ�';
alter table SMS_MESSAGE_CLASS
  add constraint PK_SMS_MESSAGE_CLASS primary key (SMS_MESSAGE_CLASS_ID);

prompt
prompt Creating table SMS_MESSAGE_TYPE
prompt ===============================
prompt
create table SMS_MESSAGE_TYPE
(
  SMS_MESSAGE_TYPE_ID   VARCHAR2(20) not null,
  SMS_MESSAGE_TYPE_NAME VARCHAR2(2000),
  DEFAULT_PRIORITY      NUMBER(2),
  MAX_PRIORITY          NUMBER(2)
)
;
comment on table SMS_MESSAGE_TYPE
  is '��Ϣ���������ֵ�';
comment on column SMS_MESSAGE_TYPE.SMS_MESSAGE_TYPE_ID
  is '��Ϣ���ʱ��';
comment on column SMS_MESSAGE_TYPE.SMS_MESSAGE_TYPE_NAME
  is '��Ϣ��������';
comment on column SMS_MESSAGE_TYPE.DEFAULT_PRIORITY
  is 'ȱʡ�����ȼ�';
comment on column SMS_MESSAGE_TYPE.MAX_PRIORITY
  is '������ȼ�';
alter table SMS_MESSAGE_TYPE
  add constraint PK_SMS_MESSAGE_TYPE primary key (SMS_MESSAGE_TYPE_ID);

prompt
prompt Creating table SMS_MO_DISPATCH
prompt ==============================
prompt
create table SMS_MO_DISPATCH
(
  SMS_MO_DISPATCH_ID VARCHAR2(200) not null,
  BIZ_TYPE           VARCHAR2(200),
  BIZ_ENTITY_ID      VARCHAR2(200),
  DISPATCH_TYPE      VARCHAR2(200),
  DISPATCH_CONTENT   VARCHAR2(20),
  DISCRIPTION        VARCHAR2(40),
  CREATE_TIME        DATE,
  START_TIME         DATE,
  END_TIME           DATE
)
;
comment on table SMS_MO_DISPATCH
  is 'ҵ����ŷ��ɱ�';
alter table SMS_MO_DISPATCH
  add constraint PK_SMS_MO_DISPATCH primary key (SMS_MO_DISPATCH_ID);

prompt
prompt Creating table SMS_MO_DISPATCH_TYPE
prompt ===================================
prompt
create table SMS_MO_DISPATCH_TYPE
(
  BIZ_TYPE        VARCHAR2(200) not null,
  DISPATCH_CLASS  VARCHAR2(200),
  DISPATCH_METHOD VARCHAR2(20)
)
;
comment on table SMS_MO_DISPATCH_TYPE
  is 'ҵ����ŷ������ͱ�';
alter table SMS_MO_DISPATCH_TYPE
  add constraint PK_SMS_MO_DISPATCH_TYPE primary key (BIZ_TYPE);

prompt
prompt Creating table SMS_RECEIVE
prompt ==========================
prompt
create table SMS_RECEIVE
(
  RECEIVE_ID     VARCHAR2(50) not null,
  MOBILE_FROM    VARCHAR2(30),
  RECEIVE_MSG    VARCHAR2(200),
  SYS_TIME       TIMESTAMP(6) default sysdate,
  SP_NUM         VARCHAR2(20),
  EXT_NUM        VARCHAR2(20),
  CHANNEL_ID     NUMBER(2) default 0,
  ORG_ID         VARCHAR2(200),
  USER_ID        VARCHAR2(200),
  RECEIVE_STATUS NUMBER(1) default 0,
  READ_TIME      TIMESTAMP(6),
  MSG_ID         VARCHAR2(200),
  REMARK         VARCHAR2(200),
  MSG_TYPE       NUMBER(1) default 0,
  MSG_KEY        VARCHAR2(200),
  REPLY_MSG      VARCHAR2(600),
  SYS_DATE_ID    NUMBER(19),
  READ_STATUS    NUMBER(19)
)
;
comment on column SMS_RECEIVE.RECEIVE_ID
  is '����Id';
comment on column SMS_RECEIVE.MOBILE_FROM
  is '���к���';
comment on column SMS_RECEIVE.RECEIVE_MSG
  is '���ж���';
comment on column SMS_RECEIVE.SYS_TIME
  is '����ʱ��';
comment on column SMS_RECEIVE.SP_NUM
  is '�ط��ţ����ж���ʱ�����ظ�����������';
comment on column SMS_RECEIVE.EXT_NUM
  is '��չ��';
comment on column SMS_RECEIVE.CHANNEL_ID
  is '���ж��ŵ�ͨ����� Ĭ��0';
comment on column SMS_RECEIVE.ORG_ID
  is '������������';
comment on column SMS_RECEIVE.USER_ID
  is '���������û�';
comment on column SMS_RECEIVE.RECEIVE_STATUS
  is '����״̬, 0:δ��ҵ��ϵͳ��ȡ, 1:�ѱ�ҵ��ϵͳ��ȡ, ҵ��ϵͳ��ȡ���ж��ź�Ӧ�����ֶ���Ϊ1 Ĭ��0';
comment on column SMS_RECEIVE.READ_TIME
  is 'ҵ��ϵͳ��ȡ���ŵ�ʱ��';
comment on column SMS_RECEIVE.MSG_ID
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column SMS_RECEIVE.REMARK
  is '�����ֶ�';
comment on column SMS_RECEIVE.MSG_TYPE
  is '���ж��ŵ����ͣ�0:��ѯ���ţ�1���㲥����,2�����ŵ��� Ĭ��ֵ0';
comment on column SMS_RECEIVE.REPLY_MSG
  is '�ظ�����';

prompt
prompt Creating table SMS_RECEIVE_CLIENT
prompt =================================
prompt
create table SMS_RECEIVE_CLIENT
(
  SMS_RECEIVE_CLIENT_ID VARCHAR2(100) not null,
  USER_NAME             VARCHAR2(100),
  PASS_WORD             VARCHAR2(100),
  RECEIVE_ID            VARCHAR2(100),
  SP                    VARCHAR2(100),
  MOBILE                VARCHAR2(100),
  MOTIME                VARCHAR2(100),
  MSG                   VARCHAR2(2000),
  SYS_TIME              DATE
)
;
alter table SMS_RECEIVE_CLIENT
  add primary key (SMS_RECEIVE_CLIENT_ID);

prompt
prompt Creating table SMS_RECEIVE_OLD
prompt ==============================
prompt
create table SMS_RECEIVE_OLD
(
  RECEIVE_ID     NUMBER(32) not null,
  MOBILE_FROM    VARCHAR2(30),
  RECEIVE_MSG    VARCHAR2(200),
  SYS_TIME       DATE default sysdate,
  SYS_DATE_ID    NUMBER(8),
  SP_NUM         VARCHAR2(20),
  SYS_EXT        VARCHAR2(20),
  EXT_NUM        VARCHAR2(20),
  CHANNEL_ID     NUMBER(2),
  ORG_ID         VARCHAR2(200),
  RECEIVE_STATUS NUMBER(1) default 0,
  READ_TIME      DATE,
  SYS_ID         VARCHAR2(200),
  MSG_ID         VARCHAR2(200),
  REMARK         VARCHAR2(200),
  MSG_KEY        VARCHAR2(200) default 0,
  REPLY_MSG      VARCHAR2(600)
)
;
comment on table SMS_RECEIVE_OLD
  is '���ձ�';
comment on column SMS_RECEIVE_OLD.RECEIVE_ID
  is '���ж��ű��, UUID';
comment on column SMS_RECEIVE_OLD.MOBILE_FROM
  is '���ж��ŵ��ֻ���';
comment on column SMS_RECEIVE_OLD.RECEIVE_MSG
  is '���ж�������';
comment on column SMS_RECEIVE_OLD.SYS_TIME
  is '���ж���ʱ��';
comment on column SMS_RECEIVE_OLD.SYS_DATE_ID
  is '���ж�������(��ʽYYYYMMDD)';
comment on column SMS_RECEIVE_OLD.SP_NUM
  is '�ط��ţ����ж���ʱ�����ظ�����������';
comment on column SMS_RECEIVE_OLD.SYS_EXT
  is '��Ϣ��Դ����ҵ��ϵͳ����Ӧ����չ�ţ��������ط���SP_NUMΪ95551121234����SYS_EXT����Ϊ12[������ҵ��ϵͳ��Ӧ��չ�ű��ֵ䣩�Ƿ��ƶ�Ϊ2λ����ϵͳ��Ӧ�Ļ�����η�������ҵ��ϵͳ]����ҵ��ϵͳ���ݡ�ҵ��ϵͳ��Ӧ��չ�š���ƥ������������Ϣ���ڱ�ϵͳ�Ķ���';
comment on column SMS_RECEIVE_OLD.EXT_NUM
  is 'ҵ����չ�룬��Ӧҵ��ϵͳ��ҵ���ţ��������ط���SP_NUMΪ95551121234����BIZ_EXT����Ϊ1234��ƥ�����б�sms_send�е�EXT_NUM[��������ͳһ]�ֶΣ�';
comment on column SMS_RECEIVE_OLD.CHANNEL_ID
  is '���ж��ŵ�ͨ�����';
comment on column SMS_RECEIVE_OLD.ORG_ID
  is '���ж�����������';
comment on column SMS_RECEIVE_OLD.RECEIVE_STATUS
  is '����״̬, 0:δ��ҵ��ϵͳ��ȡ, 1:�ѱ�ҵ��ϵͳ��ȡ, ҵ��ϵͳ��ȡ���ж��ź�Ӧ�����ֶ���Ϊ1,�����ظ���ȡ';
comment on column SMS_RECEIVE_OLD.READ_TIME
  is 'ҵ��ϵͳ��ȡ���ŵ�ʱ��';
comment on column SMS_RECEIVE_OLD.SYS_ID
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ,����ͻ���ϵ����ϵͳΪCRM';
comment on column SMS_RECEIVE_OLD.MSG_ID
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column SMS_RECEIVE_OLD.REMARK
  is '�����ֶΣ�����';
comment on column SMS_RECEIVE_OLD.MSG_KEY
  is '���ж��ŵ����ͣ�0:��ѯ���ţ�1���㲥����,2�����ŵ���';
comment on column SMS_RECEIVE_OLD.REPLY_MSG
  is '��ѯ���ŵĻظ���Ϣ';
alter table SMS_RECEIVE_OLD
  add constraint PK_SMS_RECEIVE primary key (RECEIVE_ID);
create index IDX_SMSRECEIVE_MOBILE on SMS_RECEIVE_OLD (MOBILE_FROM);
create index IDX_SMSRECEIVE_RECEIVETIME on SMS_RECEIVE_OLD (SYS_TIME);

prompt
prompt Creating table SMS_REPORT
prompt =========================
prompt
create table SMS_REPORT
(
  SEQUENCE               VARCHAR2(200) not null,
  CHANNEL_ID             NUMBER(4),
  GW_STATUS              VARCHAR2(50),
  GW_STATUS_DESC         VARCHAR2(100),
  SMS_STATUS             NUMBER(2),
  SUBMIT_TIME            TIMESTAMP(6),
  REPORT_TIME            TIMESTAMP(6) default systimestamp,
  SYS_TIME               TIMESTAMP(6) default systimestamp,
  SEND_ID                VARCHAR2(200),
  ORIGINALSMS_SENDID     VARCHAR2(200),
  ORIGINALSMS_TOTALPAGES NUMBER(1),
  CURRENT_PAGENO         NUMBER(1),
  BATCH_ID               VARCHAR2(200),
  MSG_ID                 VARCHAR2(200),
  SYS_ID                 VARCHAR2(50),
  MOBILE_TO              VARCHAR2(50),
  STATUS                 NUMBER(1) default 0,
  FETCH_STATUS           NUMBER(1) default 0
)
;
comment on table SMS_REPORT
  is '����״̬����';
comment on column SMS_REPORT.SEQUENCE
  is '�����ڶ������صı��';
comment on column SMS_REPORT.CHANNEL_ID
  is 'ͨ�����';
comment on column SMS_REPORT.GW_STATUS
  is '���ص�״̬����';
comment on column SMS_REPORT.GW_STATUS_DESC
  is '���ص�״̬��������';
comment on column SMS_REPORT.SMS_STATUS
  is '��״̬�����Ӧ����ƽ̨��״̬,1:���ύ, 5:�ͻ��յ�����, 6:�ͻ�δ�յ�����';
comment on column SMS_REPORT.SUBMIT_TIME
  is '�����ύ���������ص�ʱ��';
comment on column SMS_REPORT.REPORT_TIME
  is '�ͻ��յ�����ʱ��';
comment on column SMS_REPORT.SYS_TIME
  is '״̬�������ʱ��';
comment on column SMS_REPORT.SEND_ID
  is '״̬�����Ӧ�Ķ��ŵı��';
comment on column SMS_REPORT.ORIGINALSMS_SENDID
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column SMS_REPORT.ORIGINALSMS_TOTALPAGES
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column SMS_REPORT.CURRENT_PAGENO
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column SMS_REPORT.BATCH_ID
  is '��������,���ڱ�ʶͬһ������';
comment on column SMS_REPORT.MSG_ID
  is '��Ӧҵ��ϵͳ�Ķ��ű��';
comment on column SMS_REPORT.SYS_ID
  is '��Ϣ��Դ, ���Ķ��������ĸ�ҵ��ϵͳ';
comment on column SMS_REPORT.MOBILE_TO
  is '��Ӧ�ֻ���';
comment on column SMS_REPORT.STATUS
  is '״̬����״̬��0��δ�ɹ����¶���, 1:�ɹ����¶���״̬';
comment on column SMS_REPORT.FETCH_STATUS
  is 'ҵ��ϵͳ��ȡ״̬�����״̬��0��δ��ȡ, 1:�Ѷ�ȡ';
alter table SMS_REPORT
  add constraint PK_SMS_REPORT primary key (SEQUENCE);
create index IDX_SMS_REPORT_B on SMS_REPORT (BATCH_ID);
create index IDX_SMS_REPORT_M on SMS_REPORT (MSG_ID);
create index IDX_SMS_REPORT_MT on SMS_REPORT (MOBILE_TO);
create index IDX_SMS_REPORT_S on SMS_REPORT (SYS_ID);

prompt
prompt Creating table SMS_REPORT_CLIENT
prompt ================================
prompt
create table SMS_REPORT_CLIENT
(
  SMS_REPORT_CLIENT_ID VARCHAR2(100) not null,
  USER_NAME            VARCHAR2(100),
  PASS_WORD            VARCHAR2(100),
  MSG_ID               VARCHAR2(100),
  MOBILE               VARCHAR2(100),
  STATUS               VARCHAR2(100),
  STATUS_DESC          VARCHAR2(100),
  REPORT_TIME          VARCHAR2(100),
  SYS_TIME             DATE
)
;
alter table SMS_REPORT_CLIENT
  add primary key (SMS_REPORT_CLIENT_ID);

prompt
prompt Creating table SMS_REPORT_HIS
prompt =============================
prompt
create table SMS_REPORT_HIS
(
  SEQUENCE               VARCHAR2(200) not null,
  CHANNEL_ID             NUMBER(4),
  GW_STATUS              VARCHAR2(50),
  GW_STATUS_DESC         VARCHAR2(100),
  SMS_STATUS             NUMBER(2),
  SUBMIT_TIME            TIMESTAMP(6),
  REPORT_TIME            TIMESTAMP(6) default systimestamp,
  SYS_TIME               TIMESTAMP(6) default systimestamp,
  SEND_ID                VARCHAR2(200),
  ORIGINALSMS_SENDID     VARCHAR2(200),
  ORIGINALSMS_TOTALPAGES NUMBER(1),
  CURRENT_PAGENO         NUMBER(1),
  BATCH_ID               VARCHAR2(200),
  MSG_ID                 VARCHAR2(200),
  SYS_ID                 VARCHAR2(50),
  MOBILE_TO              VARCHAR2(50),
  STATUS                 NUMBER(1) default 0,
  FETCH_STATUS           NUMBER(1) default 0,
  SMS_REPORT_ID          VARCHAR2(200),
  DONE_TIME              DATE,
  STATUS_CODE            VARCHAR2(40),
  STATUS_CODE_DESC       VARCHAR2(200),
  MOBILE                 VARCHAR2(20),
  GW_MSG_ID              VARCHAR2(100)
)
;
comment on table SMS_REPORT_HIS
  is '����״̬����鵵��';
comment on column SMS_REPORT_HIS.SEQUENCE
  is '�����ڶ������صı��';
comment on column SMS_REPORT_HIS.CHANNEL_ID
  is 'ͨ�����';
comment on column SMS_REPORT_HIS.GW_STATUS
  is '���ص�״̬����';
comment on column SMS_REPORT_HIS.GW_STATUS_DESC
  is '���ص�״̬��������';
comment on column SMS_REPORT_HIS.SMS_STATUS
  is '��״̬�����Ӧ����ƽ̨��״̬,1:���ύ, 5:�ͻ��յ�����, 6:�ͻ�δ�յ�����';
comment on column SMS_REPORT_HIS.SUBMIT_TIME
  is '�����ύ���������ص�ʱ��';
comment on column SMS_REPORT_HIS.REPORT_TIME
  is '�ͻ��յ�����ʱ��';
comment on column SMS_REPORT_HIS.SYS_TIME
  is '״̬�������ʱ��';
comment on column SMS_REPORT_HIS.SEND_ID
  is '״̬�����Ӧ�Ķ��ŵı��';
comment on column SMS_REPORT_HIS.ORIGINALSMS_SENDID
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column SMS_REPORT_HIS.ORIGINALSMS_TOTALPAGES
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column SMS_REPORT_HIS.CURRENT_PAGENO
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column SMS_REPORT_HIS.BATCH_ID
  is '��������,���ڱ�ʶͬһ������';
comment on column SMS_REPORT_HIS.MSG_ID
  is '��Ӧҵ��ϵͳ�Ķ��ű��';
comment on column SMS_REPORT_HIS.SYS_ID
  is '��Ϣ��Դ, ���Ķ��������ĸ�ҵ��ϵͳ';
comment on column SMS_REPORT_HIS.MOBILE_TO
  is '��Ӧ�ֻ���';
comment on column SMS_REPORT_HIS.STATUS
  is '״̬����״̬��0��δ�ɹ����¶���, 1:�ɹ����¶���״̬';
comment on column SMS_REPORT_HIS.FETCH_STATUS
  is 'ҵ��ϵͳ��ȡ״̬�����״̬��0��δ��ȡ, 1:�Ѷ�ȡ';
alter table SMS_REPORT_HIS
  add constraint PK_SMS_REPORT_HIS primary key (SEQUENCE);
create index IDX_SMSREPORTHIS_B on SMS_REPORT_HIS (BATCH_ID);
create index IDX_SMSREPORTHIS_M on SMS_REPORT_HIS (MSG_ID);
create index IDX_SMSREPORTHIS_MT on SMS_REPORT_HIS (MOBILE_TO);
create index IDX_SMSREPORTHIS_S on SMS_REPORT_HIS (SYS_ID);

prompt
prompt Creating table SMS_SEND
prompt =======================
prompt
create table SMS_SEND
(
  SEND_ID                NUMBER(32) not null,
  MOBILE_TO              VARCHAR2(20),
  SEND_MSG               VARCHAR2(600),
  ORG_ID                 VARCHAR2(20) default '0000',
  SYS_ID                 VARCHAR2(10),
  PRIOR_ID               NUMBER(1) default 8,
  PRE_SEND_TIME          DATE default sysdate,
  EXT_NUM                VARCHAR2(20),
  USER_ID                VARCHAR2(40),
  CUST_ID                VARCHAR2(40),
  BATCH_ID               VARCHAR2(40),
  MSG_ID                 VARCHAR2(80),
  MESSAGE_CLASS          VARCHAR2(20) default '00',
  MESSAGE_TYPE           VARCHAR2(20) default '00',
  WAPPUSH_URL            VARCHAR2(200),
  SEND_DEADLINE          TIMESTAMP(6),
  SEND_STATUS            NUMBER(2) default -2,
  SYS_TIME               DATE default sysdate,
  SYS_DATE_ID            NUMBER(18),
  SEND_TIME              DATE default sysdate,
  SEND_DATE_ID           NUMBER(18),
  SEND_WEEKDATE          CHAR(1) default 0,
  COM_RTN_TIME           DATE,
  REPORT_TIME            DATE,
  CHANNEL_ID             NUMBER(4) default 0,
  MOBILE_COM             NUMBER(2),
  SEQUENCE               VARCHAR2(40),
  MOBILE_QUANTITIES      NUMBER(4) default 1,
  RESEND_TIMES           NUMBER(1) default 0,
  SIGNATURE              VARCHAR2(40),
  MSG_TYPE               VARCHAR2(50),
  ERR_ID                 VARCHAR2(20),
  ERR_MSG                VARCHAR2(100),
  IS_LONGSMS             NUMBER(1) default 0,
  IS_ORIGINAL_SMS        NUMBER(1) default 0,
  ORIGINALSMS_SENDID     VARCHAR2(200),
  CURRENT_PAGENO         NUMBER(1),
  ORIGINALSMS_TOTALPAGES NUMBER(1),
  LONGSMS_TAG            NUMBER(4),
  LONGSMS_SPLITED        NUMBER(1) default 0,
  REMARK                 VARCHAR2(500),
  SENDER_ID              VARCHAR2(100)
)
;
comment on table SMS_SEND
  is '���ж�����Ϣ��';
comment on column SMS_SEND.SEND_ID
  is '���ж�����ţ����ж��ŵ�Ψһ��ʶ';
comment on column SMS_SEND.MOBILE_TO
  is 'Ŀ���ֻ���(һ���ֻ����룩';
comment on column SMS_SEND.SEND_MSG
  is '��������,�Ϊ300��';
comment on column SMS_SEND.ORG_ID
  is '�������';
comment on column SMS_SEND.SYS_ID
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column SMS_SEND.PRIOR_ID
  is '���ȼ�';
comment on column SMS_SEND.PRE_SEND_TIME
  is 'Ԥ�Ʒ���ʱ��';
comment on column SMS_SEND.EXT_NUM
  is '��չ����';
comment on column SMS_SEND.USER_ID
  is '�û����';
comment on column SMS_SEND.CUST_ID
  is '��д���ŵĿͻ����, �ͻ���д����ʱ��¼';
comment on column SMS_SEND.BATCH_ID
  is '��������,���ڱ�ʶͬһ������';
comment on column SMS_SEND.MSG_ID
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column SMS_SEND.MESSAGE_CLASS
  is '��Ϣ����ı��';
comment on column SMS_SEND.MESSAGE_TYPE
  is '��Ϣ����';
comment on column SMS_SEND.WAPPUSH_URL
  is 'WAPPUSH����, ���ֶ���дֵʱ�����ö���ΪWAPPUSH����, ϵͳ����WAPPUSH��ʽ���͸ö���';
comment on column SMS_SEND.SEND_DEADLINE
  is '���͵Ľ�ֹʱ��, ������ʱ�����ڸ�ʱ��ʱ, ϵͳ��ȡ���ö��ŵķ���';
comment on column SMS_SEND.SEND_STATUS
  is '����״̬,-2:�����δ��ʼ����, 0:δ����, 1:�ѷ���, 2:������, 5:���ͳɹ�, 6:����ʧ�ܣ���ֵ��Ӧ��ʧ��ԭ������鿴ERR_ID��)';
comment on column SMS_SEND.SYS_TIME
  is '�������ʱ��';
comment on column SMS_SEND.SYS_DATE_ID
  is '����������ڣ���ʽYYYYMMDD��';
comment on column SMS_SEND.SEND_TIME
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column SMS_SEND.SEND_DATE_ID
  is 'ƽ̨���͸ö��ŵ����ڣ��鵵���Դ���Ϊ��������ʽYYYYMMDD��';
comment on column SMS_SEND.SEND_WEEKDATE
  is 'ƽ̨���͸ö��ŵ�ʱ��Ϊ�ܼ�, 0:δ����, 1:����, 2:��һ, 3:�ܶ�, 4:����, 5:����, 6:����, 7:����';
comment on column SMS_SEND.COM_RTN_TIME
  is '�������ط����ύӦ���ʱ��';
comment on column SMS_SEND.REPORT_TIME
  is '״̬����ʱ��';
comment on column SMS_SEND.CHANNEL_ID
  is 'ͨ����� ϵͳ����ʧ�ܣ�������ں���������Ϣ�а������дʣ�����д0��';
comment on column SMS_SEND.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�,2:��ͨ, 3:���� 0:�������';
comment on column SMS_SEND.SEQUENCE
  is '�������صĶ��ű��, �������ط���״̬����ʱ����ƥ��ԭʼ����';
comment on column SMS_SEND.MOBILE_QUANTITIES
  is '�������ŵĶ�������';
comment on column SMS_SEND.RESEND_TIMES
  is '���ŵ��ط�����';
comment on column SMS_SEND.SIGNATURE
  is '����ǩ��';
comment on column SMS_SEND.MSG_TYPE
  is '��Ϣ����,���ڱ�ʶ���ŵ����ɷ�ʽ������Դ';
comment on column SMS_SEND.ERR_ID
  is '������룬������Ϣƽ̨�������Ͷ������ش������ ���Ŵ������ 1007������������ 1008�����Ű���Υ���� 1009�������ֻ��� 1010��SYS_ID ��д����';
comment on column SMS_SEND.ERR_MSG
  is '��������˵����Ϣ';
comment on column SMS_SEND.IS_LONGSMS
  is '�ö����Ƿ��ǳ�����,0:���ǳ�����,1:�ǳ�����';
comment on column SMS_SEND.IS_ORIGINAL_SMS
  is '�ö����Ƿ���ԭʼ����,��ԭʼ����ָ�����ŷ���ʱ��ֳ��Ķ���,0:��ԭʼ����, 1:����ԭʼ����';
comment on column SMS_SEND.ORIGINALSMS_SENDID
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column SMS_SEND.CURRENT_PAGENO
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column SMS_SEND.ORIGINALSMS_TOTALPAGES
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column SMS_SEND.LONGSMS_TAG
  is '�����Ŷ���ʶ����ͬһ�������ŵĶ̶��Ÿñ�ʶ��ͬ';
comment on column SMS_SEND.LONGSMS_SPLITED
  is '�������Ƿ񱻲�֣�0û�б���ֻ�������ͨ���ţ�1�Ѿ�����֡�����ֵĶ��Ų�ѯͳ��ʱ��Ӧ����������Ĭ��0';
comment on column SMS_SEND.REMARK
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
comment on column SMS_SEND.SENDER_ID
  is '������ID�����ݿ�ӿ�ʱ���������ݿ��ʺ�';
alter table SMS_SEND
  add constraint PK_SMS_SEND primary key (SEND_ID);
create index IDX_SMSSEND_BATCH_ID on SMS_SEND (BATCH_ID);
create index IDX_SMSSEND_CHANNEL on SMS_SEND (CHANNEL_ID);
create index IDX_SMSSEND_MOBILE on SMS_SEND (MOBILE_TO);
create index IDX_SMSSEND_PRIOR_ID on SMS_SEND (PRIOR_ID);
create index IDX_SMSSEND_SEND_DATE on SMS_SEND (SEND_WEEKDATE);
create index IDX_SMSSEND_SEND_STATUS on SMS_SEND (SEND_STATUS);
create index IDX_SMSSEND_SEND_TIME on SMS_SEND (SEND_TIME);
create index IDX_SMSSEND_SEQUENCE on SMS_SEND (SEQUENCE);
create index IDX_SMSSEND_STATS_CHAN on SMS_SEND (CHANNEL_ID, SEND_STATUS);
create index IDX_SMSSEND_SYSDATE_MSGID on SMS_SEND (SYS_DATE_ID, MSG_ID);
create index IDX_SMSSEND_SYS_TIME on SMS_SEND (SYS_TIME);

prompt
prompt Creating table SMS_SEND_ANALYZE
prompt ===============================
prompt
create table SMS_SEND_ANALYZE
(
  ORG_ID        VARCHAR2(200),
  USER_ID       VARCHAR2(200),
  STAT_TIME     NUMBER(10),
  STATUS        NUMBER(5),
  QUANTITY      NUMBER(10),
  PARENT_ORG_ID VARCHAR2(200)
)
;

prompt
prompt Creating table SMS_SEND_HIS
prompt ===========================
prompt
create table SMS_SEND_HIS
(
  SEND_ID                NUMBER(32) not null,
  MOBILE_TO              VARCHAR2(20),
  SEND_MSG               VARCHAR2(600),
  ORG_ID                 VARCHAR2(20) default '0000',
  SYS_ID                 VARCHAR2(10),
  PRIOR_ID               NUMBER(1) default 8,
  PRE_SEND_TIME          DATE default sysdate,
  EXT_NUM                VARCHAR2(20),
  USER_ID                VARCHAR2(40),
  CUST_ID                VARCHAR2(40),
  BATCH_ID               VARCHAR2(40),
  MSG_ID                 VARCHAR2(80),
  MESSAGE_CLASS          VARCHAR2(20) default '00',
  MESSAGE_TYPE           VARCHAR2(20) default '00',
  WAPPUSH_URL            VARCHAR2(200),
  SEND_DEADLINE          TIMESTAMP(6),
  SEND_STATUS            NUMBER(2) default -2,
  SYS_TIME               DATE default sysdate,
  SYS_DATE_ID            NUMBER(18),
  SEND_TIME              DATE default sysdate,
  SEND_DATE_ID           NUMBER(18),
  SEND_WEEKDATE          CHAR(1) default 0,
  COM_RTN_TIME           DATE,
  REPORT_TIME            DATE,
  CHANNEL_ID             NUMBER(4) default 0,
  MOBILE_COM             NUMBER(2),
  SEQUENCE               VARCHAR2(40),
  MOBILE_QUANTITIES      NUMBER(4) default 1,
  RESEND_TIMES           NUMBER(1) default 0,
  SIGNATURE              VARCHAR2(40),
  MSG_TYPE               VARCHAR2(50),
  ERR_ID                 VARCHAR2(20),
  ERR_MSG                VARCHAR2(100),
  IS_LONGSMS             NUMBER(1) default 0,
  IS_ORIGINAL_SMS        NUMBER(1) default 0,
  ORIGINALSMS_SENDID     VARCHAR2(200),
  CURRENT_PAGENO         NUMBER(1),
  ORIGINALSMS_TOTALPAGES NUMBER(1),
  LONGSMS_TAG            NUMBER(5),
  LONGSMS_SPLITED        NUMBER(1) default 0,
  REMARK                 VARCHAR2(500),
  SENDER_ID              VARCHAR2(100)
)
;
comment on table SMS_SEND_HIS
  is '���ж�����Ϣ��';
comment on column SMS_SEND_HIS.SEND_ID
  is '���ж�����ţ����ж��ŵ�Ψһ��ʶ';
comment on column SMS_SEND_HIS.MOBILE_TO
  is 'Ŀ���ֻ���(һ���ֻ����룩';
comment on column SMS_SEND_HIS.SEND_MSG
  is '��������,�Ϊ300��';
comment on column SMS_SEND_HIS.ORG_ID
  is '�������';
comment on column SMS_SEND_HIS.SYS_ID
  is 'ҵ��ϵͳ�ı��, ���ڱ�ʶ���������ĸ�ҵ��ϵͳ�ı�� ������д������ERR_ID�ֶ���ʾ1010����)';
comment on column SMS_SEND_HIS.PRIOR_ID
  is '���ȼ�';
comment on column SMS_SEND_HIS.PRE_SEND_TIME
  is 'Ԥ�Ʒ���ʱ��';
comment on column SMS_SEND_HIS.EXT_NUM
  is '��չ����';
comment on column SMS_SEND_HIS.USER_ID
  is '�û����';
comment on column SMS_SEND_HIS.CUST_ID
  is '��д���ŵĿͻ����, �ͻ���д����ʱ��¼';
comment on column SMS_SEND_HIS.BATCH_ID
  is '��������,���ڱ�ʶͬһ������';
comment on column SMS_SEND_HIS.MSG_ID
  is '���ɶ��ŵ�ҵ��ϵͳ�Ķ��ű��';
comment on column SMS_SEND_HIS.MESSAGE_CLASS
  is '��Ϣ����ı��';
comment on column SMS_SEND_HIS.MESSAGE_TYPE
  is '��Ϣ����';
comment on column SMS_SEND_HIS.WAPPUSH_URL
  is 'WAPPUSH����, ���ֶ���дֵʱ�����ö���ΪWAPPUSH����, ϵͳ����WAPPUSH��ʽ���͸ö���';
comment on column SMS_SEND_HIS.SEND_DEADLINE
  is '���͵Ľ�ֹʱ��, ������ʱ�����ڸ�ʱ��ʱ, ϵͳ��ȡ���ö��ŵķ���';
comment on column SMS_SEND_HIS.SEND_STATUS
  is '����״̬,-2:�����δ��ʼ����, 0:δ����, 1:�ѷ���, 2:������, 5:���ͳɹ�, 6:����ʧ�ܣ���ֵ��Ӧ��ʧ��ԭ������鿴ERR_ID��)';
comment on column SMS_SEND_HIS.SYS_TIME
  is '�������ʱ��';
comment on column SMS_SEND_HIS.SYS_DATE_ID
  is '����������ڣ���ʽYYYYMMDD��';
comment on column SMS_SEND_HIS.SEND_TIME
  is 'ƽ̨���͸ö��ŵ�ʱ��';
comment on column SMS_SEND_HIS.SEND_DATE_ID
  is 'ƽ̨���͸ö��ŵ����ڣ��鵵���Դ���Ϊ��������ʽYYYYMMDD��';
comment on column SMS_SEND_HIS.SEND_WEEKDATE
  is 'ƽ̨���͸ö��ŵ�ʱ��Ϊ�ܼ�, 0:δ����, 1:����, 2:��һ, 3:�ܶ�, 4:����, 5:����, 6:����, 7:����';
comment on column SMS_SEND_HIS.COM_RTN_TIME
  is '�������ط����ύӦ���ʱ��';
comment on column SMS_SEND_HIS.REPORT_TIME
  is '״̬����ʱ��';
comment on column SMS_SEND_HIS.CHANNEL_ID
  is 'ͨ����� ϵͳ����ʧ�ܣ�������ں���������Ϣ�а������дʣ�����д0��';
comment on column SMS_SEND_HIS.MOBILE_COM
  is '��Ӫ�̱��, 1:�ƶ�,2:��ͨ, 3:���� 0:�������';
comment on column SMS_SEND_HIS.SEQUENCE
  is '�������صĶ��ű��, �������ط���״̬����ʱ����ƥ��ԭʼ����';
comment on column SMS_SEND_HIS.MOBILE_QUANTITIES
  is '�������ŵĶ�������';
comment on column SMS_SEND_HIS.RESEND_TIMES
  is '���ŵ��ط�����';
comment on column SMS_SEND_HIS.SIGNATURE
  is '����ǩ��';
comment on column SMS_SEND_HIS.MSG_TYPE
  is '��Ϣ����,���ڱ�ʶ���ŵ����ɷ�ʽ������Դ';
comment on column SMS_SEND_HIS.ERR_ID
  is '������룬������Ϣƽ̨�������Ͷ������ش������ ���Ŵ������ 1007������������ 1008�����Ű���Υ���� 1009�������ֻ��� 1010��SYS_ID ��д����';
comment on column SMS_SEND_HIS.ERR_MSG
  is '��������˵����Ϣ';
comment on column SMS_SEND_HIS.IS_LONGSMS
  is '�ö����Ƿ��ǳ�����,0:���ǳ�����,1:�ǳ�����';
comment on column SMS_SEND_HIS.IS_ORIGINAL_SMS
  is '�ö����Ƿ���ԭʼ����,��ԭʼ����ָ�����ŷ���ʱ��ֳ��Ķ���,0:��ԭʼ����, 1:����ԭʼ����';
comment on column SMS_SEND_HIS.ORIGINALSMS_SENDID
  is 'ԭʼ���ű�ţ���������Ϊ�ɳ����Ų�ֳɵĶ̶���ʱ, �������ݴ˱�Ų�ѯ��ԭʼ����';
comment on column SMS_SEND_HIS.CURRENT_PAGENO
  is '��ǰ���ŵ�ҳ��,�������ŵĵڼ����̶���';
comment on column SMS_SEND_HIS.ORIGINALSMS_TOTALPAGES
  is '�����̶������������Ź��ж��ŵ�ҳ��';
comment on column SMS_SEND_HIS.LONGSMS_TAG
  is '�����Ŷ���ʶ����ͬһ�������ŵĶ̶��Ÿñ�ʶ��ͬ';
comment on column SMS_SEND_HIS.LONGSMS_SPLITED
  is '�������Ƿ񱻲�֣�0û�б���ֻ�������ͨ���ţ�1�Ѿ�����֡�����ֵĶ��Ų�ѯͳ��ʱ��Ӧ����������Ĭ��0';
comment on column SMS_SEND_HIS.REMARK
  is '��ע��Ϣ�������ֶΣ���չʱʹ��';
comment on column SMS_SEND_HIS.SENDER_ID
  is '������ID�����ݿ�ӿ�ʱ���������ݿ��ʺ�';
alter table SMS_SEND_HIS
  add constraint PK_SMS_SEND_HIS primary key (SEND_ID);
create index IDX_SENDHIS_BATCH_ID on SMS_SEND_HIS (BATCH_ID);
create index IDX_SENDHIS_CHANNEL on SMS_SEND_HIS (CHANNEL_ID);
create index IDX_SENDHIS_MOBILE on SMS_SEND_HIS (MOBILE_TO);
create index IDX_SENDHIS_PRIOR_ID on SMS_SEND_HIS (PRIOR_ID);
create index IDX_SENDHIS_SENDDATE on SMS_SEND_HIS (SEND_WEEKDATE);
create index IDX_SENDHIS_SENDTIME on SMS_SEND_HIS (SEND_TIME);
create index IDX_SENDHIS_SEQUENCE on SMS_SEND_HIS (SEQUENCE);
create index IDX_SENDHIS_STATS_CHAN on SMS_SEND_HIS (CHANNEL_ID, SEND_STATUS);
create index IDX_SENDHIS_STATUS on SMS_SEND_HIS (SEND_STATUS);
create index IDX_SENDHIS_SYSTIME on SMS_SEND_HIS (SYS_TIME);

prompt
prompt Creating table SMS_SEND_PAPER
prompt =============================
prompt
create table SMS_SEND_PAPER
(
  SMS_SEND_PAPER_ID VARCHAR2(100) not null,
  STATUS            NUMBER(1),
  PRIOR_ID          NUMBER(1),
  IS_CHECK          NUMBER(1),
  SUBJECT           VARCHAR2(1000),
  CONTENT           CLOB,
  MOBILES           CLOB,
  GROUPS            CLOB,
  FILE_URL          VARCHAR2(200),
  FILE_NAME         VARCHAR2(200),
  SYS_TIME          DATE default sysdate,
  PRE_SEND_TIME     DATE,
  SEND_TIME         DATE,
  CHECK_TIME        DATE,
  CREATOR           VARCHAR2(100),
  CREATOR_NAME      VARCHAR2(100),
  CREATOR_ORG       VARCHAR2(100),
  CREATOR_ORG_NAME  VARCHAR2(100),
  AUDITOR           VARCHAR2(100),
  AUDITOR_NAME      VARCHAR2(100),
  AUDITOR_ORG       VARCHAR2(100),
  AUDITOR_ORG_NAME  VARCHAR2(100),
  BATCH_ID          VARCHAR2(100),
  SEND_TYPE         VARCHAR2(50),
  MSG_TYPE          VARCHAR2(50),
  PRODUCT_ID        VARCHAR2(100),
  PRODUCT_NAME      VARCHAR2(100),
  PRODUCT_ITEM_ID   VARCHAR2(100)
)
;
comment on table SMS_SEND_PAPER
  is '������ͨ������ʷ��¼��';
comment on column SMS_SEND_PAPER.SMS_SEND_PAPER_ID
  is 'ϵͳ���';
comment on column SMS_SEND_PAPER.STATUS
  is '�Ƿ����ã�0���ύ��ˣ�δ��ˣ�,1���ͨ����3�������ʧ�ܣ�5���ŷ��ͳɹ���6���ŷ���ʧ��';
comment on column SMS_SEND_PAPER.PRIOR_ID
  is '���ȼ�';
comment on column SMS_SEND_PAPER.IS_CHECK
  is '�Ƿ���Ҫ���  0Ϊ����Ҫ��1Ϊ��Ҫ';
comment on column SMS_SEND_PAPER.SUBJECT
  is '����ǲ��ŵĻ����������ݲ�Ϊ��';
comment on column SMS_SEND_PAPER.CONTENT
  is '����';
comment on column SMS_SEND_PAPER.MOBILES
  is '�ֻ�����';
comment on column SMS_SEND_PAPER.GROUPS
  is '�ͻ�Ⱥ��';
comment on column SMS_SEND_PAPER.FILE_URL
  is '�ļ���ַ';
comment on column SMS_SEND_PAPER.FILE_NAME
  is '�ļ�����';
comment on column SMS_SEND_PAPER.SYS_TIME
  is '����ʱ��';
comment on column SMS_SEND_PAPER.PRE_SEND_TIME
  is 'Ԥ�Ʒ���ʱ��';
comment on column SMS_SEND_PAPER.SEND_TIME
  is '����ʱ��';
comment on column SMS_SEND_PAPER.CHECK_TIME
  is '�ύ���ʱ��';
comment on column SMS_SEND_PAPER.CREATOR
  is '������';
comment on column SMS_SEND_PAPER.CREATOR_NAME
  is '������';
comment on column SMS_SEND_PAPER.CREATOR_ORG
  is '�����߻���';
comment on column SMS_SEND_PAPER.CREATOR_ORG_NAME
  is '�����߻���';
comment on column SMS_SEND_PAPER.AUDITOR
  is '�����';
comment on column SMS_SEND_PAPER.AUDITOR_NAME
  is '�����';
comment on column SMS_SEND_PAPER.AUDITOR_ORG
  is '����߻���';
comment on column SMS_SEND_PAPER.AUDITOR_ORG_NAME
  is '����߻���';
comment on column SMS_SEND_PAPER.BATCH_ID
  is '���ŵ����κţ��������͵�ʱ��ʹ��';
comment on column SMS_SEND_PAPER.SEND_TYPE
  is '�������ͣ�COMMON����ͨ���͡�BATCH���������͡�TEMPLATE��ģ�巢�͡�PRODUCT����Ŀ����';
comment on column SMS_SEND_PAPER.MSG_TYPE
  is '��Ϣ���ͣ�SMS�����š�MMS������';
comment on column SMS_SEND_PAPER.PRODUCT_ID
  is '��Ŀ���';
comment on column SMS_SEND_PAPER.PRODUCT_NAME
  is '��Ŀ����';
comment on column SMS_SEND_PAPER.PRODUCT_ITEM_ID
  is '��Ŀ������ʷ��¼�ı��';
alter table SMS_SEND_PAPER
  add constraint PK_SMS_SEND_PAPER primary key (SMS_SEND_PAPER_ID);

prompt
prompt Creating table SMS_SPNUMBER
prompt ===========================
prompt
create table SMS_SPNUMBER
(
  SMS_SPNUMBER_ID   VARCHAR2(20) not null,
  SPNUMBER          VARCHAR2(20),
  STATUS            NUMBER(1),
  SPNUMBER_TYPE     VARCHAR2(100),
  DESCRIPTION       VARCHAR2(200),
  SORT_INDEX        VARCHAR2(20),
  ORGANIZATION_ID   VARCHAR2(20),
  ORGANIZATION_NAME VARCHAR2(200),
  USER_ID           VARCHAR2(50),
  USER_NAME         VARCHAR2(200),
  CREATE_TIME       DATE
)
;
comment on table SMS_SPNUMBER
  is '�����ط��ű�';
comment on column SMS_SPNUMBER.SMS_SPNUMBER_ID
  is '�ط��ű��';
comment on column SMS_SPNUMBER.SPNUMBER
  is '�ط���';
comment on column SMS_SPNUMBER.STATUS
  is '״̬, 0:ʧЧ, 1:��Ч';
comment on column SMS_SPNUMBER.SPNUMBER_TYPE
  is '����, PREFIX:ǰ׺, REGEXP:������ʽ';
comment on column SMS_SPNUMBER.DESCRIPTION
  is '��ע';
comment on column SMS_SPNUMBER.SORT_INDEX
  is '������';
comment on column SMS_SPNUMBER.ORGANIZATION_ID
  is '�������';
comment on column SMS_SPNUMBER.ORGANIZATION_NAME
  is '��������';
comment on column SMS_SPNUMBER.USER_ID
  is '�û����';
comment on column SMS_SPNUMBER.USER_NAME
  is '�û�����';
comment on column SMS_SPNUMBER.CREATE_TIME
  is '����ʱ��';
alter table SMS_SPNUMBER
  add constraint PK_SMS_SPNUMBER primary key (SMS_SPNUMBER_ID);
create index SPNUMBER_SORTIDX on SMS_SPNUMBER (SORT_INDEX);

prompt
prompt Creating table SMS_SURVEY
prompt =========================
prompt
create table SMS_SURVEY
(
  SMS_SURVEY_ID         VARCHAR2(200) not null,
  SMS_SURVEY_NAME       VARCHAR2(80),
  SURVEY_TYPE           VARCHAR2(20),
  OPTION_NUMBER         NUMBER(18),
  STATUS                VARCHAR2(20),
  START_TIME            DATE,
  END_TIME              DATE,
  USER_ID               VARCHAR2(200),
  USER_NAME             VARCHAR2(200),
  USER_GROUP_ID         VARCHAR2(200),
  USER_GROUP_NAME       VARCHAR2(200),
  BIZ_NUMBER            VARCHAR2(20),
  SMS_DIRECTIVE         VARCHAR2(20),
  SURVEY_TEMPLATE       VARCHAR2(200),
  THANK_WORD            VARCHAR2(200),
  SPEC_RESPONSE         VARCHAR2(20),
  CONTACT_GROUPS        CLOB,
  BLACK_GROUPS          CLOB,
  SURVEY_VALID_TYPE     VARCHAR2(20),
  MAX_VOTE_NUMBER       VARCHAR2(20),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
comment on table SMS_SURVEY
  is '���ŵ���';
comment on column SMS_SURVEY.SMS_SURVEY_NAME
  is '��������';
comment on column SMS_SURVEY.SURVEY_TYPE
  is '��������';
comment on column SMS_SURVEY.OPTION_NUMBER
  is 'ѡ������';
comment on column SMS_SURVEY.STATUS
  is '״̬';
comment on column SMS_SURVEY.START_TIME
  is '��ʼʱ��';
comment on column SMS_SURVEY.END_TIME
  is '����ʱ��';
comment on column SMS_SURVEY.USER_ID
  is '�û�id';
comment on column SMS_SURVEY.USER_NAME
  is '�û���';
comment on column SMS_SURVEY.USER_GROUP_ID
  is '�û�Ⱥ��id';
comment on column SMS_SURVEY.USER_GROUP_NAME
  is '�û�Ⱥ����';
comment on column SMS_SURVEY.SMS_DIRECTIVE
  is '����ָ��';
comment on column SMS_SURVEY.SURVEY_TEMPLATE
  is '����ģ��';
comment on column SMS_SURVEY.THANK_WORD
  is '��л��';
comment on column SMS_SURVEY.SPEC_RESPONSE
  is '�Ƿ��޶��������';
comment on column SMS_SURVEY.CONTACT_GROUPS
  is '��ϵȺ��';
comment on column SMS_SURVEY.BLACK_GROUPS
  is '������';
comment on column SMS_SURVEY.SURVEY_VALID_TYPE
  is '��Ч�ظ�';
comment on column SMS_SURVEY.MAX_VOTE_NUMBER
  is '��������';
comment on column SMS_SURVEY.CREATED_STAMP
  is '����ʱ��';
alter table SMS_SURVEY
  add constraint PK_SMS_SURVEY primary key (SMS_SURVEY_ID);
create unique index IDX_SMS_DIRECTIVE on SMS_SURVEY (SMS_DIRECTIVE);
create index SMS_SURVEY_TXCRTS on SMS_SURVEY (CREATED_TX_STAMP);
create index SMS_SURVEY_TXSTMP on SMS_SURVEY (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SMS_SURVEY_GROUP
prompt ===============================
prompt
create table SMS_SURVEY_GROUP
(
  SMS_SURVEY_ID         VARCHAR2(200) not null,
  GROUP_ID              VARCHAR2(200) not null,
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
comment on table SMS_SURVEY_GROUP
  is '���ŵ��鱻����';
alter table SMS_SURVEY_GROUP
  add constraint PK_SMS_SURVEY_GROUP primary key (SMS_SURVEY_ID, GROUP_ID);
create index SMS_SRV_GRP_TXCRTS on SMS_SURVEY_GROUP (CREATED_TX_STAMP);
create index SMS_SRV_GRP_TXSTMP on SMS_SURVEY_GROUP (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SMS_SURVEY_ITEM
prompt ==============================
prompt
create table SMS_SURVEY_ITEM
(
  SMS_SURVEY_ID         VARCHAR2(200) not null,
  SURV_ITEM_CODE        VARCHAR2(10) not null,
  SURV_ITEM_NAME        VARCHAR2(80),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
comment on table SMS_SURVEY_ITEM
  is '���ŵ���ѡ��';
alter table SMS_SURVEY_ITEM
  add constraint PK_SMS_SURVEY_ITEM primary key (SMS_SURVEY_ID, SURV_ITEM_CODE);
create index SMS_SRV_ITM_TXCRTS on SMS_SURVEY_ITEM (CREATED_TX_STAMP);
create index SMS_SRV_ITM_TXSTMP on SMS_SURVEY_ITEM (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SMS_SURVEY_RECORD
prompt ================================
prompt
create table SMS_SURVEY_RECORD
(
  SMS_SURVEY_RECORD_ID  VARCHAR2(200) not null,
  SMS_SURVEY_ID         VARCHAR2(200),
  MOBILE_NUMBER         VARCHAR2(20),
  SMS_SURV_ITEM_CODE    VARCHAR2(40),
  MESSAGE_CONTENT       VARCHAR2(40),
  MESSAGE_ID            VARCHAR2(200),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
comment on table SMS_SURVEY_RECORD
  is '�����¼';
alter table SMS_SURVEY_RECORD
  add constraint PK_SMS_SURVEY_RECORD primary key (SMS_SURVEY_RECORD_ID);
create index SMS_SRV_RCD_TXCRTS on SMS_SURVEY_RECORD (CREATED_TX_STAMP);
create index SMS_SRV_RCD_TXSTMP on SMS_SURVEY_RECORD (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SMS_SURVEY_RESPONDENT
prompt ====================================
prompt
create table SMS_SURVEY_RESPONDENT
(
  SMS_SURVEY_ID         VARCHAR2(200) not null,
  MOBILE_NUMBER         VARCHAR2(20) not null,
  USER_NAME             VARCHAR2(40),
  LAST_UPDATED_STAMP    TIMESTAMP(6),
  LAST_UPDATED_TX_STAMP TIMESTAMP(6),
  CREATED_STAMP         TIMESTAMP(6),
  CREATED_TX_STAMP      TIMESTAMP(6)
)
;
comment on table SMS_SURVEY_RESPONDENT
  is '���ŵ��鱻����';
alter table SMS_SURVEY_RESPONDENT
  add constraint PK_SMS_SURVEY_RESPONDENT primary key (SMS_SURVEY_ID, MOBILE_NUMBER);
create index SMS_SRV_RSPNT_TXCS on SMS_SURVEY_RESPONDENT (CREATED_TX_STAMP);
create index SMS_SRV_RSPNT_TXSP on SMS_SURVEY_RESPONDENT (LAST_UPDATED_TX_STAMP);

prompt
prompt Creating table SMS_TEST_SEND
prompt ============================
prompt
create table SMS_TEST_SEND
(
  ID                  VARCHAR2(200) not null,
  CONTENT             VARCHAR2(2000),
  SUBMIT_TIME         DATE,
  MOBILE_TO           VARCHAR2(2000),
  MSG_ID              VARCHAR2(200),
  USER_ID             VARCHAR2(200),
  ORGANIZATION_ID     VARCHAR2(200),
  WAPPUSH_URL         VARCHAR2(200),
  DATE_INTERVAL_START NUMBER(4),
  DATE_INTERVAL_END   NUMBER(4),
  TIME_INTERVAL_START VARCHAR2(200),
  TIME_INTERVAL_END   VARCHAR2(200),
  INTERVAL            VARCHAR2(200),
  TYPE                NUMBER(2),
  STATUS              NUMBER(2),
  HOUR_MINUTE         NUMBER(2),
  SYS_ID              VARCHAR2(200)
)
;
comment on table SMS_TEST_SEND
  is '���Զ��Ų��Ա�';
comment on column SMS_TEST_SEND.ID
  is '���';
comment on column SMS_TEST_SEND.CONTENT
  is '���ݣ����Զ�׷��ʱ��';
comment on column SMS_TEST_SEND.SUBMIT_TIME
  is '�ύʱ��';
comment on column SMS_TEST_SEND.MOBILE_TO
  is '�ֻ���, ��Ӣ�Ķ��ŷָ�';
comment on column SMS_TEST_SEND.MSG_ID
  is '��Ϣ���ʱ��';
comment on column SMS_TEST_SEND.USER_ID
  is '�ύ�߱��';
comment on column SMS_TEST_SEND.ORGANIZATION_ID
  is '�ύ����������';
comment on column SMS_TEST_SEND.WAPPUSH_URL
  is 'WAPPUSH���ŵ����ӵ�ַ';
comment on column SMS_TEST_SEND.DATE_INTERVAL_START
  is '���Զ������ڼ���Ŀ�ʼʱ��, 2:����һ, 3:���ڶ�, 4:������, 5:������, 6:������, 7:������, 8:������';
comment on column SMS_TEST_SEND.DATE_INTERVAL_END
  is '���Զ������ڼ���Ŀ�ʼʱ��, 2:����һ, 3:���ڶ�, 4:������, 5:������, 6:������, 7:������, 8:������';
comment on column SMS_TEST_SEND.TIME_INTERVAL_START
  is '���Զ���ʱ�����Ŀ�ʼʱ��';
comment on column SMS_TEST_SEND.TIME_INTERVAL_END
  is '���Զ���ʱ�����Ľ���ʱ��';
comment on column SMS_TEST_SEND.INTERVAL
  is '���Զ��ŵļ������';
comment on column SMS_TEST_SEND.TYPE
  is '0:��ͨ����, 1:WAPPUSH����';
comment on column SMS_TEST_SEND.STATUS
  is '0:����, 1:��Ч, 2:ʧЧ';
comment on column SMS_TEST_SEND.HOUR_MINUTE
  is '0:Сʱ, 1:����';
comment on column SMS_TEST_SEND.SYS_ID
  is '��Ϣ��Դ';
alter table SMS_TEST_SEND
  add constraint PK_SMS_TEST_SEND primary key (ID);

prompt
prompt Creating table SMS_UNSUBSCRIBE_KEY_WORD
prompt =======================================
prompt
create table SMS_UNSUBSCRIBE_KEY_WORD
(
  KEY_WORD_ID       VARCHAR2(20) not null,
  KEY_WORD          VARCHAR2(200),
  STATUS            NUMBER(1),
  DESCRIPTION       VARCHAR2(200),
  SORT_INDEX        VARCHAR2(20),
  ORGANIZATION_ID   VARCHAR2(50),
  ORGANIZATION_NAME VARCHAR2(200),
  USER_ID           VARCHAR2(50),
  USER_NAME         VARCHAR2(200)
)
;
comment on table SMS_UNSUBSCRIBE_KEY_WORD
  is '�˶��ؼ��ֱ�';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.KEY_WORD_ID
  is '�ؼ��ֱ��';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.KEY_WORD
  is '�ؼ���';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.STATUS
  is '״̬, 0:ʧЧ, 1:��Ч';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.DESCRIPTION
  is '��ע';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.SORT_INDEX
  is '������';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.ORGANIZATION_ID
  is '�������';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.ORGANIZATION_NAME
  is '��������';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.USER_ID
  is '�û����';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.USER_NAME
  is '�û�����';
alter table SMS_UNSUBSCRIBE_KEY_WORD
  add constraint PK_SMS_UNSUBSCRIBE_KEY_WORD primary key (KEY_WORD_ID);

prompt
prompt Creating table SMS_VERCODE
prompt ==========================
prompt
create table SMS_VERCODE
(
  VERCODE_ID VARCHAR2(200) not null,
  MOBILE_TO  VARCHAR2(20) not null,
  USER_ID    VARCHAR2(200) not null,
  SEND_MSG   VARCHAR2(10),
  SEND_TIME  DATE default sysdate,
  REMARK     VARCHAR2(200),
  VERCODE    VARCHAR2(10)
)
;
comment on table SMS_VERCODE
  is '�ֻ���֤���';
comment on column SMS_VERCODE.VERCODE_ID
  is '����';
comment on column SMS_VERCODE.MOBILE_TO
  is '���յ��ֻ���';
comment on column SMS_VERCODE.USER_ID
  is '�����ֻ���֤����û�ID';
comment on column SMS_VERCODE.SEND_MSG
  is '��������';
comment on column SMS_VERCODE.SEND_TIME
  is '����ʱ��';
comment on column SMS_VERCODE.REMARK
  is '��ע';
comment on column SMS_VERCODE.VERCODE
  is '6λ��֤��';
alter table SMS_VERCODE
  add constraint VERCODE_ID primary key (VERCODE_ID);

prompt
prompt Creating table SMS_VIP
prompt ======================
prompt
create table SMS_VIP
(
  SMS_VIP_ID       VARCHAR2(50) not null,
  SMS_VIP_NAME     VARCHAR2(50),
  SMS_VIP_SHARE    NUMBER(1) default 0,
  SMS_VIP_MARK     VARCHAR2(100),
  SMS_VIP_GROUP_ID VARCHAR2(200),
  SMS_VIP_USER_ID  VARCHAR2(200),
  PHONE_NUMBER     VARCHAR2(20)
)
;
alter table SMS_VIP
  add primary key (SMS_VIP_ID);

prompt
prompt Creating table STYLE_BASE
prompt =========================
prompt
create table STYLE_BASE
(
  STYLE_ID   NUMBER(7) not null,
  SUBJECT    VARCHAR2(100),
  STYLE_KEY  VARCHAR2(10),
  THUMBNAIL  VARCHAR2(100),
  STATUS     NUMBER(1),
  CREAT_TIME DATE
)
;
comment on table STYLE_BASE
  is 'ƽ̨���������Ϣ��';
comment on column STYLE_BASE.STYLE_ID
  is '���';
comment on column STYLE_BASE.SUBJECT
  is '��������';
comment on column STYLE_BASE.STYLE_KEY
  is '�����Ӧ��Ӣ��KEY';
comment on column STYLE_BASE.THUMBNAIL
  is '��������ͼ����';
comment on column STYLE_BASE.STATUS
  is '�Ƿ�����, 0:��Ч����, 1:��Ч����';
comment on column STYLE_BASE.CREAT_TIME
  is '����ʱ��';
alter table STYLE_BASE
  add constraint PK_STYLE_BASE primary key (STYLE_ID);

prompt
prompt Creating table STYLE_USER_CONFIG
prompt ================================
prompt
create table STYLE_USER_CONFIG
(
  STYLE_CONFIG_ID NUMBER(7) not null,
  USER_ID         VARCHAR2(100),
  USER_NAME       VARCHAR2(100),
  F_ID            NUMBER(7),
  CREAT_TIME      DATE
)
;
comment on table STYLE_USER_CONFIG
  is '�û���Ӧ�������ñ�';
comment on column STYLE_USER_CONFIG.STYLE_CONFIG_ID
  is '���';
comment on column STYLE_USER_CONFIG.USER_ID
  is '�û����, ����ֶ���Ҫ����Ψһ��';
comment on column STYLE_USER_CONFIG.USER_NAME
  is '�û�����';
comment on column STYLE_USER_CONFIG.F_ID
  is '���õ�������';
comment on column STYLE_USER_CONFIG.CREAT_TIME
  is '����ʱ��';
alter table STYLE_USER_CONFIG
  add constraint PK_STYLE_USER_CONFIG primary key (STYLE_CONFIG_ID);

prompt
prompt Creating table SUBSYS_CODE
prompt ==========================
prompt
create table SUBSYS_CODE
(
  ID               VARCHAR2(200) not null,
  SUBSYS_CODE_ID   VARCHAR2(20),
  SUBSYS_CODE_NAME VARCHAR2(200),
  EXTEND_NUMBER    VARCHAR2(20),
  DESCRIPTION      VARCHAR2(200)
)
;
comment on table SUBSYS_CODE
  is '��Ϣ��Դ�����ֵ�';
comment on column SUBSYS_CODE.ID
  is '������';
comment on column SUBSYS_CODE.SUBSYS_CODE_ID
  is '��Ϣ��Դ���';
comment on column SUBSYS_CODE.SUBSYS_CODE_NAME
  is '��Ϣ��Դ����';
comment on column SUBSYS_CODE.EXTEND_NUMBER
  is '��չ��';
comment on column SUBSYS_CODE.DESCRIPTION
  is '��ע';
alter table SUBSYS_CODE
  add constraint PK_SUBSYS_CODE primary key (ID);
create unique index IDX_SUBSYSCODE_EXTNUM on SUBSYS_CODE (EXTEND_NUMBER);

prompt
prompt Creating table SYS_CONFIG
prompt =========================
prompt
create table SYS_CONFIG
(
  CONFIG_KEY   VARCHAR2(200) not null,
  CONFIG_VALUE VARCHAR2(200)
)
;
comment on table SYS_CONFIG
  is 'ϵͳʹ�õ���������';
comment on column SYS_CONFIG.CONFIG_KEY
  is '������, InitedData(�Ƿ��Ѿ���ʼ������),0:δ��ʼ��,1:�Ѿ���ʼ�����Ѿ���ʼ�����ٳ�ʼ��, PROHIBITEDWORD_POWER, 0:�ر�Υ����, 1:����Υ����';
comment on column SYS_CONFIG.CONFIG_VALUE
  is '����ֵ';
alter table SYS_CONFIG
  add constraint PK_SYS_CONFIG primary key (CONFIG_KEY);

prompt
prompt Creating table TASK_INFO
prompt ========================
prompt
create table TASK_INFO
(
  ID                    VARCHAR2(200) not null,
  ORG_ID                VARCHAR2(200),
  NAME                  VARCHAR2(200),
  FILE_URL              VARCHAR2(2000),
  CONTENT               VARCHAR2(600),
  TYPE                  NUMBER(10),
  SEND_STATUS           NUMBER(1),
  REPLY                 NUMBER(1),
  SIGNATURE             NUMBER(1),
  PRIOR_ID              NUMBER(10),
  TIME_TASK             NUMBER(1),
  EXTEND_CODE           NUMBER(1),
  SUB_TIME_TASK         NUMBER(19),
  VALID_MOBILE_COUNT    NUMBER(19),
  RUN_TIME              DATE,
  CREATE_TIME           DATE,
  INVALID_MOBILE_COUNT  NUMBER(19),
  USER_ID               VARCHAR2(200),
  STATUS                NUMBER(10),
  SMS_USER_TYPE         NUMBER(10),
  SEND_COUNT            NUMBER(19),
  END_TIME              DATE,
  CLIENT_GROUP          VARCHAR2(2000),
  BATCH_ID              VARCHAR2(2000),
  UNTREATED_MOBILE      CLOB,
  EXCEL_NAME            VARCHAR2(2000),
  LOSE_REASON           VARCHAR2(1000),
  REPEAT_NUM            CLOB,
  ILLEGAL_NUM           CLOB,
  ORIGINAL_MOBILE_COUNT NUMBER(19) default 0,
  BLACK_NUM             NUMBER(19) default 0,
  PROHIBITED_WORD_NUM   NUMBER(19) default 0,
  REPEAT_NUM_COUNT      NUMBER(19) default 0,
  ILLEGAL_NUM_COUNT     NUMBER(19) default 0,
  REPORT_ALL_COUNT      NUMBER(19) default 0,
  REPORT_SUCCESS_COUNT  NUMBER(19) default 0,
  REPORT_FAILURE_COUNT  NUMBER(19) default 0,
  REPORT_UNKNOWN_COUNT  NUMBER(19) default 0,
  GRANTER_ID            VARCHAR2(200)
)
;
comment on column TASK_INFO.ID
  is '����';
comment on column TASK_INFO.ORG_ID
  is '����id';
comment on column TASK_INFO.NAME
  is '������';
comment on column TASK_INFO.FILE_URL
  is '����ģ�巢�͵��ļ�λ��';
comment on column TASK_INFO.CONTENT
  is '��������';
comment on column TASK_INFO.TYPE
  is '�������� 0:���� 1:����';
comment on column TASK_INFO.SEND_STATUS
  is '����״̬';
comment on column TASK_INFO.SIGNATURE
  is '�û�ǩ��';
comment on column TASK_INFO.PRIOR_ID
  is '���ȼ�';
comment on column TASK_INFO.TIME_TASK
  is '�Ƿ��Ƕ�ʱ���� 0:���� 1:��';
comment on column TASK_INFO.EXTEND_CODE
  is '�û���չ��';
comment on column TASK_INFO.VALID_MOBILE_COUNT
  is '��Ч�ĵ绰����������';
comment on column TASK_INFO.RUN_TIME
  is '��������ʱ��';
comment on column TASK_INFO.CREATE_TIME
  is '���񴴽�ʱ��';
comment on column TASK_INFO.INVALID_MOBILE_COUNT
  is '��Ч�ĵ绰����������';
comment on column TASK_INFO.USER_ID
  is 'ί�����û�id';
comment on column TASK_INFO.STATUS
  is '����״̬ 0:δ���� 1:������ 2:��ͣ 3:ֹͣ 4:���ͽ���';
comment on column TASK_INFO.SMS_USER_TYPE
  is '�û�����';
comment on column TASK_INFO.SEND_COUNT
  is '����������';
comment on column TASK_INFO.END_TIME
  is '�������ʱ��';
comment on column TASK_INFO.CLIENT_GROUP
  is 'Ⱥ���id';
comment on column TASK_INFO.BATCH_ID
  is '�������Ͷ��ŵ����κ�';
comment on column TASK_INFO.UNTREATED_MOBILE
  is 'δ����ĺ���,���ڱ�����ͨ���͵ĺ���';
comment on column TASK_INFO.EXCEL_NAME
  is '�����������͵�excel_name';
comment on column TASK_INFO.LOSE_REASON
  is 'ʧ��ԭ��';
comment on column TASK_INFO.REPEAT_NUM
  is '��¼����������ظ�����';
comment on column TASK_INFO.ILLEGAL_NUM
  is '��¼��������ķǷ�����';
comment on column TASK_INFO.ORIGINAL_MOBILE_COUNT
  is '��¼���������δ���ǰ�ĺ�������';
comment on column TASK_INFO.BLACK_NUM
  is '��¼��������ĺ�������������';
comment on column TASK_INFO.PROHIBITED_WORD_NUM
  is '��¼���������Υ���ʺ�������';
comment on column TASK_INFO.REPEAT_NUM_COUNT
  is '��¼����������ظ���������';
comment on column TASK_INFO.ILLEGAL_NUM_COUNT
  is '��¼��������ķǷ���������';
comment on column TASK_INFO.REPORT_ALL_COUNT
  is '����״̬����������';
comment on column TASK_INFO.REPORT_SUCCESS_COUNT
  is '����״̬����ɹ�����';
comment on column TASK_INFO.REPORT_FAILURE_COUNT
  is '����״̬����ʧ������';
comment on column TASK_INFO.REPORT_UNKNOWN_COUNT
  is 'û�з���״̬��������';
comment on column TASK_INFO.GRANTER_ID
  is '����ί����';
alter table TASK_INFO
  add primary key (ID);

prompt
prompt Creating table TEMP_TABLE_TEST
prompt ==============================
prompt
create table TEMP_TABLE_TEST
(
  CREATE_SQL  CLOB,
  CREATE_TIME DATE
)
;

prompt
prompt Creating table UNIT_PRICE_INFO
prompt ==============================
prompt
create table UNIT_PRICE_INFO
(
  PRICE_ID          VARCHAR2(200) not null,
  ORGANIZATION_ID   VARCHAR2(200) not null,
  UNIT_PRICE        NUMBER(6,4) not null,
  START_DATE        DATE not null,
  END_DATE          DATE,
  CREATE_DATE       DATE default sysdate,
  EFFECTIVE         NUMBER,
  REMARK            VARCHAR2(200),
  ORGANIZATION_NAME VARCHAR2(200),
  GW_TYPE           NUMBER(1) default 0,
  BIZ_TYPE          NUMBER(1) default 0,
  CHANNEL_ID        NUMBER(5) default 0
)
;
comment on table UNIT_PRICE_INFO
  is '�����۸���Ϣ��';
comment on column UNIT_PRICE_INFO.PRICE_ID
  is 'ID';
comment on column UNIT_PRICE_INFO.ORGANIZATION_ID
  is '������id';
comment on column UNIT_PRICE_INFO.UNIT_PRICE
  is '�鵥��';
comment on column UNIT_PRICE_INFO.START_DATE
  is '��ʼ����';
comment on column UNIT_PRICE_INFO.END_DATE
  is '��ֹ����';
comment on column UNIT_PRICE_INFO.CREATE_DATE
  is '����ʱ��';
comment on column UNIT_PRICE_INFO.EFFECTIVE
  is '�Ƿ���ʷ����   0������ʷ���ۣ�1����ʷ����';
comment on column UNIT_PRICE_INFO.REMARK
  is '��ע';
comment on column UNIT_PRICE_INFO.ORGANIZATION_NAME
  is '����������';
comment on column UNIT_PRICE_INFO.GW_TYPE
  is '�Ŷ����͡�0-ȫ��·��1-�ƶ��ŶΣ�2-��ͨ�ŶΣ�3-С��ͨ�Ŷ�';
comment on column UNIT_PRICE_INFO.BIZ_TYPE
  is 'ҵ�����͡�0-��ͨ����ҵ��1-����ҵ��2-emailҵ��';
comment on column UNIT_PRICE_INFO.CHANNEL_ID
  is '����ͨ����0-����ͨ��';
alter table UNIT_PRICE_INFO
  add constraint UNIT_PRICE_INFO_PK primary key (PRICE_ID);

prompt
prompt Creating table USER_COMMON_CONFIG
prompt =================================
prompt
create table USER_COMMON_CONFIG
(
  ID                      NUMBER(18) not null,
  USER_ID                 VARCHAR2(200),
  BLACK_LEVEL             CHAR(1) default '0' not null,
  IS_SENSITIVE_TIME_DELAY CHAR(1) default '0'
)
;
comment on table USER_COMMON_CONFIG
  is '�û������������ñ�';
comment on column USER_COMMON_CONFIG.ID
  is '����';
comment on column USER_COMMON_CONFIG.USER_ID
  is '�û�UUID';
comment on column USER_COMMON_CONFIG.BLACK_LEVEL
  is '�����������0��ֻ���BLACK��������1�����BLACK��BLACK_CSMD��������2�����BLACK��BLACK_CSMD��BLACK_ZHUOYUE������';
comment on column USER_COMMON_CONFIG.IS_SENSITIVE_TIME_DELAY
  is '�Ƿ������ʱ���ӳ٣�1��������ʱ���ӳ٣�0��������ʱ�䲻�ӳ�';
alter table USER_COMMON_CONFIG
  add constraint PK_USER_COMMON_CONFIG primary key (ID);
alter table USER_COMMON_CONFIG
  add constraint FK_USER_COM_REFERENCE_USER_INF foreign key (USER_ID)
  references USER_INFO (USER_ID);

prompt
prompt Creating table USER_CONFIG_INFO
prompt ===============================
prompt
create table USER_CONFIG_INFO
(
  CONFIG_ID  VARCHAR2(200) not null,
  CHANNEL_ID VARCHAR2(200),
  KEY        VARCHAR2(50),
  VALUE      VARCHAR2(100),
  REMARK     VARCHAR2(200)
)
;
comment on table USER_CONFIG_INFO
  is '�û�����';
comment on column USER_CONFIG_INFO.CONFIG_ID
  is '���ñ��';
comment on column USER_CONFIG_INFO.CHANNEL_ID
  is 'ͨ�����';
comment on column USER_CONFIG_INFO.KEY
  is '�ؼ���';
comment on column USER_CONFIG_INFO.VALUE
  is 'ֵ';
comment on column USER_CONFIG_INFO.REMARK
  is '��ע';
alter table USER_CONFIG_INFO
  add constraint PK_USER_CONFIG_INFO primary key (CONFIG_ID);

prompt
prompt Creating table USER_CONFIG_KEY_INFO
prompt ===================================
prompt
create table USER_CONFIG_KEY_INFO
(
  CONFIG_KEY_ID   VARCHAR2(200) not null,
  CONFIG_KEY_NAME VARCHAR2(50),
  REMARK          VARCHAR2(200),
  CONFIG_KEY_TYPE VARCHAR2(2)
)
;
comment on table USER_CONFIG_KEY_INFO
  is '�û����ùؼ����ֵ��';
comment on column USER_CONFIG_KEY_INFO.CONFIG_KEY_ID
  is '���ùؼ��ֱ��';
comment on column USER_CONFIG_KEY_INFO.CONFIG_KEY_NAME
  is '�ؼ���';
comment on column USER_CONFIG_KEY_INFO.REMARK
  is '��ע';
comment on column USER_CONFIG_KEY_INFO.CONFIG_KEY_TYPE
  is '�ؼ�������, -1:ȫͨ������, 1:��ͨ������';
alter table USER_CONFIG_KEY_INFO
  add constraint PK_USER_CONFIG_KEY_INFO primary key (CONFIG_KEY_ID);

prompt
prompt Creating table USER_SEND_GRANT
prompt ==============================
prompt
create table USER_SEND_GRANT
(
  ID           VARCHAR2(100) not null,
  GRANTEE_ID   VARCHAR2(100) not null,
  GRANTER_ID   VARCHAR2(100) not null,
  GRANT_TYPE   VARCHAR2(10) not null,
  GRANT_REMARK VARCHAR2(200),
  SYSTEM_TIME  TIMESTAMP(6)
)
;
comment on table USER_SEND_GRANT
  is '�û�������Ȩ��';
comment on column USER_SEND_GRANT.ID
  is 'id';
comment on column USER_SEND_GRANT.GRANTEE_ID
  is '����Ȩ��id ������ʵ�ʷ�����';
comment on column USER_SEND_GRANT.GRANTER_ID
  is '��Ȩ��id ������ʵ��������';
comment on column USER_SEND_GRANT.GRANT_TYPE
  is '�������� ����ΪΪ����������Ϊ���˴�������Ȩ��id�ܸ��ֶ�Ӱ��ֱ�����ǻ���id���û�id';
comment on column USER_SEND_GRANT.GRANT_REMARK
  is '��ע��Ϣ';
comment on column USER_SEND_GRANT.SYSTEM_TIME
  is '��Ȩ��ϵ������';
alter table USER_SEND_GRANT
  add constraint PK_USER_SEND_GRANT primary key (ID);

prompt
prompt Creating table VIP_SPECIAL_INFO
prompt ===============================
prompt
create table VIP_SPECIAL_INFO
(
  VIP_SPECIAL_INFO_ID NUMBER(18) not null,
  SEND_MSG            VARCHAR2(600),
  STATUS              NUMBER(18),
  SUBSCRIBE_NUMBER    VARCHAR2(50),
  USER_ID             VARCHAR2(50),
  USER_NAME           VARCHAR2(50),
  ORGANIZATION_ID     VARCHAR2(50),
  ORGANIZATION_NAME   VARCHAR2(50),
  CREATE_TIME         DATE,
  AUDIT_TIME          DATE,
  SEND_TIME           DATE,
  PRODUCT_ID          VARCHAR2(600)
)
;
alter table VIP_SPECIAL_INFO
  add constraint PK_VIP_SPECIAL_INFO primary key (VIP_SPECIAL_INFO_ID);

prompt
prompt Creating table V_SEND_USER_ORG
prompt ==============================
prompt
create table V_SEND_USER_ORG
(
  SEND_ID                VARCHAR2(200) not null,
  MOBILE_TO              VARCHAR2(20),
  SEND_MSG               VARCHAR2(2000),
  SP_SERV_NO             VARCHAR2(20),
  SYS_TIME               DATE,
  PRIOR_ID               NUMBER(10),
  PRE_SEND_TIME          DATE,
  SEND_STATUS            NUMBER(19),
  SEND_TIME              DATE,
  COM_RTN_TIME           DATE,
  ERR_MSG                VARCHAR2(500),
  REPORT                 VARCHAR2(100),
  REPORT_TIME            DATE,
  CHANNEL_ID             NUMBER(19),
  MOBILE_COM             NUMBER(19),
  REMARK                 VARCHAR2(500),
  USER_ID                VARCHAR2(200),
  SEQUENCE               VARCHAR2(128),
  MOBILE_QUANTITIES      NUMBER(10),
  RESEND_TIMES           NUMBER(1),
  SIGNATURE              VARCHAR2(40),
  USER_ORGANIZATION      VARCHAR2(200),
  BATCH_ID               VARCHAR2(200),
  MSG_TYPE               VARCHAR2(50),
  CONSUME_SEND_ID        VARCHAR2(200),
  IS_LONGSMS             NUMBER(1),
  IS_ORIGINAL_SMS        NUMBER(1),
  ORIGINALSMS_SENDID     VARCHAR2(200),
  CURRENT_PAGENO         NUMBER(1),
  ORIGINALSMS_TOTALPAGES NUMBER(1),
  LONGSMS_TAG            NUMBER(10),
  LONGSMS_SPLITED        NUMBER(1),
  GW_SUBMIT_TIME         DATE,
  GW_DONE_TIME           DATE,
  UNIT_PRICE             FLOAT,
  RETURN_FEE             NUMBER(1),
  RECEIVE_ID             VARCHAR2(200),
  EXTRA_KEYWORD_NUM      VARCHAR2(200),
  USER_NAME              VARCHAR2(200),
  ORG_NAME               VARCHAR2(200)
)
;
alter table V_SEND_USER_ORG
  add primary key (SEND_ID);

prompt
prompt Creating table WHITE_INFO
prompt =========================
prompt
create table WHITE_INFO
(
  ORG_ID                VARCHAR2(50) not null,
  USER_ID               VARCHAR2(200) not null,
  MOBILE                VARCHAR2(50) not null,
  USER_NAME             VARCHAR2(50),
  CREATED_STAMP         DATE,
  CREATED_TX_STAMP      DATE default sysdate,
  LAST_UPDATED_STAMP    DATE,
  LAST_UPDATED_TX_STAMP DATE
)
;
alter table WHITE_INFO
  add primary key (ORG_ID, USER_ID, MOBILE);
alter table WHITE_INFO
  add constraint FK2E115F24D5594142 foreign key (USER_ID)
  references USER_INFO (USER_ID);

prompt
prompt Creating table WHITE_JOB_CONFIG
prompt ===============================
prompt
create table WHITE_JOB_CONFIG
(
  ORG_ID             VARCHAR2(50) not null,
  DO_CONGRATULATIONS VARCHAR2(20),
  ACTION_TIME        DATE
)
;
alter table WHITE_JOB_CONFIG
  add primary key (ORG_ID);

prompt
prompt Creating table WHITE_ORG_CONFIG
prompt ===============================
prompt
create table WHITE_ORG_CONFIG
(
  ORG_ID   VARCHAR2(50) not null,
  MO_OWNER VARCHAR2(12)
)
;
alter table WHITE_ORG_CONFIG
  add primary key (ORG_ID);

prompt
prompt Creating sequence HIBERNATE_SEQUENCE
prompt ====================================
prompt
create sequence HIBERNATE_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1821
increment by 1
cache 20;

prompt
prompt Creating sequence MMS_SEND_SEQ
prompt ==============================
prompt
create sequence MMS_SEND_SEQ
minvalue 10000
maxvalue 9999999999999999999
start with 100000
increment by 1
cache 20;

prompt
prompt Creating sequence MMS_STOCK_PAPER_ID_SEQUENCE
prompt =============================================
prompt
create sequence MMS_STOCK_PAPER_ID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PERMIT_WORD_SEQ
prompt =================================
prompt
create sequence PERMIT_WORD_SEQ
minvalue 1
maxvalue 9999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PRODUCT_SEQ
prompt =============================
prompt
create sequence PRODUCT_SEQ
minvalue 100000
maxvalue 999999999999999999999999999
start with 100000
increment by 1
cache 2;

prompt
prompt Creating sequence PROHIBIT_WORD_SEQ
prompt ===================================
prompt
create sequence PROHIBIT_WORD_SEQ
minvalue 1
maxvalue 9
start with 10
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CHANNEL_USER
prompt ==================================
prompt
create sequence SEQ_CHANNEL_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 2722
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MMSSCHEDULE
prompt =================================
prompt
create sequence SEQ_MMSSCHEDULE
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MMS_SEND
prompt ==============================
prompt
create sequence SEQ_MMS_SEND
minvalue 1
maxvalue 9999999999999999999999999999
start with 161
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NITICE_USER
prompt =================================
prompt
create sequence SEQ_NITICE_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 6000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NOTICE
prompt ============================
prompt
create sequence SEQ_NOTICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1578
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORDER_INFO
prompt ================================
prompt
create sequence SEQ_ORDER_INFO
minvalue 0
maxvalue 999999999999999
start with 423
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_ORGANIZATION
prompt ==================================
prompt
create sequence SEQ_ORGANIZATION
minvalue 1
maxvalue 9999999999999999999999999999
start with 562
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORG_CONFIG
prompt ================================
prompt
create sequence SEQ_ORG_CONFIG
minvalue 1
maxvalue 9999999999999999999999999999
start with 221
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PAYMENT_RECORD
prompt ====================================
prompt
create sequence SEQ_PAYMENT_RECORD
minvalue 1
maxvalue 9999999999999999999999999999
start with 2461
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE
prompt ==========================
prompt
create sequence SEQ_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 5899
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE_PERMISSION
prompt =====================================
prompt
create sequence SEQ_ROLE_PERMISSION
minvalue 1
maxvalue 9999999999999999999999999999
start with 1240
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RULE_ITEM
prompt ===============================
prompt
create sequence SEQ_RULE_ITEM
minvalue 1
maxvalue 999999999999999999999999999
start with 7769
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_TASKINFO
prompt ==============================
prompt
create sequence SEQ_TASKINFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 3381
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERINFO
prompt ==============================
prompt
create sequence SEQ_USERINFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 841
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_ACCOUNT_CHANNEL_SEQ
prompt =========================================
prompt
create sequence SGW_ACCOUNT_CHANNEL_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_ACCOUNT_INFO_SEQ
prompt ======================================
prompt
create sequence SGW_ACCOUNT_INFO_SEQ
minvalue 1
maxvalue 99999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_CUSTOMER_SEQ
prompt ==================================
prompt
create sequence SGW_CUSTOMER_SEQ
minvalue 1
maxvalue 9999999999999999999999
start with 8998
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_MO_TASK_SEQ
prompt =================================
prompt
create sequence SGW_MO_TASK_SEQ
minvalue 1
maxvalue 99999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_REPORT_TASK_SEQ
prompt =====================================
prompt
create sequence SGW_REPORT_TASK_SEQ
minvalue 1
maxvalue 99999999999999999999
start with 7181
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_SIGNATURE_POOL_SEQ
prompt ========================================
prompt
create sequence SGW_SIGNATURE_POOL_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SMS_RECEIVE_SEQ
prompt =================================
prompt
create sequence SMS_RECEIVE_SEQ
minvalue 10000
maxvalue 9999999999999999999
start with 100000
increment by 1
cache 20;

prompt
prompt Creating sequence SMS_SEND_SEQ
prompt ==============================
prompt
create sequence SMS_SEND_SEQ
minvalue 5000000
maxvalue 9999999999999999999
start with 5000000
increment by 1
cache 20;

prompt
prompt Creating sequence USER_COMMON_CONFIG_SEQ
prompt ========================================
prompt
create sequence USER_COMMON_CONFIG_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 7682
increment by 1
cache 20;

prompt
prompt Creating sequence VIP_SPECIAL_INFO_ID_SEQUENCE
prompt ==============================================
prompt
create sequence VIP_SPECIAL_INFO_ID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating view BLACK_USER_ORG
prompt ============================
prompt
create or replace view black_user_org as
select b.black_id,b.black_mobile,b.black_desc,b.black_type,b.oper_userid,b.oper_orgid,b.group_id,u.user_name as oper_userName, o.user_name as org_name,oper_org.user_name as oper_org_name
                     from black b left join user_info u on b.oper_userid = u.user_id left join  organization o on b.group_id = o.user_id left join organization oper_org on b.oper_orgid = oper_org.user_id

 ;

prompt
prompt Creating view CUSTOMER_GROUP_USER_VIEW
prompt ======================================
prompt
create or replace view customer_group_user_view as
select
       c.customer_id,
       c.mobile_user_name,
       c.mobile,
       c.email,
       c.create_user_id,
       c.organization_id as customer_org_id,
       c.create_time,
       c.mobile_remark,
       u.user_id,
       u.user_name,
       g.group_id,
       g.group_name,
       g.organization_id
  from customer_group cg
  left join group_info g on g.group_id = cg.group_id
  left join customer c on cg.customer_id = c.customer_id
  left join user_info u on g.user_id = u.user_id

 ;

prompt
prompt Creating view CUSTOMER_USER_VIEW
prompt ================================
prompt
create or replace view customer_user_view as
select
       sys_guid() id,
       c.customer_id,
       c.mobile_user_name,
       c.mobile,
       c.email,
       c.organization_id as customer_org_id,
       c.create_user_id,
       c.create_time,
       c.mobile_remark,
       u.user_id,
       u.user_name,
       g.group_id,
       g.group_name,
       g.organization_id
  from customer c
  left join customer_group cg on c.customer_id = cg.customer_id
  left join group_info g on g.group_id = cg.group_id
  left join user_info u on g.user_id = u.user_id

 ;

prompt
prompt Creating view GROUP_INFO_VIEW
prompt =============================
prompt
create or replace view group_info_view as
select "GROUP_ID","USER_ID","GROUP_NAME","GROUP_REMARK","CREATE_TIME","MODIFY_TIME","ORGANIZATION_ID","CREATE_USER_ID","IS_SHARE" from group_info a where a.group_id in(select c.group_id from group_info c group by c.group_id having count(c.group_id)=1)

;

prompt
prompt Creating view PAYMENT_RECORD_USER_ORG
prompt =====================================
prompt
create or replace view payment_record_user_org as
select
pr.payment_id,pr.user_id,pr.user_type,(case
when  pr.user_type='1' then o.user_name
when pr.user_type='0' then ui.user_name
end) user_name,pr.payment_time,pr.payment_money,pr.payment_type,pr.payment_quota,pr.quota_type,(select u.user_name from user_info u where u.user_id=pr.operator_id) operator_id ,
pr.is_online,pr.recharge_explain,pr.is_success
 from payment_record pr left join user_info ui on pr.user_id=ui.user_id left join organization o on pr.user_id=o.user_id

;

prompt
prompt Creating view USER_ORG_DATA
prompt ===========================
prompt
create or replace view user_org_data as
select o.user_name as user_name,u.nick_name as nick_name,o.pay_mode as pay_mode,
u.mobile as mobile,o.user_balance as user_balance,o.user_name as org_name,o.user_id as user_id,o.parentid as parentid,
o.user_quota as sms_quota,o.mms_quota as mms_quota,o.pay_type as pay_type,
u.user_type as user_type,u.user_stat as user_stat from organization o inner join  user_info u on o.user_id=u.organization_id

 ;

prompt
prompt Creating view VIEW_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create or replace view view_channel_rule_set_item as
select  u.user_name username,o.user_name orgName,s.RULE_SET_ITEM_NAME ruleSetItemName,s.SALIENCE,s.is_wappush,s.default_mobile_channel_id,s.default_union_channel_id,
        s.default_dx_channel_id,s.rule_set_item_id,s.org_id,s.USER_ID
 from SMS_CHANNEL_RULE_SET_ITEM s
    left join organization o on o.user_id = s.org_id
    left join user_info u on u.user_id = s.user_id
;

prompt
prompt Creating view VIEW_CMPP_ACCOUNT
prompt ===============================
prompt
create or replace view view_cmpp_account as
select
      u.user_id                     user_id,      --�û����
      u.user_name                   user_name,    --�˻���¼��
      u.user_kind                   user_kind,    --�˻����1��Webƽ̨�û���2��WebService�ӿ��û���3��CMPP�ӿ��û���4��HTTP�ӿ��û�
      ucc.black_level               black_level,  --����������
      ucc.is_sensitive_time_delay   is_sensitive_time_delay,--�Ƿ������ʱ���ӳ٣�1��������ʱ���ӳ٣�0��������ʱ�䲻�ӳ�
      org.user_id                   org_id,       --����ID
      org.eng_signature             eng_signature,  --Ӣ������ǩ��
      org.chn_signature             chn_signature,  --��������ǩ��
      org.extend_number             extend_number,  --��չ��
      sc.sgw_id                     sgw_id,       --���ر�ţ�CMPP�˻���������Ϣ)
      sc.account_pass               account_pass, --�����˻�����
      sc.registed_ip                registed_ip,  --�ͻ���ע��IP
      sc.prior_id                   prior_id,     --���ȼ�
      sc.flux_limit                 flux_limit,   --����
      sc.mt_worker_num              mt_worker_num,--���д����߳�����
      sc.mt_cache_num               mt_cache_num, --���л�����г���
      sc.server_active_test         server_active_test,--����˷�����·��� 0:������, 1:����
      sc.is_channel_account         is_channel_account,--�Ƿ������˺ţ� 0:��, 1:��
      sc.signature_type             signature_type,--ǩ�����ͣ�1����ͨ����ǩ����2���Ӷ˿�����ǩ����3������ǩ������Ҫͨ��ǩ���ع��˼�飩
      sc.check_prohibitedword       check_prohibitedword,--�Ƿ���Υ���ʣ� 0:��, 1:��
      sc.comments                   comments,
      sc.sys_time                   sys_time
FROM user_info u
left join sgw_account_info sc on sc.user_id = u.user_id
left join user_common_config ucc on ucc.user_id = u.user_id
LEFT JOIN ORGANIZATION org ON org.user_id = u.organization_id
where u.USER_STAT = 1 --��Ч
with read only

;

prompt
prompt Creating view VIEW_ORANIZATION
prompt ==============================
prompt
CREATE OR REPLACE VIEW VIEW_ORANIZATION AS
SELECT org.user_id              org_id,     --�������
       org.user_name            org_name    --��������
 FROM ORGANIZATION org
 where org.user_stat = 1    --��Ч��������1��Ч��������0����Ч��
with read only

;

prompt
prompt Creating view VIEW_RT_RECEIVE_REPORT_URL
prompt ========================================
prompt
create or replace view view_rt_receive_report_url as
select
       r.url_id,r.user_id,u.user_name as user_name,r.push_channel,r.format_str,r.push_url,r.push_url_type,r.create_time,r.status,r.is_certification,r.user_name as client_user_name,r.pass_word as client_pass_word,r.uanswer_times,r.next_push_time
    from RT_RECEIVE_REPORT_URL r inner join  USER_INFO u on r.user_id =u.user_id
;

prompt
prompt Creating view VIEW_USER_CUSTOMER_ORG
prompt ====================================
prompt
CREATE OR REPLACE VIEW VIEW_USER_CUSTOMER_ORG AS
SELECT customer."CUSTOMER_ID",customer."CUSTOMER_NAME",customer."P_CUSTOMER_ID",customer."USER_ID",customer."ORG_ID",customer."SUB_EXTEND_NUMBER",customer."COMMENTS",customer."CUSTOMER_STATUS",customer."SYS_TIME",
       userinfo.user_name           user_name,      --�û��˺�
       org.user_name                org_name,       --��������
       org.eng_signature            eng_signature,  --Ӣ��ǩ��
       org.chn_signature            chn_signature   --����ǩ��
FROM sgw_customer customer
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --������
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --�û���
with read only

;

prompt
prompt Creating view VIEW_USER_SGW_SIGNATURE_POOL
prompt ==========================================
prompt
CREATE OR REPLACE VIEW VIEW_USER_SGW_SIGNATURE_POOL AS
SELECT signaturepool."SIGNATURE_ID",signaturepool."CUSTOMER_ID",signaturepool."SIGNATURE",signaturepool."DESCRIPTION",signaturepool."SORT_INDEX",signaturepool."DO_APPEND_MSG",signaturepool."APPEND_MSG",signaturepool."BLACK_LEVEL",signaturepool."COMMENTS",signaturepool."SIGNATURE_STATUS",signaturepool."SYS_TIME",
       customer.org_id,               --�������
       customer.p_customer_id,        --�ͻ���ID
       customer.customer_name,        --�ͻ�����
       userinfo.user_id,              --�û�ID
       userinfo.user_name   user_name,--�û��˺�
       org.user_name        org_name --��������
FROM sgw_signature_pool  signaturepool            --ǩ���ر�
LEFT JOIN sgw_customer customer ON customer.customer_id = signaturepool.customer_id --ǩ���ر�
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --������
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --�û���
with read only

;

prompt
prompt Creating view VIP_USER_ORG
prompt ==========================
prompt
create or replace view vip_user_org as
select s."SMS_VIP_ID",s."SMS_VIP_NAME",s."SMS_VIP_GROUP_ID", s.sms_vip_mark,s.sms_vip_share,s."SMS_VIP_USER_ID",s."PHONE_NUMBER",u.user_name as user_name, o.user_name as org_name
                     from sms_vip s left join user_info u on s.sms_vip_user_id = u.user_id left join  organization o on s.sms_vip_group_id = o.user_id

 ;

prompt
prompt Creating view V_SMS_ANALYZE
prompt ===========================
prompt
create or replace view v_sms_analyze as
select o.user_name as org_name,
       u.user_name,
       sa.quantity,
       sa.stat_time,
       sa.org_id,
       sa.user_id,
       sa.status
  from sms_send_analyze sa
inner join organization o on o.user_id=sa.org_id
inner join user_info u on u.user_id=sa.user_id
;

prompt
prompt Creating view V_CUSTOMER_MANAGER_ORG_DATA
prompt =========================================
prompt
create or replace view v_customer_manager_org_data as
select o.user_name,o.user_id,us.nick_name,o.customer_manager_id,v.stat_time,sum(v.quantity) quantity,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel
 from organization o left join v_sms_analyze v on v.org_id=o.user_id
 left join org_config orgconfig on orgconfig.organization_id=o.user_id left join user_info us on o.customer_manager_id=us.user_id
 group by o.user_name,o.user_id,us.nick_name,o.customer_manager_id,v.stat_time,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel

;

prompt
prompt Creating view V_NOTICE_USER
prompt ===========================
prompt
create or replace view v_notice_user as
select  n."ID",n."CONTENT",n."UPLOAD_DATE",n."OPERATOR_ID",n."TITLE",n."VIABLE_DATE",n."SEND_USER_TYPE",n."IS_PASTDUE",u.user_name,u.nick_name from notice n inner join user_info u on n.operator_id=u.user_id

;

prompt
prompt Creating view V_SEND_USER
prompt =========================
prompt
create or replace view v_send_user as
select send.send_id,
       ui.user_id,
       send.mobile_to,
       ui.user_name,
       send.send_msg,
       send.send_time,
       send.user_organization,
       send.send_status,
       send.report,
       send.longsms_splited,
       send.pre_send_time,
       send.channel_id,
       send.mobile_com,
       send.signature,
       send.is_original_sms,
       send.mobile_quantities,
       send.is_longsms,
       send.sys_time
 from send send
 inner join user_info ui on send.user_id = ui.user_id
 order by send.send_time desc nulls last

;

prompt
prompt Creating view V_SMS_HOMEPAGE_USERSEND
prompt =====================================
prompt
create or replace view v_sms_homepage_usersend as
select u.user_id,
       u.user_name nick_name,
       u.user_balance,
       u.user_quota,
       u.mms_quota,
       u.pay_mode,
       u.organization_id org_id,
       u.email,
       u.mobile,
       nvl(sum(s.mobile_quantities), 0) quantity
  from user_info u
  left join send s on s.user_id = u.user_id
       and to_char(s.send_time, 'yyyy-mm-dd') = to_char(sysdate - 1, 'yyyy-mm-dd')
       and s.is_original_sms = 0
  where u.user_stat=1
  group by u.user_id,
          u.user_name,
          u.user_balance,
          u.user_quota,
          u.mms_quota,
          u.pay_mode,
          u.organization_id,
          u.email,
          u.mobile

;

prompt
prompt Creating view V_SMS_USER_BY_TIME
prompt ================================
prompt
create or replace view v_sms_user_by_time as
select rownum id,u.user_id,u.nick_name,u.user_balance,u.user_quota,u.mms_quota,u.pay_mode,vs.org_id,u.email,
u.mobile,vs.quantity,vs.stat_time from user_info u
left join v_sms_analyze vs on u.user_id=vs.user_id

;

prompt
prompt Creating view V_TASKINFO_USER
prompt =============================
prompt
create or replace view v_taskinfo_user as
select
  t.id,
  t.org_id,
  t.name,
  t.file_url,
  t.content,
  t.type,
  t.send_status,
  t.reply,
  t.signature,
  t.prior_id,
  t.time_task,
  t.extend_code,
  t.sub_time_task,
  t.valid_mobile_count,
  t.run_time,
  t.create_time,
  t.invalid_mobile_count,
  t.user_id,
  u.user_name,
  t.status,
  t.sms_user_type,
  t.send_count,
  t.end_time,
  t.client_group,
  t.batch_id,
  t.untreated_mobile,
  t.excel_name,
  t.lose_reason,
  t.original_mobile_count,
  t.black_num,
  t.repeat_num_count,
  t.prohibited_word_num,
  t.illegal_num_count,
  t.report_all_count,
  (nvl(t.report_success_count,0)+nvl(t.report_unknown_count,0)) report_success_count,
  nvl(t.report_failure_count,0)  report_failure_count,
  t.report_unknown_count,
  t.granter_id,
  (select u.user_name from user_info u where u.user_id=t.granter_id) granterName
  from task_info t
  LEFT join  user_info u on t.user_id= u.user_id

;

prompt
prompt Creating package REPORT_RECKONING_PACKAGE
prompt =========================================
prompt
create or replace package REPORT_RECKONING_PACKAGE is
   -- Author  : zhanhh
   --����洢���̰�
   -- Created : 2013/6/11 11:04:24

/**
  * �սᵥ��ʱ��������
  * ��ѯ����,Ȼ������սᵥ��daily_reckoning_info�Ĵ洢����
  * Author  : zhanhh
  * Created : 2013-06-28 16:56:32
  *
*/
  procedure INSERT_DAILY_RECKONING_REPORT;


/**
  * ���˵���ʱ��������
  * ��ѯ����,Ȼ��������˵���insert_month_reckoning_report�Ĵ洢����
  * Author  : zhanhh
  * Created : 2013-07-03 18:49:32
  *
*/
  procedure INSERT_MONTH_RECKONING_REPORT;

  /**
  * �սᵥ��ѯ
  * Author  : zhanhh
  * Created : 2013-07-04 16:01:32
  *
*/
  procedure QUERY_RECKONING_INFO_REPORT;

/**
  * ���˵���ѯ
  * Author  : zhanhh
  * Created : 2013-07-04 16:01:32
  *
*/
  procedure QUERY_MONTH_INFO_REPORT;

/* ���շ�������ʧ�ܵĶ��ŷ��ø��û�
*  Author  : zhanhh
*  Created : 2013-07-04 16:01:32
*  ������ͨ��: ���ò��,ֻ��ԭʼ��������
*  ֱ��ͨ��: �̶���--���ò��,ֻ��ԭʼ��������;������--ֻ�����ֺ�Ķ�������
*/
   procedure P_SMS_RETURN_FEE;

end REPORT_RECKONING_PACKAGE;
/

prompt
prompt Creating type TYP_TABELTYPE
prompt ===========================
prompt
create or replace type TYP_TABELTYPE is object(channel_id varchar2(200),gw_type varchar2(200),send_quantity number(10));
/

prompt
prompt Creating type TYP_TABEL
prompt =======================
prompt
create or replace type TYP_TABEL is table of TYP_TABELTYPE;
/

prompt
prompt Creating function FNC_CON_STR_TO_TAB
prompt ====================================
prompt
CREATE OR REPLACE FUNCTION FNC_CON_STR_TO_TAB(P_STR IN VARCHAR2) RETURN TYP_TABEL AS

/*
������
    ��ͨ��-�Ŷ�-����Ϊ�ַ������в��
��ѯ������
    �ޡ�
��ʽ��
    �ޡ�
�㷨��
    �ޡ�
��ע��
   �磺
select *  from table(FNC_CON_STR_TO_TAB('122:1-400;123:2-500;124:3-200;'));
--------------------------------------------------------------------------------
channel_id|gw_type|send_quantity
122       |  1    |  400
123       |  2    |  500
124       |  3    |  200

*/

  LSTR  VARCHAR2(10240) DEFAULT P_STR;
  LSTR2 varchar2(1000);
  gw_type varchar2(200);
  channel_id varchar2(200);
  send_quantity number(10);
  LN    NUMBER;
  t_Object TYP_TABELTYPE;
  LDATA TYP_TABEL := TYP_TABEL();
BEGIN
  LOOP
    LN := INSTR(LSTR, ';');
    EXIT WHEN(NVL(LN, 0) = 0);
    LDATA.EXTEND;
    LSTR2:=LTRIM(RTRIM(SUBSTR(LSTR, 1, LN - 1)));
    channel_id:=LTRIM(RTRIM(substr(LSTR2,1,instr(LSTR2,':')-1)));
    gw_type:=LTRIM(RTRIM(substr(substr(LSTR2,instr(LSTR2,':')+1),1,instr(substr(LSTR2,instr(LSTR2,':')+1),'-')-1)));
    send_quantity:=to_number(LTRIM((RTRIM((substr(LSTR2,instr(LSTR2,'-')+1))))));
    t_Object:=TYP_TABELTYPE(channel_id,gw_type,send_quantity);
    LDATA(LDATA.Count):= t_Object;
    LSTR := SUBSTR(LSTR, LN + 1);
  END LOOP;
  RETURN LDATA;
END FNC_CON_STR_TO_TAB;
/

prompt
prompt Creating function FUN_JXDATE
prompt ============================
prompt
create or replace function FUN_JXDATE(p_date varchar2)
       return varchar2
is
       backDate varchar2(50);

       v_year varchar2(30);
       v_month varchar2(30);
       v_day varchar2(30);
begin

       v_year := SUBSTR(p_date, 0, 4 );
       v_month := SUBSTR(p_date, instr(p_date, '-',1,1) + 1, 2 );
       v_day := SUBSTR(p_date, instr(p_date, '-',-1,1)+1, 2);

       backDate := 'SEND_HIS_' || v_year || '_' || v_month || '_' || v_day;
       return backDate;
end FUN_JXDATE;
/

prompt
prompt Creating function FUN_JXMDATE
prompt =============================
prompt
create or replace function FUN_JXMDATE(p_date varchar2)
       return varchar2
is
       backDate varchar2(50);

       v_year varchar2(30);
       v_month varchar2(30);
       v_day varchar2(30);
begin

       v_year := SUBSTR(p_date, 0, 4 );
       v_month := SUBSTR(p_date, instr(p_date, '-',1,1) + 1, 2 );
       v_day := SUBSTR(p_date, instr(p_date, '-',-1,1)+1, 2);

       backDate := 'MMS_SEND_HIS_' || v_year || '_' || v_month || '_' || v_day;
       return backDate;
end FUN_JXMDATE;
/

prompt
prompt Creating function ISNUMERIC
prompt ===========================
prompt
create or replace function isnumeric    ( p_string in varchar2)
  return varchar2
  as
      l_number number;
  begin
     if p_string is null then
      return '�ܲ�';
     Elsif p_string = '' then
      return '�ܲ�';
     Else
       return p_string;
     end if;
  exception    when others then
          return '�ܲ�';
  end;
/

prompt
prompt Creating function MD5
prompt =====================
prompt
CREATE OR REPLACE FUNCTION MD5(
passwd IN VARCHAR2)
RETURN VARCHAR2
IS
retval varchar2(32);
BEGIN
retval := utl_raw.cast_to_raw(DBMS_OBFUSCATION_TOOLKIT.MD5(INPUT_STRING => passwd)) ;
RETURN retval;
END;
/

prompt
prompt Creating function TEST_CREATE_ROWID
prompt ===================================
prompt
create or replace function test_create_rowId
return varchar2
is
row_id varchar2(100);
begin
  select to_char(sysdate,'yyyymmddhh24miss')||lpad(round(dbms_random.value(1,999999999)),9,0) into row_id from dual;
return row_id;
end;
/

prompt
prompt Creating procedure CREATE_VERCODE
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE CREATE_VERCODE
   (USERNAME IN USER_INFO.USER_NAME%TYPE,
    MOBILE   IN SEND.MOBILE_TO%TYPE,
    VERCODE  OUT NUMBER 
   )
IS
V_CODE VARCHAR2(100);      --����:��ʱ�洢��ʱ���ɵ���֤��
V_NUMBER NUMBER;           --����:��ǰ�û����ֻ����Ƿ��Ѿ����һ�ο� 
BEGIN
  V_NUMBER := 0;

  SELECT LPAD(ROUND(DBMS_RANDOM.VALUE(1,999999999)),6,0) INTO V_CODE FROM DUAL;
  
  SELECT COUNT(1) INTO V_NUMBER FROM MOBILE_VERCODE M WHERE M.MOBILE_TO= MOBILE AND M.USER_NAME=USERNAME;
  
  IF V_NUMBER=0 THEN
    INSERT INTO MOBILE_VERCODE (MOBILE_VERCODE_ID, CODE, LAST_SEND_TIME, USER_NAME,MOBILE_TO)
    VALUES (SYS_GUID(), V_CODE, SYSDATE,USERNAME,MOBILE);
  ELSE
    UPDATE MOBILE_VERCODE M SET M.CODE = V_CODE,M.LAST_SEND_TIME=SYSDATE WHERE M.MOBILE_TO=MOBILE AND M.USER_NAME=USERNAME;
  END IF;
  
  VERCODE := V_CODE;
  COMMIT;
  
  EXCEPTION
       WHEN OTHERS THEN
       VERCODE := 0;
   ROLLBACK;

END CREATE_VERCODE;
/

prompt
prompt Creating procedure FEE_CALCULATE_ABLE
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE FEE_CALCULATE_ABLE(P_USER_ID                 IN VARCHAR2,
                                               P_BIZ_TYPE                IN NUMBER,
                                               BATCH_ID                  IN VARCHAR2,
                                               SEND_TYPE                 IN NUMBER,
                                               SEND_MSG                  IN VARCHAR2,
                                               CHANNE_GW_QUANTIY_LIST    IN VARCHAR2,
                                               RUN_RESULT                OUT NUMBER,
                                               RUN_EXCEPTION             OUT VARCHAR,
                                               RUN_UNIT_PRICE            OUT VARCHAR,
                                               UPDATE_UNIT_PRICE_QUOTA   OUT VARCHAR) IS
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
    *     UPDATE_UNIT_PRICE_QUOTA   ����Э��۵�����,��ʽ: �Ŷ�:Э���-��������  ����  1:0.3-200; 1:0.4-200;  2:0.3-200; 3:0.3-200;
    *
   ** �㷨��
    *
  */
  QUANTIY_LIST_NO_FOUNDS EXCEPTION; --���ͨ��-�Ŷ�-�������쳣

  ILLEGALITY_BIZ_TYPE EXCEPTION; --�Ƿ������� ע:��֧�ֶ��źͲ�����������

  NO_ORG_RECORD EXCEPTION; --����������

  NO_USER_RECORD EXCEPTION; --�û�������

  NO_UNIT_PRICE EXCEPTION; --Э��۲�����

  NO_START_UNIT_PRICE EXCEPTION; --Э��ۻ�û�п�ʼ����

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

  P_PRICE_START UNIT_PRICE_INFO.START_DATE%TYPE; --����Э��ۿ�ʼʱ��

  COST_FEE NUMBER(10, 3); --���ζ��ŷ���

  REMAIN_BALANCE NUMBER(10, 3); --ʣ����

  REMAIN_QUOTA CONSUME_RECORD_INFO.REMAIN_QUOTA%TYPE; --ʣ�����

  QUANTITY_RESULT NUMBER(10); --��ֺ��¼��

  v_payMode organization.pay_mode%type;
  v_unitprice org_remain_balance.unit_price%type;
  v_extraQuota organization.user_quota%type; --�ӻ������û���ֵ����ֵ����-��ǰЭ������ �����
  v_lastQuota organization.user_quota%type;  --ʱ�������һ�����

BEGIN

  RUN_UNIT_PRICE := NULL;
  UPDATE_UNIT_PRICE_QUOTA :='';

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

 --   UPDATE_UNIT_PRICE_QUOTA := P_GW_TYPE||':';

    IF ORG_DATA.PAY_TYPE = 1 THEN
      DBMS_OUTPUT.PUT_LINE('�û����ڻ������ں󸶷�,��ִ�мƷѲ���'); --�����Ǻ󸶷�ʱ��ִ�мƷѲ���ֻ��¼��ˮ
      --��¼��ˮ
      BEGIN
      --����������������ͻ����ѯ����������Э���
      IF ORG_DATA.PARENTID != '0' and ORG_DATA.PARENTID != '1' THEN
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      ELSE
      --����������ڷ������ͻ����ѯ��ǰ������Э���
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      IF P_PRICE_START > SYSDATE THEN
          RAISE NO_START_UNIT_PRICE;  --Э��ۻ�û�п�ʼ����
      END IF;

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
         decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
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
      IF ORG_DATA.PARENTID != '0' and ORG_DATA.PARENTID != '1' THEN
       SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      ELSE
      --����������ڷ������ͻ����ѯ��ǰ������Э���
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --��ЧЭ���
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --���ݷ������Ͳ��Ҷ�Ӧ�Ļ���Э���
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      IF P_PRICE_START> SYSDATE THEN
          RAISE NO_START_UNIT_PRICE;  --Э��ۻ�û�п�ʼ����
      END IF;

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
             decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
             SEND_TYPE,
             P_UNIT_PRICE,
             P_CHANNEL_ID,
             P_GW_TYPE,
             ORG_DATA.FEE_MODE,
             ORG_DATA.USER_ID,
             ORG_DATA.PAY_TYPE,
             REMAIN_BALANCE);
        ELSE
        --�����Ը���
          IF P_BIZ_TYPE = 0 THEN
            --����Ϊ����
            IF USER_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_SMSQUOTA_NOT_ENOUGH; --�û�������������
            END IF;
            REMAIN_QUOTA := USER_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.USER_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --�����û���������
           --����Ը����û��۳�����
            begin
              --��ѯ�û�����������Э���������ӻ������
              select orb.sms_quota, orb.unit_price
                into v_lastQuota, v_unitprice
                from org_remain_balance orb
               where orb.status = 1
                 and orb.user_id = P_USER_ID
                 and orb.update_unitprice_date =
                     (select min(orb2.update_unitprice_date) from org_remain_balance orb2
                       where orb2.user_id = P_USER_ID
                         and orb2.status = 1
                         and orb2.sms_quota > 0);
              v_extraQuota := P_SEND_QUANTITY;
              if P_SEND_QUANTITY <= v_lastQuota then
                  /* �۷Ѷ�������Э������С���۳���Ӧ���û���� */
                  update org_remain_balance orb
                  set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                  where orb.user_id = P_USER_ID
                  and orb.status=1
                  and orb.unit_price=v_unitprice;
                  --����Э��ۺ�����  ���� 0.3:5
                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
                  DBMS_OUTPUT.PUT_LINE('UPDATE_UNIT_PRICE_QUOTA='||UPDATE_UNIT_PRICE_QUOTA);
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
                     decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                     SEND_TYPE,
                     v_unitprice,
                     P_CHANNEL_ID,
                     P_GW_TYPE,
                     ORG_DATA.FEE_MODE,
                     ORG_DATA.USER_ID,
                     ORG_DATA.PAY_TYPE,
                     REMAIN_BALANCE);
              elsif P_SEND_QUANTITY > v_lastQuota then
                  loop
                      --��ѯ�û�����������Э���������ӻ������
                      select orb.sms_quota, orb.unit_price
                        into v_lastQuota, v_unitprice
                        from org_remain_balance orb
                       where orb.status = 1
                         and orb.user_id = P_USER_ID
                         and orb.update_unitprice_date =
                             (select min(orb2.update_unitprice_date)
                                from org_remain_balance orb2
                               where orb2.user_id = P_USER_ID
                                 and orb2.status = 1
                                 and orb2.sms_quota > 0);
                      --��ʱ�������һ��Э�����ʼ��
                      v_extraQuota := v_extraQuota - v_lastQuota;
                      --����۷Ѷ����һ��Э��ۻ���
                      if v_extraQuota >=0 then
                       /* ��һ��Э��۵����ȿ۷Ѷ�С���û���������� */
                            update org_remain_balance orb
                            set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                            where orb.user_id = P_USER_ID
                            and orb.status=1
                            and orb.unit_price=v_unitprice;
                            --����Э��ۺ�����  ���� 0.3:5
                            UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
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
                               v_lastQuota,
                               P_BIZ_TYPE,
                               BATCH_ID,
                               COST_FEE,
                               decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                               SEND_TYPE,
                               v_unitprice,
                               P_CHANNEL_ID,
                               P_GW_TYPE,
                               ORG_DATA.FEE_MODE,
                               ORG_DATA.USER_ID,
                               ORG_DATA.PAY_TYPE,
                               REMAIN_BALANCE);

                       --�۷Ѷ����һ�������Э������С
                      elsif v_extraQuota <0 then
                          /* �۷Ѷ�������Э������С���۳���Ӧ���û���� */
                          update org_remain_balance orb
                          set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                          where orb.user_id = P_USER_ID
                          and orb.status=1
                          and orb.unit_price=v_unitprice;

                          --����Э��ۺ�����  ���� 0.3:5
                            UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'|| v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
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
                               (v_lastQuota+v_extraQuota),
                               P_BIZ_TYPE,
                               BATCH_ID,
                               COST_FEE,
                               decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                               SEND_TYPE,
                               v_unitprice,
                               P_CHANNEL_ID,
                               P_GW_TYPE,
                               ORG_DATA.FEE_MODE,
                               ORG_DATA.USER_ID,
                               ORG_DATA.PAY_TYPE,
                               REMAIN_BALANCE);
                      end if;

                      exit when v_extraQuota <=0;
                  end loop;
              end if;
            end;
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
          /*���ǽ���������ӻ������޸�����*/
          IF ORG_DATA.PARENTID !='0' AND ORG_DATA.PARENTID !='1' THEN
             --��ѯ�����ǽ��/����
             SELECT O.PAY_MODE INTO v_payMode FROM ORGANIZATION O WHERE O.USER_ID=ORG_DATA.PARENTID;
             if v_payMode=1 then
                 begin
                    --��ѯ�û�����������Э���������ӻ������
                    select orb.sms_quota, orb.unit_price
                      into v_lastQuota, v_unitprice
                      from org_remain_balance orb
                     where orb.status = 1
                       and orb.user_id = ORG_DATA.USER_ID
                       and orb.update_unitprice_date =
                           (select min(orb2.update_unitprice_date) from org_remain_balance orb2
                             where orb2.user_id = ORG_DATA.USER_ID
                               and orb2.status = 1
                               and orb2.sms_quota > 0);
                    v_extraQuota := P_SEND_QUANTITY;
                    if P_SEND_QUANTITY <= v_lastQuota then
                        /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                        where orb.user_id = ORG_DATA.USER_ID
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                        --����Э��ۺ�����  ���� 0.3:5
                        UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
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
                           decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                           SEND_TYPE,
                           v_unitprice,
                           P_CHANNEL_ID,
                           P_GW_TYPE,
                           ORG_DATA.FEE_MODE,
                           ORG_DATA.USER_ID,
                           ORG_DATA.PAY_TYPE,
                           REMAIN_BALANCE);
                    elsif P_SEND_QUANTITY > v_lastQuota then
                        loop
                            --��ѯ�û�����������Э���������ӻ������
                            select orb.sms_quota, orb.unit_price
                              into v_lastQuota, v_unitprice
                              from org_remain_balance orb
                             where orb.status = 1
                               and orb.user_id = ORG_DATA.USER_ID
                               and orb.update_unitprice_date =
                                   (select min(orb2.update_unitprice_date)
                                      from org_remain_balance orb2
                                     where orb2.user_id = ORG_DATA.USER_ID
                                       and orb2.status = 1
                                       and orb2.sms_quota > 0);
                            --��ʱ�������һ��Э�����ʼ��
                            v_extraQuota := v_extraQuota - v_lastQuota;
                            --�����ֵ�����һ��Э��ۻ���
                            if v_extraQuota >=0 then
                             /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                  update org_remain_balance orb
                                  set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                  where orb.user_id = ORG_DATA.USER_ID
                                  and orb.status=1
                                  and orb.unit_price=v_unitprice;
                                  --����Э��ۺ�����  ���� 0.3:5
                                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
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
                                   v_lastQuota,
                                   P_BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                   SEND_TYPE,
                                   v_unitprice,
                                   P_CHANNEL_ID,
                                   P_GW_TYPE,
                                   ORG_DATA.FEE_MODE,
                                   ORG_DATA.USER_ID,
                                   ORG_DATA.PAY_TYPE,
                                   REMAIN_BALANCE);
                             --��ֵ�����һ�������Э������С
                            elsif v_extraQuota <0 then
                                /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                update org_remain_balance orb
                                set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                where orb.user_id = ORG_DATA.USER_ID
                                and orb.status=1
                                and orb.unit_price=v_unitprice;

                                --����Э��ۺ�����  ���� 0.3:5
                                UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'|| v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
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
                                   (v_lastQuota+v_extraQuota),
                                   P_BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                   SEND_TYPE,
                                   v_unitprice,
                                   P_CHANNEL_ID,
                                   P_GW_TYPE,
                                   ORG_DATA.FEE_MODE,
                                   ORG_DATA.USER_ID,
                                   ORG_DATA.PAY_TYPE,
                                   REMAIN_BALANCE);
                            end if;

                            exit when v_extraQuota <=0;
                        end loop;
                    end if;
                end;
             end if;
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
          --��������ӻ������Ը����û����޸�����
          SELECT o.pay_mode into v_payMode
          FROM organization o
          where o.parentid='1'
          START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=P_USER_ID)
          CONNECT BY PRIOR o.parentid=o.user_id;
          if v_payMode=1 then
             begin
                    --��ѯ�û�����������Э���������ӻ������
                    select orb.sms_quota, orb.unit_price
                      into v_lastQuota, v_unitprice
                      from org_remain_balance orb
                     where orb.status = 1
                       and orb.user_id = P_USER_ID
                       and orb.update_unitprice_date =
                           (select min(orb2.update_unitprice_date) from org_remain_balance orb2
                             where orb2.user_id = P_USER_ID
                               and orb2.status = 1
                               and orb2.sms_quota > 0);
                    v_extraQuota := P_SEND_QUANTITY;
                    if P_SEND_QUANTITY <= v_lastQuota then
                        /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                        where orb.user_id = P_USER_ID
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                        --����Э��ۺ�����  ���� 0.3:5
                        UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
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
                             decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                             SEND_TYPE,
                             v_unitprice,
                             P_CHANNEL_ID,
                             P_GW_TYPE,
                             ORG_DATA.FEE_MODE,
                             ORG_DATA.USER_ID,
                             ORG_DATA.PAY_TYPE,
                             REMAIN_BALANCE);
                    elsif P_SEND_QUANTITY > v_lastQuota then
                        loop
                            --��ѯ�û�����������Э���������ӻ������
                            select orb.sms_quota, orb.unit_price
                              into v_lastQuota, v_unitprice
                              from org_remain_balance orb
                             where orb.status = 1
                               and orb.user_id = P_USER_ID
                               and orb.update_unitprice_date =
                                   (select min(orb2.update_unitprice_date)
                                      from org_remain_balance orb2
                                     where orb2.user_id = P_USER_ID
                                       and orb2.status = 1
                                       and orb2.sms_quota > 0);
                            --��ʱ�������һ��Э�����ʼ��
                            v_extraQuota := v_extraQuota - v_lastQuota;
                            --�����ֵ�����һ��Э��ۻ���
                            if v_extraQuota >=0 then
                             /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                  update org_remain_balance orb
                                  set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                  where orb.user_id = P_USER_ID
                                  and orb.status=1
                                  and orb.unit_price=v_unitprice;
                                  --����Э��ۺ�����  ���� 0.3:5
                                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
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
                                   v_lastQuota,
                                   P_BIZ_TYPE,
                                   BATCH_ID,
                                   COST_FEE,
                                   decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                   SEND_TYPE,
                                   v_unitprice,
                                   P_CHANNEL_ID,
                                   P_GW_TYPE,
                                   ORG_DATA.FEE_MODE,
                                   ORG_DATA.USER_ID,
                                   ORG_DATA.PAY_TYPE,
                                   REMAIN_BALANCE);
                             --��ֵ�����һ�������Э������С
                            elsif v_extraQuota <0 then
                                /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                update org_remain_balance orb
                                set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                where orb.user_id = P_USER_ID
                                and orb.status=1
                                and orb.unit_price=v_unitprice;
                                --����Э��ۺ�����  ���� 0.3:5
                                UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
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
                                 (v_lastQuota+v_extraQuota),
                                 P_BIZ_TYPE,
                                 BATCH_ID,
                                 COST_FEE,
                                 decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                                 SEND_TYPE,
                                 v_unitprice,
                                 P_CHANNEL_ID,
                                 P_GW_TYPE,
                                 ORG_DATA.FEE_MODE,
                                 ORG_DATA.USER_ID,
                                 ORG_DATA.PAY_TYPE,
                                 REMAIN_BALANCE);
                            end if;

                            exit when v_extraQuota <=0;
                        end loop;
                    end if;
                end;
          end if;

        END IF;

        if ORG_DATA.Parentid='0' then
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
             decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
             SEND_TYPE,
             P_UNIT_PRICE,
             P_CHANNEL_ID,
             P_GW_TYPE,
             ORG_DATA.FEE_MODE,
             ORG_DATA.USER_ID,
             ORG_DATA.PAY_TYPE,
             REMAIN_QUOTA);
        else
            SELECT o.pay_mode into v_payMode
            FROM organization o
            where o.parentid='1'
            START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=P_USER_ID)
            CONNECT BY PRIOR o.parentid=o.user_id;

            if v_payMode=0 then
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
                 decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
                 SEND_TYPE,
                 P_UNIT_PRICE,
                 P_CHANNEL_ID,
                 P_GW_TYPE,
                 ORG_DATA.FEE_MODE,
                 ORG_DATA.USER_ID,
                 ORG_DATA.PAY_TYPE,
                 REMAIN_QUOTA);
            end if;
        end if;

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
  WHEN NO_START_UNIT_PRICE THEN
    DBMS_OUTPUT.PUT_LINE('�û�����������Э��ۻ�û������ʱ��');
    RUN_RESULT    := 13;
    RUN_EXCEPTION := '�û�����������Э��ۻ�û������ʱ��';
    ROLLBACK;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE || '----' || SQLERRM);
    RUN_RESULT    := 11;
    RUN_EXCEPTION := SQLCODE || '----' || SQLERRM;
    ROLLBACK;
END FEE_CALCULATE_ABLE;
/

prompt
prompt Creating procedure INSERT_ALL_ORG_QUOTA
prompt =======================================
prompt
create or replace procedure insert_all_org_quota
 is
 /*��ʼ�����������з����������û���������������*/
  --�α꣺��ѯ�û����
    cursor c_user is
        select u.user_id, u.user_quota,u.mms_quota,
        (SELECT up.unit_price
          FROM organization o
          left join unit_price_info up on up.organization_id=o.user_id
          where o.parentid='1'
          and up.effective=0
          and up.biz_type=0
          START WITH o.user_id=(select u2.organization_id from user_info u2 where u2.user_id=u.user_id)
          CONNECT BY PRIOR o.parentid=o.user_id) unit_price
        from user_info u
        left join organization o on o.user_id = u.organization_id
        where 1= (SELECT o.pay_mode
                FROM organization o
                where o.parentid='1' and o.pay_type=0
                START WITH o.user_id=u.organization_id
                CONNECT BY PRIOR o.parentid=o.user_id);
    --�α꣺��ѯ��������ӻ������    
    cursor c_org is 
      select o.user_id,o.user_quota,o.mms_quota,
      (select up.unit_price from unit_price_info up where up.organization_id=o.parentid and up.effective=0 and up.biz_type=0) unit_price
      from organization o
      where o.parentid !='0'
      and o.parentid !='1'
      and o.parentid in (select o2.user_id from organization o2 where o2.pay_type=0 and o2.pay_mode=1 and o2.parentid='1');
    
    c_user_each c_user%rowtype;  
    c_org_each c_org%rowtype; 
    
    
begin
    
    if c_user%isopen then
       close c_user; 
    end if;     
    if c_org%isopen then
       close c_org; 
    end if;   
    
    begin
      open c_user;
      loop
           fetch c_user into c_user_each;
           exit when c_user%notfound;
           DBMS_OUTPUT.PUT_LINE('c_user_each.unit_price = ' || c_user_each.unit_price );
           
           if c_user_each.unit_price is not null then
              insert into org_remain_balance 
              (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
              values 
              (sys_guid(), c_user_each.user_id,1, c_user_each.user_quota, c_user_each.unit_price,0, sysdate, '', '', sysdate, 0,c_user_each.mms_quota);
           end if;
                          
                   
      end loop;
      commit;
      close c_user;
    end;
            
    begin
      open c_org;
      loop
           fetch c_org into c_org_each;
           exit when c_org%notfound;
            DBMS_OUTPUT.PUT_LINE('c_org_each.unit_price = ' || c_org_each.unit_price );
           
           if c_org_each.unit_price is not null then
              insert into org_remain_balance 
              (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
              values 
              (sys_guid(), c_org_each.user_id,1, c_org_each.user_quota, c_org_each.unit_price,0, sysdate, '', '', sysdate, 1,c_org_each.mms_quota);
           end if;      
             
      end loop;   
      commit;
      close c_org;
    end;


end insert_all_org_quota;
/

prompt
prompt Creating procedure INSERT_DAILY_RECKONING_REPORT
prompt ================================================
prompt
create or replace procedure insert_daily_reckoning_report is

    cursor c_consume is
     --�����ѯsend�������,���˷���,ͳ��һ��һ�췢�Ͷ��ٶ���
        select
             t.user_id,
             trunc(t.send_time) send_time,
             t.mobile_com,
             t.send_status,
             t.channel_id,
             sum(t.mobile_quantities) mobile_quantities,
             sum(nvl(t.unit_price,0)*t.mobile_quantities) totalFee,
             t.unit_price,
             u.user_name,
             u.pay_mode,
             u.fee_mode,
             u.user_quota,
             u.mms_quota as user_mms_quota,
             org.user_quota as org_quota,
             org.mms_quota as org_mms_quota
        from send t
        left join user_info u on t.user_id = u.user_id
        left join organization org on org.user_id = t.user_organization
        left join channel_info c on c.channel_id=t.channel_id                 --��ֱ��ͨ���͵�����ͨ��
       where  1=1
              and t.send_time is not null
              and t.send_time <=CAST(trunc(sysdate)-2 AS TIMESTAMP)
              and t.send_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
              and (org.deduct_mode=1 and t.send_status = any(1,5) or org.deduct_mode=0 and t.send_status=any(1,5,6))   --����״̬ �� 1���ύ , 5���ͳɹ� ,6����ʧ��
              and ((t.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (t.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
       group by t.user_id,
                trunc(t.send_time),
                t.mobile_com,
                t.channel_id,
                t.send_status,
                t.unit_price,
                u.user_name,
                u.pay_mode,
                u.fee_mode,
                u.user_quota,
                u.mms_quota,
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

           --ʣ������
           select u.user_quota into remainMessageQuota from user_info u where u.user_id=one_record.user_id;

           --ʣ����
           select u.user_balance into remainBalance from user_info u where u.user_id=one_record.user_id;

             --���������
           insert into daily_reckoning_info
           (DAILY_RECKONING_ID, USER_ID, USER_NAME, SEND_STATUS, SEND_QUANTITY, SUB_TOTAL_FEE, REMAIN_MESSAGE_QUOTA, REMAIN_MMS_QUOTA, RECKONING_DATE, RECORD_DATE, PAY_MODE, REMAIN_BALANCE, USER_MOME, MOBILE_COM,CHANNEL_ID,UNIT_PRICE)
           values
           (sys_guid(),one_record.user_id,one_record.user_name,one_record.send_status,one_record.mobile_quantities,one_record.totalfee,remainMessageQuota,0,one_record.send_time, sysdate,one_record.pay_mode,remainBalance,'--',one_record.mobile_com,one_record.channel_id,one_record.unit_price);
      end loop;

        commit;        
        
   close c_consume;

   exception
       when others then
   rollback;

end insert_daily_reckoning_report;
/

prompt
prompt Creating procedure INSERT_EXTRA_PAYMENTRECORD
prompt =============================================
prompt
create or replace procedure INSERT_EXTRA_PAYMENTRECORD
      (operatorId in varchar2,
       userType in number,
       userId in varchar2,
       paymentMoney in number,
       paymentQuota in number,
       paymentType in number,
       isOnline in number,
       quotaType in number,
       rechargeExplain in varchar2,
       RUN_RESULT    OUT NUMBER
       )
is
  
    v_parentId organization.parentid%type;
    v_orgId organization.user_id%type;
    v_payMode organization.pay_mode%type;
    v_unitPrice unit_price_info.unit_price%type;
   /* v_channel_userId payment_record.operator_id%type;
    v_channelSub_userId payment_record.operator_id%type;*/
begin
       
       --�����߳�ֵ
       if isOnline=0 then
       
           --�ͼ�Admin�������µ��ӻ�������˳�ֵ
           if operatorId='1' then
               --����
               if userType=1 then 
                  
                  SELECT o.user_id,o.parentid into v_orgId,v_parentId
                  FROM ORGANIZATION o where o.user_id=userId and userType=1;
                  
                  --�����µ��ӻ���
                  IF v_parentId !='1' AND v_parentId !='0' and v_orgId !='1' then
                      --��ѯ�����ĵ���
                      SELECT o.pay_mode,up.unit_price into v_payMode,v_unitPrice
                      FROM organization o 
                      left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                      where o.user_id=v_parentId;
                      
                        --�ͼ�admin����ֵ����
                        if paymentType in(0,1) then    
                        
                           --������ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                        --�ͼ�admin�����ʲ���
                        if paymentType in(2,4) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);   
                        end if;
                         --�ͼ�admin�����ʲ���
                        if paymentType in(3,5) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                  end if;    
               end if;
               --�ͼ�admin�����˳�ֵ
               if userType=0 then 
               
                  SELECT o.user_id,o.parentid into v_orgId,v_parentId
                  FROM user_info u 
                  left join organization o on o.user_id=u.organization_id
                  where u.user_id=userId and userType=0;
                                    
                   --����
                  IF v_parentId ='1' then
                  
                      SELECT o.user_id,o.parentid,o.pay_mode,up.unit_price into v_orgId,v_parentId,v_payMode,v_unitPrice 
                      FROM user_info u 
                      left join organization o on o.user_id=u.organization_id
                      left join unit_price_info up on up.organization_id=u.organization_id and up.effective=0 and up.biz_type=0
                      where u.user_id=userId and userType=0;
                      --�ͼ�admin����ֵ����
                      if paymentType in(0,1) then    
                           --������ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1); 
                      end if; 
                      --�ͼ�admin�����ʲ���
                      if paymentType in(2,4) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(3,5) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                     
                  end if;
                  --�����ӻ���
                  IF v_parentId !='1' AND v_parentId !='0' and v_orgId !='1' then                  
                  
                     SELECT o.pay_mode,up.unit_price into v_payMode,v_unitPrice 
                      FROM organization o 
                      left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                      where o.user_id=v_parentId;
                      --�ͼ�admin����ֵ����
                      if paymentType in(0,1) then
                           --������ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1); 
                           --�����ӻ�����ֵ
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), paymentQuota, operatorId, 0, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(2,4) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1); 
                           --�����ӻ�������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,0, paymentQuota, operatorId, 4, 0, 1, rechargeExplain, quotaType, 1);                           
                      end if;
                      --�ͼ�admin�����ʲ���
                      if paymentType in(3,5) then
                           --��������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1); 
                           --�����ӻ�������
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,0, paymentQuota, operatorId, 5, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                  end if;
               end if;
           end if;
           
           --����admin���ӻ�����Ա��ֵ
            if operatorId !='1' then
                  --��ѯ����
                  SELECT o.parentid,o.pay_mode,up.unit_price into v_parentId,v_payMode,v_unitPrice 
                  FROM user_info u 
                  left join organization o on o.user_id=u.organization_id
                   left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                  where u.user_id=operatorId and userType=0;
                  --��ѯ�ӻ���
                  SELECT o.user_id into v_orgId
                  FROM user_info u
                  left join organization o on o.user_id=u.organization_id
                  where u.user_id=userId and userType=0;
                  
                  if v_parentId ='1' then
                        --��ֵ
                        if paymentType in(0,1) then
                             --�����ӻ�����ֵ
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 0, 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                        --����
                        if paymentType in(2,4) then
                             --�����ӻ�������
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 4, 0, 1, rechargeExplain, quotaType, 1);  
                        end if;
                        --����
                        if paymentType in(3,5) then
                             --�����ӻ�������
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 5, 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                  end if;
            end if;      
           
       end if;
       
        commit;
       
       RUN_RESULT    := 0;
       exception
           when others then
           RUN_RESULT    := 1;
       rollback;
end INSERT_EXTRA_PAYMENTRECORD;
/

prompt
prompt Creating procedure INSERT_HANDLE_DAILY_REPORT
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE INSERT_HANDLE_DAILY_REPORT
      (RUN_TIME      IN VARCHAR2,
       RUN_RESULT    OUT NUMBER
       )
IS

    CURSOR C_CONSUME IS
     --�����ѯSEND�������,���˷���,ͳ��һ��һ�췢�Ͷ��ٶ���
        SELECT
             T.USER_ID,
             TRUNC(T.SEND_TIME) SEND_TIME,
             T.MOBILE_COM,
             T.SEND_STATUS,
             T.CHANNEL_ID,
             SUM(T.MOBILE_QUANTITIES) MOBILE_QUANTITIES,
             SUM(NVL(T.UNIT_PRICE,0)*T.MOBILE_QUANTITIES) TOTALFEE,
             T.UNIT_PRICE,
             U.USER_NAME,
             U.PAY_MODE,
             U.FEE_MODE,
             U.USER_QUOTA,
             U.MMS_QUOTA AS USER_MMS_QUOTA,
             ORG.USER_QUOTA AS ORG_QUOTA,
             ORG.MMS_QUOTA AS ORG_MMS_QUOTA
        FROM SEND T
        LEFT JOIN USER_INFO U ON T.USER_ID = U.USER_ID
        LEFT JOIN ORGANIZATION ORG ON ORG.USER_ID = T.USER_ORGANIZATION
        LEFT JOIN CHANNEL_INFO C ON C.CHANNEL_ID=T.CHANNEL_ID                 --��ֱ��ͨ���͵�����ͨ��
       WHERE  1=1
              AND T.SEND_TIME IS NOT NULL
              AND T.SEND_TIME >=NVL(TO_TIMESTAMP(RUN_TIME||' 00:00:00.000','YYYY-MM-DD HH24:MI:SS.FF'),CAST(TRUNC(SYSDATE)-3 AS TIMESTAMP))
              AND T.SEND_TIME <=NVL(TO_TIMESTAMP(RUN_TIME||' 23:59:59.999','YYYY-MM-DD HH24:MI:SS.FF'),CAST(TRUNC(SYSDATE)-2 AS TIMESTAMP))
              AND (ORG.DEDUCT_MODE=1 AND T.SEND_STATUS = ANY(1,5) OR ORG.DEDUCT_MODE=0 AND T.SEND_STATUS=ANY(1,5,6))   --����״̬ �� 1���ύ , 5���ͳɹ� ,6����ʧ��
              AND ((T.IS_ORIGINAL_SMS=0 AND C.LINK_MODE != ALL('CMPP2','SGIP','SMGP3')) OR (T.MOBILE_QUANTITIES=1 AND C.LINK_MODE = ANY('CMPP2','SGIP','SMGP3')))
       GROUP BY T.USER_ID,
                TRUNC(T.SEND_TIME),
                T.MOBILE_COM,
                T.CHANNEL_ID,
                T.SEND_STATUS,
                T.UNIT_PRICE,
                U.USER_NAME,
                U.PAY_MODE,
                U.FEE_MODE,
                U.USER_QUOTA,
                U.MMS_QUOTA,
                ORG.USER_QUOTA,
                ORG.MMS_QUOTA;

    ONE_RECORD C_CONSUME%ROWTYPE;                                                --�α���
    REMAINMESSAGEQUOTA DAILY_RECKONING_INFO.REMAIN_MESSAGE_QUOTA%TYPE;           --ʣ��������
    REMAINBALANCE     DAILY_RECKONING_INFO.REMAIN_BALANCE%TYPE;                 --ʣ����
    COUNT_MESSAGE  NUMBER;
    
BEGIN
    REMAINMESSAGEQUOTA :=0;  --��ʼֵ��Ϊ0
    REMAINBALANCE :=0;
    COUNT_MESSAGE :=0;
    
    --��ѯ��һ����սᵥ������Ƿ��Ѿ����ɹ����սᵥ
    SELECT COUNT(1) INTO COUNT_MESSAGE FROM DAILY_RECKONING_INFO D WHERE TO_CHAR(D.RECKONING_DATE,'YYYY-MM-DD')=RUN_TIME;
    --����սᵥ��û����һ��ļ�¼��������������һ�������
    if COUNT_MESSAGE=0 then 
          IF C_CONSUME%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
            CLOSE C_CONSUME;
          END IF;

          --���α�
          OPEN C_CONSUME;
          --ѭ���α�
            LOOP
              FETCH C_CONSUME INTO ONE_RECORD; --��ȡ�α�
                EXIT WHEN C_CONSUME%NOTFOUND;

                 --ʣ������
                 SELECT U.USER_QUOTA INTO REMAINMESSAGEQUOTA FROM USER_INFO U WHERE U.USER_ID=ONE_RECORD.USER_ID;

                 --ʣ����
                 SELECT U.USER_BALANCE INTO REMAINBALANCE FROM USER_INFO U WHERE U.USER_ID=ONE_RECORD.USER_ID;

                   --���������
                 INSERT INTO DAILY_RECKONING_INFO
                 (DAILY_RECKONING_ID, USER_ID, USER_NAME, SEND_STATUS, SEND_QUANTITY, SUB_TOTAL_FEE, REMAIN_MESSAGE_QUOTA, REMAIN_MMS_QUOTA, RECKONING_DATE, RECORD_DATE, PAY_MODE, REMAIN_BALANCE, USER_MOME, MOBILE_COM,CHANNEL_ID,UNIT_PRICE)
                 VALUES
                 (SYS_GUID(),ONE_RECORD.USER_ID,ONE_RECORD.USER_NAME,ONE_RECORD.SEND_STATUS,ONE_RECORD.MOBILE_QUANTITIES,ONE_RECORD.TOTALFEE,REMAINMESSAGEQUOTA,0,ONE_RECORD.SEND_TIME, SYSDATE,ONE_RECORD.PAY_MODE,REMAINBALANCE,'--',ONE_RECORD.MOBILE_COM,ONE_RECORD.CHANNEL_ID,ONE_RECORD.UNIT_PRICE);
            END LOOP;

              COMMIT;

         CLOSE C_CONSUME;
    end if;
    
    RUN_RESULT    := 0;

   EXCEPTION
       WHEN OTHERS THEN
       RUN_RESULT    := 1;
   ROLLBACK;

END INSERT_HANDLE_DAILY_REPORT;
/

prompt
prompt Creating procedure INSERT_HANDLE_MONTH_REPORT
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE INSERT_HANDLE_MONTH_REPORT
      (RUN_TIME      IN VARCHAR2,
       RUN_RESULT    OUT NUMBER
       )
IS       
    CURSOR C_CONSUME IS
    --�����ѯ�սᵥ�������,���˷���,ͳ��ÿ��ÿ�·��Ͷ��ٶ���
       SELECT D.USER_ID,
        D.USER_NAME,
        U.USER_MOME,
        U.ORGANIZATION_ID,
        D.SEND_STATUS,
        SUM(D.SEND_QUANTITY) SEND_QUANTITY,
        SUM(D.SUB_TOTAL_FEE) COST_FEE,
        D.RECKONING_DATE,
        D.MOBILE_COM,
        D.CHANNEL_ID,
        D.UNIT_PRICE
   FROM DAILY_RECKONING_INFO D
   LEFT JOIN USER_INFO U ON U.USER_ID = D.USER_ID
   WHERE 1=1
   AND TO_CHAR(D.RECKONING_DATE, 'YYYY-MM') = RUN_TIME
  GROUP BY D.USER_ID,
           D.USER_NAME,
           U.USER_MOME,
           U.ORGANIZATION_ID,
           D.SEND_STATUS,
           D.RECKONING_DATE,
           D.MOBILE_COM,
           D.CHANNEL_ID,
           D.UNIT_PRICE;

     --����ʧ�ܵĶ���
     CURSOR C_MONTH_MAIN IS
         select sum(s1.unit_price*s1.mobile_quantities) failTotalFee,
               sum(s1.mobile_quantities) failTotalQuata,
               s1.user_id,
               o.fee_mode,
               u.organization_id,
               o.pay_mode orgPayMode
          from send s1
          left join user_info u on s1.user_id = u.user_id
          left join organization o on s1.user_organization = o.user_id
          left join channel_info c on s1.channel_id = c.channel_id
         where 1=1
           AND S1.REPORT_TIME <=CAST(TRUNC(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),'MONTH')+3 AS TIMESTAMP)                   --���µ�4���賿
           AND S1.REPORT_TIME >=CAST(TRUNC(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),'MONTH') AS TIMESTAMP)                     --���µ�1���賿
           AND S1.SEND_TIME >=CAST(TRUNC(LAST_DAY(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1)))-2 AS TIMESTAMP)    --�µ׵�����3��
           AND S1.SEND_TIME <=CAST(TRUNC(LAST_DAY(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1))) AS TIMESTAMP)      --�µ����1��
           and s1.return_fee =1                                                              --���ط���:δ���ط���
         group by s1.user_id, u.pay_mode, o.fee_mode, u.organization_id,o.pay_mode;

     ONE_RECORD C_CONSUME%ROWTYPE;           --�α���
     ONE_MAIN C_MONTH_MAIN%ROWTYPE;          --�α���
     COUNT_MESSAGE NUMBER;

BEGIN

       --��ѯ��һ������˵�������Ƿ��Ѿ����ɹ������˵�
       SELECT COUNT(1) INTO COUNT_MESSAGE FROM MONTH_RECKONING_INFO M WHERE M.ACCOUNT_TIME=RUN_TIME;            
       --������˵���û������µļ�¼����������������µ�����
       if COUNT_MESSAGE=0 then 
             IF C_MONTH_MAIN%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
                CLOSE C_MONTH_MAIN;
             END IF;
             IF C_CONSUME%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
                CLOSE C_CONSUME;
             END IF;
             --��ʧ�ܷ����Ķ��żӵ��ϸ��µ׵��û�/���������
             BEGIN
                 OPEN C_MONTH_MAIN;
                      LOOP
                          FETCH C_MONTH_MAIN INTO ONE_MAIN;
                          EXIT WHEN C_MONTH_MAIN%NOTFOUND;
                          --�Ը���
                          IF ONE_MAIN.FEE_MODE=0 THEN
                             UPDATE MONTH_MAIN_INFO MM
                             SET MM.REMAIN_QUOTA=MM.REMAIN_QUOTA+ONE_MAIN.FAILTOTALQUATA
                             WHERE MM.USER_ID=ONE_MAIN.USER_ID
                             AND MM.USER_TYPE=0
                             AND MM.TIME=TO_CHAR(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1),'YYYYMM');
                          END IF;
                          --�鸶��
                          IF ONE_MAIN.FEE_MODE=1 THEN
                             --����
                             IF ONE_MAIN.ORGPAYMODE=1 THEN
                                UPDATE MONTH_MAIN_INFO MM
                                SET MM.REMAIN_FEE=MM.REMAIN_FEE+ONE_MAIN.FAILTOTALFEE
                                WHERE MM.USER_ID=ONE_MAIN.ORGANIZATION_ID
                                AND MM.USER_TYPE=1
                                AND MM.TIME=TO_CHAR(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1),'YYYYMM');
                             END IF;
                             --����
                             IF ONE_MAIN.ORGPAYMODE=0 THEN
                                UPDATE MONTH_MAIN_INFO MM
                                SET MM.REMAIN_QUOTA=MM.REMAIN_QUOTA+ONE_MAIN.FAILTOTALQUATA
                                WHERE MM.USER_ID=ONE_MAIN.ORGANIZATION_ID
                                AND MM.USER_TYPE=1
                                AND MM.TIME=TO_CHAR(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1),'YYYYMM');
                             END IF;
                          END IF;

                      END LOOP;
                      COMMIT;
                 CLOSE C_CONSUME;
             END;

   --������ʱ��
      insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('----',sysdate);
      
             BEGIN
              --���α�
              OPEN C_CONSUME;
              --ѭ���α�
                LOOP
                  FETCH C_CONSUME INTO ONE_RECORD; --��ȡ�α�
                    EXIT WHEN C_CONSUME%NOTFOUND;

                      INSERT INTO MONTH_RECKONING_INFO
                        (MONTH_RECKONING_ID,
                         USER_ID,
                         ORGANIZATION_ID,
                         MONTH_PAYMENT,
                         MONTH_BEGIN_BALANCE,
                         MONTH_END_BALANCE,
                         SEND_QUANTITY,
                         COST_FEE,
                         RECORD_DATE,
                         INNER_PAYMENT,
                         MOBILE_COM,
                         CHANNEL_ID,
                         ACCOUNT_TIME,
                         UNIT_PRICE)
                      VALUES
                        (SYS_GUID(),
                         ONE_RECORD.USER_ID,
                         ONE_RECORD.ORGANIZATION_ID,
                         0.00,
                         0.00,
                         0.00,
                         ONE_RECORD.SEND_QUANTITY,
                         ONE_RECORD.COST_FEE,
                         SYSDATE,
                         0.00,
                         ONE_RECORD.MOBILE_COM,
                         ONE_RECORD.CHANNEL_ID,
                         TO_CHAR(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1),'YYYYMM'),
                         ONE_RECORD.UNIT_PRICE);

                END LOOP;

                COMMIT;
                CLOSE C_CONSUME;
              END;
       end if;

       RUN_RESULT :=0;
       
   EXCEPTION
       WHEN OTHERS THEN
       RUN_RESULT :=1;
   ROLLBACK;

END INSERT_HANDLE_MONTH_REPORT;
/

prompt
prompt Creating procedure INSERT_MONTH_RECKONING_REPORT
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE INSERT_MONTH_RECKONING_REPORT IS
    CURSOR C_CONSUME IS
    --�����ѯ�սᵥ�������,���˷���,ͳ��ÿ��ÿ�·��Ͷ��ٶ���
       SELECT D.USER_ID,
        D.USER_NAME,
        U.USER_MOME,
        U.ORGANIZATION_ID,
        D.SEND_STATUS,
        SUM(D.SEND_QUANTITY) SEND_QUANTITY,
        SUM(D.SUB_TOTAL_FEE) COST_FEE,
        D.RECKONING_DATE,
        D.MOBILE_COM,
        D.CHANNEL_ID,
        D.UNIT_PRICE
   FROM DAILY_RECKONING_INFO D
   LEFT JOIN USER_INFO U ON U.USER_ID = D.USER_ID
   WHERE 1=1
   AND TO_CHAR(D.RECKONING_DATE, 'YYYY-MM-DD') >= TO_CHAR(TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-2))+1,'MM'),'YYYY-MM-DD')
   AND TO_CHAR(D.RECKONING_DATE, 'YYYY-MM-DD') <= TO_CHAR(TRUNC(ADD_MONTHS(SYSDATE, 0), 'MM') - 1,'YYYY-MM-DD')
  GROUP BY D.USER_ID,
           D.USER_NAME,
           U.USER_MOME,
           U.ORGANIZATION_ID,
           D.SEND_STATUS,
           D.RECKONING_DATE,
           D.MOBILE_COM,
           D.CHANNEL_ID,
           D.UNIT_PRICE;
           
     --����ʧ�ܵĶ���
     CURSOR C_MONTH_MAIN IS
         SELECT SUM(S1.UNIT_PRICE*S1.MOBILE_QUANTITIES) FAIL_FEE,
               SUM(S1.MOBILE_QUANTITIES) FAIL_QUATA,
               S1.USER_ID,
               O.FEE_MODE,
               S1.USER_ORGANIZATION ORGANIZATION_ID,
               O.PAY_MODE ORGPAYMODE
          FROM SEND S1
          LEFT JOIN USER_INFO U ON S1.USER_ID = U.USER_ID
          LEFT JOIN ORGANIZATION O ON S1.USER_ORGANIZATION = O.USER_ID
          LEFT JOIN CHANNEL_INFO C ON S1.CHANNEL_ID = C.CHANNEL_ID
         WHERE 1=1
           AND S1.REPORT_TIME <=CAST(TRUNC(SYSDATE,'MONTH')+3 AS TIMESTAMP)                   --���µ�4���賿
           AND S1.REPORT_TIME >=CAST(TRUNC(SYSDATE,'MONTH') AS TIMESTAMP)                     --���µ�1���賿
           AND S1.SEND_TIME >=CAST(TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1)))-2 AS TIMESTAMP)    --�µ׵�����3��
           AND S1.SEND_TIME <= CAST(TRUNC(SYSDATE,'MONTH') AS TIMESTAMP)                       --�µ����1��
           AND S1.RETURN_FEE =1                                                              --���ط���:�ѷ��ط���
         GROUP BY S1.USER_ID, U.PAY_MODE, O.FEE_MODE,S1.USER_ORGANIZATION,O.PAY_MODE;      
                 
     ONE_RECORD C_CONSUME%ROWTYPE;           --�α���
     ONE_MAIN C_MONTH_MAIN%ROWTYPE;          --�α���

BEGIN
       IF C_MONTH_MAIN%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
          CLOSE C_MONTH_MAIN;
       END IF;
       IF C_CONSUME%ISOPEN THEN --��ֹ�ϴ��α�δ�ر�
          CLOSE C_CONSUME;
       END IF;
       --��ʧ�ܷ����Ķ��żӵ��ϸ��µ׵��û�/���������
       BEGIN 
           OPEN C_MONTH_MAIN;
                LOOP
                    FETCH C_MONTH_MAIN INTO ONE_MAIN;
                    EXIT WHEN C_MONTH_MAIN%NOTFOUND;
                    --�Ը���
                    IF ONE_MAIN.FEE_MODE = 0 THEN
                       UPDATE MONTH_MAIN_INFO MM 
                       SET MM.REMAIN_QUOTA = MM.REMAIN_QUOTA + nvl(ONE_MAIN.FAIL_QUATA,0) 
                       WHERE MM.USER_ID=ONE_MAIN.USER_ID 
                       AND MM.USER_TYPE=0 
                       AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                    END IF;
                    --�鸶��
                    IF ONE_MAIN.FEE_MODE=1 THEN
                       --����
                       IF ONE_MAIN.ORGPAYMODE=1 THEN
                          UPDATE MONTH_MAIN_INFO MM 
                          SET MM.REMAIN_FEE = MM.REMAIN_FEE + nvl(ONE_MAIN.FAIL_FEE,0) 
                          WHERE MM.USER_ID = ONE_MAIN.ORGANIZATION_ID 
                          AND MM.USER_TYPE=1 
                          AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       END IF;
                       --����
                       IF ONE_MAIN.ORGPAYMODE=0 THEN
                       
                        --DBMS_OUTPUT.PUT_LINE('ONE_MAIN.FAIL_QUATA = '|| ONE_MAIN.FAIL_QUATA || '  ONE_MAIN.ORGANIZATION_ID=' ||ONE_MAIN.ORGANIZATION_ID ||' time='|| TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                        
                          UPDATE MONTH_MAIN_INFO MM 
                          SET MM.REMAIN_QUOTA = MM.REMAIN_QUOTA + nvl(ONE_MAIN.FAIL_QUATA,0) 
                          WHERE MM.USER_ID = ONE_MAIN.ORGANIZATION_ID 
                          AND MM.USER_TYPE=1 
                          AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       END IF;
                    END IF;
                       
                END LOOP;
                
                COMMIT;
                
           CLOSE C_MONTH_MAIN;
       END;
       
       BEGIN    
        --���α�
        OPEN C_CONSUME;
        --ѭ���α�
          LOOP
            FETCH C_CONSUME INTO ONE_RECORD; --��ȡ�α�
              EXIT WHEN C_CONSUME%NOTFOUND;
              
                INSERT INTO MONTH_RECKONING_INFO
                  (MONTH_RECKONING_ID,
                   USER_ID,
                   ORGANIZATION_ID,
                   MONTH_PAYMENT,
                   MONTH_BEGIN_BALANCE,
                   MONTH_END_BALANCE,
                   SEND_QUANTITY,
                   COST_FEE,
                   RECORD_DATE,
                   INNER_PAYMENT,
                   MOBILE_COM,
                   CHANNEL_ID,
                   ACCOUNT_TIME,
                   UNIT_PRICE)
                VALUES
                  (SYS_GUID(),
                   ONE_RECORD.USER_ID,
                   ONE_RECORD.ORGANIZATION_ID,
                   0.00,
                   0.00,
                   0.00,
                   ONE_RECORD.SEND_QUANTITY,
                   ONE_RECORD.COST_FEE,
                   SYSDATE,
                   0.00,
                   ONE_RECORD.MOBILE_COM,
                   ONE_RECORD.CHANNEL_ID,
                   TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'),
                   ONE_RECORD.UNIT_PRICE);

          END LOOP;

          COMMIT;
          CLOSE C_CONSUME;
        END;
        
   EXCEPTION
       WHEN OTHERS THEN
   ROLLBACK;

END INSERT_MONTH_RECKONING_REPORT;
/

prompt
prompt Creating procedure INSERT_MONTH_REMAIN_FEE
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE INSERT_MONTH_REMAIN_FEE IS
    --�α꣺��ѯ�û����
    cursor c_user is
        select u.user_id, u.user_quota
        from user_info u
        left join organization o on o.user_id = u.organization_id
        group by u.user_id,u.user_quota;
    --�α꣺��ѯ�������    
    cursor c_org is 
      select o.user_id,o.parentid,o.pay_mode,o.user_quota,o.user_balance
      from organization o
      left join user_info u on u.organization_id=o.user_id
      group by o.user_id,o.parentid,o.pay_mode,o.user_quota,o.user_balance;
    
    c_user_each c_user%rowtype;  
    c_org_each c_org%rowtype; 

    v_moneyAdd organization.user_balance%type;         --����ֵ
    v_moneySub organization.user_balance%type;         --������
    v_quotaAdd organization.user_quota%type;           --����ֵ
    v_quotaSub organization.user_quota%type;           --������
    v_checkNum number;                                 --��¼���������µ������������Ϊ0�����������
    v_blanceRemain organization.user_balance%type;     --�м�ֵ����¼����������ܽ������ӻ������û����ܺͣ�
    v_quotaRemain  organization.user_quota%type;       --�м�ֵ����¼����������ܽ������ӻ������û����ܺͣ�
    
BEGIN
    v_moneyAdd :=0;
    v_moneySub :=0;
    v_quotaAdd :=0;
    v_quotaSub :=0;
    v_blanceRemain :=0;
    v_quotaRemain :=0;

    if c_user%isopen then
       close c_user; 
    end if;     
    if c_org%isopen then
       close c_org; 
    end if; 
    
    select count(1) into v_checkNum from month_main_info mm where mm.time = TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
    
    if v_checkNum =0 then 
            begin
              open c_user;
              loop
                   fetch c_user into c_user_each;
                   exit when c_user%notfound;
                   --�û���ֵ������
                   select sum(p.payment_quota) into v_quotaAdd  from payment_record p 
                   where p.user_id = c_user_each.user_id
                   and p.payment_type = any(0,5) 
                   and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                   --�û�����
                   select sum(p.payment_quota) into v_quotaSub  from payment_record p 
                   where p.user_id = c_user_each.user_id
                   and p.payment_type = 4 
                   and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                   
                   --�����Ը����û����,��ֵ����
                   insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                   values (sys_guid(),c_user_each.user_id,0, nvl(c_user_each.user_quota,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                   
              end loop;
              commit;
              close c_user;
            end;
            
            begin
              open c_org;
              loop
                   fetch c_org into c_org_each;
                   exit when c_org%notfound;
                   
                   --�����ӻ���(ȫ��Ϊ����ֵ)
                   if c_org_each.parentid !='1' and c_org_each.parentid !='0' and c_org_each.user_id !='1' then
                       --��ֵ������
                       select sum(nvl(p.payment_quota,0)) into v_quotaAdd  
                       from payment_record p 
                       left join organization o on o.user_id=p.user_id
                       where 1=1
                       and p.user_id = c_org_each.user_id
                       and (p.payment_type=any(0,5) and p.is_online=0 or p.is_online=1)
                       and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       --����
                       select sum(nvl(p.payment_quota,0)) into v_quotaSub  
                       from payment_record p 
                       left join organization o on o.user_id=p.user_id
                       where 1=1
                       and p.user_id = c_org_each.user_id
                       and p.payment_type=4
                       and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       
                        select sum(user_quota) into v_quotaRemain from (
                        select sum(o.user_quota) user_quota from organization o where o.user_id=c_org_each.user_id
                        union all
                        select sum(u.user_quota) user_quota from user_info u where u.organization_id=c_org_each.user_id);
                        --����������
                       insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                       values (sys_guid(),c_org_each.user_id,1, nvl(v_quotaRemain,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                       
                   end if;
                   
                   --����(����Ϊ�������)
                   if c_org_each.parentid ='1' then
                         --�������
                         if c_org_each.pay_mode=0 then
                             --��ֵ������
                             select sum(nvl(p.payment_quota,0)) into v_quotaAdd  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and (p.payment_type=any(0,5) and p.is_online=0 or p.is_online=1)
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --����
                             select sum(nvl(p.payment_quota,0)) into v_quotaSub  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and p.payment_type=4
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             
                             select sum(user_quota) into v_quotaRemain from (
                              select sum(o.user_quota) user_quota from organization o 
                              where o.parentid=c_org_each.user_id or o.user_id=c_org_each.user_id
                              union all
                              select sum(u.user_quota) user_quota from user_info u 
                              left join organization o on o.user_id=u.organization_id
                              where o.user_id=c_org_each.user_id or o.parentid=c_org_each.user_id);
                              --����������,��ֵ��
                             insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                             values (sys_guid(),c_org_each.user_id,1, nvl(v_quotaRemain,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                         end if;
                         
                         --�������
                         if c_org_each.pay_mode=1 then
                             --��ֵ������
                             select sum(nvl(p.payment_money,0)) into v_moneyAdd  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and (p.payment_type=any(1,3) and p.is_online=0 or p.is_online=1)
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --����
                             select sum(nvl(p.payment_money,0)) into v_moneySub  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and p.payment_type=2
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --��ѯ�ӻ������û������(����ɽ��)
                             select sum(orb.sms_quota*orb.unit_price) into v_blanceRemain from 
                              org_remain_balance orb 
                              where orb.user_id in (select o.user_id from organization o where o.parentid=c_org_each.user_id)
                              or orb.user_id in (select u.user_id from user_info u 
                                                   left join organization o on o.user_id=u.organization_id
                                                   where o.user_id=c_org_each.user_id or o.parentid=c_org_each.user_id);
                             v_blanceRemain := c_org_each.user_balance + v_blanceRemain;
                              --����������,��ֵ��
                             insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                             values (sys_guid(),c_org_each.user_id,1, nvl(c_org_each.user_quota,0), nvl(v_blanceRemain,0), nvl(v_moneyAdd,0)-nvl(v_moneySub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                         end if;    
                        
                   end if;                  
                
                   --�ͼ�(û���ĸ���������Ϊ�ͼѳ�ֵ)
                   if c_org_each.parentid ='0' then
                         --����������,��ֵ��
                         insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                         values (sys_guid(),c_org_each.user_id,1, nvl(c_org_each.user_quota,0), nvl(c_org_each.user_balance,0),'0', TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                   end if;
              
              end loop;   
              commit;
              close c_org;
            end;
    end if;

  exception
       when others then
   rollback;
END INSERT_MONTH_REMAIN_FEE;
/

prompt
prompt Creating procedure INSERT_ORG_QUOTA
prompt ===================================
prompt
create or replace procedure insert_org_quota
      (operatorId in varchar2,
       userId in varchar2,
       rechargeExplain in varchar2,
       paymentType in number,
       userQuota in number,
       userType in number,
       RUN_RESULT    OUT NUMBER
       )
is
  
    orgCount number;   --��ѯ��������Ƿ��Ѿ���������
    v_unitprice org_remain_balance.unit_price%type;
    v_payMode organization.pay_mode%type;
    v_parentid organization.parentid%type;
    v_operatorId user_info.user_id%type;
    v_extraQuota organization.user_quota%type; --�ӻ������û���ֵ����ֵ����-��ǰЭ������ �����
    v_lastQuota organization.user_quota%type;  --ʱ�������һ�����
    v_userQuota organization.user_quota%type;  --��ֵ���������ݳ�ֵ���ͣ�ѡ��������������ֵΪ��������Ϊ��
    v_subOrgId  organization.user_id%type;     --�м�ֵ�����ӻ���id
begin
    orgCount :=0;
    v_unitprice :=0;
    v_userQuota :=0;
                
    if paymentType =4 then 
       v_userQuota := 0-userQuota;
    elsif paymentType !=4 then
       v_userQuota := userQuota;    
    end if;     
    
    --��������ӻ�����ֵ
    if userType=1 then
        select count(1) into orgCount from org_remain_balance orb where orb.user_id =userId 
        and orb.status=1
        and orb.unit_price=(select up.unit_price from unit_price_info up where up.organization_id=(select o.parentid from organization o where o.user_id=userId) and up.effective=0 and up.biz_type=0);
              
        if orgCount>0 then
            update org_remain_balance orb 
            set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate 
            where orb.user_id = userId 
            and orb.status=1 
            and orb.unit_price=(select up.unit_price from unit_price_info up where up.organization_id=(select o.parentid from organization o where o.user_id=userId) and up.effective=0 and up.biz_type=0);
        elsif orgCount=0 then
              select up.unit_price into v_unitprice from unit_price_info up 
              where up.organization_id=(select o.parentid from organization o where o.user_id=userId) 
              and up.effective=0 
              and up.biz_type=0;
              
             insert into org_remain_balance 
             (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
             values 
             (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
        end if;         
    end if;
    --�û���ֵ
    if userType=0 then
        select o.parentid into v_parentid  from organization o where o.user_id=(select u.organization_id from user_info u where u.user_id=userId);
        --�����û�
        if v_parentid='1' then
              SELECT up.unit_price,o.pay_mode into v_unitprice,v_payMode
              FROM organization o
              left join user_info u on u.organization_id=o.user_id
              left join unit_price_info up on up.organization_id=o.user_id
              where u.user_id=userId
              and up.effective=0;
               --��������µģ��ӻ������û�
              if v_payMode=1 then
                    /* �����û������ 
                    *  ���������Ȼʹ�û�����Ľ��
                    */
                    select count(1) into orgCount 
                    from org_remain_balance orb 
                    where orb.user_id = userId
                    and orb.unit_price =v_unitprice
                    and orb.status=1;
                    --�������Ѵ��ڴ��û�����Э������޸����
                    if orgCount>0 then
                        update org_remain_balance orb 
                        set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate 
                        where orb.user_id = userId 
                        and orb.status=1 
                        and orb.unit_price=v_unitprice;
                     --�����в����ڴ��û�����Э������������
                    elsif orgCount=0 then
                         insert into org_remain_balance 
                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                         values 
                         (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                    end if;                                  
              end if;
                  
        end if;
        --���������û�
        if v_parentid !='1' and v_parentid !='0' then
              SELECT up.unit_price,o.pay_mode into v_unitprice,v_payMode
              FROM organization o
              left join unit_price_info up on up.organization_id=o.user_id
              where o.parentid='1'
              and up.effective=0
              START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=userId)
              CONNECT BY PRIOR o.parentid=o.user_id;
              --��������µģ��ӻ������û�
              if v_payMode=1 then
                    --����Ǻͼ�Admin���ӻ����û�Խ����ֵ��ֱ�Ӽӵ��û������������
                    if operatorId = '1' then 
                          --��ѯ�û��Ƿ������µ�Э������
                          select count(1) into orgCount 
                          from org_remain_balance orb 
                          where orb.user_id = userId 
                          and orb.status=1
                          and orb.unit_price =v_unitprice;
                          --�������Ѵ��ڴ��û�����Э������޸����
                           if orgCount>0 then
                              update org_remain_balance orb 
                              set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate 
                              where orb.user_id = userId 
                              and orb.status=1 
                              and orb.unit_price=v_unitprice;
                           --�����в����ڴ��û�����Э������������
                           elsif orgCount=0 then
                               insert into org_remain_balance 
                               (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                               values 
                               (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                           end if;
                     /*�ӻ�������Ա���������û���ֵ */     
                    elsif  operatorId != '1' then 
                             -- ��ѯ��ֵ������(������ӻ����Ĺ���Ա����ִ�г�ֵ�㷨)
                             select u.user_id into v_operatorId 
                             from user_info u 
                             where u.user_type=1 
                             and u.user_stat=1
                             and u.organization_id=(select ui.organization_id from user_info ui where ui.user_id=userId and ui.user_stat=1);
                             --����ӻ�������Ա���Լ��û���ֵ���ӻ����۳���Ӧ������
                             if v_operatorId =operatorId then
                                  --��ѯ�ӻ�����id
                                  select u.organization_id into v_subOrgId from user_info u where u.user_stat = 1 and u.user_id = userId;
                             
                                  if v_userQuota >0 then 
                                      
                                      begin
                                          --��ѯ�ӻ�������������Э���������ӻ������
                                              select orb.sms_quota, orb.unit_price
                                                into v_lastQuota, v_unitprice
                                                from org_remain_balance orb
                                               where orb.status = 1
                                                 and orb.user_id = v_subOrgId
                                                 and orb.update_unitprice_date =
                                                     (select min(orb2.update_unitprice_date)  from org_remain_balance orb2
                                                       where orb2.user_id = v_subOrgId and orb2.status = 1 and orb2.sms_quota > 0);       
                                          v_extraQuota := userQuota; 
                                          if (userQuota - v_lastQuota) <=0 then
                                               /* �����û������ */
                                               select count(1) into orgCount 
                                               from org_remain_balance orb 
                                               where orb.user_id = userId
                                               and orb.status =1 
                                               and orb.unit_price =v_unitprice;
                                                --�������Ѵ��ڴ��û�����Э������޸����
                                               if orgCount>0 then
                                                  update org_remain_balance orb 
                                                  set orb.sms_quota = orb.sms_quota+ userQuota, orb.last_update_quota_date =sysdate 
                                                  where orb.user_id = userId 
                                                  and orb.status=1 
                                                  and orb.unit_price=v_unitprice;
                                               --�����в����ڴ��û�����Э������������
                                               elsif orgCount=0 then
                                                   insert into org_remain_balance 
                                                   (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                   values 
                                                   (sys_guid(), userId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                               end if;
                                              /* ��ֵ��������Э������С���۳���Ӧ���ӻ������ */
                                              update org_remain_balance orb 
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate 
                                              where orb.user_id = v_subOrgId
                                              and orb.status=1 
                                              and orb.unit_price=v_unitprice;
                                         /* end if;
                                         --�㷨���ӻ������Լ��û���ֵ,ʹ��ѭ�� 
                                         if v_extraQuota >0 then*/
                                         else
                                            loop
                                              --��ѯ�ӻ�������������Э���������ӻ������
                                              select orb.sms_quota, orb.unit_price
                                                into v_lastQuota, v_unitprice
                                                from org_remain_balance orb
                                               where orb.status = 1
                                                 and orb.user_id = v_subOrgId
                                                 and orb.update_unitprice_date =
                                                     (select min(orb2.update_unitprice_date)
                                                        from org_remain_balance orb2
                                                       where orb2.user_id = v_subOrgId
                                                         and orb2.status = 1
                                                         and orb2.sms_quota > 0);
                                              DBMS_OUTPUT.PUT_LINE('�㷨���ӻ������Լ��û���ֵ,��ʼѭ�� v_lastQuota' ||v_lastQuota||' v_unitprice'||v_unitprice  );           
                                              --��ʱ�������һ��Э�����ʼ��
                                              v_extraQuota := v_extraQuota - v_lastQuota;
                                              DBMS_OUTPUT.PUT_LINE('v_extraQuota '||v_extraQuota);  
                                               --�����ֵ�����һ��Э��ۻ���
                                              if v_extraQuota >=0 then
                                              /* �����û������ */
                                                  select count(1) into orgCount 
                                                  from org_remain_balance orb 
                                                  where orb.user_id = userId
                                                  and orb.status =1 
                                                  and orb.unit_price =v_unitprice;
                                                  DBMS_OUTPUT.PUT_LINE('��ʼ�����û���� orgCount '||orgCount);  
                                                  --�������Ѵ��ڴ��û�����Э������޸����
                                                   if orgCount>0 then
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = orb.sms_quota+ v_lastQuota, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId 
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice;
                                                   --�����в����ڴ��û�����Э������������
                                                   elsif orgCount=0 then
                                                       insert into org_remain_balance 
                                                       (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                       values 
                                                       (sys_guid(), userId,1, v_lastQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                                   end if;
                                               /* ��һ��Э��۵����ȳ�ֵ��С���ӻ������������ */
                                                    update org_remain_balance orb 
                                                    set orb.sms_quota = 0, orb.last_update_quota_date =sysdate 
                                                    where orb.user_id = v_subOrgId 
                                                    and orb.status=1 
                                                    and orb.unit_price=v_unitprice; 
                                              --��ֵ�����һ�������Э������С    
                                              elsif v_extraQuota <0 then
                                                   /* �����û������ */
                                                   select count(1) into orgCount 
                                                   from org_remain_balance orb 
                                                   where orb.user_id = userId
                                                   and orb.status =1 
                                                   and orb.unit_price =v_unitprice;
                                                    --�������Ѵ��ڴ��û�����Э������޸����
                                                   if orgCount>0 then
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = orb.sms_quota+ v_lastQuota+v_extraQuota, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId 
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice;
                                                   --�����в����ڴ��û�����Э������������
                                                   elsif orgCount=0 then
                                                       insert into org_remain_balance 
                                                       (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                       values 
                                                       (sys_guid(), userId,1, v_lastQuota+v_extraQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                                   end if;
                                                  /* ��ֵ��������Э������С���۳���Ӧ���ӻ������ */
                                                  update org_remain_balance orb 
                                                  set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate 
                                                  where orb.user_id = v_subOrgId
                                                  and orb.status=1 
                                                  and orb.unit_price=v_unitprice;
                                              end if;
                                              --��ֵ��������Э�����С��0���˳�ѭ��
                                              exit when v_extraQuota <=0;
                                          end loop;        
                                         end if;
                                         
                                      end;
                                  --�û�����    
                                  elsif v_userQuota <0  then 
                                        begin
                                          --��ѯ�û�����������Э���������ӻ������
                                          select orb.sms_quota, orb.unit_price
                                            into v_lastQuota, v_unitprice
                                            from org_remain_balance orb
                                           where orb.status = 1
                                             and orb.user_id = userId
                                             and orb.update_unitprice_date =
                                                 (select min(orb2.update_unitprice_date)
                                                    from org_remain_balance orb2
                                                   where orb2.user_id = userId
                                                     and orb2.status = 1
                                                     and orb2.sms_quota > 0);
                                          v_extraQuota := userQuota; 
                                          if (userQuota - v_lastQuota) <=0 then
                                              /* �����ӻ�������� */
                                               select count(1) into orgCount 
                                               from org_remain_balance orb 
                                               where orb.user_id = v_subOrgId
                                               and orb.status =1 
                                               and orb.unit_price =v_unitprice;
                                                --�������Ѵ��ڴ��û�����Э������޸����
                                               if orgCount>0 then
                                                  update org_remain_balance orb 
                                                  set orb.sms_quota = orb.sms_quota+ userQuota, orb.last_update_quota_date =sysdate 
                                                  where orb.user_id = v_subOrgId 
                                                  and orb.status=1 
                                                  and orb.unit_price=v_unitprice;
                                               --�����в����ڴ��û�����Э������������
                                               elsif orgCount=0 then
                                                   insert into org_remain_balance 
                                                   (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                   values 
                                                   (sys_guid(), v_subOrgId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                               end if;
                                              /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                              update org_remain_balance orb 
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate 
                                              where orb.user_id = userId
                                              and orb.status=1 
                                              and orb.unit_price=v_unitprice;
                                          /*end if;*/
                                          else
                                            loop
                                                --��ѯ�û�����������Э���������ӻ������
                                                select orb.sms_quota, orb.unit_price
                                                  into v_lastQuota, v_unitprice
                                                  from org_remain_balance orb
                                                 where orb.status = 1
                                                   and orb.user_id = userId
                                                   and orb.update_unitprice_date =
                                                       (select min(orb2.update_unitprice_date)
                                                          from org_remain_balance orb2
                                                         where orb2.user_id = userId
                                                           and orb2.status = 1
                                                           and orb2.sms_quota > 0);
                                                --��ʱ�������һ��Э�����ʼ��
                                                v_extraQuota := v_extraQuota - v_lastQuota;
                                                --�����ֵ�����һ��Э��ۻ���
                                                if v_extraQuota >=0 then
                                                    /* �����ӻ�������� */
                                                    select count(1) into orgCount 
                                                    from org_remain_balance orb 
                                                    where orb.user_id = v_subOrgId 
                                                    and orb.status =1 
                                                    and orb.unit_price =v_unitprice;
                                                    --�������Ѵ��ڴ��ӻ�������Э������޸����
                                                     if orgCount>0 then
                                                        update org_remain_balance orb 
                                                        set orb.sms_quota = orb.sms_quota+ v_lastQuota, orb.last_update_quota_date =sysdate 
                                                        where orb.user_id = v_subOrgId 
                                                        and orb.status=1 
                                                        and orb.unit_price=v_unitprice;
                                                     --�����в����ڴ��û�����Э������������
                                                     elsif orgCount=0 then
                                                         insert into org_remain_balance 
                                                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                         values 
                                                         (sys_guid(), v_subOrgId,1, v_lastQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                                     end if;
                                                 /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = 0, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice; 
                                                
                                                 --��ֵ�����һ�������Э������С       
                                                elsif v_extraQuota <0 then
                                                     /* �����ӻ�������� */
                                                     select count(1) into orgCount 
                                                     from org_remain_balance orb 
                                                     where orb.user_id = v_subOrgId
                                                     and orb.status =1 
                                                     and orb.unit_price =v_unitprice;
                                                      --�������Ѵ��ڴ��û�����Э������޸����
                                                     if orgCount>0 then
                                                        update org_remain_balance orb 
                                                        set orb.sms_quota = orb.sms_quota+ v_lastQuota+v_extraQuota, orb.last_update_quota_date =sysdate 
                                                        where orb.user_id = v_subOrgId 
                                                        and orb.status=1 
                                                        and orb.unit_price=v_unitprice;
                                                     --�����в����ڴ��û�����Э������������
                                                     elsif orgCount=0 then
                                                         insert into org_remain_balance 
                                                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                         values 
                                                         (sys_guid(), v_subOrgId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                                     end if;
                                                    /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                                    update org_remain_balance orb 
                                                    set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate 
                                                    where orb.user_id = userId
                                                    and orb.status=1 
                                                    and orb.unit_price=v_unitprice;
                                                end if;
                                                
                                                exit when v_extraQuota <=0;
                                            end loop; 
                                          end if;                                              
                                        end;
                                  end if; 
                             /*��������Ա���ӻ����û���ֵ*/     
                             else
                                    --�û���ֵ������
                                  if v_userQuota >0 then 
                                       --��ѯ����Э������
                                        select up.unit_price,
                                        (select orb.sms_quota from org_remain_balance orb 
                                        where orb.status=1 and orb.user_id = userId
                                        and orb.unit_price=up.unit_price) sms_quota
                                        into v_unitprice,v_lastQuota
                                       from unit_price_info up 
                                       left join organization o on o.user_id=up.organization_id
                                       left join user_info u on u.organization_id=o.user_id
                                      where u.user_id = operatorId
                                       and up.effective=0 
                                       and up.biz_type=0;
                                      if v_lastQuota is null or v_lastQuota=0 then
                                           insert into org_remain_balance 
                                           (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                           values 
                                           (sys_guid(), userId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                      else
                                           update org_remain_balance orb 
                                           set orb.sms_quota = orb.sms_quota + userQuota,orb.last_update_quota_date = sysdate 
                                           where orb.user_id = userId
                                           and orb.unit_price = v_unitprice;
                                      end if;
                                       
                                  --�û�����    
                                  elsif v_userQuota <0  then 
                                        begin
                                          --��ѯ�û�����������Э���������ӻ������
                                          select orb.sms_quota, orb.unit_price
                                            into v_lastQuota, v_unitprice
                                            from org_remain_balance orb
                                           where orb.status = 1
                                             and orb.user_id = userId
                                             and orb.update_unitprice_date =
                                                 (select min(orb2.update_unitprice_date)
                                                    from org_remain_balance orb2
                                                   where orb2.user_id = userId
                                                     and orb2.status = 1
                                                     and orb2.sms_quota > 0);
                                          v_extraQuota := userQuota; 
                                          --��ֵ��������һ��Э��������
                                          if (userQuota - v_lastQuota) <=0 then
                                               /*��java�������Ѿ����������Ľ��˴������ټ�
                                               ��ֵ��������Э������С���۳���Ӧ���û����*/ 
                                              update org_remain_balance orb 
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate 
                                              where orb.user_id = userId
                                              and orb.status=1 
                                              and orb.unit_price=v_unitprice;
                                          --��ֵ��������һ��Э�������    
                                          else
                                            loop
                                                --��ѯ�û�����������Э���������ӻ������
                                                select orb.sms_quota, orb.unit_price
                                                  into v_lastQuota, v_unitprice
                                                  from org_remain_balance orb
                                                 where orb.status = 1
                                                   and orb.user_id = userId
                                                   and orb.update_unitprice_date =
                                                       (select min(orb2.update_unitprice_date)
                                                          from org_remain_balance orb2
                                                         where orb2.user_id = userId
                                                           and orb2.status = 1
                                                           and orb2.sms_quota > 0);
                                                --��ʱ�������һ��Э�����ʼ��
                                                v_extraQuota := v_extraQuota - v_lastQuota;
                                                --�����ֵ�����һ��Э��ۻ���
                                                if v_extraQuota >=0 then 
                                                 /* ��һ��Э��۵����ȳ�ֵ��С���û���������� */
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = 0, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice; 
                                                 --��ֵ�����һ�������Э������С       
                                                elsif v_extraQuota <0 then
                                                    /* ��ֵ��������Э������С���۳���Ӧ���û���� */
                                                    update org_remain_balance orb 
                                                    set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate 
                                                    where orb.user_id = userId
                                                    and orb.status=1 
                                                    and orb.unit_price=v_unitprice;
                                                end if;
                                                
                                                exit when v_extraQuota <=0;
                                            end loop; 
                                          end if;                                              
                                        end;
                                  end if; 
                                 
                             end if;      
                    end if;           
              end if;   
        end if;
    
        --����ύ
        commit;
    end if;
    
    RUN_RESULT := 0;
    
   exception
       when others then
       RUN_RESULT := 1;
   rollback;

end insert_org_quota;
/

prompt
prompt Creating procedure PROC_DROPIFEXISTS
prompt ====================================
prompt
create or replace procedure proc_dropifexists(p_table in varchar2) is
    v_count number(10);
  begin
     select count(*) into v_count from user_objects where object_name = upper(p_table);
     if v_count > 0 then
        execute immediate 'drop table ' || p_table ||' purge';
  end if;
end proc_dropifexists;
/

prompt
prompt Creating procedure P_CHECK_LONGSMS_SIGANATURE
prompt =============================================
prompt
create or replace procedure p_check_longsms_siganature is
  --��ѯ���������һ������
  CURSOR send_cur IS
  SELECT *
         from send t
         where
              t.send_status = -1
              and rownum <= 5000
              and t.is_original_sms = 1
              and t.current_pageno = t.originalsms_totalpages;


  r_send            send%rowtype;

  TYPE              cur_rs IS REF CURSOR;
  c_sinature_pool   cur_rs;--���ǩ�����α�
  r_signature_pool  sgw_signature_pool%rowtype;

  v_msg_total             varchar2(2000);--ƴ�ӵ���Ϣ
  v_msg_count       number :=0;
  v_signature_ok    number :=0;
  v_has_total       number :=1; --�Ƿ������Ķ���
  v_send_id         varchar2(2000);

  errormessage      exception;
begin

  --���²���Ҫ����ǩ����У�������
  --update send t set t.send_status = 0 where t.send_status = -1 and t.charge = 1;
  --commit;

  open send_cur;

      --������
      loop
          fetch send_cur into r_send;

          v_msg_total    := '';
          v_msg_count    := 0;
          v_signature_ok := 0;
          v_has_total    := 1;
          v_send_id      := '';

          --��ѯ�������
          --ѭ����ƴ�Ӷ���
          FOR a_send IN (
                         select *
                                from send t
                                where     t.send_status = -1
                                      and t.mobile_to = r_send.mobile_to
                                      and t.longsms_tag = r_send.longsms_tag
                                 order by t.current_pageno )
          LOOP
              v_msg_count := v_msg_count + 1;

              --������������
              if v_msg_count != to_number(a_send.current_pageno) THEN
                 --��Ų�һ�£����Ƴ�ѭ����trigger
                 v_has_total := 0;
                 exit;
              end if;
              --ƴ�ӳ�����
              v_msg_total := v_msg_total||a_send.send_msg;
              if length(v_send_id) > 0 then
                   v_send_id := v_send_id||','||''''||a_send.send_id||'''';
              else
                   v_send_id := ''''||a_send.send_id||'''';
              end if;
          END LOOP;

          --����ƴ�ӳɳ�����
          if v_has_total = 1 and v_msg_count = r_send.originalsms_totalpages then
            --����Ƿ���ǩ����
            open c_sinature_pool for
                 select pool.*
                        from sgw_signature_pool pool
                        LEFT JOIN sgw_customer customer ON pool.customer_id = customer.customer_id
                                                       AND  customer.org_id= r_send.user_organization;
                loop
                    fetch c_sinature_pool into r_signature_pool;
                    exit when c_sinature_pool%notfound;
                          --��ǩ������
                          if instr(v_msg_total,r_signature_pool.signature,1,1) > 0 then
                             --���¶���״̬
                             --insert into SQL_LOG values(systimestamp, 'p_check_longsms_siganature sql', 'update send set send_status = 0 where send_id in (' || v_send_id || ')');
                             --commit;
                             if r_signature_pool.do_append_msg = 1 and length(r_send.send_msg||r_signature_pool.append_msg) <= 67 then
                                --execute immediate ('update send set send_status = 0, send_msg = ''' || (s.send_msg || r_signature_pool.append_msg) || ''' where send_id in (' || v_send_id || ')');
                                update send set send_msg = (r_send.send_msg||r_signature_pool.append_msg) where send_id = r_send.send_id;
                                execute immediate ('update send set send_status = 0 where send_id in (' || v_send_id || ')');
                                commit;
                             else
                               execute immediate ('update send set send_status = 0 where send_id in (' || v_send_id || ')');
                               commit;
                             end if;

                             v_signature_ok := 1;
                             --�˳�ѭ��
                             exit;
                          end if;
                end loop;
            close c_sinature_pool;

            --����ǩ�����У����޸Ķ���״̬
            if v_signature_ok = 0 then
               execute immediate ('update send set send_status = 6, report = ''UD:0000'',err_msg = ''����ǩ������ǩ����'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               commit;
            end if;
          end if;
          exit when send_cur%notfound;
      end loop;
  close send_cur;

  --���³�ʱ�Ķ���,60����֮ǰ��
  update send t set t.send_status = -3, t.err_msg = '����ǩ����ʱ' where t.send_status = -1 and t.sys_time < (sysdate - 60/60/24);
  commit;
end p_check_longsms_siganature;
/

prompt
prompt Creating procedure P_MMS_CHANNEL_ANALYZE
prompt ========================================
prompt
create or replace procedure P_MMS_CHANNEL_ANALYZE(p_date varchar2)
is
       v_sendTime date;--?????
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --???????, 0:?? ?1??
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ?????SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --??????????????? ??
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from mms_channel_analyze mca where mca.stat_time >= to_number ( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

        --  execute immediate v_del_SQL;
           --??????????????? ??
          -- commit;
           --????????????

           v_child_SQL := ' select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXMDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id,ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms  left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into mms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id, t.org_id , send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.channel_id,t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --?????????????? ??
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1-1/24/60/60;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXMDATE(p_date); -- p_date ?? ?2012-11-08 14:00:00
            v_del_SQL :=  'delete from mms_channel_analyze mca where mca.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';

          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, o.parentid as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat, ms.channel_id, ms.org_id as parent_org_id, ms.org_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into mms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id,t.org_id , t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (1,5,6) group by t.channel_id, t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_MMS_CHANNEL_ANALYZE;
/

prompt
prompt Creating procedure P_MMS_SEND_ANALYZE
prompt =====================================
prompt
create or replace procedure P_MMS_SEND_ANALYZE(p_date varchar2)
is
       v_sendTime date;--?????
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --???????, 0:?? ?1??
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ?????SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --??????????????? ??
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from mms_send_analyze msa where msa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --??????????????? ??
          -- commit;
           --????????????
           v_child_SQL := ' select to_number(to_char(send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id  where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id  where ms.send_status in (1,5,6) and ms.send_time >=''' || v_sendTime || ''' and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXMDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ss.user_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,ms.org_id as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and o.parentid in (''0'',''1'')' ;
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into mms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id,t.org_id, t.user_id,t.send_status, t.sysdat, sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.parent_org_id,t.org_id,t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --?????????????? ??
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1-1/24/60/60;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXMDATE(p_date); -- p_date ?? ?2012-11-08 14:00:00
            v_del_SQL :=  'delete from mms_send_analyze msa where msa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,ms.org_id as parent_org_id,ms.org_id,ms.user_id,ms.send_status,ms.mobile_quantities from mms_send ms left join organization o on ms.org_id = o.user_id where ms.send_status in (1,5,6) and ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';
          while v_count < 30
          loop
              v_curTableName := FUN_JXMDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ms.org_id, ms.user_id, ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ms.send_time,''YYYYMMDD''))  as sysdat,ms.org_id as parent_org_id,ms.org_id, ms.user_id, ms.send_status,ms.mobile_quantities  from ' || v_curTableName || ' ms left join organization o on ms.org_id = o.user_id where ms.send_time >= ''' || v_sendTime || ''' and ms.send_time <= ''' || v_sendEndTime || ''' and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into mms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id, t.org_id, t.user_id, t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (1,5,6) group by t.parent_org_id,t.org_id, t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_MMS_SEND_ANALYZE;
/

prompt
prompt Creating procedure P_SEND_SMS_SUM
prompt =================================
prompt
create or replace procedure P_SEND_SMS_SUM
is
user_id sms_send_analyze.user_id%type;--���͵��û�id
stat_time sms_send_analyze.stat_time%type;--��������
quantity sms_send_analyze.quantity%type;--���ŷ�������
org_id sms_send_analyze.org_id%type;--�û���������
cursor sms_cursor_result is select
 sum(MOBILE_QUANTITIES) quantity,
user_id,USER_ORGANIZATION as
 org_id,max(to_number(to_char(sysdate,'yyyymmdd')))
 as stat_time from send where sys_time<=sysdate
 and sys_time>trunc(sysdate,'dd') group by user_id,USER_ORGANIZATION;--ͳ�ƻ�������ķ�����
begin
if sms_cursor_result%isopen then--��ֹ�α��ϴ�δ�ر�
close sms_cursor_result;
end if;
open sms_cursor_result;
loop
fetch sms_cursor_result into quantity,user_id,org_id,stat_time;
exit when sms_cursor_result%notfound;
dbms_output.put_line('quantity:'||quantity||'user_id:'||user_id||'org_id:'||org_id||'stat_time:'||stat_time);
insert into sms_send_analyze(org_id,user_id,stat_time,status,quantity) values(org_id,user_id,stat_time,'1',quantity);
commit;
end loop;
close sms_cursor_result;


exception
 when others then
  rollback;

end P_SEND_SMS_SUM;
/

prompt
prompt Creating procedure P_SMS_CHANNEL_ANALYZE
prompt ========================================
prompt
create or replace procedure P_SMS_CHANNEL_ANALYZE(p_date varchar2)
is
       v_sendTime date;--�濪ʼ����
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_channel_analyze sca where sca.stat_time >= to_number ( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ����
          -- commit;
           --Ԥͳ������ǰ���Ͷ�������

           v_child_SQL := ' select to_number(to_char(sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, o.parentid as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (1,5,6) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (1,5,6) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'' and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, o.parentid as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss  left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into sms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id, t.org_id , send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.channel_id,t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --ɾ�����췢�Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date ��ʽ ��2012-11-08 14:00:00
            v_del_SQL :=  'delete from sms_channel_analyze sca where sca.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, o.parentid as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.longsms_splited = 0 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id, ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';

          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1  and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat, ss.channel_id,ss.user_organization as org_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1  and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into sms_channel_analyze(channel_id,parent_org_id,org_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.channel_id, t.parent_org_id,t.org_id , t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (0,1,5,6,7) group by t.channel_id, t.parent_org_id, t.org_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      end if;

end P_SMS_CHANNEL_ANALYZE;
/

prompt
prompt Creating procedure P_SMS_RETURN_CONSUME_FEE
prompt ===========================================
prompt
create or replace procedure P_SMS_RETURN_CONSUME_FEE
       (
         p_batchId in varchar2,           --���κ�
         RUN_RESULT      OUT NUMBER,
         RUN_EXCEPTION   OUT VARCHAR
       )
is
       query_SQL varchar2(1000);    --��ѯ�Ʒѱ�sql
       update_SQL varchar2(1000);   --�޸��û����sql

       NO_BATCHID_RECORD exception;   --���κŲ������쳣

       NO_ORG_RECORD EXCEPTION; --����������

       NO_USER_RECORD EXCEPTION; --�û�������

       NO_PAY_MODE_RECORD EXCEPTION;  --�Ʒѵ�λ������

       NO_FEE_MODE_RECORD EXCEPTION;  --�۷ѷ�ʽ������

       TYPE My_CurType IS REF CURSOR;                              --�����α�����
       c_consume My_CurType;                                       --ָʾc_consume������ΪMy_CurType����My_CurType���α�����
       v_batchId consume_record_info.batch_id%type;                --���κ�id
       v_organizationId consume_record_info.organization_id%type;  --����id
       v_userId consume_record_info.consumer_id%type;              --�û�userId
       v_payMode organization.pay_mode%type;                       --�Ʒѵ�λ, 0:����, 1:����
       v_feeMode consume_record_info.fee_mode%type;                --�۷ѷ�ʽ, 0:�Ը���, 1:�鸶��
       v_costFee consume_record_info.cost_fee%type;                --�۷ѽ��
       v_sendQuantity consume_record_info.send_quantity%type;       --��������
begin
        update_SQL :='';

        query_SQL :='select cr.batch_id,
                         sum(nvl(cr.send_quantity,0)) send_quantity,
                         nvl(sum(cr.send_quantity*cr.unit_price),0) cost_fee,
                         cr.consumer_id userId,
                         cr.organization_id,
                         o.pay_mode,
                         cr.fee_mode
                    from consume_record_info cr
                    left join user_info u on u.user_id = cr.consumer_id
                    left join organization o on o.user_id = cr.organization_id';
        if p_batchId is null then
             RAISE NO_BATCHID_RECORD; --���κŲ�����ʱ�׳��쳣
        ELSE
             query_SQL := ' and cr.batch_id='''||p_batchId||'''';
        end if;
             query_SQL :='group by cr.batch_id,
                           cr.send_quantity,
                           nvl((cr.send_quantity*cr.unit_price),0),
                           cr.consumer_id,
                           cr.organization_id,
                           o.pay_mode,
                           cr.fee_mode
                          ';

        DBMS_OUTPUT.PUT_LINE(query_SQL);
     /*  --���Դ���:������ʱ���鿴sql
       insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('��ѯ�Ʒ��õ�sql'||query_SQL,sysdate);
     */

        if c_consume%isopen then --��ֹ�ϴ��α�δ�ر�
          close c_consume;
        end if;

        open c_consume for query_SQL;

        loop
          fetch c_consume into v_batchId,v_sendQuantity,v_costFee,v_userId,v_organizationId,v_payMode,v_feeMode; --��ȡ�α�
            exit when c_consume%notfound;

             --�쳣����
             if v_feeMode is null then
                RAISE NO_FEE_MODE_RECORD;
             end if;
             if v_payMode is null then
                RAISE NO_PAY_MODE_RECORD;
             end if;
             if v_organizationId is null then
                RAISE NO_ORG_RECORD;
             end if;
             if v_userId is null then
                RAISE NO_USER_RECORD;
             end if;

             --������鸶��
             if v_feeMode is not null and v_payMode is not null and v_organizationId is not null then
                if v_feeMode=1 then
                   --�����������,������������
                   if v_payMode=0 then
                       update_SQL :='update organization o
                          set o.user_quota = o.user_quota + '||v_sendQuantity||' where o.user_id = '''||v_organizationId||'''';
                   end if;
                   --����ǽ�����,���������
                   if v_payMode=1 then
                       update_SQL :='update organization o
                          set o.user_balance = o.user_balance + '||v_costFee||' where o.user_id = '''||v_organizationId||'''';
                   end if;
                end if;
            end if;

           --������Ը���
             if v_feeMode is not null and v_payMode is not null and v_userId is not null then
                if v_feeMode=0 then
                   --���������û�,������������
                   if v_payMode=0 then
                       update_SQL :='update user_info u
                          set u.user_quota = u.user_quota + '||v_sendQuantity||' where u.user_id = single_cursor.user_id';
                   end if;
                   --����ǽ���û�,���������
                   if v_payMode=1 then
                      update_SQL :='update user_info u
                         set u.user_balance = u.user_balance + '||v_costFee||' where u.user_id = single_cursor.user_id';
                   end if;
                 end if;
             end if;

            DBMS_OUTPUT.PUT_LINE(update_SQL);
         /*   --���Դ���:������ʱ���鿴sql
           insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('�޸ļƷ��õ�sql'||update_SQL,sysdate);
         */

            execute immediate update_SQL;
       end loop;

           commit;
           DBMS_OUTPUT.PUT_LINE('============���ط��óɹ�==========');
       close c_consume;

       exception
             when NO_BATCHID_RECORD then
                   DBMS_OUTPUT.PUT_LINE('���κ�Ϊ��');
                   RUN_RESULT    := 1;
                   RUN_EXCEPTION := '���κ�Ϊ��';
                   ROLLBACK;
             when NO_ORG_RECORD then
                   DBMS_OUTPUT.PUT_LINE('����������');
                   RUN_RESULT    := 2;
                   RUN_EXCEPTION := '����������';
                   ROLLBACK;
             when NO_USER_RECORD then
                   DBMS_OUTPUT.PUT_LINE('�û�������');
                   RUN_RESULT    := 3;
                   RUN_EXCEPTION := '�û�������';
                   ROLLBACK;
             when NO_PAY_MODE_RECORD then
                   DBMS_OUTPUT.PUT_LINE('�Ʒѵ�λ������');
                   RUN_RESULT    := 4;
                   RUN_EXCEPTION := '�Ʒѵ�λ������';
                   ROLLBACK;
             when NO_FEE_MODE_RECORD then
                   DBMS_OUTPUT.PUT_LINE('�۷ѷ�ʽ������');
                   RUN_RESULT    := 5;
                   RUN_EXCEPTION := '�۷ѷ�ʽ������';
                   ROLLBACK;
            WHEN OTHERS THEN
                   DBMS_OUTPUT.PUT_LINE(SQLCODE || '----' || SQLERRM);
                   RUN_RESULT    := 6;
                   RUN_EXCEPTION := SQLCODE || '----' || SQLERRM;
                   ROLLBACK;

end P_SMS_RETURN_CONSUME_FEE;
/

prompt
prompt Creating procedure P_SMS_RETURN_FEE
prompt ===================================
prompt
create or replace procedure P_SMS_RETURN_FEE is
   cursor c_consume is
        select sum(s1.unit_price*s1.mobile_quantities) failTotalFee,
                   sum(s1.mobile_quantities) failTotalQuata,
                   s1.user_id,
                   s1.unit_price,
                   to_char(s1.send_time, 'yyyymmdd') send_time,
                   o.fee_mode,
                   o.parentid,
                   u.organization_id
              from send s1
              left join user_info u on s1.user_id = u.user_id
              left join organization o on s1.user_organization = o.user_id
              left join channel_info c on s1.channel_id = c.channel_id
              left join task_info ti on ti.batch_id=s1.batch_id
             where 1=1
               and s1.sys_time <=CAST(sysdate AS TIMESTAMP)
               and s1.sys_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
               --and s1.receive_id is null                        -- ��CMPP�ӿڹ����Ķ���
               and s1.send_status = 6                           --��������:����ʧ��
               and (s1.return_fee=0 or s1.return_fee is null)   --���ط���:δ���ط���
               and o.deduct_mode=1                              --�Ʒ�����:�ɹ��Ʒ�
               and o.pay_type=0                                 --��ֵ����:Ԥ����
               and ti.time_task=0                               --�Ƿ�ʱ����0���� 1��
               and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
             group by s1.user_id,s1.unit_price,to_char(s1.send_time, 'yyyymmdd'), o.fee_mode,o.parentid, u.organization_id
         union all
         select sum(s1.unit_price*s1.mobile_quantities) failTotalFee,
                   sum(s1.mobile_quantities) failTotalQuata,
                   s1.user_id,
                   s1.unit_price,
                   to_char(s1.send_time, 'yyyymmdd') send_time,
                   o.fee_mode,
                   o.parentid,
                   u.organization_id
              from send s1
              left join user_info u on s1.user_id = u.user_id
              left join organization o on s1.user_organization = o.user_id
              left join channel_info c on s1.channel_id = c.channel_id
              left join task_info ti on ti.batch_id=s1.batch_id
             where 1=1
               and s1.send_time <=CAST(sysdate AS TIMESTAMP)
               and s1.send_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
               --and s1.receive_id is null                        -- ��CMPP�ӿڹ����Ķ���
               and s1.send_status = 6                           --��������:����ʧ��
               and (s1.return_fee=0 or s1.return_fee is null)   --���ط���:δ���ط���
               and o.deduct_mode=1                              --�Ʒ�����:�ɹ��Ʒ�
               and o.pay_type=0                                 --��ֵ����:Ԥ����
               and ti.time_task=1                               --�Ƿ�ʱ����0���� 1��
               and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
             group by s1.user_id,s1.unit_price,to_char(s1.send_time, 'yyyymmdd'), o.fee_mode,o.parentid, u.organization_id;

      single_cursor c_consume%rowtype;
      v_payMode organization.pay_mode%type;                     --�û������������Ʒѵ�λ, 0:����, 1:����
      orgCount number;                                          --��ѯ��������Ƿ��Ѿ���������

begin
      if c_consume%isopen then
         close c_consume;
      end if;

      open c_consume;
           loop
             fetch c_consume into single_cursor;
               exit when c_consume%notfound;
               --DBMS_OUTPUT.PUT_LINE(single_cursor.user_id||'--'||nvl(single_cursor.failTotalFee,0)||'---'||single_cursor.fee_mode);
                --��ѯ���û��������ļƷѵ�λ, 0:����, 1:����
                if single_cursor.organization_id != '1' then
                    SELECT o.pay_mode into v_payMode
                    FROM organization o
                    where o.parentid='1'
                    START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=single_cursor.user_id)
                    CONNECT BY PRIOR o.parentid=o.user_id;
                else
                    select o.pay_mode into v_payMode from organization o
                    where o.user_id=single_cursor.organization_id;
                end if;

               --DBMS_OUTPUT.PUT_LINE(single_cursor.user_id||'--'||nvl(single_cursor.failTotalFee,0)||'---'||single_cursor.fee_mode);
               --������Ը���
               if single_cursor.fee_mode is not null and single_cursor.user_id is not null then
                 if single_cursor.fee_mode=0 then
                   --����������û����ǽ���û�,��������������
                       update user_info u
                          set u.user_quota = u.user_quota + nvl(single_cursor.failTotalQuata,0)
                        where u.user_id = single_cursor.user_id;
                      /* �޸�����,������������Ը��ѣ����������û���������
                       * ��������µ��ӻ����������Ը��ѣ�ҲҪ��������
                       */
                      if v_payMode = 1 then
                          --��ѯ�û��Ƿ������Э��۵����
                          select count(1) into orgCount
                          from org_remain_balance orb
                          where orb.user_id = single_cursor.user_id
                          and orb.unit_price =single_cursor.unit_price
                          and orb.status=1;
                          --�д�Э������������
                          if orgCount>0 then
                            update org_remain_balance orb
                            set orb.sms_quota = orb.sms_quota + nvl(single_cursor.failTotalQuata,0),
                            orb.last_update_quota_date = sysdate,orb.update_user='SYS_JOB_RETURN_FEE'
                            where orb.user_id = single_cursor.user_id
                            and orb.unit_price =single_cursor.unit_price;
                          --û�д�Э������������
                          elsif orgCount=0 then
                             insert into org_remain_balance
                             (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                             values
                             (sys_guid(), single_cursor.user_id,1, nvl(single_cursor.failTotalQuata,0), single_cursor.unit_price,0, sysdate, 'SYS_JOB_RETURN_FEE', '�����û����ò�������', sysdate, 0,0);
                          end if;
                      end if;
                 end if;
               end if;

               --������鸶��
               if single_cursor.fee_mode is not null and v_payMode is not null then
                  if single_cursor.fee_mode=1 then
                     --����(�ֽ���������������)
                     if single_cursor.parentid = '1' or single_cursor.parentid = '0' then
                          --�����������,������������
                         if v_payMode=0 then
                             update organization o
                                set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                              where o.user_id = single_cursor.organization_id;
                         end if;
                         --����ǽ�����,���������
                         if v_payMode=1 then
                             update organization o
                                set o.user_balance = o.user_balance + nvl(single_cursor.failTotalFee,0)
                              where o.user_id = single_cursor.organization_id;
                         end if;
                     --�����������ӻ�����ȫ����ֱ�ӷ���������
                     elsif single_cursor.parentid != '1' and single_cursor.parentid != '0' then
                         --�Ժ�۷�ʱ������������������������ã���������ֻ�ǲ鿴������
                         update organization o
                         set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                         where o.user_id = single_cursor.organization_id;

                         /*��������������ӻ���������������*/

                         if v_payMode=1 then
                            --��ѯ�û��Ƿ������Э��۵����
                            select count(1) into orgCount
                            from org_remain_balance orb
                            where orb.user_id = single_cursor.organization_id
                            and orb.unit_price =single_cursor.unit_price
                            and orb.status=1;
                            --�д�Э������������
                            if orgCount>0 then
                              update org_remain_balance orb
                              set orb.sms_quota = orb.sms_quota + nvl(single_cursor.failTotalQuata,0),
                              orb.last_update_quota_date = sysdate,orb.update_user='SYS_JOB_RETURN_FEE'
                              where orb.user_id = single_cursor.organization_id
                              and orb.unit_price =single_cursor.unit_price;
                            --û�д�Э������������
                            elsif orgCount=0 then
                               insert into org_remain_balance
                               (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                               values
                               (sys_guid(), single_cursor.organization_id,1, nvl(single_cursor.failTotalQuata,0), single_cursor.unit_price,0, sysdate, 'SYS_JOB_RETURN_FEE', '���ػ������ò�������', sysdate, 1,0);
                            end if;
                         end if;
                     end if;


                  end if;
              end if;

              --�޸Ķ���״̬Ϊ:�ѷ�����
               update send s set s.return_fee=1 where s.send_id in
                 (select s1.send_id
                      from send s1
                      left join user_info u on s1.user_id = u.user_id
                      left join organization o on s1.user_organization = o.user_id
                      left join channel_info c on s1.channel_id = c.channel_id
                     where to_char(s1.send_time, 'yyyymmdd') =single_cursor.send_time
                       and s1.user_id=single_cursor.user_id
                       and s1.receive_id is null                        -- ��CMPP�ӿڹ����Ķ���
                       and s1.send_status = 6                           --��������:����ʧ��
                       and o.deduct_mode=1                              --�Ʒ�����:�ɹ��Ʒ�
                       and o.pay_type=0                                 --��ֵ����:Ԥ����
                       --and s1.deduct_fee_status !=0                      --�۷�״̬:�ɹ�
                       and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3'))
                       or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3'))));

                --�����ֵ��¼��
                 --������鸶��
                 if single_cursor.fee_mode=1 then
                     --����
                     if single_cursor.parentid = '1' or single_cursor.parentid = '0' then
                          --�����������,������������
                         if v_payMode=0 then
                              insert into payment_record
                              (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE,IS_ONLINE, USER_TYPE,RECHARGE_EXPLAIN,QUOTA_TYPE,IS_SUCCESS)
                              values
                              (sys_guid(), single_cursor.organization_id,sysdate,0, nvl(single_cursor.failTotalQuata,0), 'SYS_JOB_RETURN_FEE', 6, 0,1, '��������ʧ�ܶ������',1, 1);
                         end if;
                         --����ǽ�����,���������
                         if v_payMode=1 then
                              insert into payment_record
                              (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE,IS_SUCCESS)
                              values
                              (sys_guid(),single_cursor.organization_id,sysdate, nvl(single_cursor.failTotalFee,0), 0, 'SYS_JOB_RETURN_FEE', 7, 0, 1, '��������ʧ�ܶ��Ž��',1, 1);
                         end if;
                     --�����������ӻ�����ȫ����ֱ�ӷ���������
                     elsif single_cursor.parentid != '1' and single_cursor.parentid != '0' then
                             insert into payment_record
                             (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE,IS_ONLINE, USER_TYPE,RECHARGE_EXPLAIN,QUOTA_TYPE,IS_SUCCESS)
                             values
                             (sys_guid(), single_cursor.organization_id,sysdate,0, nvl(single_cursor.failTotalQuata,0), 'SYS_JOB_RETURN_FEE', 6, 0,1, '��������ʧ�ܶ������',1, 1);
                     end if;
               end if;

               --������Ը���
               if single_cursor.fee_mode=0 then
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
                           0,
                           '��������ʧ�ܶ������',
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

prompt
prompt Creating procedure P_SMS_SEND_ANALYZE
prompt =====================================
prompt
create or replace procedure P_SMS_SEND_ANALYZE(p_date varchar2)
is
       v_sendTime date;--�濪ʼ����
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --�Ƿ�������Ϣ, 0:���� ��1����
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- ƴ�ӵĻ���SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time >= to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --ɾ������ǰ���Ͷ��ŵ�ͳ�Ƶ����� ����
          -- commit;
           --Ԥͳ������ǰ���Ͷ�������

           v_child_SQL := ' select o.parentid as parent_org_id,
                                   ss.user_organization as org_id,
                                   ss.user_id,
                                   ss.send_status,
                                   to_number(to_char(ss.sys_time, ''YYYYMMDD'')) as sysdat,
                                   sum(ss.mobile_quantities)
                              from send ss
                              left join organization o on ss.user_organization = o.user_id
                              left join channel_info c on c.channel_id=ss.channel_id 
                             where ss.send_status in (1, 5, 6, 7, 8)
                               and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') 
                                   --������ͨ��(�����)
                               AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                                   --ֱ��ͨ��(��Ҫ���)
                                    OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                                    OR SS.SEND_STATUS=any(7,8))
                            group by o.parentid,
                                     ss.user_organization,
                                     ss.user_id,
                                     to_number(to_char(ss.sys_time, ''YYYYMMDD'')),
                                     ss.send_status';

             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL ||v_child_SQL;

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         execute immediate v_SQL;
         commit;
      else
             --ɾ�����췢�Ͷ��ŵ�ͳ�Ƶ����� ��ʼ
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date ��ʽ ��2012-11-08 14:00:00
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

           execute immediate v_del_SQL;
           commit;
           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id where ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
          while v_count < 30
          loop
              v_curTableName := FUN_JXDATE( to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));

            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.org_id, ss.user_id, ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o  where ss.MOBILE_QUANTITIES = 1 and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.org_id as parent_org_id,ss.org_id, ss.user_id, ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o  where ss.MOBILE_QUANTITIES = 1 and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and ss.sys_time <  to_date(''' || to_char(v_sendEndTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';
               Exception
                 when others then
                   v_SQL_TMP := '';
             end;

             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_count := v_count + 1;
             v_tempTime := v_tempTime + 1;
          end loop;

             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id, t.org_id, t.user_id, t.send_status, t.sysdat , sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t where t.send_status in (0,1,5,6,7) group by t.parent_org_id,t.org_id, t.user_id, t.sysdat, t.send_status ';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_SQL > ' || v_SQL );
           end if;

         --������ʱ��
         insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);

         execute immediate v_SQL;
         commit;
      end if;

 EXCEPTION
   WHEN OTHERS THEN
 ROLLBACK;
end P_SMS_SEND_ANALYZE;
/

prompt
prompt Creating procedure P_SMS_UPDATE_TASKINFO
prompt ========================================
prompt
create or replace procedure P_SMS_UPDATE_TASKINFO is
   cursor c_consume is
         select aa.batch_id,
                sum(nvl(aa.successQuota,0)) successQuota,
                sum(nvl(aa.failureQuota,0)) failureQuota,
                sum(nvl(aa.unkownQuota,0)) unkownQuota
                 from (select s.batch_id,
                              (case when s.send_status=5 then nvl(sum(s.mobile_quantities),0)
                               end) successQuota,
                               (case when s.send_status=6 then nvl(sum(s.mobile_quantities),0)
                               end) failureQuota,
                               (case when s.send_status=1 then nvl(sum(s.mobile_quantities),0)
                               end) unkownQuota
                             from send s
                             left join task_info t on t.batch_id = s.batch_id
                             left join channel_info c on s.channel_id = c.channel_id 
                            where s.sys_time >= CAST(trunc(sysdate)-2 AS TIMESTAMP)
                              and s.sys_time <= CAST(sysdate AS TIMESTAMP)
                              and ((c.link_mode != all('CMPP2','SGIP','SMGP3') and s.is_original_sms=0)  
                                     or (c.link_mode = any('CMPP2','SGIP','SMGP3') and s.mobile_quantities=1))
                group by s.batch_id,s.send_status) aa
                group by aa.batch_id;

   single_cursor c_consume%rowtype;
   allCount task_info.report_all_count%type;

begin
     allCount :=0;

     if c_consume%isopen then
         close c_consume;
      end if;

      open c_consume;
           loop
             fetch c_consume into single_cursor;
               exit when c_consume%notfound;

               --���㷵��״̬�����������
               allCount := nvl(single_cursor.successQuota,0)+nvl(single_cursor.failurequota,0)+nvl(single_cursor.unkownquota,0);

               --�޸�task_info����״̬���������
               update task_info t set
                 t.report_all_count=allCount,
                 t.report_success_count=nvl(single_cursor.successQuota,0),
                 t.report_failure_count=nvl(single_cursor.failurequota,0),
                 t.report_unknown_count=nvl(single_cursor.unkownquota,0)
               where t.batch_id=single_cursor.batch_id;

           end loop;

            commit;

      close c_consume;

     exception
         when others then
     rollback;

end P_SMS_UPDATE_TASKINFO;
/

prompt
prompt Creating procedure P_STATICS_SMSQUANTITY
prompt ========================================
prompt
create or replace procedure p_statics_smsquantity
 is
begin
  --??????
  delete from send_statics_quantity_temp;
  commit;
  --????????????
  insert into send_statics_quantity_temp
          select channel_id,
                 SUM(mobile_quantities) as total_quantity,
                 SUM( DECODE ( send_status, 0, mobile_quantities, 0 )) wait_send_quantity,
                 SUM( DECODE ( send_status, 2, mobile_quantities, 0 )) sending_quantity,
                 SUM( DECODE ( send_status, 1, mobile_quantities, 0 )) sent_quantity,
                 SUM( DECODE ( send_status, 5, mobile_quantities, 0 )) success_quantity,
                 SUM( DECODE ( send_status, 6, mobile_quantities, 0 )) failed_quantity,
                 SUM( DECODE ( send_status, 7, mobile_quantities, 0 )) black_quantity,
                 SUM( DECODE ( send_status, 8, mobile_quantities, 0 )) prohibited_quantity,
                 0 receive_quantity,
                 sysdate as create_time
          from  send t
          where sys_time = to_timestamp(to_date(SYSDATE,'yyyymmdd'))
                and t.is_original_sms = 0
          group by channel_id
          order by channel_id
  ;

  --????????
  update send_statics_quantity_temp q set q.receive_quantity =
  (
  select count(*) receive_quantity from sms_receive t
  where  1=1
         --and trunc(sys_time) = to_date(theDate, 'yyyy-MM-dd')
         and trunc(sys_time) = trunc(sysdate)
         and t.channel_id = q.channel_id
  group by channel_id
  )
  ;

  --?????????????
  insert into send_statics_quantity_temp t
  select channel_id,
         0 total_quantity,
         0 wait_send_quantity,
         0 sending_quantity,
         0 sent_quantity,
         0 success_quantity,
         0 failed_quantity,
         0 black_quantity,
         0 prohibited_quantity,
         count(*) receive_quantity,
         sysdate as create_time
  from sms_receive q
  where  1=1
         --and trunc(sys_time) = to_date(theDate, 'yyyy-MM-dd')
         and trunc(sys_time) = trunc(sysdate)
         and q.channel_id not in
         (
             select distinct channel_id from send_statics_quantity_temp
         )
  group by channel_id
  ;
  --??????
  insert into send_statics_quantity_temp
          select -1 channel_id,
                 sum(total_quantity) total_quantity,
                 sum(wait_send_quantity) wait_send_quantity,
                 sum(sending_quantity) sending_quantity,
                 sum(sent_quantity) sent_quantity,
                 sum(success_quantity) success_quantity,
                 sum(failed_quantity) failed_quantity,
                 sum(black_quantity) black_quantity,
                 sum(prohibited_quantity) prohibited_quantity,
                 sum(receive_quantity) receive_quantity,
                 sysdate as create_time
          from send_statics_quantity_temp t
  ;
  --??????
  update send_statics_quantity_temp set receive_quantity =
  (
         select sum(receive_quantity) from send_statics_quantity_temp where channel_id != -1
  )
  where channel_id = -1;

  --?????????
  insert into send_statics_quantity select * from send_statics_quantity_temp;
  commit;
end p_statics_smsquantity;
/

prompt
prompt Creating procedure QUERY_MMS_CHANNEL
prompt ====================================
prompt
create or replace procedure QUERY_MMS_CHANNEL(
                  p_startTime in varchar2,--????????) 2012-12-13
                  p_endTime in varchar2,--???? ????) 2012-12-13
                  p_statType in number, -- ???? 0   ??????????1  ?????????
                  p_channelID in varchar2,--??ID   1,2,3,....n ????
                  p_orgID in varchar2,--??ID ????
                  p_status in varchar2,--??
                  mycursor out sys_refcursor--???????
                 )
is
       v_startTime number(8);--?????
       v_endTime number(8);--?????
       v_debug number(1); --???????, 0:?? ?1??
       v_SQL varchar2(8000); -- ?????SQL
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --????????
     if p_startTime is not null  then
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     if p_statType = 0 then --????????
           v_SQL := 'select c.channel_name,o.user_name,mca.status,sum(mca.quantity) from mms_channel_analyze mca
                     left join channel_info c on mca.channel_id = c.channel_id
                          left join organization o on mca.parent_org_id = o.user_id
                   where 1 = 1' ;

           if p_channelID is not null then
               v_SQL := v_SQL || ' and mca.channel_id = ' || p_channelID ;
           end if;
           if v_startTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time <= ' || v_endTime ;
           end if ;

           if p_status is not null then
              v_SQL := v_SQL || ' and mca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,mca.status';
      else
              v_SQL := 'select c.channel_name,o.user_name,mca.status,sum(mca.quantity) from mms_channel_analyze mca
                       left join channel_info c on mca.channel_id = c.channel_id
                            left join organization o on mca.org_id = o.user_id
                     where  mca.parent_org_id = ''' || p_orgID || '''' ;

           if p_channelID is not null then
               v_SQL := v_SQL || ' and mca.channel_id = ' || p_channelID ;
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and mca.stat_time <= ' || v_endTime ;
           end if ;

           if p_status is not null then
              v_SQL := v_SQL || ' and mca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,mca.status';
      end if;

     --???SQL??

      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);

     open mycursor for v_SQL ;

end QUERY_MMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_MMS_SEND
prompt =================================
prompt
create or replace procedure QUERY_MMS_SEND(
               p_startTime in varchar2,--????????)
                  p_endTime in varchar2,--???? ????)
                  p_statType in number, -- ???? 0 ???????1 ???????? 2 ?????????
                  p_userID in varchar2,--??ID Admin ???
                  p_parentOrgID in varchar2,--??ID ???
                  p_orgID in varchar2,--??ID ????
                  p_status in varchar2, --??
                  mycursor out sys_refcursor--???????
                 )
is
       v_startTime number(8);--?????
       v_endTime number(8);--?????
       v_debug number(1); --???????, 0:?? ?1??
       v_SQL varchar2(8000); -- ?????SQL
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --????????
     if p_startTime is not null  then
             v_startTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;
     if p_endTime is not null then
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
     end if;

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     --???SQL??
     if p_statType = 0  then --??????
          v_SQL := 'select u.user_name,msa.status,sum(msa.quantity) from mms_send_analyze msa
                     left join user_info u on msa.user_id = u.user_id
                   where msa.org_id  = ''' || p_orgID || '''' ;
           if p_userID is not null then
              v_SQL := v_SQL || ' and msa.user_id = ''' || p_userID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and msa.status in (' || p_status || ')';
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' group by u.user_name,msa.status';
      end if;

      if p_statType = 1  then --??????
          v_SQL := 'select o.user_name,msa.status,sum(msa.quantity) from mms_send_analyze msa
                          left join organization o on msa.org_id = o.user_id
                   where msa.parent_org_id  = ''' || p_parentOrgID || '''' ;

           if p_orgID is not null then
               v_SQL := v_SQL || ' and msa.org_id = ''' || p_orgID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and msa.status in (' || p_status || ')';
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' group by o.user_name,msa.status';
      end if;

      if p_statType = 2  then --?????????
          v_SQL := 'select o.user_name,msa.status,sum(msa.quantity) from mms_send_analyze msa
                          left join organization o on msa.parent_org_id = o.user_id
                   where 1= 1 ' ;
           if p_orgID is not null then
              v_SQL := v_SQL || ' and msa.parent_org_id = ''' || p_orgID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and msa.status in (' || p_status || ')';
           end if;

           if v_startTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time >= ' || v_startTime ;
           end if;

           if v_endTime > 0 then
               v_SQL := v_SQL || ' and msa.stat_time <= ' || v_endTime ;
           end if ;

           v_SQL := v_SQL || ' group by o.user_name,msa.status';
      end if;

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_MMS_SEND;
/

prompt
prompt Creating procedure QUERY_MONTH_INFO_REPORT
prompt ==========================================
prompt
create or replace procedure QUERY_MONTH_INFO_REPORT
     (
       p_queryTime in varchar2,          --��ѯ�·ݣ�����)
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
                       ui.user_name,
                       o.user_name org_name,
                       mri.account_time,
                       sum(mri.send_quantity) send_quantity,
                       sum(mri.cost_fee) cost_fee
                  from month_reckoning_info mri
                  left join user_info ui on ui.user_id=mri.user_id
                  left join organization o on o.user_id=ui.organization_id
                  where 1=1
                  ';

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

           if p_queryTime is not null then
               v_SQL := v_SQL || ' and mri.ACCOUNT_TIME = ' || p_queryTime;
           end if;

      end if;

         if p_statType = 0  then --��������Ա����ͳ��

           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;

           if p_orgID is not null then
                 v_SQL := v_SQL || ' and ui.organization_id='''|| p_orgID || '''';
           end if;

           if p_queryTime is not null then
               v_SQL := v_SQL || ' and mri.ACCOUNT_TIME = ' || p_queryTime;
           end if;

      end if;
      
      v_SQL := v_SQL||' group by mri.user_id,ui.user_name,o.user_name,mri.account_time order by mri.ACCOUNT_TIME desc';
     --���Դ���:������ʱ���鿴sql
/*       insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
       commit;*/

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_MONTH_INFO_REPORT;
/

prompt
prompt Creating procedure QUERY_ORGSMS_MANAGER_AND_TIME
prompt ================================================
prompt
create or replace procedure QUERY_ORGSMS_MANAGER_AND_TIME(p_date in varchar2,p_cm in varchar2,mycursor out sys_refcursor,p_pageSize number,p_page number,p_count out number,user_type in varchar2)
is
  v_sql varchar2(1000);
  v_time number(8);
  v_id varchar2(100);
  p_customer_manager varchar2(100);
begin
  p_customer_manager := ''''||p_cm||'''';
  if user_type = '1' then
    v_id := 'o.parentid =';
    select count(o.user_id) into p_count from organization o where o.parentid=p_cm and o.user_stat=1;
  else
    v_id :='o.customer_manager_id =';
    select count(o.user_id) into p_count from organization o where o.customer_manager_id=p_cm and o.user_stat=1 ;
  end if;
  
  v_time:= to_number(to_char(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
  
  v_sql:='select t2.* from (select rownum r,o.user_name,o.user_id,us.nick_name,
    o.customer_manager_id,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel,
    (select vd.quantity from  v_sms_analyze vd where o.user_id = vd.org_id and vd.stat_time ='''||v_time||''' ) as quantity
   from organization o
   left join org_config orgconfig on orgconfig.organization_id = o.user_id 
   left join user_info us on o.customer_manager_id = us.user_id
   where '||v_id||p_customer_manager||' and  rownum<='||p_page||'*'||p_pageSize||' and o.user_stat=1) t2 
   where t2.r>('||p_page||'-1)*'||p_pageSize||'';
  
  dbms_output.put_line('v_sql:'||v_sql);
   --������ʱ��
  insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
  open mycursor for v_sql;
  
  exception
  when others then
  dbms_output.put_line('error:'||sqlcode||':'||sqlerrm);
end QUERY_ORGSMS_MANAGER_AND_TIME;
/

prompt
prompt Creating procedure QUERY_PRICIPAL_SMS_SEND
prompt ==========================================
prompt
create or replace procedure QUERY_PRICIPAL_SMS_SEND(
                  p_startTime in varchar2,--��ʼʱ�䣨������)
                  p_endTime in varchar2,--����ʱ�� ��������)
                  p_statType in number, -- ͳ������ 2 һ�����ͳ�ƣ�1 ������������ͳ�� 0 ��������Ա����ͳ�� 3 ί����ͳ��
                  p_userID in varchar2,--ί����

                  p_status in varchar2,-- ״̬
                  p_operatorID in varchar2, --ʵ�ʲ�����
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

      if p_statType = 3  then --ί����ͳ��
          v_subSQL := '
          SELECT T.PARENT_ORG_ID,
                 T.ORG_ID,
                 T.OPERATOR_ID,
                 T.USER_ID,
                 T.SEND_STATUS AS STATUS,
                 T.SYSDAT,
                 T.GRANTER_ID,
                 SUM(MOBILE_QUANTITIES) AS QUANTITY
            FROM (
                   --��ͨ����ѯ
                   SELECT  SYS_TIME AS SYSDAT,
                           O.PARENTID AS PARENT_ORG_ID,
                           SS.USER_ORGANIZATION AS ORG_ID,
                           SS.OPERATOR_ID,
                           SS.USER_ID,
                           SS.SEND_STATUS,
                           SS.MOBILE_QUANTITIES,
                           TI.GRANTER_ID
                      FROM SEND SS
                      LEFT JOIN ORGANIZATION O ON SS.USER_ORGANIZATION = O.USER_ID
                      LEFT JOIN USER_INFO U ON U.USER_ID=SS.OPERATOR_ID and U.USER_ID=SS.USER_ID
                      LEFT JOIN CHANNEL_INFO C ON SS.CHANNEL_ID = C.CHANNEL_ID
                      LEFT JOIN TASK_INFO TI ON TI.BATCH_ID=SS.BATCH_ID AND SS.USER_ID=TI.GRANTER_ID
                     WHERE 1=1
                           AND TI.GRANTER_ID IS NOT NULL
                           AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                           AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                           --������ͨ��(�����)
                           AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                           --ֱ��ͨ��(��Ҫ���)
                            OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                            OR SS.SEND_STATUS=any(7,8))
                 ) T
           WHERE 1=1
           AND T.SEND_STATUS =any(1,5,6,7,8)
           GROUP BY T.PARENT_ORG_ID, T.ORG_ID, T.OPERATOR_ID, T.USER_ID,T.SEND_STATUS,T.SYSDAT,T.GRANTER_ID';

           --ί����

               v_SQL := 'select u.user_name,ssa.status,sum(ssa.quantity) from ' || '(' || v_subSQL || ') ssa
                     left join user_info u on ssa.user_id = u.user_id
                   where 1=1' ;
                  --��ǰ��¼�û�
                 if p_operatorID is not null then
                    v_SQL := v_SQL || ' and ssa.operator_id = ''' || p_operatorID || '''';
                 end if;
                 if p_status is not null then
                    v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
                 end if;
                 if  p_userID is not null then
                      v_SQL := v_SQL || 'and ssa.granter_id in ('|| p_userID || ')';
                 end if;
                 v_SQL := v_SQL || ' group by u.user_name,ssa.status';

      end if;

        --������ʱ��
      insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_PRICIPAL_SMS_SEND;
/

prompt
prompt Creating procedure QUERY_RECKONING_INFO_REPORT
prompt ==============================================
prompt
create or replace procedure QUERY_RECKONING_INFO_REPORT
                (
                 p_startTime in varchar2,          --��ʼʱ�䣨������)
                 p_endTime in varchar2,            --����ʱ�� ��������)
                 p_statType in number,             --��ѯ���� 0 һ�������ѯ��1 ����������ѯ 2 ��������Ա��ѯ
                 p_orgID in varchar2,              --����ID �������
                 p_userID in varchar2,             --�û�ID Admin ������
                 p_userOrgId in varchar2,          --�û�����
                 p_pageSize number,                --ÿһҳ�ж���������
                 p_page number,                    --��ǰ�ǵڼ�ҳ
                 p_count out number,               --������
                 mycursor out sys_refcursor        --���ؽ�����α�
                 )
 is
       v_startTime number(8);                      --�濪ʼ����
       v_endTime number(8);                        --���������
       v_debug number(1);                          --�Ƿ�������Ϣ, 0:���� ��1����
       v_SQL varchar2(8000);                       -- ƴ�ӵĻ���SQL
begin
       v_SQL := '';
       v_debug := 0;
       --------ͳ�Ʋ�ѯ����������
        if p_statType = 1  then   --��������ͳ��
            if p_startTime is null and p_endTime is null then
               if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                  where d.user_id=p_userID
                 group by d.user_id,d.reckoning_date) a;
               end if;
                if p_orgID is not null then
                    select count(a.user_id) into p_count from
                    (select d.user_id,d.reckoning_date from daily_reckoning_info d
                     left join user_info u on d.user_id=u.user_id
                     left join organization o on o.user_id=u.organization_id
                     where o.user_id=p_orgID
                     group by d.user_id,d.reckoning_date) a;
               end if;

               if p_userID is null and p_orgID is null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                 left join user_info u on d.user_id=u.user_id
                 left join organization o on o.user_id=u.organization_id
                 where o.user_id=p_userOrgId
                 group by d.user_id,d.reckoning_date) a;
               end if;
            else
                if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                  where d.user_id=p_userID
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                 group by d.user_id,d.reckoning_date) a;
               end if;

                if p_orgID is not null then
                    select count(a.user_id) into p_count from
                    (select d.user_id,d.reckoning_date from daily_reckoning_info d
                     left join user_info u on d.user_id=u.user_id
                     left join organization o on o.user_id=u.organization_id
                     where o.user_id=p_orgID
                     and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                     and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                     group by d.user_id,d.reckoning_date) a;
               end if;

               if p_userID is null and p_orgID is null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d
                 left join user_info u on d.user_id=u.user_id
                 left join organization o on o.user_id=u.organization_id
                 where o.user_id=p_userOrgId
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                 group by d.user_id,d.reckoning_date) a;
               end if;
            end if;


        end if;

        if p_statType = 2  then   --��������Ա����ͳ��
           if p_startTime is null and p_endTime is null then
              if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d where d.user_id=p_userID
                 group by d.user_id,d.reckoning_date) a;
             end if;
             if p_orgID is not null then
                   select count(a.user_id) into p_count from
                   (select d.user_id,d.reckoning_date from daily_reckoning_info d
                   left join user_info u on d.user_id=u.user_id
                   left join organization o on o.user_id=u.organization_id
                   where o.user_id=p_orgID
                   group by d.user_id,d.reckoning_date) a;
             end if;
             if p_userID is null and p_orgID is null then
               select count(a.user_id) into p_count from
               (select d.user_id,d.reckoning_date from daily_reckoning_info d
               group by d.user_id,d.reckoning_date) a;
             end if;
           else
              if p_userID is not null then
                 select count(a.user_id) into p_count from
                 (select d.user_id,d.reckoning_date from daily_reckoning_info d where d.user_id=p_userID
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                 and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                 group by d.user_id,d.reckoning_date) a;
             end if;
             if p_orgID is not null then
                   select count(a.user_id) into p_count from
                   (select d.user_id,d.reckoning_date from daily_reckoning_info d
                   left join user_info u on d.user_id=u.user_id
                   left join organization o on o.user_id=u.organization_id
                   where o.user_id=p_orgID
                   and to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
                   and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
                   group by d.user_id,d.reckoning_date) a;
             end if;
             if p_userID is null and p_orgID is null then
               select count(a.user_id) into p_count from
               (select d.user_id,d.reckoning_date from daily_reckoning_info d
               where to_number(to_char(d.reckoning_date,'yyyymmdd')) >=to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'))
               and to_number(to_char(d.reckoning_date,'yyyymmdd')) <=to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'))
               group by d.user_id,d.reckoning_date) a;
             end if;
           end if;

        end if;


        --�����ѯ��ʼ����
       if p_startTime is not null  then
             v_startTime := to_number(to_char(to_date(p_startTime,'yyyy-mm-dd'),'yyyymmdd'));
       end if;
       if p_endTime is not null then
             v_endTime := to_number(to_char(to_date(p_endTime,'yyyy-mm-dd'),'yyyymmdd'));
       end if;

       if v_debug = 1 then
         DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime);
         DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime);
       end if;

       if p_statType = 1  then   --��������ͳ��
          v_SQL := 'select t2.user_id,t2.user_name,t2.reckoning_date,t2.SEND_QUANTITY,t2.SUB_TOTAL_FEE from (';
          v_SQL := v_SQL|| ' select rownum r,t1.* from (';
          v_SQL := v_SQL|| ' select dri.user_id,dri.user_name,dri.reckoning_date,SUM(dri.SEND_QUANTITY) SEND_QUANTITY,SUM(dri.SUB_TOTAL_FEE) SUB_TOTAL_FEE
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

           v_SQL := v_SQL || ' GROUP BY dri.USER_ID,dri.USER_NAME,dri.RECKONING_DATE order by dri.reckoning_date desc,dri.user_id desc';
           v_SQL := v_SQL || ') t1 where rownum<='||p_page||'*'||p_pageSize;
           v_SQL := v_SQL || ') t2 where t2.r > '||'('||p_page||'-1)*'||p_pageSize||'';
      end if;


         if p_statType = 2  then --��������Ա����ͳ��
          v_SQL := 'select t2.user_id,t2.user_name,t2.reckoning_date,t2.SEND_QUANTITY,t2.SUB_TOTAL_FEE from ( ';
          v_SQL := v_SQL|| ' select rownum r,t1.* from ( ';
          v_SQL := v_SQL|| 'select dri.user_id,dri.user_name,dri.reckoning_date,SUM(dri.SEND_QUANTITY) SEND_QUANTITY,SUM(dri.SUB_TOTAL_FEE) SUB_TOTAL_FEE
                    from daily_reckoning_info dri
                    left join user_info u on dri.user_id=u.user_id
                    left join organization o on u.organization_id=o.user_id
                    where 1=1 ';
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

           v_SQL := v_SQL || ' GROUP BY dri.USER_ID,dri.USER_NAME,dri.RECKONING_DATE order by dri.reckoning_date desc,dri.user_id';
           v_SQL := v_SQL||') t1 where rownum<='||p_page||'*'||p_pageSize;
           v_SQL := v_SQL||') t2 where t2.r > '||'('||p_page||'-1)*'||p_pageSize||'';
      end if;

      --dbms_output.put_line('v_SQL = ' || v_SQL);
/*      insert into temp_table_test (CREATE_SQL, CREATE_TIME)
      values (v_SQL, sysdate);*/

      open mycursor for v_SQL ;

  exception
  when others then
  dbms_output.put_line('error:'||sqlcode||':'||sqlerrm);
end QUERY_RECKONING_INFO_REPORT;
/

prompt
prompt Creating procedure QUERY_SMS_CHANNEL
prompt ====================================
prompt
create or replace procedure QUERY_SMS_CHANNEL(
                  p_startTime in varchar2,--��ʼʱ�䣨������) 2012-12-13
                  p_endTime in varchar2,--����ʱ�� ��������) 2012-12-13
                  p_statType in number, -- ͳ������ 0   ��������Աͨ��ͳ�ƣ�1  ��ͨ����Աͨ��ͳ��
                  p_channelID in varchar2,--ͨ��ID   1,2,3,....n ������ʽ
                  p_orgID in varchar2,--����ID �������
                  p_status in varchar2,--״̬
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
             v_endTime :=to_number( to_char(to_date(p_endTime,'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD'));
             v_char_endTime   := to_char(to_date(p_endTime,  'yyyy-MM-dd hh24:mi:ss') + 1,'YYYYMMDD');
     end if;

     if v_startTime != 0 and v_endTime != 0 and v_startTime > v_endTime then
        v_startTime := v_endTime;
        v_endTime := to_number( to_char(to_date(p_startTime,'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD'));
        v_char_endTime   := to_char(to_date(p_startTime,  'yyyy-MM-dd hh24:mi:ss'),'YYYYMMDD');
     end if;

       /*
        SELECT T.CHANNEL_ID,
               T.PARENT_ORG_ID,
               T.ORG_ID,
               SEND_STATUS,
               T.SYSDAT,
               SUM(MOBILE_QUANTITIES) AS total_quantity
          FROM
          (
               SELECT TO_NUMBER(TO_CHAR(SS.SYS_TIME, 'YYYYMMDD')) AS SYSDAT,
                       SS.CHANNEL_ID,
                       O.PARENTID AS PARENT_ORG_ID,
                       SS.USER_ORGANIZATION AS ORG_ID,
                       SS.SEND_STATUS,
                       SS.MOBILE_QUANTITIES
                  FROM SEND SS
                  LEFT JOIN ORGANIZATION O
                    ON SS.USER_ORGANIZATION = O.USER_ID
                 WHERE 1 = 1
                   AND SS.SEND_STATUS IN (0, 1, 5, 6, 7)
                   AND SS.SYS_TIME >= TO_DATE('2013-06-17', 'YYYY-MM-DD')
                   AND SS.SYS_TIME <  TO_DATE('2013-06-18', 'YYYY-MM-DD')
         ) T
        GROUP BY T.CHANNEL_ID, T.PARENT_ORG_ID, T.ORG_ID, T.SYSDAT, T.SEND_STATUS
        */
     v_subSQL := '
         SELECT T.CHANNEL_ID,
               T.PARENT_ORG_ID,
               T.ORG_ID,
               t.SEND_STATUS as STATUS,
               SUM(MOBILE_QUANTITIES) AS QUANTITY
          FROM
          (
               SELECT  SYS_TIME AS SYSDAT,
                       SS.CHANNEL_ID,
                       O.PARENTID AS PARENT_ORG_ID,
                       SS.USER_ORGANIZATION AS ORG_ID,
                       SS.SEND_STATUS,
                       SS.MOBILE_QUANTITIES
                  FROM SEND SS
                  LEFT JOIN ORGANIZATION O
                    ON SS.USER_ORGANIZATION = O.USER_ID
                 WHERE 1 = 1
                   AND ( SS.SEND_STATUS IN (1,5,6,7,8) and ss.IS_ORIGINAL_SMS = 0 ) --����״̬��ԭʼ����,�ֶ���Ҫ����ԭʼ����
                   AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                   AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
         ) T
        GROUP BY T.CHANNEL_ID, T.PARENT_ORG_ID, T.ORG_ID, T.SEND_STATUS
        ';

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     if p_statType = 0 then --��������ͨ��ͳ��

          v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from ' || '(' || v_subSQL || ') sca
                   left join channel_info c on sca.channel_id = c.channel_id
                          left join organization o on sca.org_id = o.user_id
                   where 1 = 1 ' ;
          /*
           v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from sms_channel_analyze sca
                     left join channel_info c on sca.channel_id = c.channel_id
                          left join organization o on sca.parent_org_id = o.user_id
                   where 1 = 1 ' ;
           */

           if p_channelID is not null then
               v_SQL := v_SQL || ' and sca.channel_id = ' || p_channelID ;
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and sca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,sca.status';
      else

          v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from ' || '(' || v_subSQL || ') sca
                   left join channel_info c on sca.channel_id = c.channel_id
                   left join organization o on sca.parent_org_id = o.user_id
                   where 1 = 1
                         and sca.org_id = ''' || p_orgID || '''' ;
          /*
              v_SQL := 'select c.channel_name,o.user_name,sca.status,sum(sca.quantity) from sms_channel_analyze sca
                       left join channel_info c on sca.channel_id = c.channel_id
                            left join organization o on sca.org_id = o.user_id
                     where  sca.parent_org_id = ''' || p_orgID || '''' ;
            */

           if p_channelID is not null then
               v_SQL := v_SQL || ' and sca.channel_id = ' || p_channelID ;
           end if;


           if p_status is not null then
              v_SQL := v_SQL || ' and sca.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by c.channel_name,o.user_name,sca.status';
      end if;

      insert into temp_table_test (CREATE_SQL, CREATE_TIME)
      values (v_SQL,sysdate);
     --ƴִ��SQL��ʼ

      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);

     open mycursor for v_SQL ;

end QUERY_SMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_SMS_RECEIVE
prompt ====================================
prompt
create or replace procedure QUERY_SMS_RECEIVE(p_startTime    in varchar2, --��ʼʱ�䣨������)
                                              p_endTime      in varchar2, --����ʱ�� ��������)
                                              p_statType     in number, -- ͳ������ 0 ��Ի���ͳ�����ж��ţ�1 ����û�ͳ�����ж���
                                              p_userID       in varchar2, --����ID Admin ������
                                              p_parentOrgID  in varchar2, --����ID ������
                                              p_orgID        in varchar2, --����ID �������
                                              p_pageNo       in number, --��ǰҳ�棬��1��ʼ
                                              p_pageSize     in number, --ÿҳ��¼��
                                              outRecordCount out number, --���ؼ�¼������
                                              mycursor       out sys_refcursor --���ؽ�����α�
                                              ) is

  v_SQL            varchar2(8000); -- ƴ�ӵĻ���SQL
  v_SQL_TotalCount varchar2(8000); -- ��ѯ��¼������SQL
  v_SQL_Result     varchar2(8000); -- ��ѯ�����SQL

  v_hiRownum number(8); --��ǰҳ��¼��Ӧ����ҳ��
  v_loRownum number(8); --��ǰҳ��¼��Ӧ��С��ҳ��
begin
  v_SQL      := '';
  v_hiRownum := 15;
  v_loRownum := 0;

  --ƴִ��SQL��ʼ
  if p_statType = 0 then
    --��Ի���ͳ�����ж���
    if p_parentOrgID is not null then
      --ͳ�����л����ӻ���
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.sys_time >= to_date(''' ||
               p_startTime||''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <=to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id where o.parentid= ''' ||
               p_parentOrgID || ''' or o.user_id = ''' || p_parentOrgID ||
               ''' group by o.user_name';
    else
      --ֻͳ��ĳ������
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id  group by o.user_name';
    end if;
  else
    --����û�ͳ�����ж���
    if p_userID is not null then
      --ͳ�Ƹû���ĳ���û�
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.user_id =''' || p_userID ||
               ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    else
      -- ͳ�Ƹû��������û�
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and  r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    end if;
  end if;

   insert into temp_table_test (CREATE_SQL, CREATE_TIME)
     values (v_SQL,sysdate);

  dbms_output.put_line('v_SQL = ' || v_SQL);
  --��ѯ��ǰ�����¼�¼������
  v_SQL_TotalCount := ' SELECT count(*) FROM ( ';
  v_SQL_TotalCount := v_SQL_TotalCount || v_SQL;
  v_SQL_TotalCount := v_SQL_TotalCount || ' ) ';
  --ȡ��¼������
  execute immediate v_SQL_TotalCount
    into outRecordCount;
  --�����ҳ��ҳ��
  v_hiRownum := p_pageNo * p_pageSize;
  v_loRownum := v_hiRownum - p_pageSize + 1;
  --ƴ��ҳ�Ĳ�ѯSQL
  v_SQL_Result := ' select * FROM (  select A.*, rownum rn From ( ';
  v_SQL_Result := v_SQL_Result || v_SQL;
  v_SQL_Result := v_SQL_Result || ' ) A   where rownum <= ' ||
                  to_char(v_hiRownum) || ' ) B  where rn >= ' ||
                  to_char(v_loRownum);
  open mycursor for v_SQL_Result;

end QUERY_SMS_RECEIVE;
/

prompt
prompt Creating procedure QUERY_SMS_SEND
prompt =================================
prompt
create or replace procedure QUERY_SMS_SEND(
                  p_startTime in varchar2,--��ʼʱ�䣨������)
                  p_endTime in varchar2,--����ʱ�� ��������)
                  p_statType in number, -- ͳ������ 2 һ�����ͳ�ƣ�1 ������������ͳ�� 0 ��������Ա����ͳ��
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
                 T.DEDUCT_MODE,
                 T.ORG_ID,
                 T.USER_ID,
                 T.SEND_STATUS AS STATUS,
                 T.SYSDAT,
                 SUM(MOBILE_QUANTITIES) AS QUANTITY
            FROM (
                   --��ͨ����ѯ
                   SELECT  SYS_TIME AS SYSDAT,
                           O.PARENTID AS PARENT_ORG_ID,
                           O.DEDUCT_MODE,
                           SS.USER_ORGANIZATION AS ORG_ID,
                           SS.USER_ID,
                           SS.SEND_STATUS,
                           SS.MOBILE_QUANTITIES
                      FROM SEND SS
                      LEFT JOIN TASK_INFO TI ON TI.BATCH_ID=SS.BATCH_ID
                      LEFT JOIN ORGANIZATION O ON SS.USER_ORGANIZATION = O.USER_ID
                      LEFT JOIN CHANNEL_INFO C ON SS.CHANNEL_ID = C.CHANNEL_ID
                     WHERE 1=1
                           AND TI.GRANTER_ID IS NULL
                           AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                           AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                          --������ͨ��(�����)
                           AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                           --ֱ��ͨ��(��Ҫ���)
                            OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                            OR SS.SEND_STATUS=any(7,8))
                 ) T
           WHERE 1=1
           AND T.SEND_STATUS =any(1,5,6,7,8)
           GROUP BY T.PARENT_ORG_ID,T.DEDUCT_MODE,T.ORG_ID, T.USER_ID, T.SYSDAT, T.SEND_STATUS';
     --ƴִ��SQL��ʼ
     if p_statType = 2  then --һ�����ͳ��
          v_SQL := 'select u.user_name,ssa.status,sum(ssa.quantity),ssa.deduct_mode from ' || '(' || v_subSQL || ') ssa
                     left join user_info u on ssa.user_id = u.user_id
                   where ssa.org_id  = ''' || p_orgID || '''' ;
           if p_userID is not null then
              v_SQL := v_SQL || ' and ssa.user_id = ''' || p_userID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by u.user_name,ssa.status,ssa.deduct_mode';
      end if;

      if p_statType = 1  then --��������ͳ��
          v_SQL := 'select o.user_name,ssa.status,sum(ssa.quantity),ssa.deduct_mode from ' || '(' || v_subSQL || ') ssa
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

           v_SQL := v_SQL || ' group by o.user_name,ssa.status,ssa.deduct_mode';
      end if;

      if p_statType = 0  then --��������Ա����ͳ��
          v_SQL := 'select o.user_name,ssa.status,sum(ssa.quantity),ssa.deduct_mode from ' || '(' || v_subSQL || ') ssa
                          left join organization o on ssa.org_id = o.user_id
                   where 1= 1 ' ;
           if p_orgID is not null then
              v_SQL := v_SQL || ' and ssa.org_id = ''' || p_orgID || '''';
           end if;

           if p_status is not null then
              v_SQL := v_SQL || ' and ssa.status in (' || p_status || ')';
           end if;

           v_SQL := v_SQL || ' group by o.user_name,ssa.status,ssa.deduct_mode';
      end if;

        --������ʱ��
      insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
    /* dbms_output.put_line('v_SQL = ' || v_SQL);*/
     open mycursor for v_SQL ;

     exception
       when others then
     rollback;
end QUERY_SMS_SEND;
/

prompt
prompt Creating procedure UPDATE_USER_STATE
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE UPDATE_USER_STATE IS
BEGIN

    --�����û�״̬Ϊ��Ч
    UPDATE USER_INFO U SET U.USER_STAT=1,U.LOGIN_ERROR_NUM=0 WHERE U.LOGIN_ERROR_NUM >0;
    COMMIT;
    EXCEPTION
       WHEN OTHERS THEN
    ROLLBACK;
END UPDATE_USER_STATE;
/

prompt
prompt Creating trigger TRIGGER_AFTERDELETE_REPORTTASK
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER trigger_afterdelete_reporttask

AFTER delete ON sgw_report_task
For each row
DECLARE
--ɾ��״̬�������д״̬��������ʱ��
BEGIN
    update send s set s.send_time = systimestamp where SEND_ID = :old.SEND_ID;

    BEGIN
      --����֤ȯ��״̬����
      --IF :old.User_Organization = 'fcaaf96b2b8ed794012b99e92baa0568' THEN
          INSERT INTO sgw_report_task_his
          (
            task_id,
            send_id,
            mobile_to,
            destnation_id,
            stat,
            msg_id,
            user_organization,
            user_id,
            channel_id,
            sys_time,
            submit_time,
            done_time,
            report_time,
            push_status,
            next_push_time,
            push_times,
            log_time
          )
          values
          (
            :old.task_id,
            :old.Send_Id,
            :old.Mobile_To,
            :old.Destnation_Id,
            :old.Stat,
            :old.Msg_Id,
            :old.User_Organization,
            :old.User_Id,
            :old.Channel_Id,
            :old.Sys_Time,
            :old.Submit_Time,
            :old.Done_Time,
            :old.Report_Time,
            5,
            :old.Next_Push_Time,
            :old.Push_Times,
            SYSDATE
          );
      --END IF;
      EXCEPTION
          WHEN OTHERS THEN
             NULL;
      END;
END;
/

prompt
prompt Creating trigger TRIGGER_AFTERDELETE_RT_RECEIVE
prompt ===============================================
prompt
CREATE OR REPLACE TRIGGER trigger_afterdelete_rt_receive
AFTER delete ON rt_receive
For each row

DECLARE

BEGIN
  --ɾ��״̬����󣬽�״̬�������͵���Ϣ�鵵�������ӹ鵵ʱ���ֶ�
    BEGIN
          INSERT INTO rt_receive_backup
          (
            RT_RECEIVE_ID,
            ORG_ID,
            USER_ID,
            SP_NO,
            SP_SERV_NO,
            MOBILE,
            RECEIVE_MSG,
            RECEIVE_TIME,
            PUSHED_TIME,
            IS_PUSHED,
            RESERVED_CHAR1,
            RESERVED_CHAR2,
            BACKUP_TIME
          )
          values
          (
            :old.RT_RECEIVE_ID,
            :old.ORG_ID,
            :old.USER_ID,
            :old.SP_NO,
            :old.SP_SERV_NO,
            :old.MOBILE,
            :old.RECEIVE_MSG,
            :old.RECEIVE_TIME,
            :old.PUSHED_TIME,
            :old.IS_PUSHED,
            :old.RESERVED_CHAR1,
            :old.RESERVED_CHAR2,
            SYSDATE
          );
      EXCEPTION
          WHEN OTHERS THEN
             NULL;
      END;
END;
/

prompt
prompt Creating trigger TRIGGER_AFTERDELETE_RT_REPORT
prompt ==============================================
prompt
CREATE OR REPLACE TRIGGER trigger_afterdelete_rt_report
AFTER delete ON rt_report
For each row

DECLARE
--ɾ��״̬��������������Ϣ�󣬽�״̬���͵���Ϣ�鵵�������ӹ鵵ʱ���ֶ�
BEGIN

    BEGIN
          INSERT INTO rt_report_backup
          (
            SMS_ID,
            SEQ_ID,
            ORG_ID,
            USER_ID,
            MOBILE,
            REPORT_TIME,
            PUSHED_TIME,
            SEND_STATUS,
            ERROR_MSG,
            IS_PUSHED,
            CHANNEL_ID,
            BACKUP_TIME
          )
          values
          (
            :old.SMS_ID,
            :old.SEQ_ID,
            :old.ORG_ID,
            :old.USER_ID,
            :old.MOBILE,
            :old.REPORT_TIME,
            :old.PUSHED_TIME,
            :old.SEND_STATUS,
            :old.ERROR_MSG,
            :old.IS_PUSHED,
            :old.CHANNEL_ID,
            SYSDATE
          );
      EXCEPTION
          WHEN OTHERS THEN
             NULL;
      END;
END;
/

prompt
prompt Creating trigger TRIGGER_AFTERINSERT_RECEIVE
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER trigger_afterinsert_receive --�����������, ��д��Ӧ������
AFTER INSERT ON sms_receive
For each row

DECLARE

--��Ҫ���е��û�
CURSOR cmpp_org_cur IS
       SELECT user_id, user_name, ORGANIZATION_ID as org_id  from user_info where user_kind = 3;


BEGIN

    --����Ƿ�����ҵ���Ӧ���û�
    FOR s IN cmpp_org_cur LOOP
    if :NEW.user_id = s.user_id then
      --INSERT INTO sql_log VALUES(s.user_name, SYSDATE, 'trigger_afterinsert_receive userid');
      insert into SGW_MO_TASK (receive_id, mobile_from, sp_no, receive_msg, read_user_group_id, user_id, channel_id, receive_time, receive_status, next_push_time)
      values(sgw_mo_task_seq.nextval, :new.mobile_from, :new.sp_num, :new.receive_msg, :new.org_id, :new.user_id, :new.channel_id, :new.sys_time, 0, sysdate);
      exit;
        end if;
    END LOOP;

    --���û���ҵ���Ӧ���û���������Ӧ�Ļ���
    FOR s IN cmpp_org_cur LOOP
    if :NEW.org_id = s.org_id THEN
      --INSERT INTO sql_log VALUES(s.org_id, SYSDATE, 'trigger_afterinsert_receive orgid');
      insert into SGW_MO_TASK (receive_id, mobile_from, sp_no, receive_msg, read_user_group_id, user_id, channel_id, receive_time, receive_status, next_push_time)
      values(sgw_mo_task_seq.nextval, :new.mobile_from, :new.sp_num, :new.receive_msg, :new.org_id, s.user_id, :new.channel_id, :new.sys_time, 0, sysdate);
      exit;
        end if;
    END LOOP;

    exception
       when others then
           --INSERT INTO sql_log VALUES('excepion', SYSDATE, 'trigger_afterinsert_receive exception');
           null;

END;
/

prompt
prompt Creating trigger TRIGGER_AFTER_UPDATE_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER "TRIGGER_AFTER_UPDATE_SEND"
  AFTER UPDATE ON SEND
  FOR EACH ROW
--���²�ֶ��ź󣬸���ԭʼ����
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

  IF :OLD.SEND_STATUS = 1 --ԭʼ״̬��1
     AND (:NEW.SEND_STATUS = 5 OR :NEW.SEND_STATUS = 6) --��״̬��5����6
     AND :OLD.IS_ORIGINAL_SMS = 1 --�ǲ�ֶ���
   THEN
    --����ԭʼ����
    UPDATE SEND T
       SET T.REPORT_TIME = :NEW.REPORT_TIME,
           SEND_STATUS   = CASE
                             WHEN SEND_STATUS = 1 THEN
                              :NEW.SEND_STATUS
                             WHEN SEND_STATUS = 6 AND :NEW.SEND_STATUS = 5 THEN
                              :NEW.SEND_STATUS
                             ELSE
                              SEND_STATUS
                           END,
           REPORT        = CASE
                             WHEN SEND_STATUS = 1 THEN
                              :NEW.REPORT
                             WHEN SEND_STATUS = 6 AND :NEW.SEND_STATUS = 5 THEN
                              :NEW.REPORT
                             ELSE
                              REPORT
                           END
     WHERE T.SEND_ID = :OLD.ORIGINALSMS_SENDID;
    COMMIT;
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    NULL;

END;
/

prompt
prompt Creating trigger TRIGGER_BEFOREINSERT_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER trigger_beforeinsert_send
  BEFORE insert ON send
  For each row
DECLARE

BEGIN
  --���������롢Υ���ʡ�����ǩ������ǩ����, ����״̬��������
  if :NEW.send_status = 6 and substr(:NEW.Msg_Type,1,4) = 'CMPP'  then
     insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
     values(SGW_REPORT_TASK_SEQ.NEXTVAL, :new.send_id, :new.mobile_to, :new.report, '10657101095536' || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, sysdate, 0, sysdate, 0,sysdate, sysdate, sysdate);
  end if;
  commit;
  exception
      WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
END;
/

prompt
prompt Creating trigger TRIGGER_INSERT_RECEIVE
prompt =======================================
prompt
CREATE OR REPLACE TRIGGER "TRIGGER_INSERT_RECEIVE" --�����������, ��д��Ӧ������
BEFORE INSERT ON SMS_RECEIVE_OLD
For each row

DECLARE
--��ѯ������Ϣ
CURSOR send_cur IS
       SELECT t.send_id, t.mobile_to, t.ext_num, t.sys_id, t.msg_id, t.send_status, t.org_id
       FROM sms_send t
       WHERE
            t.mobile_to = :new.mobile_from
            and t.send_status in (1,5)
       ORDER BY t.send_time desc;

--��ѯ�ط���
CURSOR spnumber_cur IS
       SELECT *  from sms_spnumber order by spnumber asc;

--��ѯ�˶��ؼ���
CURSOR key_cur IS
       SELECT KEY_WORD  from SMS_UNSUBSCRIBE_KEY_WORD where status = 1 order by KEY_WORD asc;

--��ѯ�Ƿ��ǵ㲥����
CURSOR recdb_cur IS
       SELECT db_name,db_content  from recbiz_db;

--��ѯ�Ƿ��Ƕ��ŵ���
CURSOR survey_cur IS
       SELECT sms_survey_id,biz_number,thank_word,end_time,start_time,status,sms_directive  from sms_survey ;
survey_temp varchar2(200);
sp varchar2(200);
receive_sys_ext varchar(10);
sys_count number;
receive_sys_id varchar(20);
BEGIN
  sys_count:=0;
  --����receive_id
  if :new.RECEIVE_ID is null then
    :new.RECEIVE_ID := SMS_RECEIVE_SEQ.nextval;
  end if;
  --������������
    :new.sys_date_id:=to_number(to_char(sysdate,'yyyyMMdd'));

  sp:='';
    --��ѯ��Ӧ�Ķ�����Ϣ, ��дϵͳ���SYS_ID, MSG_ID
    FOR s IN send_cur LOOP
        :new.sys_id := s.sys_id;
        :new.msg_id := s.msg_id;                     --ҵ��ϵͳ�Ķ��ű��
        :new.org_id := s.org_id;  --�������
    END LOOP;

    --��ѯ�ط���, ������չ��,������ط��ţ���ôsp���ǳ�ȥ�ط��ŵ����к���
    FOR s IN spnumber_cur LOOP
    if substr(:new.sp_num, 0, length(s.spnumber)) = s.spnumber then
       sp := substr(:new.sp_num, length(s.spnumber) + 1);
      end if;
    END LOOP;
    --���û���ط��ţ���ôsp�������е�ȫ������
    if ''=sp then
      sp:=:new.sp_num;
      end if;
     --receive_sys_ext=��ȡsp����λ��Ϊ��Ϣ��Դ
     receive_sys_ext:=substr(sp,0,2);
     :new.sys_ext:=receive_sys_ext;
     select count(*) into sys_count from subsys_code s_code  where s_code.extend_number=receive_sys_ext;
     --�����Ϣ��Դ��Ϊ�գ���ѯsubsys_code�е�subsys_code_id�����sms_receive���е�sys_id
     if sys_count!=0 then
       select s_code.subsys_code_id into receive_sys_id from subsys_code s_code  where s_code.extend_number=receive_sys_ext;
       :new.sys_id:=receive_sys_id;
     end if;
     --��ȡsp��λ�����Ϊҵ����
     :new.ext_num:=substr(sp,3,length(sp));

    --����������Ƿ����˶��ؼ���,�����Զ��Ӻ�����
    FOR s IN key_cur LOOP
    if INSTR(trim(:new.RECEIVE_MSG), trim(s.KEY_WORD), 1, 1) = 1 then --���˶��ؼ�����ʼ�Ķ���
        insert into black (black_id, black_mobile,black_desc,black_time) values(sys_guid(), :new.mobile_from,'�ÿͻ������˶��ؼ��֣�ϵͳ��'||to_char(sysdate,'yyyy-MM-dd hh24:mi:ss')||'�Զ����ÿͻ����������',sysdate);
      end if;
    END LOOP;

    --��ѯ���ж����������Ƿ�����㲥������
    FOR s IN recdb_cur LOOP
    if NLS_UPPER(trim(:new.RECEIVE_MSG)) = s.db_name then
      :new.msg_key:=1;
      :new.reply_msg:=s.db_content;
     -- P_DIANBO_SEND(:new.mobile_from,s.db_content,sp);--��������ʱ���в���һ������
      end if;
    END LOOP;

     --��ѯ���ж����Ƿ��Ƕ��ŵ���
    FOR s IN survey_cur LOOP
    if :new.ext_num = s.biz_number and :new.sys_time>=s.start_time and :new.sys_time<=s.end_time and s.status!='9' then
      :new.msg_key:=2;
      :new.reply_msg:=s.thank_word;
     -- p_survey_send(:new.mobile_from,:new.receive_msg,:new.receive_id,s.sms_survey_id,sp);
      end if;
    END LOOP;

    --�ж����еĶ����Ƿ��Ǹ��ݶ���ָ����ж��ŵ����
    survey_temp :=substr(:new.receive_msg,0,(instr(:new.receive_msg,'#')-1));
    FOR s IN survey_cur LOOP
      if survey_temp = s.sms_directive and :new.sys_time>=s.start_time and :new.sys_time<=s.end_time and s.status!='9' then
      :new.msg_key:=2;
      :new.reply_msg:=s.thank_word;
     -- p_survey_send(:new.mobile_from,substr(:new.receive_msg,(instr(:new.receive_msg,'#')+1),length(:new.receive_msg)),:new.receive_id,s.sms_survey_id,sp);
      end if;
    END LOOP;

    Exception
      when others then
        null;
END;
/

prompt
prompt Creating trigger TRIGGER_INSERT_SMS_REPORT
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER "TRIGGER_INSERT_SMS_REPORT" --�������״̬����, �Զ��޸Ķ��ŵ�״̬�Ͳ�ȫ״̬�����������Ϣ
BEFORE INSERT ON sms_report
For each row
DECLARE
v_err_msg varchar2(30);--������Ϣ
err_code_count number:=0;
CURSOR send_cur IS
       SELECT t.send_id, t.org_id, t.batch_id, t.msg_id, t.originalsms_sendid,t.originalsms_totalpages,t.current_pageno, t.sys_id, t.is_original_sms  from sms_send t where t.sequence = :new.sequence;
BEGIN
    if :new.report_time is null then
        :new.report_time := sysdate;
    end if;

    --��ѯ״̬����Ĵ�����Ϣ,����Ӧ�Ĵ�����Ϣ��д��ERR_MSG
    if :new.sms_status = 6 and :new.gw_status_desc is null then
         err_code_count := 0;
         select count(*) into err_code_count from sms_err_code where channel_id = :new.channel_id and err_code = :new.gw_status and rownum <= 1;
         if err_code_count = 1 then
            select err_desc into v_err_msg from sms_err_code where channel_id = :new.channel_id and err_code = :new.gw_status and rownum <= 1;
         end if;
    end if;

    if v_err_msg is not null then
       :new.gw_status_desc :=  v_err_msg;
    end if;

    --������Ӧ�Ķ���
    update sms_send t set t.send_status = :new.sms_status, t.err_id = :new.gw_status, t.err_msg = v_err_msg, t.report_time = :new.report_time where t.sequence = :new.sequence and t.send_status = 1;

    --�����ɹ����¶���״̬
    :new.status := 1;

    --��ѯ��Ӧ�Ķ�����Ϣ
    FOR s IN send_cur LOOP
        :new.send_id := s.send_id;                          --���ű��
        :new.originalsms_sendid := s.originalsms_sendid;      --ԭʼ���ű��
        :new.batch_id := s.batch_id;                        --����
        :new.msg_id := s.msg_id;                            --ҵ��ϵͳ�Ķ��ű��
        :new.originalsms_totalpages := s.originalsms_totalpages;    --����������
        :new.current_pageno := s.current_pageno;                --�������еĵڼ���
        :new.sys_id := s.sys_id;                            --ҵ��ϵͳ���
        --����ԭʼ����, ˵���˶����ǳ����Ų�ֺ�Ķ���, ��Ҫͬ������ԭʼ���ŵ�״̬
        if s.is_original_sms = 1 then
          update sms_send set send_status = :new.sms_status, err_id = :new.gw_status, err_msg = v_err_msg, report_time = :new.report_time where send_id = s.originalsms_sendid and send_status = 1;
        end if;
    END LOOP;


END;
/

prompt
prompt Creating trigger TRIGGER_ORGANIZATION
prompt =====================================
prompt
create or replace trigger "TRIGGER_ORGANIZATION"

after  insert or update or delete on organization
for each row
begin
       -- 0 ����ҪҪ���� 1 ���е����� 2 ���е��û�
     if inserting then
      	if :new.mo_type = 1 then
      		insert into white_org_config(org_id,mo_owner)values(:new.user_id,'ORG');
      	end if;
        if :new.mo_type = 2 then
      		insert into white_org_config(org_id,mo_owner)values(:new.user_id,'USER');
      	end if;
     elsif updating then
         if :new.mo_type != :old.mo_type then
            if(:new.mo_type = 1) then
        		  update white_org_config  set mo_owner = 'ORG' where org_id = :old.user_id;
            end if;
            if(:new.mo_type = 2) then
        		  update white_org_config  set mo_owner = 'USER' where org_id = :old.user_id;
            end if;
            if(:new.mo_type = 1) then
        		  delete from white_org_config  where org_id = :old.user_id;
            end if;
        end if;
     elsif deleting then
		       delete from white_org_config  where org_id = :old.user_id;
           delete from white_info t where t.org_id = :old.user_id;
     end if;

    exception
    when others then
        dbms_output.put_line('���������������쳣') ;
end;
/

prompt
prompt Creating trigger TRIGGER_RECEIVE_BEFORINSERT
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER "TRIGGER_RECEIVE_BEFORINSERT" --�����������, ��д��Ӧ������
BEFORE INSERT ON SMS_RECEIVE
For each row

DECLARE
  --��ѯ�ط���
  CURSOR SPNUMBER_CUR IS
    SELECT * FROM SMS_SPNUMBER ORDER BY SPNUMBER ASC;

  --������չ��
  CURSOR org_cur IS
         SELECT *  from ORGANIZATION order by extend_number asc;
  --�û���չ��
  CURSOR user_cur IS
         SELECT *  from USER_INFO order by extend_number asc;


  --��ѯ�˶��ؼ���
  CURSOR KEY_CUR IS
    SELECT KEY_WORD
      FROM SMS_UNSUBSCRIBE_KEY_WORD
     WHERE STATUS = 1
     ORDER BY KEY_WORD ASC;

  --��ѯ�Ƿ��ǵ㲥����
  /*
  CURSOR RECDB_CUR IS
    SELECT DB_NAME, DB_CONTENT FROM RECBIZ_DB;
   */

  EXT            VARCHAR2(200); --��չ��
  ORGEXT         VARCHAR2(200);
  USEREXT        VARCHAR2(200);
  v_ok           VARCHAR2(200);
  v_orgid        VARCHAR2(200);
  v_userid        VARCHAR2(200);
BEGIN
  v_ok := '0';
  v_orgid := '';
  v_userid := '';


  --����receive_id
  IF :NEW.RECEIVE_ID IS NULL THEN
    :NEW.RECEIVE_ID := SMS_RECEIVE_SEQ.NEXTVAL;
  END IF;

  --ͨ��Ϊ14��������������
  if :new.channel_id = 14 then
     :new.org_id := 'ff8080813fa793ec013fa80e75de0001';
     :new.user_id := 'ff8080813fa793ec013fa80f2e810002';
  end if;

  EXT := '';
  --��ѯ��Ӧ�Ķ�����Ϣ, ��дϵͳ���SYS_ID, MSG_ID

  --��ѯ�ط���, ������չ��,������ط��ţ���ôsp���ǳ�ȥ�ط��ŵ����к���
  FOR S IN SPNUMBER_CUR LOOP
    IF SUBSTR(:NEW.SP_NUM, 0, LENGTH(S.SPNUMBER)) = S.SPNUMBER THEN
      EXT := SUBSTR(:NEW.SP_NUM, LENGTH(S.SPNUMBER) + 1);
      :NEW.EXT_NUM := ext;
      EXIT;
    END IF;
  END LOOP;

  --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT');

  --���ݻ�����Ϣ��ȡ�������
  --ƥ�����, ��ȡ1λ, ��ȡ2λ, ���4λ
  v_ok := '0';
  IF length(ext) > 0 THEN
      BEGIN
        --֧�ֻ�����չ4λ
        --for i in 1..4 LOOP
        for i IN Reverse 1..4 LOOP
          IF v_ok = '1' THEN
             EXIT;
          END IF;
          IF length(ext) >= i THEN
            ORGEXT :=  SUBSTR(EXT, 0, i);
            --INSERT INTO sql_log VALUES('orgext ' || ORGEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT 2');
            --ѭ�����
              FOR S IN org_cur LOOP
                IF length(s.extend_number) = i AND orgext = s.extend_number THEN
                  --��ȡʣ�µ���չ��
                  EXT := SUBSTR(EXT, i + 1, length(ext));
                  --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT ext');
                  v_orgid := s.user_id;
                  :new.Org_Id := s.user_id;
                  v_ok := '1';
                  EXIT;
                END IF;
              END LOOP;
          END IF;
        end loop;

        --INSERT INTO sql_log VALUES('userext ' || ORGEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT ext2 = ' || ext);
        --�����û���չ�Ž�ȡ�û����
        --ȷ��������ȷ���û�
        IF v_ok = '1' THEN
          v_ok := '0';
          --for i in 1..4 LOOP
          for i in 1..4 LOOP
            IF v_ok = '1' THEN
               EXIT;
            END IF;
            IF length(ext) >= i THEN
              USEREXT :=  SUBSTR(EXT, 0, i);
              --INSERT INTO sql_log VALUES('userext ' || userEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT userext = ' || userext );
              --ѭ�����
                FOR user_row IN user_cur LOOP
                  IF length(user_row.extend_number) = i AND userext = user_row.extend_number AND user_row.organization_id = v_orgid THEN
                    --��ȡʣ�µ���չ��
                    EXT := SUBSTR(EXT, i + 1, length(ext));
                    --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT final ext = ' || ext || ', userid = ' || user_row.user_id || ', userext = ' || userext || ', s.ext' ||user_row.extend_number);
                    v_userid := user_row.user_id;
                    :new.User_Id := user_row.user_id;
                    v_ok := '1';
                    EXIT;
                  END IF;
                END LOOP;
            END IF;
          end loop;
        END IF;
      END;
  END IF;



  --����������Ƿ����˶��ؼ���,�����Զ��Ӻ�����
  FOR S IN KEY_CUR LOOP
    IF INSTR(TRIM(:NEW.RECEIVE_MSG), TRIM(S.KEY_WORD), 1, 1) = 1 THEN
      --���˶��ؼ�����ʼ�Ķ���
      INSERT INTO BLACK
        (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME)
      VALUES
        (SYS_GUID(),
         :NEW.MOBILE_FROM,
         '�ÿͻ������˶��ؼ��֣�ϵͳ��' || TO_CHAR(SYSDATE, 'yyyy-MM-dd hh24:mi:ss') ||
         '�Զ����ÿͻ����������',
         SYSDATE);
    END IF;
  END LOOP;

  --��������������������û�������û�ʱ�������û�������ԱΪ�������û�
  if :new.org_id is not null and :new.user_id is null then
     select t.user_id into :new.user_id from user_info t where t.organization_id = :new.org_id and t.user_type = 1 and rownum <= 1;
  end if;

  --��֤�ȵ��������
  if INSTR(TRIM(:NEW.Sp_Num), '106903590528', 1, 1) = 1 then
     :new.org_id := 'ff8080814577e4ed0145cf15467f439e';
     :new.user_id := 'ff808081463c75c0014641d8dc5c072c';
  end if;

  /*
  --��ѯ���ж����������Ƿ�����㲥������
  FOR S IN RECDB_CUR LOOP
    IF NLS_UPPER(TRIM(:NEW.RECEIVE_MSG)) = S.DB_NAME THEN
      :NEW.MSG_KEY   := 1;
      :NEW.REPLY_MSG := S.DB_CONTENT;
      -- P_DIANBO_SEND(:new.mobile_from,s.db_content,sp);--��������ʱ���в���һ������
    END IF;
  END LOOP;
  */
EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;
/

prompt
prompt Creating trigger TRIGGER_REPORT_SEND
prompt ====================================
prompt
CREATE OR REPLACE TRIGGER trigger_report_send --�������״̬����, ��д��Ӧ������
AFTER UPDATE ON send
For each row
DECLARE
    pragma autonomous_transaction;
    v_spnumber VARCHAR2(20);

--��Ҫ״̬����Ļ���
BEGIN

       --�������, ״̬������޵��У� ״̬Ϊ�ɹ�����ʧ��
      if :NEW.report is not null and :old.report is null and :NEW.send_status in(5,6) AND  substr(:NEW.Msg_Type,1,4) = 'CMPP' and :new.report != 'IA:0006' THEN
         --��̬����channel_id ���ط���
         SELECT ac.sp_number||nvl(:OLD.SP_SERV_NO,'') INTO v_spnumber
                FROM sgw_account_channel ac
                inner JOIN view_cmpp_account cmpp ON ac.sgw_id = cmpp.sgw_id
                                                   AND cmpp.user_id = :OLD.user_id
                WHERE ac.channel_id = :OLD.channel_id AND ac.mobile_com = :OLD.mobile_com ;

                --�ж��Ƿ���͸������
                --͸������
                IF :OLD.ORIGINALSMS_SENDID IS NOT NULL THEN
                    --�ò�ֶ��ŵ�״̬������ԭʼ���ŵ�״̬
                    UPDATE send send SET send.send_status = :new.send_status,
                                         send.report      = :new.report,
                                         send.report_time = :new.report_time
                                   WHERE
                                         send.send_id     = :old.ORIGINALSMS_SENDID
                                    AND  send.send_status !=5;
                    --���������Ӽ�¼
                    insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
                    values(SGW_REPORT_TASK_SEQ.NEXTVAL, :old.ORIGINALSMS_SENDID, :new.mobile_to, :new.report, v_spnumber || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, :new.report_time, 0, sysdate, 0,sysdate, sysdate, sysdate);

                ELSE  --��͸������
                    --���������Ӽ�¼
                    insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
                    values(SGW_REPORT_TASK_SEQ.NEXTVAL, :new.send_id, :new.mobile_to, :new.report, v_spnumber || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, :new.report_time, 0, sysdate, 0,sysdate, sysdate, sysdate);

                END IF;
         commit;
      end if;


END;
/

prompt
prompt Creating trigger TRIGGER_WHITE_ORG_CONFIG
prompt =========================================
prompt
create or replace trigger "TRIGGER_WHITE_ORG_CONFIG"

after  insert or update or delete on white_org_config
for each row
begin
     if inserting or updating then
         if :new.mo_owner = 'ORG' then
    		    update organization o set o.mo_type = 1  where o.user_id = :new.org_id;
         end if;
         if :new.mo_owner = 'USER' then
    		    update organization o set o.mo_type = 2  where o.user_id = :new.org_id;
         end if;
     elsif deleting then
           update organization o set o.mo_type = 0  where o.user_id = :old.org_id;
     end if;

    exception
    when others then
        dbms_output.put_line('�������������ô����������쳣') ;
end;
/

prompt
prompt Creating trigger TRI_BEFOREINSERT_SMS_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER TRI_BEFOREINSERT_SMS_SEND
--����SMS_SENDǰ���Զ���д����
before insert on SMS_SEND
for each row

begin

  --��дID
  if :new.SEND_ID is null then
    :new.SEND_ID := SMS_SEND_SEQ.nextval;
  end if;

  if :new.sender_id is null then
    :new.sender_id := user; --���ݿ�ӿڲ������ݵ�ʱ��,�Զ�д���ʺ���Ϣ,�Ա������
  end if;

    --�Զ���дSYS_DATE_ID,������
    :new.sys_date_id  := to_number(to_char(:new.sys_time,'yyyyMMdd'));
    --�Զ���дSYS_DATE_ID,������
    :new.send_date_id := to_number(to_char(:new.send_time,'yyyyMMdd'));



    --�������ϵͳ�������Ķ���

    if :new.is_original_sms = 0 and :new.sys_id = 'FMS' then
      --�����ʱ������û�иú��������
      select count(*) into sms_whole_count.fms_send_count from fms_sms_send f ;

      if sms_whole_count.fms_send_count = 0 then
        --���û�о���ӵ���ʱ���У����ʱ����ֱ����ӣ���Ҫ��sms_send���в�ѯ�ж�
        select max(s.pre_send_time) into sms_whole_count.fms_send_datetime from sms_send s where s.sys_id = 'FMS' and s.mobile_to=:new.mobile_to;
        if sms_whole_count.fms_send_datetime is null then
          insert into fms_sms_send(pre_send_time) values(:new.pre_send_time);
        else
          insert into fms_sms_send(pre_send_time) values(sms_whole_count.fms_send_datetime);
        end if;
      end if;
      select pre_send_time into sms_whole_count.fms_send_datetime from fms_sms_send;
      --�÷���ʱ���ȥ��ʱ���еķ���ʱ���Ƿ����10
      if (:new.pre_send_time-sms_whole_count.fms_send_datetime)*60*60*24<10 then
         --���С��10���ö��ŵ�Ԥ����ʱ�������ʱ���еķ���ʱ���ϼ�10�룬��������ʱ���з�Ԥ����ʱ��
        :new.pre_send_time:=sms_whole_count.fms_send_datetime+1/24/60/60*10;
      end if;
      update fms_sms_send set pre_send_time=:new.pre_send_time;
    end if;

end;
/

prompt
prompt Creating trigger TRI_BEFOREUPDATE_SMS_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER "TRI_BEFOREUPDATE_SMS_SEND"
--����SMS_SENDǰ���Զ���д����
before update on SMS_SEND
for each row
begin
    if :new.send_time != :old.send_time then
        :new.send_date_id := to_number(to_char(:new.send_time,'yyyyMMdd'));
    end if;
end;
/

prompt
prompt Creating trigger TRI_LOGON
prompt ==========================
prompt
CREATE OR REPLACE TRIGGER TRI_LOGON
        AFTER LOGON ON DATABASE

BEGIN
        INSERT INTO LOGON_TABLE VALUES (SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
END;
/


spool off
