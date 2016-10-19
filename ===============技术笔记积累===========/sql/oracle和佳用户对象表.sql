----------------------------------------------------
-- Export file for user MESSAGECHANNEL            --
-- Created by Administrator on 2014/7/3, 15:22:37 --
----------------------------------------------------

spool 和佳用户对象表.log

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
  is '创世漫道黑名单';
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
  is '卓望黑名单';
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
  is '短信通道配置元数据表';
comment on column CHANNEL_CFG_META_DATA.LINK_MODE
  is '接入类型';
comment on column CHANNEL_CFG_META_DATA.MESSAGE_TYPE
  is '信息类型, SMS-短信, MMS-彩信';
comment on column CHANNEL_CFG_META_DATA.PARAM_NAME
  is '参数名称';
comment on column CHANNEL_CFG_META_DATA.PARAM_SHORT_NAME
  is '参数中文名称';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_TYPE
  is '参数的数据类型';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_UNIT_TYPE
  is '单位';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_SCOPE
  is '参数的值域,检验方式, REGEXP:正则表达式, JS:javascript, ENUM:列表枚举';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_REG_EXP
  is '参数的值域的正则表达式';
comment on column CHANNEL_CFG_META_DATA.PARAM_DATA_HINT
  is '参数提示';
comment on column CHANNEL_CFG_META_DATA.PARAM_DEFAULT_VALUE
  is '参数的缺省值';
comment on column CHANNEL_CFG_META_DATA.PARAM_DESCRIPTION
  is '参数的说明';
comment on column CHANNEL_CFG_META_DATA.HIDDEN_ME
  is '是否不显示';
comment on column CHANNEL_CFG_META_DATA.RELATION_FIELD
  is '从业务数据的哪个字段取值';
comment on column CHANNEL_CFG_META_DATA.DISPLAY_INDEX
  is '参数的说明';
comment on column CHANNEL_CFG_META_DATA.TAG_NAME
  is '此参数应用到哪个配置文件';
comment on column CHANNEL_CFG_META_DATA.REQUIRED
  is '必填';
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
  is '通道切换list表';

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
  is '通道切换配置';
comment on column CHANNEL_CHECK_CONFIG.CHANNEL_ID
  is '通道编号';
comment on column CHANNEL_CHECK_CONFIG.CHANNEL_NAME
  is '通道名称';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_CHANNEL_ID
  is '备份通道编号';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_CHANNEL_NAME
  is '备份通道名称';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_MOBILE_CHANNEL_ID
  is '移动备份通道编号';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_UNION_CHANNEL_ID
  is '联通备份通道编号';
comment on column CHANNEL_CHECK_CONFIG.BACKUP_DX_CHANNEL_ID
  is '电信备份通道编号';
comment on column CHANNEL_CHECK_CONFIG.CHECK_FREQUENCE
  is '检测频率, 单位:秒';
comment on column CHANNEL_CHECK_CONFIG.FAULT_REPORT_DELAY
  is '故障报警延迟时间, 单位:秒, 为减少误报, 当故障延续该时间后再报警,然后采取措施';
comment on column CHANNEL_CHECK_CONFIG.CHECK_TYPE
  is '检验类型, QUANTITY:按堆积短信检测, TIME:按照时效检测';
comment on column CHANNEL_CHECK_CONFIG.STATUS
  is '状态, Y:生效,N:未生效';
comment on column CHANNEL_CHECK_CONFIG.MAX_SWITCH_QUANTITY
  is '最大切换数量';
comment on column CHANNEL_CHECK_CONFIG.MIN_SMS_THREDHOLD
  is '积压短信的最小阀值, 当待发短信数量高于该值时, 表明通道不正常';
comment on column CHANNEL_CHECK_CONFIG.MAX_SMS_THREDHOLD
  is '积压短信的最大阀值, 当待发短信数量高于该值时, 需要切换通道';
comment on column CHANNEL_CHECK_CONFIG.SEND_RATE
  is '短信的发送速度, 单位:条/秒';
comment on column CHANNEL_CHECK_CONFIG.MAX_DELAY_MINUTE
  is '最长延迟时间, 单位:分钟';
comment on column CHANNEL_CHECK_CONFIG.DO_SEND_SMS_ALARM
  is '是否发送短信告警, Y:发送, N:不发送';
comment on column CHANNEL_CHECK_CONFIG.DO_SEND_EMAIL_ALARM
  is '是否发送邮件告警, Y:发送, N:不发送';
comment on column CHANNEL_CHECK_CONFIG.SMS_ALARM_TEMPLAT
  is '短信告警模板';
comment on column CHANNEL_CHECK_CONFIG.EMAIL_ALARM_TEMPLATE
  is '邮件告警模板';
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
  is '通道监控配置';
comment on column CHANNEL_CONSOLE_CONFIG.CHANNEL_TYPE
  is '通道类型, SMS:短信, MMS:彩信';
comment on column CHANNEL_CONSOLE_CONFIG.STATUS
  is '状态, N:不运行, Y:运行';
comment on column CHANNEL_CONSOLE_CONFIG.CHECK_INTERVAL
  is '检验间隔, 单位:秒';
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
  is '短信通道信息表';
comment on column CHANNEL_INFO.CHANNEL_ID
  is '通道ID';
comment on column CHANNEL_INFO.CHANNEL_NAME
  is '通道名称';
comment on column CHANNEL_INFO.SP_NO_LT
  is '联通特服号';
comment on column CHANNEL_INFO.SP_NO_YD
  is '移动特服号';
comment on column CHANNEL_INFO.SP_NO_DX
  is '电信特服号';
comment on column CHANNEL_INFO.CHANNEL_STATUS
  is '通道状态,0:有效, 1:无效';
comment on column CHANNEL_INFO.CHANNEL_CLZ
  is '通道调用的类和参数名';
comment on column CHANNEL_INFO.CHANNEL_REMARK
  is '备注';
comment on column CHANNEL_INFO.SORT_ID
  is '通道排序id';
comment on column CHANNEL_INFO.CHANNEL_STATE
  is '通道发送状态';
comment on column CHANNEL_INFO.COM_TYPE
  is '支持号段类型,1:只移动, 2:只联通,3:只电信,0:全支持';
comment on column CHANNEL_INFO.IS_WHITE
  is '是否开启白名单 0-开启 ，1不开启';
comment on column CHANNEL_INFO.MOST_SPEED
  is '最高速度';
comment on column CHANNEL_INFO.NORMAL_STATUS
  is '正常状态, 单位为分钟';
comment on column CHANNEL_INFO.WARN_STATUS
  is '故障状态, 单位为分钟';
comment on column CHANNEL_INFO.BUSY_STATUS
  is '繁忙状态, 单位为分钟';
comment on column CHANNEL_INFO.MAIN_CHANNEL
  is '主通道, 1:是,0:否';
comment on column CHANNEL_INFO.CH_SIGNATURE
  is '中文签名';
comment on column CHANNEL_INFO.EN_SIGNATURE
  is '英文签名';
comment on column CHANNEL_INFO.GATEWAY
  is '签名方式, 0：无签名，1:网关签名，2:自动添加签名';
comment on column CHANNEL_INFO.LOWEST_SEND
  is '最低发送量';
comment on column CHANNEL_INFO.LINK_MODE
  is '接入类型，CMPP、SGIP、SMGP...';
comment on column CHANNEL_INFO.PARAMETERS
  is '配置数据，JSON格式保存';
comment on column CHANNEL_INFO.DEPLOY_STATUS
  is '部署状态, 0-未部署,1-已部署';
comment on column CHANNEL_INFO.USER_NAME
  is '常用用户';
comment on column CHANNEL_INFO.IS_RECEIVED
  is '是否支持上行,0:否,1:是';
comment on column CHANNEL_INFO.IS_SENDSTATUS
  is '是否支持状态报告,0:否,1:是';
comment on column CHANNEL_INFO.IS_EXTENDED
  is '是否支持扩展码,0:否,1:是';
comment on column CHANNEL_INFO.IS_LONGSMS
  is '是否支持长短信,0:否,1:是';
comment on column CHANNEL_INFO.SPNUMBER_YD_TYPE
  is '移动特服号类型';
comment on column CHANNEL_INFO.SPNUMBER_LT_TYPE
  is '联通特服号类型';
comment on column CHANNEL_INFO.SPNUMBER_DX_TYPE
  is '电信特服号类型';
comment on column CHANNEL_INFO.SMS_MAX_LENGTH_EN
  is '普通短信的最大长度,一般最大为70(英文)';
comment on column CHANNEL_INFO.LONG_SMS_PER_LENGTH_EN
  is '长短信中每个分短信的长度,一般为67(英文)';
comment on column CHANNEL_INFO.LONG_SMS_MAX_LENGTH_EN
  is '长短信的最大长度,例如250,300(英文)';
comment on column CHANNEL_INFO.SMS_MAX_LENGTH_CH
  is '普通短信的最大长度,一般最大为70(中文)';
comment on column CHANNEL_INFO.LONG_SMS_PER_LENGTH_CH
  is '长短信中每个分短信的长度,一般为67(中文)';
comment on column CHANNEL_INFO.LONG_SMS_MAX_LENGTH_CH
  is '长短信的最大长度,例如250,300(中文)';
comment on column CHANNEL_INFO.UNSUBSCRIBE_KEYWORD
  is '退订关键字';
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
  is '通道价格策略表，用于费用统计';
comment on column CHANNEL_PRICE_POLICY.POLICY_ID
  is '价格策略的ID';
comment on column CHANNEL_PRICE_POLICY.CHANNEL_ID
  is '通道编号';
comment on column CHANNEL_PRICE_POLICY.POLICY_TYPE
  is '策略类型：1--是直连通道，2--是用第三方通道';
comment on column CHANNEL_PRICE_POLICY.DIRECT_NUMBER
  is '直连时，月基本条数';
comment on column CHANNEL_PRICE_POLICY.DIRECT_PRICE
  is '直连时，月基本条数的价格';
comment on column CHANNEL_PRICE_POLICY.DIRECT_ADD_PRICE
  is '直连时，增值业务的每条价格';
comment on column CHANNEL_PRICE_POLICY.INDIRECT_MIN_NUMBER
  is '使用第三方通道时，最小发送量';
comment on column CHANNEL_PRICE_POLICY.INDIRECT_MAX_NUMBER
  is '使用第三方通道时，最大发送量';
comment on column CHANNEL_PRICE_POLICY.INDIRECT_PRICE
  is '使用第三方通道时，发送每条的单价';
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
  is '通道测试定时任务表';
comment on column CHANNEL_TEST.CHANNEL_TEST_ID
  is '主键';
comment on column CHANNEL_TEST.MOBILE_TO
  is '目标手机号';
comment on column CHANNEL_TEST.SEND_MSG
  is '短信内容';
comment on column CHANNEL_TEST.SEND_TIME
  is '平台发送该短信的时间';
comment on column CHANNEL_TEST.CHANNEL_ID
  is '通道ID';
comment on column CHANNEL_TEST.CREATE_TIME
  is '创建定时任务时间';
comment on column CHANNEL_TEST.REMARK
  is '备注信息，作为外部系统扩展用，CC短信系统该字段填写基金账号';
comment on column CHANNEL_TEST.TRIGGER_NAME
  is '定时任务名';
comment on column CHANNEL_TEST.EXT_NUM
  is '自定义扩展码';
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
  is '用户表';
comment on column USER_INFO.USER_ID
  is '用户编号';
comment on column USER_INFO.USER_NAME
  is '用户名称';
comment on column USER_INFO.USER_PASS
  is '密码';
comment on column USER_INFO.USER_STAT
  is '状态, 1:有效, 0:无效,2:已删除';
comment on column USER_INFO.USER_MOME
  is '备注';
comment on column USER_INFO.USER_DEF_ROLE
  is '用户默认角色';
comment on column USER_INFO.USER_TYPE
  is '用户类型, 2:普通员工, 1:组管理员';
comment on column USER_INFO.USER_BALANCE
  is '用户可用费用';
comment on column USER_INFO.CREATE_TIME
  is '创建时间';
comment on column USER_INFO.ORGANIZATION_ID
  is '机构ID';
comment on column USER_INFO.ENG_SIGNATURE
  is '用户的英文签名';
comment on column USER_INFO.CHN_SIGNATURE
  is '用户的中文签名';
comment on column USER_INFO.USE_USER_SIGNATURE
  is '是否需要用户签名, 0:需要, 1:不需要';
comment on column USER_INFO.EXTEND_NUMBER
  is '用户扩展号';
comment on column USER_INFO.USER_QUOTA
  is '短信配额';
comment on column USER_INFO.PAY_TYPE
  is '充值类型, 0:预付费, 1:后付费';
comment on column USER_INFO.PAY_MODE
  is '计费单位, 0:配额付费, 1:金额付费';
comment on column USER_INFO.FEE_MODE
  is '扣费方式, 0:自付费, 1:组付费';
comment on column USER_INFO.CHANNEL_TYPE
  is '是否区分通道, 0:不区分, 1:区分';
comment on column USER_INFO.MOBILE_TYPE
  is '是否区分号段, 0:不区分, 1:区分';
comment on column USER_INFO.EMAIL
  is 'E-mail';
comment on column USER_INFO.MOBILE
  is '手机号码';
comment on column USER_INFO.SMS_ALERT
  is '审批短信提醒, 0:是, 1:否';
comment on column USER_INFO.MMS_QUOTA
  is '彩信配额';
comment on column USER_INFO.RECHARGE_EXPLAIN
  is '充值说明';
comment on column USER_INFO.USER_KIND
  is '用户种类：1：Web平台用户；2：WebService接口用户；3：CMPP接口用户；4：HTTP接口用户';
comment on column USER_INFO.IS_INSTEAD_SEND
  is '是否允许代发信息';
comment on column USER_INFO.LOGIN_ERROR_NUM
  is '登录错误次数';
comment on column USER_INFO.LAST_UPDATE_PSW_DATE
  is '上次修改密码时间';
comment on column USER_INFO.VALID_IP
  is '用户绑定的IP地址';
comment on column USER_INFO.VALID_MOBILE
  is '用户绑定的手机号码';
comment on column USER_INFO.IP_STATUS
  is '用户IP绑定的状态, 0:不绑定 , 1:绑定 ';
comment on column USER_INFO.MOBILE_STATUS
  is '用户手机号码绑定的状态, 0:不绑定 , 1:绑定 ';
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
  is '主键';
comment on column CHANNEL_USER.USER_ID
  is '用户id';
comment on column CHANNEL_USER.CHANNEL_ID
  is '通道id';
comment on column CHANNEL_USER.CREATE_USER
  is '创建人';
comment on column CHANNEL_USER.CREATE_TIME
  is '创建时间';
comment on column CHANNEL_USER.COM_TYPE
  is '1:移动, 2:联通,3:电信,0:全支持';
comment on column CHANNEL_USER.CASCADE_ID
  is '级联id:用于对表级联删除或更新';
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
  is '公共管理平台模块表';
comment on column COMMON_MODULE_INFO.MODULE_ID
  is '模块ID';
comment on column COMMON_MODULE_INFO.P_MODULE_ID
  is '父模块ID';
comment on column COMMON_MODULE_INFO.MODULE_NAME
  is '模块名称';
comment on column COMMON_MODULE_INFO.MODULE_URL
  is '模块URL';
comment on column COMMON_MODULE_INFO.MODULE_REMARK
  is '模块备注';
comment on column COMMON_MODULE_INFO.MODULE_SORT
  is '显示顺序';
comment on column COMMON_MODULE_INFO.MODULE_LEVEL
  is '模块级别';
comment on column COMMON_MODULE_INFO.MODULE_STATUS
  is '模块状态 0:停用, 1:启用';
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
  is '消费流水记录';
comment on column CONSUME_RECORD_INFO.RECORD_ID
  is 'id';
comment on column CONSUME_RECORD_INFO.CONSUMER_ID
  is '用户id';
comment on column CONSUME_RECORD_INFO.CONSUMER_NAME
  is '用户登录名';
comment on column CONSUME_RECORD_INFO.SEND_TIME
  is '发送时间';
comment on column CONSUME_RECORD_INFO.SEND_QUANTITY
  is '发送量';
comment on column CONSUME_RECORD_INFO.SEND_TYPE
  is '发送类型。0普通发送,1批量发送,2回复短信,3群组发送,4socket发送,5webservice发送,6手工发送,7预警短信,8调查问卷,9生日祝福,10普通彩信,11账单彩信,20普通email';
comment on column CONSUME_RECORD_INFO.REMAIN_QUOTA
  is '剩余配额';
comment on column CONSUME_RECORD_INFO.UNIT_PRICE
  is '单价';
comment on column CONSUME_RECORD_INFO.COST_FEE
  is '本次短信费用';
comment on column CONSUME_RECORD_INFO.REMARK
  is '备注';
comment on column CONSUME_RECORD_INFO.SEND_MSG
  is '该批次短信的内容(批量发送方式只记录第一条短信的内容)';
comment on column CONSUME_RECORD_INFO.GW_TYPE
  is '号段类型。0-全网路，1-移动号段，2-联通号段，3-小灵通号段';
comment on column CONSUME_RECORD_INFO.BIZ_TYPE
  is '业务类型。0-普通短信业务，1-彩信业务，2-email业务';
comment on column CONSUME_RECORD_INFO.CHANNEL_ID
  is '发送通道。0-所有通道';
comment on column CONSUME_RECORD_INFO.USER_MOME
  is '用户简介';
comment on column CONSUME_RECORD_INFO.BATCH_ID
  is '批次号';
comment on column CONSUME_RECORD_INFO.REMAIN_BALANCE
  is '剩余金额';
comment on column CONSUME_RECORD_INFO.ORGANIZATION_ID
  is '机构id ';
comment on column CONSUME_RECORD_INFO.FEE_MODE
  is '机构的付费类型 0:自付费, 1:组付费';
comment on column CONSUME_RECORD_INFO.PAY_TYPE
  is '充值类型, 0:预付费, 1:后付费';
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
  is '各状态的总数表';
comment on column COUNT_SEND_STATUS.ID
  is '主键';
comment on column COUNT_SEND_STATUS.ALL_COUNT
  is '总数';
comment on column COUNT_SEND_STATUS.SENDING_COUNT
  is '待发送总数';
comment on column COUNT_SEND_STATUS.CREATE_TIME
  is '创建的时间';
comment on column COUNT_SEND_STATUS.SENT_COUNT
  is '已提交总数';
comment on column COUNT_SEND_STATUS.RECEIVE_COUNT
  is '上行总数';
comment on column COUNT_SEND_STATUS.SUC_COUNT
  is '成功总数';
comment on column COUNT_SEND_STATUS.CHANNEL_ID
  is '0为所有通道';
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
  is '0：独有 1：分享';
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
  is '客户表';
comment on column CUSTOMER_INFO.CUSTOMER_ID
  is '客户表的主键';
comment on column CUSTOMER_INFO.MOBILE_USER_NAME
  is '客户的名字';
comment on column CUSTOMER_INFO.MOBILE
  is '客户手机号';
comment on column CUSTOMER_INFO.GROUP_ID
  is '客户所属的组';
comment on column CUSTOMER_INFO.CREATE_TIME
  is '添加客户时的时间';
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
  is '客户信息表';
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
  is '日结单表';
comment on column DAILY_RECKONING_INFO.DAILY_RECKONING_ID
  is 'id';
comment on column DAILY_RECKONING_INFO.USER_ID
  is '账户id';
comment on column DAILY_RECKONING_INFO.USER_NAME
  is '账户名';
comment on column DAILY_RECKONING_INFO.SEND_STATUS
  is '短信状态(现只计提交和发送成功的)';
comment on column DAILY_RECKONING_INFO.SEND_QUANTITY
  is '计费短信的数量';
comment on column DAILY_RECKONING_INFO.SUB_TOTAL_FEE
  is '短信费用';
comment on column DAILY_RECKONING_INFO.REMAIN_MESSAGE_QUOTA
  is '剩余短信配额';
comment on column DAILY_RECKONING_INFO.REMAIN_MMS_QUOTA
  is '剩余彩信配额';
comment on column DAILY_RECKONING_INFO.RECKONING_DATE
  is '短信发送的日期';
comment on column DAILY_RECKONING_INFO.RECORD_DATE
  is '记录日期';
comment on column DAILY_RECKONING_INFO.PAY_MODE
  is '计费模式';
comment on column DAILY_RECKONING_INFO.REMAIN_BALANCE
  is '剩余金额';
comment on column DAILY_RECKONING_INFO.USER_MOME
  is '账户名称';
comment on column DAILY_RECKONING_INFO.MOBILE_COM
  is '运营商ID，1为移动，2为联通,3为电信,0为全网 ';
comment on column DAILY_RECKONING_INFO.CHANNEL_ID
  is '通道ID';
comment on column DAILY_RECKONING_INFO.UNIT_PRICE
  is '短信单价';
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
  is '数据库接口';
comment on column DB_INTERFACE_INFO.DB_INTERFACE_ID
  is '数据库接口的ID';
comment on column DB_INTERFACE_INFO.ZHANG_HAO
  is '账号';
comment on column DB_INTERFACE_INFO.PASS_WORD
  is '密码';
comment on column DB_INTERFACE_INFO.SEND_SELECT_LIMIT
  is 'sms_send表的权限:select--查询权限';
comment on column DB_INTERFACE_INFO.SEND_INSERT_LIMIT
  is 'sms_send表的权限:insert--插入权限';
comment on column DB_INTERFACE_INFO.RECEIVE_LIMIT
  is 'sms_receive表的权限：select--查询权限';
comment on column DB_INTERFACE_INFO.PRO_CLASS_LIMIT
  is '发送违禁词分类的权限：select--查询权限';
comment on column DB_INTERFACE_INFO.PRO_LIMIT
  is '发送违禁词的权限：select--查询权限';
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
  is '系统字典表';
comment on column DIC_ALL_KIND.KIND_CODE
  is '字典代码';
comment on column DIC_ALL_KIND.KIND_NAME
  is '字典名称';
comment on column DIC_ALL_KIND.MEMO
  is '备注';
comment on column DIC_ALL_KIND.OPERATION_KIND
  is '操作类型';
comment on column DIC_ALL_KIND.OPERATION_NAME
  is '操作类型描述';
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
  is '短信草稿';
comment on column DRAFT_INFO.DRAFT_ID
  is '草稿编号';
comment on column DRAFT_INFO.CONTEXT
  is '短信内容';
comment on column DRAFT_INFO.MOBILE_TO
  is '手机号';
comment on column DRAFT_INFO.USER_ID
  is '用户编号';
comment on column DRAFT_INFO.CREATE_DATE
  is '创建日期';
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
  is '临时机构信息表';
comment on column D_ORG_INFO.ORG_ID
  is '机构编号';
comment on column D_ORG_INFO.ORG_NAME
  is '机构名称';
comment on column D_ORG_INFO.ORG_FULL_NAME
  is '机构全名';
comment on column D_ORG_INFO.ORG_STS
  is '机构状态0 正常,9 注销';
comment on column D_ORG_INFO.ORG_TYPE_CODE
  is '机构类型代码，01:代表处，02：营业部';
comment on column D_ORG_INFO.SUPER_ORG_NO
  is '上级机构编号';
comment on column D_ORG_INFO.IS_FRZ
  is '是否冻结 0 未冻结,1 冻结';
comment on column D_ORG_INFO.EXTEND_STR
  is '预留';
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
  is '临时信息来源数据字典';
comment on column D_SYS_CODE.SUBSYS_CODE_ID
  is '信息来源编号';
comment on column D_SYS_CODE.SUBSYS_CODE_NAME
  is '信息来源名称';
comment on column D_SYS_CODE.DESCRIPTION
  is '备注';
comment on column D_SYS_CODE.SYS_ID
  is '信息来源扩展号';
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
  is '客户管理模块组信息表';
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
  is '群组EXCEL导入手机号码';
comment on column GROUP_EXCEL_INFO.EXCEL_ID
  is '编号';
comment on column GROUP_EXCEL_INFO.EXCEL_NAME
  is 'Excel名称';
comment on column GROUP_EXCEL_INFO.MOBILE
  is '手机号';
comment on column GROUP_EXCEL_INFO.MOBILE_USER_NAME
  is '用户名';
comment on column GROUP_EXCEL_INFO.GROUP_ID
  is '所属机构';
comment on column GROUP_EXCEL_INFO.MOBILE_REMARK
  is '备注';
comment on column GROUP_EXCEL_INFO.BIRTHDAY
  is '生日';
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
  is '客户组订阅产品的模型';
comment on column GROUP_ORDER_INFO.ORDER_ID
  is '订购编号';
comment on column GROUP_ORDER_INFO.PRODUCT_ID
  is '产品编号';
comment on column GROUP_ORDER_INFO.ORGANIZATION_ID
  is '机构编号';
comment on column GROUP_ORDER_INFO.ORDER_TYPE
  is '定制方式，0：短信、1：彩信';
comment on column GROUP_ORDER_INFO.ORDER_ADDRESS
  is '定制的地址:	手机号或email';
comment on column GROUP_ORDER_INFO.GROUP_ID
  is '定制组编号';
comment on column GROUP_ORDER_INFO.ORDER_PARAMS
  is '定制参数:股票代码，可多只';
comment on column GROUP_ORDER_INFO.BEGIN_TIME
  is '定制开始时间';
comment on column GROUP_ORDER_INFO.END_TIME
  is '定制结束时间';
comment on column GROUP_ORDER_INFO.ORDER_STATUS
  is '定制有效状态，0：正常、1：未开始、2过期、3：作废、4：暂停、5：退订';
comment on column GROUP_ORDER_INFO.ORDER_TIME
  is '定制日期';
comment on column GROUP_ORDER_INFO.ORDER_DEPRECATED_FLAG
  is '过期、删除标记。订单正常状态下该值为空。订单作废、过期、暂停、未开始状态时，随机生成一个标记，用于与正常订单定制地址区别(主要用于数据库判重)';
comment on column GROUP_ORDER_INFO.PRODUCT_NAME
  is '服务产品名称';
comment on column GROUP_ORDER_INFO.CUSTOMER_ID
  is '客户编号。由客户自行维护';
comment on column GROUP_ORDER_INFO.NOTIFY_STATUS
  is '发送告知短信的状态，0：未发送、1：已发送';
comment on column GROUP_ORDER_INFO.USER_NAME
  is '操作当前记录客户姓名';
comment on column GROUP_ORDER_INFO.PRORITY
  is '订单优先级越小越优先';
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
  is '6位数字验证码';
comment on column LOGIN_SMS_VERCODE.MOBILE_TO
  is '接收验证码的手机号';
comment on column LOGIN_SMS_VERCODE.USER_ID
  is '接收手机验证码的用户ID';
comment on column LOGIN_SMS_VERCODE.VERCODE_TYPE
  is '验证码类型  0找回密码  1手机验证码登录';
comment on column LOGIN_SMS_VERCODE.STATUS
  is '是否有效状态   0无效  1有效';
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
  is '记录登录数据库的用户和登录时间';
comment on column LOGON_TABLE.LOGON_USER
  is '登录数据库的用户';
comment on column LOGON_TABLE.CREATE_TIME
  is '登录的时间';

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
  is '彩信通道表';
comment on column MMS_CHANNEL_INFO.CHANNEL_ID
  is '通道ID';
comment on column MMS_CHANNEL_INFO.CHANNEL_NAME
  is '通道名称';
comment on column MMS_CHANNEL_INFO.CHANNEL_STATUS
  is '通道状态，0启动,1,停止,2未启动';
comment on column MMS_CHANNEL_INFO.CHANNEL_REMARK
  is '备注';
comment on column MMS_CHANNEL_INFO.SORT_ID
  is '通道排序id';
comment on column MMS_CHANNEL_INFO.CHANNEL_STATE
  is '通道发送状态(此字段无效)';
comment on column MMS_CHANNEL_INFO.COM_TYPE
  is '支持号段类型：1-只移动,2-只联通,3-电信  0-全支持';
comment on column MMS_CHANNEL_INFO.SP_NO_YD
  is '移动特服号';
comment on column MMS_CHANNEL_INFO.SP_NO_LT
  is '联通特服号';
comment on column MMS_CHANNEL_INFO.SP_NO_DX
  is '电信特服号';
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
  is '彩信通道规则表';
comment on column MMS_CHANNEL_RULE_SET.RULE_SET_ID
  is '规则编号';
comment on column MMS_CHANNEL_RULE_SET.RULE_SET_NAME
  is '规则名称';
comment on column MMS_CHANNEL_RULE_SET.RULE_SET_TYPE
  is '规则类型, ITEMS:手工输入的规则, DECISIONTABLE:决策表';
comment on column MMS_CHANNEL_RULE_SET.DC_FILE_PATH
  is '决策表保存路径';
comment on column MMS_CHANNEL_RULE_SET.RULE_STATUS
  is '状态, -1:草稿状态, 0:备选, 1:生效';
comment on column MMS_CHANNEL_RULE_SET.USER_ORGANIZATION
  is '机构编号';
comment on column MMS_CHANNEL_RULE_SET.USER_ORG_NAME
  is '机构名称';
comment on column MMS_CHANNEL_RULE_SET.USER_ID
  is '用户编号';
comment on column MMS_CHANNEL_RULE_SET.USER_NAME
  is '用户名称';
comment on column MMS_CHANNEL_RULE_SET.DESCRIPTIONS
  is '备注';
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
  is '短信通道规则表明细表';
comment on column MMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ID
  is '规则编号';
comment on column MMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_ID
  is '规则明细编号';
comment on column MMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_NAME
  is '规则明细名称';
comment on column MMS_CHANNEL_RULE_SET_ITEM.SALIENCE
  is '优先级';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MESSAGE_TYPE
  is '信息性质, 可以多选';
comment on column MMS_CHANNEL_RULE_SET_ITEM.ORG_ID
  is '机构编号, 可以多选';
comment on column MMS_CHANNEL_RULE_SET_ITEM.USER_ID
  is '用户编号, 可以多选';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MOBILE_COM
  is '运营商, 可以多选';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NUM_SCOPE
  is '号段, 可以填写多个, 以英文逗号分割';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NUM_REGION
  is '手机所属区域, 可以填写多个, 以英文逗号分';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MOBILE
  is '手机号码, 可以填写多个';
comment on column MMS_CHANNEL_RULE_SET_ITEM.CHANNEL_ID
  is '所选通道';
comment on column MMS_CHANNEL_RULE_SET_ITEM.MSG_TYPE
  is '信息类型';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DAY_START_TIME
  is '白天开始时间';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DAY_END_TIME
  is '白天结束时间';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NIGHT_START_TIME
  is '夜间开始时间';
comment on column MMS_CHANNEL_RULE_SET_ITEM.NIGHT_END_TIME
  is '夜间结束时间';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_CHANNEL_ID
  is '缺省使用的通道';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_MOBILE_CHANNEL_ID
  is '缺省使用的移动通道';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_UNION_CHANNEL_ID
  is '缺省使用的联通通道';
comment on column MMS_CHANNEL_RULE_SET_ITEM.DEFAULT_DX_CHANNEL_ID
  is '缺省使用的电信通道';
comment on column MMS_CHANNEL_RULE_SET_ITEM.USE_CHANNEL_ID
  is '最终使用的通道编号';
comment on column MMS_CHANNEL_RULE_SET_ITEM.USE_STATUS
  is '彩信的缺省状态';
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
  is '彩信归档表';
comment on column MMS_HIS.MMS_HIS_ID
  is 'id';
comment on column MMS_HIS.SEND_STATUS
  is '发送状态';
comment on column MMS_HIS.USER_ORGANIZATION
  is '机构';
comment on column MMS_HIS.CHANNEL_ID
  is '通道';
comment on column MMS_HIS.MOBILE_COM
  is '运营商';
comment on column MMS_HIS.SYS_ID
  is '信息来源';
comment on column MMS_HIS.MESSAGE_TYPE
  is '信息性质';
comment on column MMS_HIS.BATCH_ID
  is '批次号';
comment on column MMS_HIS.MOBILE_QUANTITIES
  is '发送总量';
comment on column MMS_HIS.SEND_TIME
  is '发送时间';
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
  is '彩信上行信息表';
comment on column MMS_RECEIVE.RECEIVE_ID
  is '上行彩信编号';
comment on column MMS_RECEIVE.MOBILE_FROM
  is '上行手机号';
comment on column MMS_RECEIVE.SUBJECT
  is '彩信标题';
comment on column MMS_RECEIVE.RECEIVE_MSG
  is '彩信内容';
comment on column MMS_RECEIVE.RECEIVE_TIME
  is '上行时间';
comment on column MMS_RECEIVE.SP_NO
  is '特服号';
comment on column MMS_RECEIVE.SP_SERV_NO
  is '业务编号';
comment on column MMS_RECEIVE.RECEIVE_STATUS
  is '上行状态';
comment on column MMS_RECEIVE.READ_TIME
  is '阅读时间';
comment on column MMS_RECEIVE.CHANNEL_ID
  is '通道编号';
comment on column MMS_RECEIVE.ORGANIZATION_ID
  is '所属机构';
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
  is '彩信发送导入手机号的临时表';
comment on column MMS_SCHED_MOBILE_TEMP.SCHEDULE_ID
  is '彩信发送记录编号';
comment on column MMS_SCHED_MOBILE_TEMP.MOBILE
  is '手机号码';
comment on column MMS_SCHED_MOBILE_TEMP.IMPORT_TYPE
  is '导入方式';
comment on column MMS_SCHED_MOBILE_TEMP.BATCH_ID
  is '导入批号, 用于统计导入数量';
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
  is '下行彩信信息表';
comment on column MMS_SEND.MMS_SEND_ID
  is '彩信编号';
comment on column MMS_SEND.SUBJECT
  is '彩信标题';
comment on column MMS_SEND.MOBILE_TO
  is '手机号';
comment on column MMS_SEND.EXT_NUM
  is '扩展号码';
comment on column MMS_SEND.PRIOR_ID
  is '优先级';
comment on column MMS_SEND.SEND_STATUS
  is '发送状态, -2:生成中, 0,未发送, 1:已提交, 2:发送中, 5:发送成功, 6:发送失败, 7:系统黑名单';
comment on column MMS_SEND.SYS_TIME
  is '入库时间';
comment on column MMS_SEND.SYS_DATE_ID
  is '彩信入库日期';
comment on column MMS_SEND.PRE_SEND_TIME
  is '预计发送时间';
comment on column MMS_SEND.EVENT_LATEST_TIME
  is '晚间最晚发送时间';
comment on column MMS_SEND.MORNING_EARLEST_TIME
  is '早晨最早发送时间';
comment on column MMS_SEND.MORNING_LATEST_TIME
  is '早晨最晚发送时间';
comment on column MMS_SEND.SEND_TIME
  is '平台发送该短信的时间';
comment on column MMS_SEND.SEND_DATE_ID
  is '平台发送彩信的日期';
comment on column MMS_SEND.COM_RTN_TIME
  is '发送后移动或联通网关返回结果的时间';
comment on column MMS_SEND.ERR_MSG
  is '发送失败时，运营商网关返回的错误信息，只有在发送失败时，该字段有值，其余时候未空';
comment on column MMS_SEND.FAIL_RESEND_TIMES
  is '发送失败次数';
comment on column MMS_SEND.ERR_ID
  is '错误代码，包含短息平台错误代码和彩信网关错误代码';
comment on column MMS_SEND.REPORT_TIME
  is '手机接收状态报告返回时间';
comment on column MMS_SEND.GW_SEND_TIME
  is '网关发送彩信时间';
comment on column MMS_SEND.GW_REPORT_TIME
  is '网关接收状态报告时间';
comment on column MMS_SEND.CHANNEL_ID
  is '通道编号';
comment on column MMS_SEND.MOBILE_QUANTITIES
  is '本条信息的手机数量';
comment on column MMS_SEND.RESEND_TIMES
  is '重发此数';
comment on column MMS_SEND.ORG_NAME
  is '机构名称';
comment on column MMS_SEND.ORG_ID
  is '机构编号';
comment on column MMS_SEND.USER_ID
  is '用户编号';
comment on column MMS_SEND.USER_NAME
  is '用户名称';
comment on column MMS_SEND.BATCH_ID
  is '彩信批号';
comment on column MMS_SEND.GW_BATCH
  is '彩信网关返回的批号';
comment on column MMS_SEND.SEQUENCE
  is '彩信网关返回的彩信编号';
comment on column MMS_SEND.SEND_TYPE
  is '发送类型';
comment on column MMS_SEND.MOBILE_COM
  is '运营商编号, 1:移动, 2:联通,3:电信,0:错误号码';
comment on column MMS_SEND.MESSAGE_TYPE
  is '信息性质';
comment on column MMS_SEND.SYS_ID
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column MMS_SEND.MSG_ID
  is '生成彩信的业务系统的彩信编号';
comment on column MMS_SEND.SENDER_ID
  is '接口用户编号';
comment on column MMS_SEND.REMARK
  is '备注信息，保留字段，扩展时使用';
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
  is '彩信发送内容表';
comment on column MMS_SEND_CONTENT.BATCH_ID
  is '批号';
comment on column MMS_SEND_CONTENT.SUBJECT
  is '彩信标题';
comment on column MMS_SEND_CONTENT.SYS_TIME
  is '入库时间';
comment on column MMS_SEND_CONTENT.SEND_MSG
  is '彩信内容';
comment on column MMS_SEND_CONTENT.USER_ORGANIZATION
  is '机构编号';
comment on column MMS_SEND_CONTENT.USER_ORG_NAME
  is '机构名称';
comment on column MMS_SEND_CONTENT.USER_ID
  is '用户编号';
comment on column MMS_SEND_CONTENT.USER_NAME
  is '用户名称';
comment on column MMS_SEND_CONTENT.SENDER_ID
  is '接口用户编号';
comment on column MMS_SEND_CONTENT.GW_MMS_ID
  is '网关返回的彩信编号';
comment on column MMS_SEND_CONTENT.GW_MMS_ID1
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID2
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID3
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID4
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID5
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID6
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID7
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID8
  is '网关返回的彩信编号(保留字段)';
comment on column MMS_SEND_CONTENT.GW_MMS_ID9
  is '网关返回的彩信编号(保留字段)';
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
  is '下行彩信信息表';
comment on column MMS_SEND_HIS.MMS_SEND_ID
  is '彩信编号';
comment on column MMS_SEND_HIS.SUBJECT
  is '彩信标题';
comment on column MMS_SEND_HIS.MOBILE_TO
  is '手机号';
comment on column MMS_SEND_HIS.EXT_NUM
  is '扩展号码';
comment on column MMS_SEND_HIS.PRIOR_ID
  is '优先级';
comment on column MMS_SEND_HIS.SEND_STATUS
  is '发送状态, -2:生成中, 0,未发送, 1:已提交, 2:发送中, 5:发送成功, 6:发送失败, 7:系统黑名单';
comment on column MMS_SEND_HIS.SYS_TIME
  is '入库时间';
comment on column MMS_SEND_HIS.SYS_DATE_ID
  is '彩信入库日期';
comment on column MMS_SEND_HIS.PRE_SEND_TIME
  is '预计发送时间';
comment on column MMS_SEND_HIS.EVENT_LATEST_TIME
  is '晚间最晚发送时间';
comment on column MMS_SEND_HIS.MORNING_EARLEST_TIME
  is '早晨最早发送时间';
comment on column MMS_SEND_HIS.MORNING_LATEST_TIME
  is '早晨最晚发送时间';
comment on column MMS_SEND_HIS.SEND_TIME
  is '平台发送该短信的时间';
comment on column MMS_SEND_HIS.SEND_DATE_ID
  is '平台发送彩信的日期';
comment on column MMS_SEND_HIS.COM_RTN_TIME
  is '发送后移动或联通网关返回结果的时间';
comment on column MMS_SEND_HIS.ERR_MSG
  is '发送失败时，运营商网关返回的错误信息，只有在发送失败时，该字段有值，其余时候未空';
comment on column MMS_SEND_HIS.FAIL_RESEND_TIMES
  is '发送失败次数';
comment on column MMS_SEND_HIS.ERR_ID
  is '错误代码，包含短息平台错误代码和彩信网关错误代码';
comment on column MMS_SEND_HIS.REPORT_TIME
  is '手机接收状态报告返回时间';
comment on column MMS_SEND_HIS.GW_SEND_TIME
  is '网关发送彩信时间';
comment on column MMS_SEND_HIS.GW_REPORT_TIME
  is '网关接收状态报告时间';
comment on column MMS_SEND_HIS.CHANNEL_ID
  is '通道编号';
comment on column MMS_SEND_HIS.MOBILE_QUANTITIES
  is '本条信息的手机数量';
comment on column MMS_SEND_HIS.RESEND_TIMES
  is '重发此数';
comment on column MMS_SEND_HIS.ORG_NAME
  is '机构名称';
comment on column MMS_SEND_HIS.ORG_ID
  is '机构编号';
comment on column MMS_SEND_HIS.USER_ID
  is '用户编号';
comment on column MMS_SEND_HIS.USER_NAME
  is '用户名称';
comment on column MMS_SEND_HIS.BATCH_ID
  is '彩信批号';
comment on column MMS_SEND_HIS.GW_BATCH
  is '彩信网关返回的批号';
comment on column MMS_SEND_HIS.SEQUENCE
  is '彩信网关返回的彩信编号';
comment on column MMS_SEND_HIS.SEND_TYPE
  is '发送类型';
comment on column MMS_SEND_HIS.MOBILE_COM
  is '运营商编号, 1:移动, 2:联通,3:电信,0:错误号码';
comment on column MMS_SEND_HIS.MESSAGE_TYPE
  is '信息性质';
comment on column MMS_SEND_HIS.SYS_ID
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column MMS_SEND_HIS.MSG_ID
  is '生成彩信的业务系统的彩信编号';
comment on column MMS_SEND_HIS.SENDER_ID
  is '接口用户编号';
comment on column MMS_SEND_HIS.REMARK
  is '备注信息，保留字段，扩展时使用';
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
  is '彩信发送记录表';
comment on column MMS_SEND_SCHEDULE.MMS_SEND_SCHEDULE_ID
  is '编号';
comment on column MMS_SEND_SCHEDULE.MMS_TEMPLATE_ID
  is '模板编号';
comment on column MMS_SEND_SCHEDULE.SUBJECT
  is '彩信标题';
comment on column MMS_SEND_SCHEDULE.MOBILE_TO
  is '手机号,以逗号分隔';
comment on column MMS_SEND_SCHEDULE.GROUPS
  is '客户群组, 以英文分号分割';
comment on column MMS_SEND_SCHEDULE.GROUPS_NAME
  is '客户组名字, 以英文分号分割';
comment on column MMS_SEND_SCHEDULE.DATA_FILE
  is '手机号码文件';
comment on column MMS_SEND_SCHEDULE.DATA_FILE_TYPE
  is '号码文件类型';
comment on column MMS_SEND_SCHEDULE.SEND_MSG
  is '彩信内容';
comment on column MMS_SEND_SCHEDULE.PRIOR_ID
  is '优先级';
comment on column MMS_SEND_SCHEDULE.SEND_STATUS
  is '发送状态, -2:生成中, 0:待发送, 1:已发送, 2:发送中, 5:发送成功, 6:发送失败, 7:黑名单';
comment on column MMS_SEND_SCHEDULE.SYS_TIME
  is '入库时间';
comment on column MMS_SEND_SCHEDULE.PRE_SEND_TIME
  is '预定发送时间';
comment on column MMS_SEND_SCHEDULE.CHANNEL_ID
  is '通道编号';
comment on column MMS_SEND_SCHEDULE.MOBILE_QUANTITIES
  is '本条信息的手机数量';
comment on column MMS_SEND_SCHEDULE.TEMP_TEMP
  is '缓存模板内容';
comment on column MMS_SEND_SCHEDULE.TEMP_MSG
  is '缓存彩信内容';
comment on column MMS_SEND_SCHEDULE.PARAM_MAP
  is '提交信息时候的参数';
comment on column MMS_SEND_SCHEDULE.MOBILE_LIST_ID
  is '缓存手机号码的队列';
comment on column MMS_SEND_SCHEDULE.USER_ORGANIZATION
  is '机构编号';
comment on column MMS_SEND_SCHEDULE.USER_ORG_NAME
  is '机构名称';
comment on column MMS_SEND_SCHEDULE.USER_ID
  is '用户编号';
comment on column MMS_SEND_SCHEDULE.USER_NAME
  is '用户名称';
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
  is '彩信模板';
comment on column MMS_TEMPLATE.MMS_TEMPLATE_ID
  is '模板编号';
comment on column MMS_TEMPLATE.SUBJECT
  is '彩信标题';
comment on column MMS_TEMPLATE.FRAME_SIZE
  is '帧数';
comment on column MMS_TEMPLATE.CONTENT_SIZE
  is '彩信大小';
comment on column MMS_TEMPLATE.DURATION
  is '持续时间, 单位:秒';
comment on column MMS_TEMPLATE.USER_ORGANIZATION
  is '机构编号';
comment on column MMS_TEMPLATE.USER_ORG_NAME
  is '机构名称';
comment on column MMS_TEMPLATE.USER_ID
  is '用户编号';
comment on column MMS_TEMPLATE.USER_NAME
  is '用户名称';
comment on column MMS_TEMPLATE.IS_DEFAULT
  is '是否是缺省模板';
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
  is '彩信模板中的帧';
comment on column MMS_TMPL_FRAME.MMS_TMPL_FRAME_ID
  is '帧编号';
comment on column MMS_TMPL_FRAME.MMS_TEMPLATE_ID
  is '模板编号';
comment on column MMS_TMPL_FRAME.SEQUENCE_ID
  is '顺序号';
comment on column MMS_TMPL_FRAME.DURATION
  is '持续时间, 单位:秒';
comment on column MMS_TMPL_FRAME.FRAME_SIZE
  is '帧的大小';
comment on column MMS_TMPL_FRAME.PICTURE_NAME
  is '图片名称';
comment on column MMS_TMPL_FRAME.PICTURE_TYPE
  is '图片类型';
comment on column MMS_TMPL_FRAME.PICTURE_SIZE
  is '图片大小';
comment on column MMS_TMPL_FRAME.PICTURE_FILE
  is '图片文件';
comment on column MMS_TMPL_FRAME.AUDIO_NAME
  is '音乐名称';
comment on column MMS_TMPL_FRAME.AUDIO_TYPE
  is '音乐类型';
comment on column MMS_TMPL_FRAME.AUDIO_SIZE
  is '音乐大小';
comment on column MMS_TMPL_FRAME.AUDIO_FILE
  is '音乐文件';
comment on column MMS_TMPL_FRAME.MESSAGE_CONTENT
  is '文字内容';
comment on column MMS_TMPL_FRAME.MESSAGE_SIZE
  is '文字大小';
comment on column MMS_TMPL_FRAME.MESSAGE_LOCATION
  is '文字位置, TOP:上方, BOTTOM:下方';
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
  is '手机号段归属地表';
comment on column MOBILENUM_REGION.NUMSCOPE
  is '手机号段';
comment on column MOBILENUM_REGION.PROVINCE
  is '手机号段所属省';
comment on column MOBILENUM_REGION.CITY
  is '手机号段所属城市';
comment on column MOBILENUM_REGION.CARD_TYPE
  is '手机卡类型';
comment on column MOBILENUM_REGION.REGION_NUM
  is '邮政编码';
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
  is '手机号段所属运营商表的数据字典表';
comment on column MOBILE_COM.NUMSCOPE
  is '手机号段';
comment on column MOBILE_COM.MOBILE_COM
  is '运营商编号, 1:移动, 2:联通, 3:电信';
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
  is '手机号导入的临时表';
comment on column MOBILE_EXCEL_INFO.EXCEL_ID
  is 'Excel编号';
comment on column MOBILE_EXCEL_INFO.EXCEL_NAME
  is 'Excel名称';
comment on column MOBILE_EXCEL_INFO.MOBILE
  is '手机号';
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
  is '无效手机号码';
comment on column MOBILE_INVALID.MOBILE_ID
  is '无效手机号表的主键';
comment on column MOBILE_INVALID.MOBILE
  is '无效手机号';
comment on column MOBILE_INVALID.MOBILE_TYPE
  is '类型, 1:短信, 2:彩信';
comment on column MOBILE_INVALID.MOBILE_REMARK
  is '无效手机号的注释';
comment on column MOBILE_INVALID.CREATE_TIME
  is '添加无效手机号时的时间';
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
  is '手机号码临时存放表';
comment on column MOBILE_TEMP.MOBILE
  is '手机号';
comment on column MOBILE_TEMP.TYPE
  is '类型';
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
  is '维护带号转网号码表';
comment on column MOBILE_TO_OPERATORS.MOBILE
  is '手机号';
comment on column MOBILE_TO_OPERATORS.MOBILE_COM
  is '运营商编号, 1:移动,2:联通, 3:电信';
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
  is '手机登陆验证码';
comment on column MOBILE_VERCODE.MOBILE_VERCODE_ID
  is '主键';
comment on column MOBILE_VERCODE.CODE
  is '验证码';
comment on column MOBILE_VERCODE.LAST_SEND_TIME
  is '最近一次的发送时间';
comment on column MOBILE_VERCODE.USER_NAME
  is '收到短信的用户名称';
comment on column MOBILE_VERCODE.MOBILE_TO
  is '目标手机号';
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
  is '所有的白名单';
comment on column MOBILE_WHITE_LIST.WHITE_LIST_ID
  is '白名单编号';
comment on column MOBILE_WHITE_LIST.MOBILE
  is '手机号码';
comment on column MOBILE_WHITE_LIST.MOBILE_COM
  is '运营商编号, 1:移动, 2:联通, 3:电信';
comment on column MOBILE_WHITE_LIST.BATCH_ID
  is '批号';
comment on column MOBILE_WHITE_LIST.CREATE_TIME
  is '时间';
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
  is '通道的白名单';
comment on column MOBILE_WHITE_LIST_CHANNEL.WHITE_LIST_CHANNEL_ID
  is '白名单编号';
comment on column MOBILE_WHITE_LIST_CHANNEL.MOBILE
  is '手机号码';
comment on column MOBILE_WHITE_LIST_CHANNEL.CHANNEL_ID
  is '运营商编号, 1:移动, 2:联通, 3:电信';
comment on column MOBILE_WHITE_LIST_CHANNEL.STATUS
  is '状态, 0:未同步到移动的通道, 1:同步成功, -1:同步失败';
comment on column MOBILE_WHITE_LIST_CHANNEL.CREATE_TIME
  is '创建时间';
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
  is '白名单相关配置表';
comment on column MOBILE_WHITE_LIST_CONFIG.CONFIG_KEY
  is '配置项';
comment on column MOBILE_WHITE_LIST_CONFIG.CONFIG_VALUE
  is '配置值';
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
  is '监控数据详细表,主要用于查询之前的走势图查询';
comment on column MONITOR_DETAIL.ID
  is '系统id';
comment on column MONITOR_DETAIL.NOT_SENDCOUNT
  is '待发短信条数(状态包括0,2)';
comment on column MONITOR_DETAIL.SUBMITEDCOUNT
  is '已提交短信条数';
comment on column MONITOR_DETAIL.SEND_SUCCOUNT
  is '成功短信条数';
comment on column MONITOR_DETAIL.SEND_FAILCOUNT
  is '失败短信条数(状态包括6,7,8)';
comment on column MONITOR_DETAIL.SYS_TIME
  is '获取信息的时间';
comment on column MONITOR_DETAIL.MO_COUNT
  is '上行短信的条数';
comment on column MONITOR_DETAIL.CHANNEL
  is '通道号码';
comment on column MONITOR_DETAIL.SPEED
  is '速度';
comment on column MONITOR_DETAIL.CREATE_TIME
  is '创建时间';
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
  is '月账单中间表（余额记录表）';
comment on column MONTH_MAIN_INFO.MONTH_MAIN_INFO_ID
  is '主键';
comment on column MONTH_MAIN_INFO.USER_ID
  is '用户或机构id';
comment on column MONTH_MAIN_INFO.USER_TYPE
  is '被记录的用户类型 1:机构(true) 0:用户(false)';
comment on column MONTH_MAIN_INFO.REMAIN_QUOTA
  is '剩余条数';
comment on column MONTH_MAIN_INFO.REMAIN_FEE
  is '剩余金额';
comment on column MONTH_MAIN_INFO.MONTH_PAYMENT
  is '本月充值(金额或条数)';
comment on column MONTH_MAIN_INFO.TIME
  is '月份标记：如201312';
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
  is '月结单表';
comment on column MONTH_RECKONING_INFO.MONTH_RECKONING_ID
  is 'id';
comment on column MONTH_RECKONING_INFO.USER_ID
  is '账户id';
comment on column MONTH_RECKONING_INFO.ORGANIZATION_ID
  is '机构名称';
comment on column MONTH_RECKONING_INFO.MONTH_PAYMENT
  is '本期充值';
comment on column MONTH_RECKONING_INFO.MONTH_BEGIN_BALANCE
  is '起初账户余额';
comment on column MONTH_RECKONING_INFO.MONTH_END_BALANCE
  is '期末账户余额';
comment on column MONTH_RECKONING_INFO.SEND_QUANTITY
  is '当月发送数量';
comment on column MONTH_RECKONING_INFO.COST_FEE
  is '费用合计';
comment on column MONTH_RECKONING_INFO.RECORD_DATE
  is '记录时间';
comment on column MONTH_RECKONING_INFO.INNER_PAYMENT
  is '组内账户充值';
comment on column MONTH_RECKONING_INFO.MOBILE_COM
  is '运营商ID，1为移动，2为联通,3为电信,0为全网 ';
comment on column MONTH_RECKONING_INFO.CHANNEL_ID
  is '通道ID';
comment on column MONTH_RECKONING_INFO.ACCOUNT_TIME
  is '结算日期';
comment on column MONTH_RECKONING_INFO.UNIT_PRICE
  is '短信单价';
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
  is '机构上行短信的导出时间的记录表';
comment on column MO_LAST_EXPORT_TIME.ID
  is '主键id';
comment on column MO_LAST_EXPORT_TIME.ORG_ID
  is '机构id';
comment on column MO_LAST_EXPORT_TIME.USER_ID
  is '用户id';
comment on column MO_LAST_EXPORT_TIME.LAST_EXPORT_TIME
  is '上次导出时间';
comment on column MO_LAST_EXPORT_TIME.STATUS
  is '是否使用状态 0 不用  1 使用';
comment on column MO_LAST_EXPORT_TIME.CREATE_TIME
  is '该条创建日期';
comment on column MO_LAST_EXPORT_TIME.DESCRIPTION
  is '描述信息';
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
  is '在线支付订单表';
comment on column ORDER_INFO.ID
  is 'id';
comment on column ORDER_INFO.ORDERID
  is '订单编号 系统唯一';
comment on column ORDER_INFO.SUBJECT
  is '产品名称';
comment on column ORDER_INFO.PRICE
  is '价格（金额充值无该项）';
comment on column ORDER_INFO.TOTAL_FEE
  is '充值金额';
comment on column ORDER_INFO.QUANTITY
  is '充值总条数（金额充值无该项）';
comment on column ORDER_INFO.GIFT_QUANTITY
  is '赠送数量（金额充值无该项）';
comment on column ORDER_INFO.ORGID
  is '充值机构id';
comment on column ORDER_INFO.CREATER
  is '充值人';
comment on column ORDER_INFO.TYPE
  is '金额充值 / 配额充值 ： 0/1';
comment on column ORDER_INFO.INFOTYPE
  is '短信 / 彩信 ： 0/1  （金额充值无该项）';
comment on column ORDER_INFO.TRADE_STATE
  is '交易状态 0：待付款；1：充值中；2：充值成功；3：充值失败;4:交易关闭';
comment on column ORDER_INFO.CREATETIME
  is '创建订单时间';
comment on column ORDER_INFO.TRADETIME
  is '交易订单时间';
comment on column ORDER_INFO.ENDTIME
  is '交易结束时间';
comment on column ORDER_INFO.STATE
  is '订单状态   （默认0：显示；1：交易成功后页面删除订单(隐藏)）';
comment on column ORDER_INFO.REMARK
  is '备注';
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
  is '机构信息表';
comment on column ORGANIZATION.USER_ID
  is '机构编号';
comment on column ORGANIZATION.USER_NAME
  is '机构名称';
comment on column ORGANIZATION.USER_MOME
  is '注释';
comment on column ORGANIZATION.USER_BALANCE
  is '可用费用';
comment on column ORGANIZATION.CREATE_TIME
  is '创建时间';
comment on column ORGANIZATION.USER_STAT
  is '状态, 1:有效, 0:无效';
comment on column ORGANIZATION.EXTEND_NUMBER
  is '扩展号';
comment on column ORGANIZATION.ENG_SIGNATURE
  is '英文签名';
comment on column ORGANIZATION.CHN_SIGNATURE
  is '中文签名';
comment on column ORGANIZATION.USER_QUOTA
  is '短信配额';
comment on column ORGANIZATION.PAY_TYPE
  is '充值类型, 0:预付费, 1:后付费';
comment on column ORGANIZATION.PAY_MODE
  is '计费单位, 0:配额付费, 1:金额付费';
comment on column ORGANIZATION.FEE_MODE
  is '扣费方式, 0:自付费, 1:组付费';
comment on column ORGANIZATION.CHANNEL_TYPE
  is '是否区分通道, 0:不区分, 1:区分';
comment on column ORGANIZATION.MOBILE_TYPE
  is '是否区分号段, 0:不区分, 1:区分';
comment on column ORGANIZATION.SUPER_ORG_NO
  is '机构分类，用于联系人树状显示，6000：营业部；7000：代表处；8000：本部；9000：子公司';
comment on column ORGANIZATION.ORGAN_TYPE
  is '0:渠道 1:直客';
comment on column ORGANIZATION.MO_TYPE
  is '0:不接收上行 1:上行到机构 2:上行到用户';
comment on column ORGANIZATION.RECHARGE_EXPLAIN
  is '充值说明';
comment on column ORGANIZATION.MMS_QUOTA
  is '彩信配额';
comment on column ORGANIZATION.DEDUCT_MODE
  is '扣费方式 0:提交扣费 1:成功扣费';
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
  is '机构彩信发送调配表';
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
  is '金额机构余额表';
comment on column ORG_REMAIN_BALANCE.ROW_ID
  is '主键';
comment on column ORG_REMAIN_BALANCE.USER_ID
  is '机构ID';
comment on column ORG_REMAIN_BALANCE.STATUS
  is '状态, 1:有效, 0:无效';
comment on column ORG_REMAIN_BALANCE.SMS_QUOTA
  is '可用短信条数';
comment on column ORG_REMAIN_BALANCE.UNIT_PRICE
  is '单价';
comment on column ORG_REMAIN_BALANCE.GW_TYPE
  is '号段类型。0-全网路，1-移动号段，2-联通号段，3-小灵通号段';
comment on column ORG_REMAIN_BALANCE.UPDATE_UNITPRICE_DATE
  is '修改协议价时间';
comment on column ORG_REMAIN_BALANCE.UPDATE_USER
  is '修改人';
comment on column ORG_REMAIN_BALANCE.REMARK
  is '备注';
comment on column ORG_REMAIN_BALANCE.LAST_UPDATE_QUOTA_DATE
  is '最近一次修改余额时间';
comment on column ORG_REMAIN_BALANCE.USER_TYPE
  is '用户类型: 0用户  1机构';
comment on column ORG_REMAIN_BALANCE.MMS_QUOTA
  is '可用彩信条数';
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
  is '主键';
comment on column PAYMENT_RECORD.USER_ID
  is '充值的用户或者机构';
comment on column PAYMENT_RECORD.PAYMENT_TIME
  is '充值时间';
comment on column PAYMENT_RECORD.PAYMENT_MONEY
  is '充值的金额';
comment on column PAYMENT_RECORD.PAYMENT_QUOTA
  is '充值的配额';
comment on column PAYMENT_RECORD.OPERATOR_ID
  is '充值操作者';
comment on column PAYMENT_RECORD.PAYMENT_TYPE
  is '充值类型 1:金额  0:配额 2:金额冲账 3:金额补账 4:配额冲账 5:配额补账 6:返还失败短信配额 7:返还失败短信金额';
comment on column PAYMENT_RECORD.IS_ONLINE
  is '是否是在线充值 1:是 0:否';
comment on column PAYMENT_RECORD.USER_TYPE
  is '被记录的用户类型 1:机构(true) 0:用户(false)';
comment on column PAYMENT_RECORD.RECHARGE_EXPLAIN
  is '记录充值说明';
comment on column PAYMENT_RECORD.QUOTA_TYPE
  is '配额类型 1:短信 0:彩信';
comment on column PAYMENT_RECORD.IS_SUCCESS
  is '是否充值成功 1:成功 0:失败';
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
  is '主键';
comment on column PB_LIST_OF_VALUE.STATUS
  is '状态:0无效,1,有效';
comment on column PB_LIST_OF_VALUE.STAND_CODE
  is '字段编码';
comment on column PB_LIST_OF_VALUE.TYPE_ID
  is '类型';
comment on column PB_LIST_OF_VALUE.TYPE_NAME
  is '类型名';
comment on column PB_LIST_OF_VALUE.DISPLAY_VALUE
  is '显示名';
comment on column PB_LIST_OF_VALUE.VALUE_DESC
  is '值注释';
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
  is '许可词表';
comment on column PERMIT_WORD.ID
  is '主键';
comment on column PERMIT_WORD.PERMIT_WORD
  is '许可词';
comment on column PERMIT_WORD.DESCRIPTION
  is '备注';
comment on column PERMIT_WORD.CREATETIME
  is '创建时间';
comment on column PERMIT_WORD.MODIFYTIME
  is '修改时间';
comment on column PERMIT_WORD.CREATE_USER_ID
  is '创建者';
comment on column PERMIT_WORD.PERMIT_WORD_STATUS
  is '状态, 0:停用, 1:启用';
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
  is '常用短语组';
comment on column PHRASE_GROUP.GROUP_ID
  is '常用短语组编号';
comment on column PHRASE_GROUP.GROUP_NAME
  is '常用短语组名称';
comment on column PHRASE_GROUP.GROUP_REMARK
  is '备注';
comment on column PHRASE_GROUP.USER_ID
  is '用户编号';
comment on column PHRASE_GROUP.CREATE_TIME
  is '创建时间';
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
  is '常用短语';
comment on column PHRASE_INFO.PHRASE_ID
  is '短语编号';
comment on column PHRASE_INFO.PHRASE_NAME
  is '短语名称';
comment on column PHRASE_INFO.PHRASE_CONTENT
  is '短语内容';
comment on column PHRASE_INFO.PHRASE_REMARK
  is '备注';
comment on column PHRASE_INFO.GROUP_ID
  is '常用短语组编号';
comment on column PHRASE_INFO.CREATE_TIME
  is '创建时间';
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
  is '短信平台日志表';
comment on column PLAT_LOG.PLAT_LOG_ID
  is '日志编号';
comment on column PLAT_LOG.USER_ID
  is '操作者编号';
comment on column PLAT_LOG.USER_NAME
  is '操作者用户名';
comment on column PLAT_LOG.USER_ORGANIZATION
  is '操作者所属机构编号';
comment on column PLAT_LOG.USER_ORGANIZATION_NAME
  is '操作者所属机构名称';
comment on column PLAT_LOG.LOG_TYPE
  is '日志类型, 1:登入\登出, 4:系统开启\关闭, 8：日常信息, 9：错误信息';
comment on column PLAT_LOG.DESCRIPTION
  is '详细信息';
comment on column PLAT_LOG.LOG_TIME
  is '日志时间';
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
  is '套餐表';
comment on column PRICING_PACKAGE_INFO.ID
  is '主键id';
comment on column PRICING_PACKAGE_INFO.PACKAGENAME
  is '套餐名称';
comment on column PRICING_PACKAGE_INFO.TYPE
  is '套餐类型（0：短信/1：彩信）';
comment on column PRICING_PACKAGE_INFO.RULE
  is '套餐规则标志  0：多条一下；1：多少条到多少条间；2：多少条以上';
comment on column PRICING_PACKAGE_INFO.INFONUM1
  is '套餐条数1';
comment on column PRICING_PACKAGE_INFO.INFONUM2
  is '套餐条数2';
comment on column PRICING_PACKAGE_INFO.PRICE
  is '单价';
comment on column PRICING_PACKAGE_INFO.COUPON
  is '是否优惠(0:是；1:否)';
comment on column PRICING_PACKAGE_INFO.INFONUM3
  is '优惠条数1';
comment on column PRICING_PACKAGE_INFO.INFONUM4
  is '优惠条数2';
comment on column PRICING_PACKAGE_INFO.CREATEDATE
  is '创建日期';
comment on column PRICING_PACKAGE_INFO.CREATER
  is '创建人';
comment on column PRICING_PACKAGE_INFO.REMARK
  is '备注';
comment on column PRICING_PACKAGE_INFO.STATE
  is '状态 0：启用;1:停用';
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
  is '产品信息';
comment on column PRODUCT.PRODUCTID
  is '必须，服务产品唯一标识，该编号由管理员手工编写，短信编号为D001…，彩信产品为C001…该字段为主键';
comment on column PRODUCT.PRODUCTNAME
  is '必须，服务产品简要名称';
comment on column PRODUCT.CATALOGID
  is '服务目录的ID';
comment on column PRODUCT.DESCRIPTION
  is '服务产品特性等的说明文字';
comment on column PRODUCT.RESERVEDINT
  is '备用';
comment on column PRODUCT.RESERVEDCHAR
  is 'JSON格式串记录此能发布产品内容的机构ID格式';
comment on column PRODUCT.STAUTUS
  is '0:可用，1:冻结；暂保留功能';
comment on column PRODUCT.CREATETIME
  is '产品创建时间';
comment on column PRODUCT.MODIFYTIME
  is '产品修改时间';
comment on column PRODUCT.USER_ID
  is '用户编号';
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
  is '为机构配置产品的配置项';
comment on column PRODUCT_ORGANIZATION_ITEMS.ID
  is 'ID';
comment on column PRODUCT_ORGANIZATION_ITEMS.PRODUCTID
  is '产品编号';
comment on column PRODUCT_ORGANIZATION_ITEMS.ORGANIZATIONID
  is '机构编号';
comment on column PRODUCT_ORGANIZATION_ITEMS.STATUS
  is '记录状态';
comment on column PRODUCT_ORGANIZATION_ITEMS.ITEMSJSON
  is '当前机构针对当前产品的配置项信息';
comment on column PRODUCT_ORGANIZATION_ITEMS.CREATETIME
  is '创建时间';
comment on column PRODUCT_ORGANIZATION_ITEMS.MODIFYTIME
  is '修改时间';
comment on column PRODUCT_ORGANIZATION_ITEMS.RESERVEDINT
  is 'INT备用字段,记录了当前配置的优先级1-8数字越大优先级越高';
comment on column PRODUCT_ORGANIZATION_ITEMS.RESERVEDCHAR
  is 'CHAR备用字段';
comment on column PRODUCT_ORGANIZATION_ITEMS.ISEXTENDS
  is '对应组是否可以继承所在机构对应产品配置项信息；0:不继随；1：继承';
comment on column PRODUCT_ORGANIZATION_ITEMS.GROUPID
  is '组ID';
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
  is '违禁词表';
comment on column PROHIBITEDWORD.ID
  is '主键';
comment on column PROHIBITEDWORD.PROHIBITEDWORD
  is '违禁词';
comment on column PROHIBITEDWORD.DESCRIPTION
  is '备注';
comment on column PROHIBITEDWORD.CREATETIME
  is '创建时间';
comment on column PROHIBITEDWORD.MODIFYTIME
  is '修改时间';
comment on column PROHIBITEDWORD.CREATE_USER
  is '创建者';
comment on column PROHIBITEDWORD.CLASS_ID
  is '违禁词分类Id';
comment on column PROHIBITEDWORD.STATUS
  is '违禁词状态, 0:停用, 1:启用';
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
  is '违禁词分类表';
comment on column PROHIBITEDWORD_CLASS.ID
  is '主键';
comment on column PROHIBITEDWORD_CLASS.NAME
  is '分类名字';
comment on column PROHIBITEDWORD_CLASS.DESCRIPTION
  is '备注';
comment on column PROHIBITEDWORD_CLASS.CREATETIME
  is '创建时间';
comment on column PROHIBITEDWORD_CLASS.CREATE_USER
  is '创建者';
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
  is '违禁词表';
comment on column PROHIBIT_WORD.ID
  is '主键';
comment on column PROHIBIT_WORD.PROHIBIT_WORD
  is '违禁词';
comment on column PROHIBIT_WORD.DESCRIPTION
  is '备注';
comment on column PROHIBIT_WORD.CREATETIME
  is '创建时间';
comment on column PROHIBIT_WORD.MODIFYTIME
  is '修改时间';
comment on column PROHIBIT_WORD.CREATE_USER_ID
  is '创建者ID';
comment on column PROHIBIT_WORD.PROHIBITED_WORD_STATUS
  is '违禁词状态, 0:停用, 1:启用';
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
  is '点播短信管理';
comment on column RECBIZ_DB.DB_ID
  is '编号';
comment on column RECBIZ_DB.DB_NAME
  is '点播的名字';
comment on column RECBIZ_DB.DB_CONTENT
  is '点播的内容';
comment on column RECBIZ_DB.DB_CHANNEL
  is '点播的通道';
comment on column RECBIZ_DB.DB_USER
  is '添加点播的机构';
comment on column RECBIZ_DB.DB_SERVICE
  is '点播的特服号';
comment on column RECBIZ_DB.REMARK
  is '备注';
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
  is '资源表';
comment on column RESOURCE_INFO.RESOURCE_ID
  is '资源编号';
comment on column RESOURCE_INFO.RESOURCE_NAME
  is '资源名称';
comment on column RESOURCE_INFO.RESOURCE_CONTENT
  is '资源内容';
comment on column RESOURCE_INFO.RESOURCE_TYPE_ID
  is '资源类型';
comment on column RESOURCE_INFO.RESOURCE_REMARK
  is '资源备注';
comment on column RESOURCE_INFO.RESOURCE_PARENTID
  is '父资源id';
comment on column RESOURCE_INFO.RESOURCE_ACCESS
  is '资源访问属性,0:普通资源, 1:系统资源';
comment on column RESOURCE_INFO.RESOURCE_IMAGE
  is '显示图片';
comment on column RESOURCE_INFO.RESOURCE_SORT
  is '显示顺序';
comment on column RESOURCE_INFO.IS_DEFAULT
  is '是否是默认显示';
comment on column RESOURCE_INFO.RESOURCE_ROLE_TYPE
  is '资源权限类型，SYSTEM:系统权限，ORGADMIN：机构管理员，COMMON：普通权限';
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
  is '访问控制列表，授予用户对某资源有某角色（即一组权限）';
comment on column SEC_ACL.RESOURCE_ID
  is '资源编号';
comment on column SEC_ACL.RESOURCE_TYPE
  is '资源类型,ColumnCategory为栏目，ColumnInfo为栏目分类';
comment on column SEC_ACL.ROLE_ID
  is '角色编号';
comment on column SEC_ACL.PARTY_ID
  is '被授权人';
comment on column SEC_ACL.PARTY_TYPE
  is '被授权类型';
comment on column SEC_ACL.CREATED_BY
  is '操作人';
comment on column SEC_ACL.CREATED_BY_NAME
  is '操作人名称';
comment on column SEC_ACL.IS_DEFAULT
  is '是否缺省用户';
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
  is 'Party和角色';
comment on column SEC_PARTY_ROLE.PARTY_TYPE
  is 'Party类型';
comment on column SEC_PARTY_ROLE.PARTY_ID
  is 'Party编号';
comment on column SEC_PARTY_ROLE.ROLE_ID
  is '角色编号';
comment on column SEC_PARTY_ROLE.IS_DEFAULT
  is '是否缺省用户';
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
  is '权限的数据字典';
comment on column SEC_PERMISSION.RESOURCE_TYPE
  is '资源类型：菜单、栏目、栏目分类、客户';
comment on column SEC_PERMISSION.PERMISSION_TYPE
  is '操作权限，例如VIEW、CREATE......';
comment on column SEC_PERMISSION.DESCRIPTION
  is '备注';
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
  is '资源类型表';
comment on column SEC_RESOURCE_TYPE.RESOURCE_TYPE
  is '资源类型, 菜单、栏目、栏目分类、客户';
comment on column SEC_RESOURCE_TYPE.SEQUENCE_ID
  is '序号';
comment on column SEC_RESOURCE_TYPE.RESOURCE_TYPE_CODE
  is '资源类型编号';
comment on column SEC_RESOURCE_TYPE.RESOURCE_TYPE_NAME
  is '资源类型名称';
comment on column SEC_RESOURCE_TYPE.IS_FOR_INSTANCE
  is '此种资源是否需要向资源实例授权，Y则不可以直接授权给用户该类资源的角色，N则可以';
comment on column SEC_RESOURCE_TYPE.DESCRIPTION
  is '备注';
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
  is '角色实体';
comment on column SEC_ROLE.ROLE_ID
  is '系统编号';
comment on column SEC_ROLE.ROLE_TYPE
  is '角色类型，对于类型是SYSTEM的角色页面不可见、不可编辑，但是后台会使用，COMMON则可以';
comment on column SEC_ROLE.RESOURCE_TYPE
  is '资源类型：菜单、栏目、栏目分类、客户';
comment on column SEC_ROLE.ROLE_NAME
  is '角色名称';
comment on column SEC_ROLE.DESCRIPTION
  is '备注';
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
  is '角色拥有的权限';
comment on column SEC_ROLE_PERMISSION.ROLE_ID
  is '角色的编号';
comment on column SEC_ROLE_PERMISSION.RESOURCE_TYPE
  is '资源类型';
comment on column SEC_ROLE_PERMISSION.RESOURCE_ID
  is '权限';
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
  is '角色类型';
comment on column SEC_ROLE_TYPE.ROLE_TYPE
  is '角色类型，对于类型是SYSTEM的角色页面不可见、不可编辑，但是后台会使用，COMMON则可以';
comment on column SEC_ROLE_TYPE.ROLE_NAME
  is '角色名称';
comment on column SEC_ROLE_TYPE.DESCRIPTION
  is '备注';
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
  is '下行短信信息表';
comment on column SEND.SEND_ID
  is '下行短信序号，下行短信的唯一标识';
comment on column SEND.MOBILE_TO
  is '目标手机号';
comment on column SEND.SEND_MSG
  is '短信内容';
comment on column SEND.SP_SERV_NO
  is '扩展号';
comment on column SEND.SYS_TIME
  is '入库时间';
comment on column SEND.PRIOR_ID
  is '优先级，只有3个优先级，3为最高 ,8为最低，5为中等优先级';
comment on column SEND.PRE_SEND_TIME
  is '预计发送时间';
comment on column SEND.SEND_STATUS
  is '发送状态 -2未计费, 0待发, 1已提交, 2发送中, 4已删除, 5发送成功, 6发送失败, 7系统黑名单.8 违禁词保留如下状态：-1计划任务 3重发中 8二次重发失败。其它待定';
comment on column SEND.SEND_TIME
  is '平台发送该短信的时间';
comment on column SEND.COM_RTN_TIME
  is '发送后移动或联通网关返回结果的时间';
comment on column SEND.ERR_MSG
  is '发送失败时，移动联通网关返回的错误信息，只有在发送失败时，该字段有值，其余时候未空';
comment on column SEND.REPORT
  is '手机接收状态报告。保留字段';
comment on column SEND.REPORT_TIME
  is '手机接收状态报告返回时间';
comment on column SEND.CHANNEL_ID
  is '通道ID';
comment on column SEND.MOBILE_COM
  is '运营商ID，1为移动，2为联通,3为电信';
comment on column SEND.REMARK
  is '备注信息，作为外部系统扩展用，CC短信系统该字段填写基金账号';
comment on column SEND.USER_ID
  is '由用户id更改为短信所属人';
comment on column SEND.SEQUENCE
  is '网关序列';
comment on column SEND.MOBILE_QUANTITIES
  is '本条信息的数量';
comment on column SEND.RESEND_TIMES
  is '平台向网关提交该短信的次数';
comment on column SEND.SIGNATURE
  is '签名';
comment on column SEND.USER_ORGANIZATION
  is '用户组id';
comment on column SEND.BATCH_ID
  is '批次号';
comment on column SEND.MSG_TYPE
  is '信息类型,记录短信产生的方式';
comment on column SEND.CONSUME_SEND_ID
  is '客户端短信id。';
comment on column SEND.IS_LONGSMS
  is '该短信是否是长短信,0:不是长短信,1:是长短信';
comment on column SEND.IS_ORIGINAL_SMS
  is '该短信是否是原始短信,非原始短信指长短信发送时拆分出的短信,0:是原始短信, 1:不是原始短信';
comment on column SEND.ORIGINALSMS_SENDID
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column SEND.CURRENT_PAGENO
  is '当前短信的页号,即长短信的第几条短短信';
comment on column SEND.ORIGINALSMS_TOTALPAGES
  is '本条短短信所属长短信共有短信的页数';
comment on column SEND.LONGSMS_TAG
  is '长短信都标识符：同一条长短信的短短信该标识相同';
comment on column SEND.LONGSMS_SPLITED
  is '长短信是否被拆分：0没有被拆分或者是普通短信；1已经被拆分。被拆分的短信查询统计时不应计算数量。默认0';
comment on column SEND.GW_SUBMIT_TIME
  is '提交到网关的时间';
comment on column SEND.GW_DONE_TIME
  is '手机收到短信的时间';
comment on column SEND.UNIT_PRICE
  is '短信单价';
comment on column SEND.RETURN_FEE
  is '是否已给这条短信返还费用,0:没返还,1:已返还';
comment on column SEND.RECEIVE_ID
  is 'CMPP账号';
comment on column SEND.OPERATOR_ID
  is '短信发送人(短信发送的操作者)';
comment on column SEND.DEDUCT_FEE_STATUS
  is '扣除费用状态:0-扣费失败,1-扣费成功。(暂时为CMPP接口短信使用,渠道网站发的短信不用此字段)';
comment on column SEND.EXTRA_KEYWORD_NUM
  is '增加了退订关键字后，增加的条数';
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
  is '保留每次计算发送完短信需要到的时间记录';
comment on column SEND_SPEED_TIME.ID
  is '系统id';
comment on column SEND_SPEED_TIME.NOT_SENDCOUNT
  is '待发短信条数(状态包括0,2)';
comment on column SEND_SPEED_TIME.CHANNEL
  is '通道号码';
comment on column SEND_SPEED_TIME.SPEED
  is '速度';
comment on column SEND_SPEED_TIME.TIME
  is '需要花费的时间,单位是秒';
comment on column SEND_SPEED_TIME.STATUS
  is '1正常,2繁忙,3异常';
comment on column SEND_SPEED_TIME.SYS_TIME
  is '获取信息的时间';
comment on column SEND_SPEED_TIME.CREATE_TIME
  is '创建时间';
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
  is '各状态的总数表';
comment on column SEND_STATICS_QUANTITY.CHANNEL_ID
  is '0为所有通道';
comment on column SEND_STATICS_QUANTITY.TOTAL_QUANTITY
  is '总数';
comment on column SEND_STATICS_QUANTITY.WAIT_SEND_QUANTITY
  is '待发送总数,状态为0';
comment on column SEND_STATICS_QUANTITY.SENDING_QUANTITY
  is '待发送总数,状态为2';
comment on column SEND_STATICS_QUANTITY.SENT_QUANTITY
  is '已提交总数';
comment on column SEND_STATICS_QUANTITY.SUCCESS_QUANTITY
  is '成功总数';
comment on column SEND_STATICS_QUANTITY.FAILED_QUANTITY
  is '失败总数';
comment on column SEND_STATICS_QUANTITY.BLACK_QUANTITY
  is '黑名单总数';
comment on column SEND_STATICS_QUANTITY.PROHIBITED_QUANTITY
  is '违禁词总数';
comment on column SEND_STATICS_QUANTITY.RECEIVE_QUANTITY
  is '上行总数';
comment on column SEND_STATICS_QUANTITY.CREATE_TIME
  is '创建的时间';
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
  is '各状态的总数表';
comment on column SEND_STATICS_QUANTITY_TEMP.CHANNEL_ID
  is '0为所有通道';
comment on column SEND_STATICS_QUANTITY_TEMP.TOTAL_QUANTITY
  is '总数';
comment on column SEND_STATICS_QUANTITY_TEMP.WAIT_SEND_QUANTITY
  is '待发送总数,状态为0';
comment on column SEND_STATICS_QUANTITY_TEMP.SENDING_QUANTITY
  is '待发送总数,状态为2';
comment on column SEND_STATICS_QUANTITY_TEMP.SENT_QUANTITY
  is '已提交总数';
comment on column SEND_STATICS_QUANTITY_TEMP.SUCCESS_QUANTITY
  is '成功总数';
comment on column SEND_STATICS_QUANTITY_TEMP.FAILED_QUANTITY
  is '失败总数';
comment on column SEND_STATICS_QUANTITY_TEMP.BLACK_QUANTITY
  is '黑名单总数';
comment on column SEND_STATICS_QUANTITY_TEMP.PROHIBITED_QUANTITY
  is '违禁词总数';
comment on column SEND_STATICS_QUANTITY_TEMP.RECEIVE_QUANTITY
  is '上行总数';
comment on column SEND_STATICS_QUANTITY_TEMP.CREATE_TIME
  is '创建的时间';
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
  is 'CMPP账户通道表';
comment on column SGW_ACCOUNT_CHANNEL.ID
  is '主键';
comment on column SGW_ACCOUNT_CHANNEL.SGW_ID
  is '网关ID';
comment on column SGW_ACCOUNT_CHANNEL.SP_NUMBER
  is '特服号';
comment on column SGW_ACCOUNT_CHANNEL.CHANNEL_ID
  is '通道ID';
comment on column SGW_ACCOUNT_CHANNEL.SUB_EXTEND_NUMBER
  is '子扩展号';
comment on column SGW_ACCOUNT_CHANNEL.MOBILE_COM
  is '运营商编号, 1:移动, 2:联通, 3:电信';
comment on column SGW_ACCOUNT_CHANNEL.CHANNEL_STATUS
  is '通道状态 0:停用, 1:启用';
comment on column SGW_ACCOUNT_CHANNEL.SYS_TIME
  is '入库时间';
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
  is 'CMPP网关信息表';
comment on column SGW_ACCOUNT_INFO.SGW_ID
  is '网关ID';
comment on column SGW_ACCOUNT_INFO.USER_ID
  is '用户UUID';
comment on column SGW_ACCOUNT_INFO.ACCOUNT_PASS
  is 'CMPP账户明文密码';
comment on column SGW_ACCOUNT_INFO.REGISTED_IP
  is '认证IP';
comment on column SGW_ACCOUNT_INFO.PRIOR_ID
  is '优先级';
comment on column SGW_ACCOUNT_INFO.FLUX_LIMIT
  is '流控';
comment on column SGW_ACCOUNT_INFO.MT_WORKER_NUM
  is '下行处理线程数量';
comment on column SGW_ACCOUNT_INFO.MT_CACHE_NUM
  is '下行缓存队列长度';
comment on column SGW_ACCOUNT_INFO.SERVER_ACTIVE_TEST
  is '服务端发送链路检测 0:不发送, 1:发送';
comment on column SGW_ACCOUNT_INFO.IS_CHANNEL_ACCOUNT
  is '是否渠道账号， 0:否, 1:是';
comment on column SGW_ACCOUNT_INFO.SIGNATURE_TYPE
  is '签名类型：1：普通网关签名；2：子端口网关签名；3：自主签名（需要通过签名池过滤检查）';
comment on column SGW_ACCOUNT_INFO.CHECK_PROHIBITEDWORD
  is '是否检查违禁词， 0:否, 1:是';
comment on column SGW_ACCOUNT_INFO.COMMENTS
  is '备注';
comment on column SGW_ACCOUNT_INFO.SYS_TIME
  is '入库时间';
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
  is '网关客户表';
comment on column SGW_CUSTOMER.CUSTOMER_ID
  is '客户ID';
comment on column SGW_CUSTOMER.CUSTOMER_NAME
  is '客户名称';
comment on column SGW_CUSTOMER.P_CUSTOMER_ID
  is '父客户ID：顶级为0';
comment on column SGW_CUSTOMER.USER_ID
  is '用户UUID';
comment on column SGW_CUSTOMER.ORG_ID
  is '机构编号';
comment on column SGW_CUSTOMER.SUB_EXTEND_NUMBER
  is '子扩展号';
comment on column SGW_CUSTOMER.COMMENTS
  is '备注';
comment on column SGW_CUSTOMER.CUSTOMER_STATUS
  is '账号状态 0:停用, 1:启用';
comment on column SGW_CUSTOMER.SYS_TIME
  is '入库时间';
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
  is '上行短信任务非HTTP推送处理表';
comment on column SGW_MO_TASK.MOBILE_FROM
  is '上行手机号码';
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
  is '短信网关状态报告任务表';
comment on column SGW_REPORT_TASK.TASK_ID
  is '任务编号';
comment on column SGW_REPORT_TASK.SEND_ID
  is '短信编号';
comment on column SGW_REPORT_TASK.MOBILE_TO
  is '手机号';
comment on column SGW_REPORT_TASK.DESTNATION_ID
  is '特服号';
comment on column SGW_REPORT_TASK.STAT
  is '状态码';
comment on column SGW_REPORT_TASK.MSG_ID
  is '分配给客户端的短信编号';
comment on column SGW_REPORT_TASK.USER_ORGANIZATION
  is '机构编号';
comment on column SGW_REPORT_TASK.USER_ID
  is '用户编号';
comment on column SGW_REPORT_TASK.CHANNEL_ID
  is '通道编号';
comment on column SGW_REPORT_TASK.SYS_TIME
  is '入库时间';
comment on column SGW_REPORT_TASK.SUBMIT_TIME
  is '短信提交时间';
comment on column SGW_REPORT_TASK.DONE_TIME
  is '短信发送时间';
comment on column SGW_REPORT_TASK.REPORT_TIME
  is '状态报告时间';
comment on column SGW_REPORT_TASK.PUSH_STATUS
  is '推送状态：0：待推送；2：推送中；5：推送成功；6：推送失败';
comment on column SGW_REPORT_TASK.NEXT_PUSH_TIME
  is '下次推送时间';
comment on column SGW_REPORT_TASK.PUSH_TIMES
  is '推送次数';
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
  is '网关状态报告任务处理历史表';
comment on column SGW_REPORT_TASK_HIS.TASK_ID
  is '任务编号';
comment on column SGW_REPORT_TASK_HIS.SEND_ID
  is '短信编号';
comment on column SGW_REPORT_TASK_HIS.MOBILE_TO
  is '手机号';
comment on column SGW_REPORT_TASK_HIS.DESTNATION_ID
  is '特服号';
comment on column SGW_REPORT_TASK_HIS.STAT
  is '状态码';
comment on column SGW_REPORT_TASK_HIS.MSG_ID
  is '分配给客户端的短信编号';
comment on column SGW_REPORT_TASK_HIS.USER_ORGANIZATION
  is '机构编号';
comment on column SGW_REPORT_TASK_HIS.USER_ID
  is '用户编号';
comment on column SGW_REPORT_TASK_HIS.CHANNEL_ID
  is '通道编号';
comment on column SGW_REPORT_TASK_HIS.SYS_TIME
  is '入库时间';
comment on column SGW_REPORT_TASK_HIS.SUBMIT_TIME
  is '短信提交时间';
comment on column SGW_REPORT_TASK_HIS.DONE_TIME
  is '短信发送时间';
comment on column SGW_REPORT_TASK_HIS.REPORT_TIME
  is '状态报告时间';
comment on column SGW_REPORT_TASK_HIS.PUSH_STATUS
  is '推送状态';
comment on column SGW_REPORT_TASK_HIS.NEXT_PUSH_TIME
  is '下次推送时间';
comment on column SGW_REPORT_TASK_HIS.PUSH_TIMES
  is '推送次数';
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
  is '网关客户签名池表';
comment on column SGW_SIGNATURE_POOL.SIGNATURE_ID
  is '签名ID';
comment on column SGW_SIGNATURE_POOL.CUSTOMER_ID
  is '客户ID';
comment on column SGW_SIGNATURE_POOL.SIGNATURE
  is '签名';
comment on column SGW_SIGNATURE_POOL.DESCRIPTION
  is '描述';
comment on column SGW_SIGNATURE_POOL.SORT_INDEX
  is '排序编号';
comment on column SGW_SIGNATURE_POOL.DO_APPEND_MSG
  is '是否自动添加短信内容 0:不添加, 1:添加';
comment on column SGW_SIGNATURE_POOL.APPEND_MSG
  is '自动添加的短信内容';
comment on column SGW_SIGNATURE_POOL.BLACK_LEVEL
  is '黑名单级别：0：只检测BLACK黑名单；1：检测BLACK和BLACK_CSMD黑名单；2：检测BLACK和BLACK_CSMD、BLACK_ZHUOYUE黑名单';
comment on column SGW_SIGNATURE_POOL.COMMENTS
  is '备注';
comment on column SGW_SIGNATURE_POOL.SIGNATURE_STATUS
  is '状态 0:停用, 1:启用';
comment on column SGW_SIGNATURE_POOL.SYS_TIME
  is '入库时间';
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
  is '所属用户组';
comment on column SMS_BIR_CONFIG.USER_GROUP_NAME
  is ' 所属用户组名称';
comment on column SMS_BIR_CONFIG.DO_CONGRATULATIONS
  is '是否进行生日祝福';
comment on column SMS_BIR_CONFIG.SOURCE_ENTITY_NAME
  is '数据源名称';
comment on column SMS_BIR_CONFIG.ACCOUNT_NAME_FIELD
  is '客户姓名字段';
comment on column SMS_BIR_CONFIG.ACCOUNT_BIRTHDAY_FIELD
  is '生日字段';
comment on column SMS_BIR_CONFIG.MOBILE_NUMBER_FIELD
  is '手机号码字段';
comment on column SMS_BIR_CONFIG.MESSAGE_TEMPLATE
  is '短信模板';
comment on column SMS_BIR_CONFIG.SEND_TIME
  is '短信发送时间';
comment on column SMS_BIR_CONFIG.GROUP_IDS
  is '群组ID';
comment on column SMS_BIR_CONFIG.USER_ID
  is ' 所属用户';
comment on column SMS_BIR_CONFIG.USER_NAME
  is ' 所属用户名称';
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
  is '发送时间';
comment on column SMS_BIR_RECORD.SEND_TIME
  is '短信发送时间';
comment on column SMS_BIR_RECORD.STATUS
  is '2:已发送';
comment on column SMS_BIR_RECORD.SEND_QUANTITY
  is '发送数量';
comment on column SMS_BIR_RECORD.TEMPLATE
  is '短信模板';
comment on column SMS_BIR_RECORD.USER_NAME
  is '用户名';
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
  is '短信通道规则表';
comment on column SMS_CHANNEL_RULE_SET.RULE_SET_ID
  is '规则编号';
comment on column SMS_CHANNEL_RULE_SET.RULE_SET_NAME
  is '规则名称';
comment on column SMS_CHANNEL_RULE_SET.RULE_SET_TYPE
  is '规则类型, ITEMS:手工输入的规则, DECISIONTABLE:决策表';
comment on column SMS_CHANNEL_RULE_SET.DC_FILE_PATH
  is '决策表保存路径';
comment on column SMS_CHANNEL_RULE_SET.RULE_STATUS
  is '状态, -1:草稿状态, 0:备选, 1:生效';
comment on column SMS_CHANNEL_RULE_SET.USER_ORGANIZATION
  is '机构编号';
comment on column SMS_CHANNEL_RULE_SET.USER_ORG_NAME
  is '机构名称';
comment on column SMS_CHANNEL_RULE_SET.USER_ID
  is '用户编号';
comment on column SMS_CHANNEL_RULE_SET.USER_NAME
  is '用户名称';
comment on column SMS_CHANNEL_RULE_SET.DESCRIPTIONS
  is '备注';
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
  is '短信通道规则表明细表';
comment on column SMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ID
  is '规则编号';
comment on column SMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_ID
  is '规则明细编号';
comment on column SMS_CHANNEL_RULE_SET_ITEM.RULE_SET_ITEM_NAME
  is '规则名称';
comment on column SMS_CHANNEL_RULE_SET_ITEM.SALIENCE
  is '优先级';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MESSAGE_CLASS
  is '信息分类, 可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.SYS_ID
  is '信息来源, 可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MESSAGE_TYPE
  is '信息性质, 可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.ORG_ID
  is '机构编号, 可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.USER_ID
  is '用户编号, 可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MOBILE_COM
  is '运营商, 可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.IS_WAPPUSH
  is '是否是WAPPUSH短信, true:是, false:不是';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NUM_SCOPE
  is '号段';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NUM_REGION
  is '手机所属区域';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MOBILE
  is '手机号码，可以多选';
comment on column SMS_CHANNEL_RULE_SET_ITEM.IS_LONG_SMS
  is '是否是长短信，用于在选择规则时进行判断';
comment on column SMS_CHANNEL_RULE_SET_ITEM.CHANNEL_ID
  is '所选通道';
comment on column SMS_CHANNEL_RULE_SET_ITEM.MSG_TYPE
  is '信息类型';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DAY_START_TIME
  is '白天开始时间';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DAY_END_TIME
  is '白天结束时间';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NIGHT_START_TIME
  is '夜间开始时间';
comment on column SMS_CHANNEL_RULE_SET_ITEM.NIGHT_END_TIME
  is '夜间结束时间';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_CHANNEL_ID
  is '缺省使用的通道';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_MOBILE_CHANNEL_ID
  is '缺省使用的移动通道';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_UNION_CHANNEL_ID
  is '缺省使用的联通通道';
comment on column SMS_CHANNEL_RULE_SET_ITEM.DEFAULT_DX_CHANNEL_ID
  is '缺省使用的电信通道';
comment on column SMS_CHANNEL_RULE_SET_ITEM.USE_CHANNEL_ID
  is '最终使用的通道编号';
comment on column SMS_CHANNEL_RULE_SET_ITEM.USE_LONG_SMS
  is '是否使用长短信方式发送';
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
  is '短信通道状态报告表';
comment on column SMS_ERR_CODE.CHANNEL_ID
  is '通道编号';
comment on column SMS_ERR_CODE.ERR_CODE
  is '错误码';
comment on column SMS_ERR_CODE.ERR_DESC
  is '说明';
comment on column SMS_ERR_CODE.SUGGESTION
  is '处理建议';
comment on column SMS_ERR_CODE.DESCRIPTION
  is '备注';
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
  is '短信归档表';
comment on column SMS_HIS.SMS_HIS_ID
  is 'id';
comment on column SMS_HIS.SEND_STATUS
  is '发送状态';
comment on column SMS_HIS.USER_ORGANIZATION
  is '机构';
comment on column SMS_HIS.CHANNEL_ID
  is '通道';
comment on column SMS_HIS.MOBILE_COM
  is '运营商';
comment on column SMS_HIS.SYS_ID
  is '信息来源';
comment on column SMS_HIS.MESSAGE_TYPE
  is '信息性质';
comment on column SMS_HIS.MESSAGE_CLASS
  is '信息分类';
comment on column SMS_HIS.BATCH_ID
  is '批次号';
comment on column SMS_HIS.MOBILE_QUANTITIES
  is '发送总量';
comment on column SMS_HIS.SEND_TIME
  is '发送时间';
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
  is '信息分类数据字典';
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
  is '信息性质数据字典';
comment on column SMS_MESSAGE_TYPE.SMS_MESSAGE_TYPE_ID
  is '信息性质编号';
comment on column SMS_MESSAGE_TYPE.SMS_MESSAGE_TYPE_NAME
  is '信息性质名称';
comment on column SMS_MESSAGE_TYPE.DEFAULT_PRIORITY
  is '缺省的优先级';
comment on column SMS_MESSAGE_TYPE.MAX_PRIORITY
  is '最高优先级';
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
  is '业务短信分派表';
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
  is '业务短信分派类型表';
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
  is '上行Id';
comment on column SMS_RECEIVE.MOBILE_FROM
  is '上行号码';
comment on column SMS_RECEIVE.RECEIVE_MSG
  is '上行短信';
comment on column SMS_RECEIVE.SYS_TIME
  is '上行时间';
comment on column SMS_RECEIVE.SP_NUM
  is '特服号，上行短信时输入或回复的完整号码';
comment on column SMS_RECEIVE.EXT_NUM
  is '扩展号';
comment on column SMS_RECEIVE.CHANNEL_ID
  is '上行短信的通道编号 默认0';
comment on column SMS_RECEIVE.ORG_ID
  is '上行所属机构';
comment on column SMS_RECEIVE.USER_ID
  is '上行所属用户';
comment on column SMS_RECEIVE.RECEIVE_STATUS
  is '短信状态, 0:未被业务系统读取, 1:已被业务系统读取, 业务系统读取上行短信后应将该字段置为1 默认0';
comment on column SMS_RECEIVE.READ_TIME
  is '业务系统读取短信的时间';
comment on column SMS_RECEIVE.MSG_ID
  is '生成短信的业务系统的短信编号';
comment on column SMS_RECEIVE.REMARK
  is '保留字段';
comment on column SMS_RECEIVE.MSG_TYPE
  is '上行短信的类型：0:咨询短信，1：点播短信,2：短信调查 默认值0';
comment on column SMS_RECEIVE.REPLY_MSG
  is '回复内容';

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
  is '接收表';
comment on column SMS_RECEIVE_OLD.RECEIVE_ID
  is '上行短信编号, UUID';
comment on column SMS_RECEIVE_OLD.MOBILE_FROM
  is '上行短信的手机号';
comment on column SMS_RECEIVE_OLD.RECEIVE_MSG
  is '上行短信内容';
comment on column SMS_RECEIVE_OLD.SYS_TIME
  is '上行短信时间';
comment on column SMS_RECEIVE_OLD.SYS_DATE_ID
  is '上行短信日期(格式YYYYMMDD)';
comment on column SMS_RECEIVE_OLD.SP_NUM
  is '特服号，上行短信时输入或回复的完整号码';
comment on column SMS_RECEIVE_OLD.SYS_EXT
  is '信息来源（各业务系统）对应的扩展号（如上行特服号SP_NUM为95551121234，则SYS_EXT内容为12[（参照业务系统对应扩展号表字典）是否制定为2位，各系统对应的机构如何发布给各业务系统]。各业务系统根据“业务系统对应扩展号”来匹配哪条上行信息属于本系统的短信';
comment on column SMS_RECEIVE_OLD.EXT_NUM
  is '业务扩展码，对应业务系统的业务编号（如上行特服号SP_NUM为95551121234，则BIZ_EXT内容为1234，匹配下行表sms_send中的EXT_NUM[建议名称统一]字段）';
comment on column SMS_RECEIVE_OLD.CHANNEL_ID
  is '上行短信的通道编号';
comment on column SMS_RECEIVE_OLD.ORG_ID
  is '上行短信所属机构';
comment on column SMS_RECEIVE_OLD.RECEIVE_STATUS
  is '短信状态, 0:未被业务系统读取, 1:已被业务系统读取, 业务系统读取上行短信后应将该字段置为1,以免重复读取';
comment on column SMS_RECEIVE_OLD.READ_TIME
  is '业务系统读取短信的时间';
comment on column SMS_RECEIVE_OLD.SYS_ID
  is '业务系统的编号, 用于标识短信属于哪个业务系统,例如客户关系管理系统为CRM';
comment on column SMS_RECEIVE_OLD.MSG_ID
  is '生成短信的业务系统的短信编号';
comment on column SMS_RECEIVE_OLD.REMARK
  is '保留字段，无用';
comment on column SMS_RECEIVE_OLD.MSG_KEY
  is '上行短信的类型：0:咨询短信，1：点播短信,2：短信调查';
comment on column SMS_RECEIVE_OLD.REPLY_MSG
  is '咨询短信的回复信息';
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
  is '短信状态报告';
comment on column SMS_REPORT.SEQUENCE
  is '短信在短信网关的编号';
comment on column SMS_REPORT.CHANNEL_ID
  is '通道编号';
comment on column SMS_REPORT.GW_STATUS
  is '网关的状态报告';
comment on column SMS_REPORT.GW_STATUS_DESC
  is '网关的状态报告描述';
comment on column SMS_REPORT.SMS_STATUS
  is '此状态报告对应短信平台的状态,1:已提交, 5:客户收到短信, 6:客户未收到短信';
comment on column SMS_REPORT.SUBMIT_TIME
  is '短信提交到短信网关的时间';
comment on column SMS_REPORT.REPORT_TIME
  is '客户收到短信时间';
comment on column SMS_REPORT.SYS_TIME
  is '状态报告入库时间';
comment on column SMS_REPORT.SEND_ID
  is '状态报告对应的短信的编号';
comment on column SMS_REPORT.ORIGINALSMS_SENDID
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column SMS_REPORT.ORIGINALSMS_TOTALPAGES
  is '本条短短信所属长短信共有短信的页数';
comment on column SMS_REPORT.CURRENT_PAGENO
  is '当前短信的页号,即长短信的第几条短短信';
comment on column SMS_REPORT.BATCH_ID
  is '短信批号,用于标识同一批短信';
comment on column SMS_REPORT.MSG_ID
  is '对应业务系统的短信编号';
comment on column SMS_REPORT.SYS_ID
  is '信息来源, 即改短信来自哪个业务系统';
comment on column SMS_REPORT.MOBILE_TO
  is '对应手机号';
comment on column SMS_REPORT.STATUS
  is '状态报告状态，0：未成功更新短信, 1:成功更新短信状态';
comment on column SMS_REPORT.FETCH_STATUS
  is '业务系统读取状态报告的状态，0：未读取, 1:已读取';
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
  is '短信状态报告归档表';
comment on column SMS_REPORT_HIS.SEQUENCE
  is '短信在短信网关的编号';
comment on column SMS_REPORT_HIS.CHANNEL_ID
  is '通道编号';
comment on column SMS_REPORT_HIS.GW_STATUS
  is '网关的状态报告';
comment on column SMS_REPORT_HIS.GW_STATUS_DESC
  is '网关的状态报告描述';
comment on column SMS_REPORT_HIS.SMS_STATUS
  is '此状态报告对应短信平台的状态,1:已提交, 5:客户收到短信, 6:客户未收到短信';
comment on column SMS_REPORT_HIS.SUBMIT_TIME
  is '短信提交到短信网关的时间';
comment on column SMS_REPORT_HIS.REPORT_TIME
  is '客户收到短信时间';
comment on column SMS_REPORT_HIS.SYS_TIME
  is '状态报告入库时间';
comment on column SMS_REPORT_HIS.SEND_ID
  is '状态报告对应的短信的编号';
comment on column SMS_REPORT_HIS.ORIGINALSMS_SENDID
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column SMS_REPORT_HIS.ORIGINALSMS_TOTALPAGES
  is '本条短短信所属长短信共有短信的页数';
comment on column SMS_REPORT_HIS.CURRENT_PAGENO
  is '当前短信的页号,即长短信的第几条短短信';
comment on column SMS_REPORT_HIS.BATCH_ID
  is '短信批号,用于标识同一批短信';
comment on column SMS_REPORT_HIS.MSG_ID
  is '对应业务系统的短信编号';
comment on column SMS_REPORT_HIS.SYS_ID
  is '信息来源, 即改短信来自哪个业务系统';
comment on column SMS_REPORT_HIS.MOBILE_TO
  is '对应手机号';
comment on column SMS_REPORT_HIS.STATUS
  is '状态报告状态，0：未成功更新短信, 1:成功更新短信状态';
comment on column SMS_REPORT_HIS.FETCH_STATUS
  is '业务系统读取状态报告的状态，0：未读取, 1:已读取';
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
  is '下行短信信息表';
comment on column SMS_SEND.SEND_ID
  is '下行短信序号，下行短信的唯一标识';
comment on column SMS_SEND.MOBILE_TO
  is '目标手机号(一个手机号码）';
comment on column SMS_SEND.SEND_MSG
  is '短信内容,最长为300字';
comment on column SMS_SEND.ORG_ID
  is '机构编号';
comment on column SMS_SEND.SYS_ID
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column SMS_SEND.PRIOR_ID
  is '优先级';
comment on column SMS_SEND.PRE_SEND_TIME
  is '预计发送时间';
comment on column SMS_SEND.EXT_NUM
  is '扩展号码';
comment on column SMS_SEND.USER_ID
  is '用户编号';
comment on column SMS_SEND.CUST_ID
  is '编写短信的客户编号, 客户自写短信时记录';
comment on column SMS_SEND.BATCH_ID
  is '短信批号,用于标识同一批短信';
comment on column SMS_SEND.MSG_ID
  is '生成短信的业务系统的短信编号';
comment on column SMS_SEND.MESSAGE_CLASS
  is '信息分类的编号';
comment on column SMS_SEND.MESSAGE_TYPE
  is '信息性质';
comment on column SMS_SEND.WAPPUSH_URL
  is 'WAPPUSH链接, 此字段填写值时表明该短信为WAPPUSH短信, 系统将以WAPPUSH方式发送该短信';
comment on column SMS_SEND.SEND_DEADLINE
  is '发送的截止时间, 但发送时间晚于该时间时, 系统将取消该短信的发送';
comment on column SMS_SEND.SEND_STATUS
  is '发送状态,-2:已入库未开始发送, 0:未发送, 1:已发送, 2:发送中, 5:发送成功, 6:发送失败（如值相应的失败原因编号请查看ERR_ID表)';
comment on column SMS_SEND.SYS_TIME
  is '短信入库时间';
comment on column SMS_SEND.SYS_DATE_ID
  is '短信入库日期（格式YYYYMMDD）';
comment on column SMS_SEND.SEND_TIME
  is '平台发送该短信的时间';
comment on column SMS_SEND.SEND_DATE_ID
  is '平台发送该短信的日期，归档表将以此作为分区（格式YYYYMMDD）';
comment on column SMS_SEND.SEND_WEEKDATE
  is '平台发送该短信的时间为周几, 0:未发送, 1:周日, 2:周一, 3:周二, 4:周三, 5:周四, 6:周五, 7:周六';
comment on column SMS_SEND.COM_RTN_TIME
  is '短信网关返回提交应答的时间';
comment on column SMS_SEND.REPORT_TIME
  is '状态报告时间';
comment on column SMS_SEND.CHANNEL_ID
  is '通道编号 系统处理失败（如号码在黑名单、信息中包含敏感词）则填写0（';
comment on column SMS_SEND.MOBILE_COM
  is '运营商编号, 1:移动,2:联通, 3:电信 0:错误号码';
comment on column SMS_SEND.SEQUENCE
  is '短信网关的短信编号, 短信网关返回状态报告时用于匹配原始短信';
comment on column SMS_SEND.MOBILE_QUANTITIES
  is '本条短信的短信条数';
comment on column SMS_SEND.RESEND_TIMES
  is '短信的重发次数';
comment on column SMS_SEND.SIGNATURE
  is '短信签名';
comment on column SMS_SEND.MSG_TYPE
  is '信息类型,用于标识短信的生成方式或者来源';
comment on column SMS_SEND.ERR_ID
  is '错误代码，包含短息平台错误代码和短信网关错误代码 短信错误代码 1007：黑名单号码 1008：短信包含违禁词 1009：错误手机号 1010：SYS_ID 填写错误';
comment on column SMS_SEND.ERR_MSG
  is '错误代码的说明信息';
comment on column SMS_SEND.IS_LONGSMS
  is '该短信是否是长短信,0:不是长短信,1:是长短信';
comment on column SMS_SEND.IS_ORIGINAL_SMS
  is '该短信是否是原始短信,非原始短信指长短信发送时拆分出的短信,0:是原始短信, 1:不是原始短信';
comment on column SMS_SEND.ORIGINALSMS_SENDID
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column SMS_SEND.CURRENT_PAGENO
  is '当前短信的页号,即长短信的第几条短短信';
comment on column SMS_SEND.ORIGINALSMS_TOTALPAGES
  is '本条短短信所属长短信共有短信的页数';
comment on column SMS_SEND.LONGSMS_TAG
  is '长短信都标识符：同一条长短信的短短信该标识相同';
comment on column SMS_SEND.LONGSMS_SPLITED
  is '长短信是否被拆分：0没有被拆分或者是普通短信；1已经被拆分。被拆分的短信查询统计时不应计算数量。默认0';
comment on column SMS_SEND.REMARK
  is '备注信息，保留字段，扩展时使用';
comment on column SMS_SEND.SENDER_ID
  is '发送者ID，数据库接口时，就是数据库帐号';
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
  is '下行短信信息表';
comment on column SMS_SEND_HIS.SEND_ID
  is '下行短信序号，下行短信的唯一标识';
comment on column SMS_SEND_HIS.MOBILE_TO
  is '目标手机号(一个手机号码）';
comment on column SMS_SEND_HIS.SEND_MSG
  is '短信内容,最长为300字';
comment on column SMS_SEND_HIS.ORG_ID
  is '机构编号';
comment on column SMS_SEND_HIS.SYS_ID
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column SMS_SEND_HIS.PRIOR_ID
  is '优先级';
comment on column SMS_SEND_HIS.PRE_SEND_TIME
  is '预计发送时间';
comment on column SMS_SEND_HIS.EXT_NUM
  is '扩展号码';
comment on column SMS_SEND_HIS.USER_ID
  is '用户编号';
comment on column SMS_SEND_HIS.CUST_ID
  is '编写短信的客户编号, 客户自写短信时记录';
comment on column SMS_SEND_HIS.BATCH_ID
  is '短信批号,用于标识同一批短信';
comment on column SMS_SEND_HIS.MSG_ID
  is '生成短信的业务系统的短信编号';
comment on column SMS_SEND_HIS.MESSAGE_CLASS
  is '信息分类的编号';
comment on column SMS_SEND_HIS.MESSAGE_TYPE
  is '信息性质';
comment on column SMS_SEND_HIS.WAPPUSH_URL
  is 'WAPPUSH链接, 此字段填写值时表明该短信为WAPPUSH短信, 系统将以WAPPUSH方式发送该短信';
comment on column SMS_SEND_HIS.SEND_DEADLINE
  is '发送的截止时间, 但发送时间晚于该时间时, 系统将取消该短信的发送';
comment on column SMS_SEND_HIS.SEND_STATUS
  is '发送状态,-2:已入库未开始发送, 0:未发送, 1:已发送, 2:发送中, 5:发送成功, 6:发送失败（如值相应的失败原因编号请查看ERR_ID表)';
comment on column SMS_SEND_HIS.SYS_TIME
  is '短信入库时间';
comment on column SMS_SEND_HIS.SYS_DATE_ID
  is '短信入库日期（格式YYYYMMDD）';
comment on column SMS_SEND_HIS.SEND_TIME
  is '平台发送该短信的时间';
comment on column SMS_SEND_HIS.SEND_DATE_ID
  is '平台发送该短信的日期，归档表将以此作为分区（格式YYYYMMDD）';
comment on column SMS_SEND_HIS.SEND_WEEKDATE
  is '平台发送该短信的时间为周几, 0:未发送, 1:周日, 2:周一, 3:周二, 4:周三, 5:周四, 6:周五, 7:周六';
comment on column SMS_SEND_HIS.COM_RTN_TIME
  is '短信网关返回提交应答的时间';
comment on column SMS_SEND_HIS.REPORT_TIME
  is '状态报告时间';
comment on column SMS_SEND_HIS.CHANNEL_ID
  is '通道编号 系统处理失败（如号码在黑名单、信息中包含敏感词）则填写0（';
comment on column SMS_SEND_HIS.MOBILE_COM
  is '运营商编号, 1:移动,2:联通, 3:电信 0:错误号码';
comment on column SMS_SEND_HIS.SEQUENCE
  is '短信网关的短信编号, 短信网关返回状态报告时用于匹配原始短信';
comment on column SMS_SEND_HIS.MOBILE_QUANTITIES
  is '本条短信的短信条数';
comment on column SMS_SEND_HIS.RESEND_TIMES
  is '短信的重发次数';
comment on column SMS_SEND_HIS.SIGNATURE
  is '短信签名';
comment on column SMS_SEND_HIS.MSG_TYPE
  is '信息类型,用于标识短信的生成方式或者来源';
comment on column SMS_SEND_HIS.ERR_ID
  is '错误代码，包含短息平台错误代码和短信网关错误代码 短信错误代码 1007：黑名单号码 1008：短信包含违禁词 1009：错误手机号 1010：SYS_ID 填写错误';
comment on column SMS_SEND_HIS.ERR_MSG
  is '错误代码的说明信息';
comment on column SMS_SEND_HIS.IS_LONGSMS
  is '该短信是否是长短信,0:不是长短信,1:是长短信';
comment on column SMS_SEND_HIS.IS_ORIGINAL_SMS
  is '该短信是否是原始短信,非原始短信指长短信发送时拆分出的短信,0:是原始短信, 1:不是原始短信';
comment on column SMS_SEND_HIS.ORIGINALSMS_SENDID
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column SMS_SEND_HIS.CURRENT_PAGENO
  is '当前短信的页号,即长短信的第几条短短信';
comment on column SMS_SEND_HIS.ORIGINALSMS_TOTALPAGES
  is '本条短短信所属长短信共有短信的页数';
comment on column SMS_SEND_HIS.LONGSMS_TAG
  is '长短信都标识符：同一条长短信的短短信该标识相同';
comment on column SMS_SEND_HIS.LONGSMS_SPLITED
  is '长短信是否被拆分：0没有被拆分或者是普通短信；1已经被拆分。被拆分的短信查询统计时不应计算数量。默认0';
comment on column SMS_SEND_HIS.REMARK
  is '备注信息，保留字段，扩展时使用';
comment on column SMS_SEND_HIS.SENDER_ID
  is '发送者ID，数据库接口时，就是数据库帐号';
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
  is '短信普通发送历史记录表';
comment on column SMS_SEND_PAPER.SMS_SEND_PAPER_ID
  is '系统编号';
comment on column SMS_SEND_PAPER.STATUS
  is '是否启用，0刚提交审核（未审核）,1审核通过，3审核流程失败，5短信发送成功，6短信发送失败';
comment on column SMS_SEND_PAPER.PRIOR_ID
  is '优先级';
comment on column SMS_SEND_PAPER.IS_CHECK
  is '是否需要审核  0为不需要，1为需要';
comment on column SMS_SEND_PAPER.SUBJECT
  is '如果是彩信的话，这里内容不为空';
comment on column SMS_SEND_PAPER.CONTENT
  is '内容';
comment on column SMS_SEND_PAPER.MOBILES
  is '手机号码';
comment on column SMS_SEND_PAPER.GROUPS
  is '客户群组';
comment on column SMS_SEND_PAPER.FILE_URL
  is '文件地址';
comment on column SMS_SEND_PAPER.FILE_NAME
  is '文件名称';
comment on column SMS_SEND_PAPER.SYS_TIME
  is '创建时间';
comment on column SMS_SEND_PAPER.PRE_SEND_TIME
  is '预计发送时间';
comment on column SMS_SEND_PAPER.SEND_TIME
  is '发送时间';
comment on column SMS_SEND_PAPER.CHECK_TIME
  is '提交审核时间';
comment on column SMS_SEND_PAPER.CREATOR
  is '创建者';
comment on column SMS_SEND_PAPER.CREATOR_NAME
  is '创建者';
comment on column SMS_SEND_PAPER.CREATOR_ORG
  is '创建者机构';
comment on column SMS_SEND_PAPER.CREATOR_ORG_NAME
  is '创建者机构';
comment on column SMS_SEND_PAPER.AUDITOR
  is '审核者';
comment on column SMS_SEND_PAPER.AUDITOR_NAME
  is '审核者';
comment on column SMS_SEND_PAPER.AUDITOR_ORG
  is '审核者机构';
comment on column SMS_SEND_PAPER.AUDITOR_ORG_NAME
  is '审核者机构';
comment on column SMS_SEND_PAPER.BATCH_ID
  is '短信的批次号，批量发送的时候使用';
comment on column SMS_SEND_PAPER.SEND_TYPE
  is '发送类型，COMMON：普通发送、BATCH：批量发送、TEMPLATE：模板发送、PRODUCT：栏目发送';
comment on column SMS_SEND_PAPER.MSG_TYPE
  is '信息类型，SMS：短信、MMS：彩信';
comment on column SMS_SEND_PAPER.PRODUCT_ID
  is '栏目编号';
comment on column SMS_SEND_PAPER.PRODUCT_NAME
  is '栏目名称';
comment on column SMS_SEND_PAPER.PRODUCT_ITEM_ID
  is '栏目发送历史记录的编号';
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
  is '短信特服号表';
comment on column SMS_SPNUMBER.SMS_SPNUMBER_ID
  is '特服号编号';
comment on column SMS_SPNUMBER.SPNUMBER
  is '特服号';
comment on column SMS_SPNUMBER.STATUS
  is '状态, 0:失效, 1:生效';
comment on column SMS_SPNUMBER.SPNUMBER_TYPE
  is '类型, PREFIX:前缀, REGEXP:正则表达式';
comment on column SMS_SPNUMBER.DESCRIPTION
  is '备注';
comment on column SMS_SPNUMBER.SORT_INDEX
  is '排序编号';
comment on column SMS_SPNUMBER.ORGANIZATION_ID
  is '机构编号';
comment on column SMS_SPNUMBER.ORGANIZATION_NAME
  is '机构名称';
comment on column SMS_SPNUMBER.USER_ID
  is '用户编号';
comment on column SMS_SPNUMBER.USER_NAME
  is '用户名称';
comment on column SMS_SPNUMBER.CREATE_TIME
  is '创建时间';
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
  is '短信调查';
comment on column SMS_SURVEY.SMS_SURVEY_NAME
  is '调查名称';
comment on column SMS_SURVEY.SURVEY_TYPE
  is '调查类型';
comment on column SMS_SURVEY.OPTION_NUMBER
  is '选项数量';
comment on column SMS_SURVEY.STATUS
  is '状态';
comment on column SMS_SURVEY.START_TIME
  is '开始时间';
comment on column SMS_SURVEY.END_TIME
  is '结束时间';
comment on column SMS_SURVEY.USER_ID
  is '用户id';
comment on column SMS_SURVEY.USER_NAME
  is '用户名';
comment on column SMS_SURVEY.USER_GROUP_ID
  is '用户群组id';
comment on column SMS_SURVEY.USER_GROUP_NAME
  is '用户群组名';
comment on column SMS_SURVEY.SMS_DIRECTIVE
  is '短信指令';
comment on column SMS_SURVEY.SURVEY_TEMPLATE
  is '调查模板';
comment on column SMS_SURVEY.THANK_WORD
  is '感谢语';
comment on column SMS_SURVEY.SPEC_RESPONSE
  is '是否限定调查对象';
comment on column SMS_SURVEY.CONTACT_GROUPS
  is '联系群组';
comment on column SMS_SURVEY.BLACK_GROUPS
  is '黑名单';
comment on column SMS_SURVEY.SURVEY_VALID_TYPE
  is '有效回复';
comment on column SMS_SURVEY.MAX_VOTE_NUMBER
  is '次数限制';
comment on column SMS_SURVEY.CREATED_STAMP
  is '创建时间';
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
  is '短信调查被访组';
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
  is '短信调查选项';
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
  is '调查记录';
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
  is '短信调查被访者';
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
  is '测试短信策略表';
comment on column SMS_TEST_SEND.ID
  is '编号';
comment on column SMS_TEST_SEND.CONTENT
  is '内容，会自动追加时间';
comment on column SMS_TEST_SEND.SUBMIT_TIME
  is '提交时间';
comment on column SMS_TEST_SEND.MOBILE_TO
  is '手机号, 以英文逗号分割';
comment on column SMS_TEST_SEND.MSG_ID
  is '信息性质编号';
comment on column SMS_TEST_SEND.USER_ID
  is '提交者编号';
comment on column SMS_TEST_SEND.ORGANIZATION_ID
  is '提交者所属机构';
comment on column SMS_TEST_SEND.WAPPUSH_URL
  is 'WAPPUSH短信的链接地址';
comment on column SMS_TEST_SEND.DATE_INTERVAL_START
  is '测试短信日期间隔的开始时间, 2:星期一, 3:星期二, 4:星期三, 5:星期四, 6:星期五, 7:星期六, 8:星期日';
comment on column SMS_TEST_SEND.DATE_INTERVAL_END
  is '测试短信日期间隔的开始时间, 2:星期一, 3:星期二, 4:星期三, 5:星期四, 6:星期五, 7:星期六, 8:星期日';
comment on column SMS_TEST_SEND.TIME_INTERVAL_START
  is '测试短信时间间隔的开始时间';
comment on column SMS_TEST_SEND.TIME_INTERVAL_END
  is '测试短信时间间隔的结束时间';
comment on column SMS_TEST_SEND.INTERVAL
  is '测试短信的间隔发送';
comment on column SMS_TEST_SEND.TYPE
  is '0:普通短信, 1:WAPPUSH短信';
comment on column SMS_TEST_SEND.STATUS
  is '0:初稿, 1:生效, 2:失效';
comment on column SMS_TEST_SEND.HOUR_MINUTE
  is '0:小时, 1:分钟';
comment on column SMS_TEST_SEND.SYS_ID
  is '信息来源';
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
  is '退订关键字表';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.KEY_WORD_ID
  is '关键字编号';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.KEY_WORD
  is '关键字';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.STATUS
  is '状态, 0:失效, 1:生效';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.DESCRIPTION
  is '备注';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.SORT_INDEX
  is '排序编号';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.ORGANIZATION_ID
  is '机构编号';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.ORGANIZATION_NAME
  is '机构名称';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.USER_ID
  is '用户编号';
comment on column SMS_UNSUBSCRIBE_KEY_WORD.USER_NAME
  is '用户名称';
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
  is '手机验证码表';
comment on column SMS_VERCODE.VERCODE_ID
  is '主键';
comment on column SMS_VERCODE.MOBILE_TO
  is '接收的手机号';
comment on column SMS_VERCODE.USER_ID
  is '接收手机验证码的用户ID';
comment on column SMS_VERCODE.SEND_MSG
  is '发送内容';
comment on column SMS_VERCODE.SEND_TIME
  is '发送时间';
comment on column SMS_VERCODE.REMARK
  is '备注';
comment on column SMS_VERCODE.VERCODE
  is '6位验证码';
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
  is '平台主题基础信息表';
comment on column STYLE_BASE.STYLE_ID
  is '编号';
comment on column STYLE_BASE.SUBJECT
  is '主题名称';
comment on column STYLE_BASE.STYLE_KEY
  is '主题对应的英文KEY';
comment on column STYLE_BASE.THUMBNAIL
  is '主题缩略图名称';
comment on column STYLE_BASE.STATUS
  is '是否启用, 0:无效主题, 1:有效主题';
comment on column STYLE_BASE.CREAT_TIME
  is '创建时间';
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
  is '用户对应主题配置表';
comment on column STYLE_USER_CONFIG.STYLE_CONFIG_ID
  is '编号';
comment on column STYLE_USER_CONFIG.USER_ID
  is '用户编号, 这个字段需要设置唯一性';
comment on column STYLE_USER_CONFIG.USER_NAME
  is '用户名称';
comment on column STYLE_USER_CONFIG.F_ID
  is '配置的主题编号';
comment on column STYLE_USER_CONFIG.CREAT_TIME
  is '创建时间';
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
  is '信息来源数据字典';
comment on column SUBSYS_CODE.ID
  is '表主键';
comment on column SUBSYS_CODE.SUBSYS_CODE_ID
  is '信息来源编号';
comment on column SUBSYS_CODE.SUBSYS_CODE_NAME
  is '信息来源名称';
comment on column SUBSYS_CODE.EXTEND_NUMBER
  is '扩展号';
comment on column SUBSYS_CODE.DESCRIPTION
  is '备注';
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
  is '系统使用的配置数据';
comment on column SYS_CONFIG.CONFIG_KEY
  is '配置项, InitedData(是否已经初始化数据),0:未初始化,1:已经初始化，已经初始化则不再初始化, PROHIBITEDWORD_POWER, 0:关闭违禁词, 1:开启违禁词';
comment on column SYS_CONFIG.CONFIG_VALUE
  is '配置值';
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
  is '主键';
comment on column TASK_INFO.ORG_ID
  is '机构id';
comment on column TASK_INFO.NAME
  is '任务名';
comment on column TASK_INFO.FILE_URL
  is '保存模板发送的文件位置';
comment on column TASK_INFO.CONTENT
  is '短信内容';
comment on column TASK_INFO.TYPE
  is '发送类型 0:短信 1:彩信';
comment on column TASK_INFO.SEND_STATUS
  is '发送状态';
comment on column TASK_INFO.SIGNATURE
  is '用户签名';
comment on column TASK_INFO.PRIOR_ID
  is '优先级';
comment on column TASK_INFO.TIME_TASK
  is '是否是定时任务 0:不是 1:是';
comment on column TASK_INFO.EXTEND_CODE
  is '用户扩展号';
comment on column TASK_INFO.VALID_MOBILE_COUNT
  is '有效的电话号码总条数';
comment on column TASK_INFO.RUN_TIME
  is '任务启动时间';
comment on column TASK_INFO.CREATE_TIME
  is '任务创建时间';
comment on column TASK_INFO.INVALID_MOBILE_COUNT
  is '无效的电话号码总条数';
comment on column TASK_INFO.USER_ID
  is '委托人用户id';
comment on column TASK_INFO.STATUS
  is '发送状态 0:未启动 1:发送中 2:暂停 3:停止 4:发送结束';
comment on column TASK_INFO.SMS_USER_TYPE
  is '用户类型';
comment on column TASK_INFO.SEND_COUNT
  is '发送总条数';
comment on column TASK_INFO.END_TIME
  is '任务结束时间';
comment on column TASK_INFO.CLIENT_GROUP
  is '群组的id';
comment on column TASK_INFO.BATCH_ID
  is '批量发送短信的批次号';
comment on column TASK_INFO.UNTREATED_MOBILE
  is '未处理的号码,用于保存普通发送的号码';
comment on column TASK_INFO.EXCEL_NAME
  is '保存批量发送的excel_name';
comment on column TASK_INFO.LOSE_REASON
  is '失败原因';
comment on column TASK_INFO.REPEAT_NUM
  is '记录本次任务的重复号码';
comment on column TASK_INFO.ILLEGAL_NUM
  is '记录本次任务的非法号码';
comment on column TASK_INFO.ORIGINAL_MOBILE_COUNT
  is '记录本次任务的未拆分前的号码总数';
comment on column TASK_INFO.BLACK_NUM
  is '记录本次任务的黑名单号码总数';
comment on column TASK_INFO.PROHIBITED_WORD_NUM
  is '记录本次任务的违禁词号码总数';
comment on column TASK_INFO.REPEAT_NUM_COUNT
  is '记录本次任务的重复号码总数';
comment on column TASK_INFO.ILLEGAL_NUM_COUNT
  is '记录本次任务的非法号码总数';
comment on column TASK_INFO.REPORT_ALL_COUNT
  is '返回状态报告总条数';
comment on column TASK_INFO.REPORT_SUCCESS_COUNT
  is '返回状态报告成功条数';
comment on column TASK_INFO.REPORT_FAILURE_COUNT
  is '返回状态报告失败条数';
comment on column TASK_INFO.REPORT_UNKNOWN_COUNT
  is '没有返回状态报告条数';
comment on column TASK_INFO.GRANTER_ID
  is '短信委托人';
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
  is '机构价格信息表';
comment on column UNIT_PRICE_INFO.PRICE_ID
  is 'ID';
comment on column UNIT_PRICE_INFO.ORGANIZATION_ID
  is '机构组id';
comment on column UNIT_PRICE_INFO.UNIT_PRICE
  is '组单价';
comment on column UNIT_PRICE_INFO.START_DATE
  is '起始日期';
comment on column UNIT_PRICE_INFO.END_DATE
  is '终止日期';
comment on column UNIT_PRICE_INFO.CREATE_DATE
  is '创建时间';
comment on column UNIT_PRICE_INFO.EFFECTIVE
  is '是否历史单价   0：非历史单价；1：历史单价';
comment on column UNIT_PRICE_INFO.REMARK
  is '备注';
comment on column UNIT_PRICE_INFO.ORGANIZATION_NAME
  is '机构组名称';
comment on column UNIT_PRICE_INFO.GW_TYPE
  is '号段类型。0-全网路，1-移动号段，2-联通号段，3-小灵通号段';
comment on column UNIT_PRICE_INFO.BIZ_TYPE
  is '业务类型。0-普通短信业务，1-彩信业务，2-email业务';
comment on column UNIT_PRICE_INFO.CHANNEL_ID
  is '发送通道。0-所有通道';
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
  is '用户公共属性配置表';
comment on column USER_COMMON_CONFIG.ID
  is '主键';
comment on column USER_COMMON_CONFIG.USER_ID
  is '用户UUID';
comment on column USER_COMMON_CONFIG.BLACK_LEVEL
  is '黑名单级别表：0：只检测BLACK黑名单；1：检测BLACK和BLACK_CSMD黑名单；2：检测BLACK和BLACK_CSMD、BLACK_ZHUOYUE黑名单';
comment on column USER_COMMON_CONFIG.IS_SENSITIVE_TIME_DELAY
  is '是否对敏感时间延迟：1：对敏感时间延迟；0：对敏感时间不延迟';
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
  is '用户配置';
comment on column USER_CONFIG_INFO.CONFIG_ID
  is '配置编号';
comment on column USER_CONFIG_INFO.CHANNEL_ID
  is '通道编号';
comment on column USER_CONFIG_INFO.KEY
  is '关键字';
comment on column USER_CONFIG_INFO.VALUE
  is '值';
comment on column USER_CONFIG_INFO.REMARK
  is '备注';
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
  is '用户配置关键字字典表';
comment on column USER_CONFIG_KEY_INFO.CONFIG_KEY_ID
  is '配置关键字编号';
comment on column USER_CONFIG_KEY_INFO.CONFIG_KEY_NAME
  is '关键字';
comment on column USER_CONFIG_KEY_INFO.REMARK
  is '备注';
comment on column USER_CONFIG_KEY_INFO.CONFIG_KEY_TYPE
  is '关键字类型, -1:全通道配置, 1:单通道配置';
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
  is '用户代发授权表';
comment on column USER_SEND_GRANT.ID
  is 'id';
comment on column USER_SEND_GRANT.GRANTEE_ID
  is '被授权人id 即短信实际发送人';
comment on column USER_SEND_GRANT.GRANTER_ID
  is '授权人id 即短信实际所属者';
comment on column USER_SEND_GRANT.GRANT_TYPE
  is '操作类型 即分为为机构代发和为个人代发。授权人id受该字段影响分别可以是机构id和用户id';
comment on column USER_SEND_GRANT.GRANT_REMARK
  is '备注信息';
comment on column USER_SEND_GRANT.SYSTEM_TIME
  is '授权关系的日期';
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
      u.user_id                     user_id,      --用户编号
      u.user_name                   user_name,    --账户登录名
      u.user_kind                   user_kind,    --账户类别：1：Web平台用户；2：WebService接口用户；3：CMPP接口用户；4：HTTP接口用户
      ucc.black_level               black_level,  --黑名单级别
      ucc.is_sensitive_time_delay   is_sensitive_time_delay,--是否对敏感时间延迟：1：对敏感时间延迟；0：对敏感时间不延迟
      org.user_id                   org_id,       --机构ID
      org.eng_signature             eng_signature,  --英文网关签名
      org.chn_signature             chn_signature,  --中文网关签名
      org.extend_number             extend_number,  --扩展号
      sc.sgw_id                     sgw_id,       --网关编号（CMPP账户的其他信息)
      sc.account_pass               account_pass, --网管账户密码
      sc.registed_ip                registed_ip,  --客户端注册IP
      sc.prior_id                   prior_id,     --优先级
      sc.flux_limit                 flux_limit,   --流控
      sc.mt_worker_num              mt_worker_num,--下行处理线程数量
      sc.mt_cache_num               mt_cache_num, --下行缓存队列长度
      sc.server_active_test         server_active_test,--服务端发送链路检测 0:不发送, 1:发送
      sc.is_channel_account         is_channel_account,--是否渠道账号， 0:否, 1:是
      sc.signature_type             signature_type,--签名类型：1：普通网关签名；2：子端口网关签名；3：自主签名（需要通过签名池过滤检查）
      sc.check_prohibitedword       check_prohibitedword,--是否检查违禁词， 0:否, 1:是
      sc.comments                   comments,
      sc.sys_time                   sys_time
FROM user_info u
left join sgw_account_info sc on sc.user_id = u.user_id
left join user_common_config ucc on ucc.user_id = u.user_id
LEFT JOIN ORGANIZATION org ON org.user_id = u.organization_id
where u.USER_STAT = 1 --有效
with read only

;

prompt
prompt Creating view VIEW_ORANIZATION
prompt ==============================
prompt
CREATE OR REPLACE VIEW VIEW_ORANIZATION AS
SELECT org.user_id              org_id,     --机构编号
       org.user_name            org_name    --机构名称
 FROM ORGANIZATION org
 where org.user_stat = 1    --有效（渠道：1有效；其他：0：有效）
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
       userinfo.user_name           user_name,      --用户账号
       org.user_name                org_name,       --机构名称
       org.eng_signature            eng_signature,  --英文签名
       org.chn_signature            chn_signature   --中文签名
FROM sgw_customer customer
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --机构表
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --用户表
with read only

;

prompt
prompt Creating view VIEW_USER_SGW_SIGNATURE_POOL
prompt ==========================================
prompt
CREATE OR REPLACE VIEW VIEW_USER_SGW_SIGNATURE_POOL AS
SELECT signaturepool."SIGNATURE_ID",signaturepool."CUSTOMER_ID",signaturepool."SIGNATURE",signaturepool."DESCRIPTION",signaturepool."SORT_INDEX",signaturepool."DO_APPEND_MSG",signaturepool."APPEND_MSG",signaturepool."BLACK_LEVEL",signaturepool."COMMENTS",signaturepool."SIGNATURE_STATUS",signaturepool."SYS_TIME",
       customer.org_id,               --机构编号
       customer.p_customer_id,        --客户父ID
       customer.customer_name,        --客户名称
       userinfo.user_id,              --用户ID
       userinfo.user_name   user_name,--用户账号
       org.user_name        org_name --机构名称
FROM sgw_signature_pool  signaturepool            --签名池表
LEFT JOIN sgw_customer customer ON customer.customer_id = signaturepool.customer_id --签名池表
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --机构表
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --用户表
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
   --报表存储过程包
   -- Created : 2013/6/11 11:04:24

/**
  * 日结单定时插入数据
  * 查询数据,然后插入日结单表daily_reckoning_info的存储过程
  * Author  : zhanhh
  * Created : 2013-06-28 16:56:32
  *
*/
  procedure INSERT_DAILY_RECKONING_REPORT;


/**
  * 月账单定时插入数据
  * 查询数据,然后插入月账单表insert_month_reckoning_report的存储过程
  * Author  : zhanhh
  * Created : 2013-07-03 18:49:32
  *
*/
  procedure INSERT_MONTH_RECKONING_REPORT;

  /**
  * 日结单查询
  * Author  : zhanhh
  * Created : 2013-07-04 16:01:32
  *
*/
  procedure QUERY_RECKONING_INFO_REPORT;

/**
  * 月账单查询
  * Author  : zhanhh
  * Created : 2013-07-04 16:01:32
  *
*/
  procedure QUERY_MONTH_INFO_REPORT;

/* 日终返还发送失败的短信费用给用户
*  Author  : zhanhh
*  Created : 2013-07-04 16:01:32
*  第三方通道: 不用拆分,只算原始短信条数
*  直连通道: 短短信--不用拆分,只算原始短信条数;长短信--只计算拆分后的短信条数
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
描述：
    以通道-号段-总量为字符串进行拆分
查询条件：
    无。
格式：
    无。
算法：
    无。
备注：
   如：
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
      return '总部';
     Elsif p_string = '' then
      return '总部';
     Else
       return p_string;
     end if;
  exception    when others then
          return '总部';
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
V_CODE VARCHAR2(100);      --参数:暂时存储临时生成的验证码
V_NUMBER NUMBER;           --参数:当前用户，手机号是否已经存过一次库 
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
    *     UPDATE_UNIT_PRICE_QUOTA   各个协议价的条数,格式: 号段:协议价-发送总量  例如  1:0.3-200; 1:0.4-200;  2:0.3-200; 3:0.3-200;
    *
   ** 算法：
    *
  */
  QUANTIY_LIST_NO_FOUNDS EXCEPTION; --拆分通道-号段-发送量异常

  ILLEGALITY_BIZ_TYPE EXCEPTION; --非法的类型 注:仅支持短信和彩信两种类型

  NO_ORG_RECORD EXCEPTION; --机构不存在

  NO_USER_RECORD EXCEPTION; --用户不存在

  NO_UNIT_PRICE EXCEPTION; --协议价不存在

  NO_START_UNIT_PRICE EXCEPTION; --协议价还没有开始启用

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

  P_PRICE_START UNIT_PRICE_INFO.START_DATE%TYPE; --机构协议价开始时间

  COST_FEE NUMBER(10, 3); --本次短信费用

  REMAIN_BALANCE NUMBER(10, 3); --剩余金额

  REMAIN_QUOTA CONSUME_RECORD_INFO.REMAIN_QUOTA%TYPE; --剩余配额

  QUANTITY_RESULT NUMBER(10); --拆分后记录数

  v_payMode organization.pay_mode%type;
  v_unitprice org_remain_balance.unit_price%type;
  v_extraQuota organization.user_quota%type; --子机构给用户充值，充值条数-当前协议价余额 的余额
  v_lastQuota organization.user_quota%type;  --时间最早的一个余额

BEGIN

  RUN_UNIT_PRICE := NULL;
  UPDATE_UNIT_PRICE_QUOTA :='';

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

 --   UPDATE_UNIT_PRICE_QUOTA := P_GW_TYPE||':';

    IF ORG_DATA.PAY_TYPE = 1 THEN
      DBMS_OUTPUT.PUT_LINE('用户所在机构属于后付费,不执行计费操作'); --机构是后付费时不执行计费操作只记录流水
      --记录流水
      BEGIN
      --如果机构属于渠道客户则查询渠道机构的协议价
      IF ORG_DATA.PARENTID != '0' and ORG_DATA.PARENTID != '1' THEN
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --根据发送类型查找对应的机构协议价
      ELSE
      --如果机构属于非渠道客户则查询当前机构的协议价
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --根据发送类型查找对应的机构协议价
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      IF P_PRICE_START > SYSDATE THEN
          RAISE NO_START_UNIT_PRICE;  --协议价还没有开始启用
      END IF;

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
         decode(SEND_TYPE,0,SEND_MSG||(SELECT C.UNSUBSCRIBE_KEYWORD FROM CHANNEL_INFO C WHERE C.CHANNEL_ID=P_CHANNEL_ID),1,SEND_MSG,SEND_MSG),
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
      IF ORG_DATA.PARENTID != '0' and ORG_DATA.PARENTID != '1' THEN
       SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.PARENTID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --根据发送类型查找对应的机构协议价
      ELSE
      --如果机构属于非渠道客户则查询当前机构的协议价
      SELECT UI.UNIT_PRICE,UI.START_DATE
          INTO P_UNIT_PRICE,P_PRICE_START
          FROM UNIT_PRICE_INFO UI
         WHERE (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = P_GW_TYPE)
            OR (UI.ORGANIZATION_ID = ORG_DATA.USER_ID
           AND UI.EFFECTIVE=0  --有效协议价
           AND UI.BIZ_TYPE = P_BIZ_TYPE
           AND UI.GW_TYPE = 0); --根据发送类型查找对应的机构协议价
      END IF;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE NO_UNIT_PRICE;
      END;

      IF P_PRICE_START> SYSDATE THEN
          RAISE NO_START_UNIT_PRICE;  --协议价还没有开始启用
      END IF;

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
        --机构自付费
          IF P_BIZ_TYPE = 0 THEN
            --类型为短信
            IF USER_DATA.USER_QUOTA < P_SEND_QUANTITY THEN
              RAISE USER_SMSQUOTA_NOT_ENOUGH; --用户短信条数不足
            END IF;
            REMAIN_QUOTA := USER_DATA.USER_QUOTA - P_SEND_QUANTITY;
            UPDATE USER_INFO U
               SET U.USER_QUOTA = REMAIN_QUOTA
             WHERE U.USER_ID = P_USER_ID; --更新用户短信条数
           --金额自付费用户扣除余额表
            begin
              --查询用户余额大于零且协议价最早的子机构余额
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
                  /* 扣费额比最早的协议价余额小，扣除相应的用户余额 */
                  update org_remain_balance orb
                  set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                  where orb.user_id = P_USER_ID
                  and orb.status=1
                  and orb.unit_price=v_unitprice;
                  --返回协议价和条数  例如 0.3:5
                  UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||P_SEND_QUANTITY||';';
                  DBMS_OUTPUT.PUT_LINE('UPDATE_UNIT_PRICE_QUOTA='||UPDATE_UNIT_PRICE_QUOTA);
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
                      --查询用户余额大于零且协议价最早的子机构余额
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
                      --从时间最早的一个协议价余额开始减
                      v_extraQuota := v_extraQuota - v_lastQuota;
                      --如果扣费额比上一个协议价还大
                      if v_extraQuota >=0 then
                       /* 上一个协议价的余额比扣费额小，用户的余额清零 */
                            update org_remain_balance orb
                            set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                            where orb.user_id = P_USER_ID
                            and orb.status=1
                            and orb.unit_price=v_unitprice;
                            --返回协议价和条数  例如 0.3:5
                            UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'||v_unitprice||'-'||v_lastQuota||';';
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

                       --扣费额比上一个最早的协议价余额小
                      elsif v_extraQuota <0 then
                          /* 扣费额比最早的协议价余额小，扣除相应的用户余额 */
                          update org_remain_balance orb
                          set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                          where orb.user_id = P_USER_ID
                          and orb.status=1
                          and orb.unit_price=v_unitprice;

                          --返回协议价和条数  例如 0.3:5
                            UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'|| v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
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
          /*若是金额渠道的子机构，修改余额表*/
          IF ORG_DATA.PARENTID !='0' AND ORG_DATA.PARENTID !='1' THEN
             --查询渠道是金额/配额付费
             SELECT O.PAY_MODE INTO v_payMode FROM ORGANIZATION O WHERE O.USER_ID=ORG_DATA.PARENTID;
             if v_payMode=1 then
                 begin
                    --查询用户余额大于零且协议价最早的子机构余额
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
                        /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                        where orb.user_id = ORG_DATA.USER_ID
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                        --返回协议价和条数  例如 0.3:5
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
                            --查询用户余额大于零且协议价最早的子机构余额
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
                            --从时间最早的一个协议价余额开始减
                            v_extraQuota := v_extraQuota - v_lastQuota;
                            --如果充值额比上一个协议价还大
                            if v_extraQuota >=0 then
                             /* 上一个协议价的余额比充值额小，用户的余额清零 */
                                  update org_remain_balance orb
                                  set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                  where orb.user_id = ORG_DATA.USER_ID
                                  and orb.status=1
                                  and orb.unit_price=v_unitprice;
                                  --返回协议价和条数  例如 0.3:5
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
                             --充值额比上一个最早的协议价余额小
                            elsif v_extraQuota <0 then
                                /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
                                update org_remain_balance orb
                                set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                where orb.user_id = ORG_DATA.USER_ID
                                and orb.status=1
                                and orb.unit_price=v_unitprice;

                                --返回协议价和条数  例如 0.3:5
                                UPDATE_UNIT_PRICE_QUOTA := UPDATE_UNIT_PRICE_QUOTA||P_GW_TYPE||':'|| v_unitprice||'-'||(v_lastQuota+v_extraQuota)||';';
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
          --金额渠道子机构的自付费用户，修改余额表
          SELECT o.pay_mode into v_payMode
          FROM organization o
          where o.parentid='1'
          START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=P_USER_ID)
          CONNECT BY PRIOR o.parentid=o.user_id;
          if v_payMode=1 then
             begin
                    --查询用户余额大于零且协议价最早的子机构余额
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
                        /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
                        update org_remain_balance orb
                        set orb.sms_quota = orb.sms_quota - P_SEND_QUANTITY, orb.last_update_quota_date =sysdate
                        where orb.user_id = P_USER_ID
                        and orb.status=1
                        and orb.unit_price=v_unitprice;
                        --返回协议价和条数  例如 0.3:5
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
                            --查询用户余额大于零且协议价最早的子机构余额
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
                            --从时间最早的一个协议价余额开始减
                            v_extraQuota := v_extraQuota - v_lastQuota;
                            --如果充值额比上一个协议价还大
                            if v_extraQuota >=0 then
                             /* 上一个协议价的余额比充值额小，用户的余额清零 */
                                  update org_remain_balance orb
                                  set orb.sms_quota = 0, orb.last_update_quota_date =sysdate
                                  where orb.user_id = P_USER_ID
                                  and orb.status=1
                                  and orb.unit_price=v_unitprice;
                                  --返回协议价和条数  例如 0.3:5
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
                             --充值额比上一个最早的协议价余额小
                            elsif v_extraQuota <0 then
                                /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
                                update org_remain_balance orb
                                set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate
                                where orb.user_id = P_USER_ID
                                and orb.status=1
                                and orb.unit_price=v_unitprice;
                                --返回协议价和条数  例如 0.3:5
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
  WHEN NO_START_UNIT_PRICE THEN
    DBMS_OUTPUT.PUT_LINE('用户所属机构的协议价还没到启用时间');
    RUN_RESULT    := 13;
    RUN_EXCEPTION := '用户所属机构的协议价还没到启用时间';
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
 /*初始化余额表，把所有符合条件的用户，机构插入余额表*/
  --游标：查询用户余额
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
    --游标：查询金额渠道子机构余额    
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
     --分组查询send表的数据,按人分组,统计一人一天发送多少短信
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
        left join channel_info c on c.channel_id=t.channel_id                 --分直连通道和第三方通道
       where  1=1
              and t.send_time is not null
              and t.send_time <=CAST(trunc(sysdate)-2 AS TIMESTAMP)
              and t.send_time >=CAST(trunc(sysdate)-3 AS TIMESTAMP)
              and (org.deduct_mode=1 and t.send_status = any(1,5) or org.deduct_mode=0 and t.send_status=any(1,5,6))   --发送状态 ： 1已提交 , 5发送成功 ,6发送失败
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

           --剩余条数
           select u.user_quota into remainMessageQuota from user_info u where u.user_id=one_record.user_id;

           --剩余金额
           select u.user_balance into remainBalance from user_info u where u.user_id=one_record.user_id;

             --插入表数据
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
       
       --非在线充值
       if isOnline=0 then
       
           --和佳Admin给渠道下的子机构或个人充值
           if operatorId='1' then
               --机构
               if userType=1 then 
                  
                  SELECT o.user_id,o.parentid into v_orgId,v_parentId
                  FROM ORGANIZATION o where o.user_id=userId and userType=1;
                  
                  --渠道下的子机构
                  IF v_parentId !='1' AND v_parentId !='0' and v_orgId !='1' then
                      --查询渠道的单价
                      SELECT o.pay_mode,up.unit_price into v_payMode,v_unitPrice
                      FROM organization o 
                      left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                      where o.user_id=v_parentId;
                      
                        --和佳admin做充值操作
                        if paymentType in(0,1) then    
                        
                           --渠道充值
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                        --和佳admin做冲帐操作
                        if paymentType in(2,4) then
                           --渠道冲账
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);   
                        end if;
                         --和佳admin做补帐操作
                        if paymentType in(3,5) then
                           --渠道补帐
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, v_unitPrice*nvl(paymentQuota,0), nvl(paymentQuota,0), operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                  end if;    
               end if;
               --和佳admin给个人充值
               if userType=0 then 
               
                  SELECT o.user_id,o.parentid into v_orgId,v_parentId
                  FROM user_info u 
                  left join organization o on o.user_id=u.organization_id
                  where u.user_id=userId and userType=0;
                                    
                   --渠道
                  IF v_parentId ='1' then
                  
                      SELECT o.user_id,o.parentid,o.pay_mode,up.unit_price into v_orgId,v_parentId,v_payMode,v_unitPrice 
                      FROM user_info u 
                      left join organization o on o.user_id=u.organization_id
                      left join unit_price_info up on up.organization_id=u.organization_id and up.effective=0 and up.biz_type=0
                      where u.user_id=userId and userType=0;
                      --和佳admin做充值操作
                      if paymentType in(0,1) then    
                           --渠道充值
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1); 
                      end if; 
                      --和佳admin做冲帐操作
                      if paymentType in(2,4) then
                           --渠道冲账
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --和佳admin做补帐操作
                      if paymentType in(3,5) then
                           --渠道补账
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate, paymentQuota*v_unitPrice, paymentQuota, operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                     
                  end if;
                  --渠道子机构
                  IF v_parentId !='1' AND v_parentId !='0' and v_orgId !='1' then                  
                  
                     SELECT o.pay_mode,up.unit_price into v_payMode,v_unitPrice 
                      FROM organization o 
                      left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                      where o.user_id=v_parentId;
                      --和佳admin做充值操作
                      if paymentType in(0,1) then
                           --渠道充值
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,1,0,0,null), 0, 1, rechargeExplain, quotaType, 1); 
                           --渠道子机构充值
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), paymentQuota, operatorId, 0, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                      --和佳admin做冲帐操作
                      if paymentType in(2,4) then
                           --渠道冲帐
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,2,0,4,null), 0, 1, rechargeExplain, quotaType, 1); 
                           --渠道子机构冲帐
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,0, paymentQuota, operatorId, 4, 0, 1, rechargeExplain, quotaType, 1);                           
                      end if;
                      --和佳admin做补帐操作
                      if paymentType in(3,5) then
                           --渠道补帐
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_parentId, sysdate, decode(v_payMode,1,paymentQuota*v_unitPrice,0,0,null), decode(v_payMode,1,0,0,paymentQuota,null), operatorId, decode(v_payMode,1,3,0,5,null), 0, 1, rechargeExplain, quotaType, 1); 
                           --渠道子机构补帐
                           insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                           values (sys_guid(), v_orgId, sysdate,0, paymentQuota, operatorId, 5, 0, 1, rechargeExplain, quotaType, 1);
                      end if;
                  end if;
               end if;
           end if;
           
           --渠道admin给子机构成员充值
            if operatorId !='1' then
                  --查询渠道
                  SELECT o.parentid,o.pay_mode,up.unit_price into v_parentId,v_payMode,v_unitPrice 
                  FROM user_info u 
                  left join organization o on o.user_id=u.organization_id
                   left join unit_price_info up on up.organization_id=o.user_id and up.effective=0 and up.biz_type=0
                  where u.user_id=operatorId and userType=0;
                  --查询子机构
                  SELECT o.user_id into v_orgId
                  FROM user_info u
                  left join organization o on o.user_id=u.organization_id
                  where u.user_id=userId and userType=0;
                  
                  if v_parentId ='1' then
                        --充值
                        if paymentType in(0,1) then
                             --渠道子机构充值
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 0, 0, 1, rechargeExplain, quotaType, 1); 
                        end if;
                        --冲账
                        if paymentType in(2,4) then
                             --渠道子机构冲账
                             insert into payment_record (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA, OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE, IS_SUCCESS)
                             values (sys_guid(), v_orgId, sysdate, 0, nvl(paymentQuota,0), operatorId, 4, 0, 1, rechargeExplain, quotaType, 1);  
                        end if;
                        --补帐
                        if paymentType in(3,5) then
                             --渠道子机构补帐
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
     --分组查询SEND表的数据,按人分组,统计一人一天发送多少短信
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
        LEFT JOIN CHANNEL_INFO C ON C.CHANNEL_ID=T.CHANNEL_ID                 --分直连通道和第三方通道
       WHERE  1=1
              AND T.SEND_TIME IS NOT NULL
              AND T.SEND_TIME >=NVL(TO_TIMESTAMP(RUN_TIME||' 00:00:00.000','YYYY-MM-DD HH24:MI:SS.FF'),CAST(TRUNC(SYSDATE)-3 AS TIMESTAMP))
              AND T.SEND_TIME <=NVL(TO_TIMESTAMP(RUN_TIME||' 23:59:59.999','YYYY-MM-DD HH24:MI:SS.FF'),CAST(TRUNC(SYSDATE)-2 AS TIMESTAMP))
              AND (ORG.DEDUCT_MODE=1 AND T.SEND_STATUS = ANY(1,5) OR ORG.DEDUCT_MODE=0 AND T.SEND_STATUS=ANY(1,5,6))   --发送状态 ： 1已提交 , 5发送成功 ,6发送失败
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

    ONE_RECORD C_CONSUME%ROWTYPE;                                                --游标行
    REMAINMESSAGEQUOTA DAILY_RECKONING_INFO.REMAIN_MESSAGE_QUOTA%TYPE;           --剩余短信配额
    REMAINBALANCE     DAILY_RECKONING_INFO.REMAIN_BALANCE%TYPE;                 --剩余金额
    COUNT_MESSAGE  NUMBER;
    
BEGIN
    REMAINMESSAGEQUOTA :=0;  --初始值设为0
    REMAINBALANCE :=0;
    COUNT_MESSAGE :=0;
    
    --查询这一天的日结单，检测是否已经生成过了日结单
    SELECT COUNT(1) INTO COUNT_MESSAGE FROM DAILY_RECKONING_INFO D WHERE TO_CHAR(D.RECKONING_DATE,'YYYY-MM-DD')=RUN_TIME;
    --如果日结单表没有这一天的记录，则重新生成这一天的数据
    if COUNT_MESSAGE=0 then 
          IF C_CONSUME%ISOPEN THEN --防止上次游标未关闭
            CLOSE C_CONSUME;
          END IF;

          --打开游标
          OPEN C_CONSUME;
          --循环游标
            LOOP
              FETCH C_CONSUME INTO ONE_RECORD; --提取游标
                EXIT WHEN C_CONSUME%NOTFOUND;

                 --剩余条数
                 SELECT U.USER_QUOTA INTO REMAINMESSAGEQUOTA FROM USER_INFO U WHERE U.USER_ID=ONE_RECORD.USER_ID;

                 --剩余金额
                 SELECT U.USER_BALANCE INTO REMAINBALANCE FROM USER_INFO U WHERE U.USER_ID=ONE_RECORD.USER_ID;

                   --插入表数据
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
    --分组查询日结单表的数据,按人分组,统计每人每月发送多少短信
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

     --发送失败的短信
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
           AND S1.REPORT_TIME <=CAST(TRUNC(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),'MONTH')+3 AS TIMESTAMP)                   --本月第4天凌晨
           AND S1.REPORT_TIME >=CAST(TRUNC(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),'MONTH') AS TIMESTAMP)                     --本月第1天凌晨
           AND S1.SEND_TIME >=CAST(TRUNC(LAST_DAY(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1)))-2 AS TIMESTAMP)    --月底倒数第3天
           AND S1.SEND_TIME <=CAST(TRUNC(LAST_DAY(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1))) AS TIMESTAMP)      --月底最后1天
           and s1.return_fee =1                                                              --返回费用:未返回费用
         group by s1.user_id, u.pay_mode, o.fee_mode, u.organization_id,o.pay_mode;

     ONE_RECORD C_CONSUME%ROWTYPE;           --游标行
     ONE_MAIN C_MONTH_MAIN%ROWTYPE;          --游标行
     COUNT_MESSAGE NUMBER;

BEGIN

       --查询这一天的月账单，检测是否已经生成过了月账单
       SELECT COUNT(1) INTO COUNT_MESSAGE FROM MONTH_RECKONING_INFO M WHERE M.ACCOUNT_TIME=RUN_TIME;            
       --如果月账单表没有这个月的记录，则重新生成这个月的数据
       if COUNT_MESSAGE=0 then 
             IF C_MONTH_MAIN%ISOPEN THEN --防止上次游标未关闭
                CLOSE C_MONTH_MAIN;
             END IF;
             IF C_CONSUME%ISOPEN THEN --防止上次游标未关闭
                CLOSE C_CONSUME;
             END IF;
             --把失败返还的短信加到上个月底的用户/机构余额里
             BEGIN
                 OPEN C_MONTH_MAIN;
                      LOOP
                          FETCH C_MONTH_MAIN INTO ONE_MAIN;
                          EXIT WHEN C_MONTH_MAIN%NOTFOUND;
                          --自付费
                          IF ONE_MAIN.FEE_MODE=0 THEN
                             UPDATE MONTH_MAIN_INFO MM
                             SET MM.REMAIN_QUOTA=MM.REMAIN_QUOTA+ONE_MAIN.FAILTOTALQUATA
                             WHERE MM.USER_ID=ONE_MAIN.USER_ID
                             AND MM.USER_TYPE=0
                             AND MM.TIME=TO_CHAR(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1),'YYYYMM');
                          END IF;
                          --组付费
                          IF ONE_MAIN.FEE_MODE=1 THEN
                             --金额付费
                             IF ONE_MAIN.ORGPAYMODE=1 THEN
                                UPDATE MONTH_MAIN_INFO MM
                                SET MM.REMAIN_FEE=MM.REMAIN_FEE+ONE_MAIN.FAILTOTALFEE
                                WHERE MM.USER_ID=ONE_MAIN.ORGANIZATION_ID
                                AND MM.USER_TYPE=1
                                AND MM.TIME=TO_CHAR(ADD_MONTHS(to_date(RUN_TIME||'-03','YYYY-MM-DD HH24:MI:SS'),-1),'YYYYMM');
                             END IF;
                             --配额付费
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

   --插入临时表
      insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('----',sysdate);
      
             BEGIN
              --打开游标
              OPEN C_CONSUME;
              --循环游标
                LOOP
                  FETCH C_CONSUME INTO ONE_RECORD; --提取游标
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
    --分组查询日结单表的数据,按人分组,统计每人每月发送多少短信
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
           
     --发送失败的短信
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
           AND S1.REPORT_TIME <=CAST(TRUNC(SYSDATE,'MONTH')+3 AS TIMESTAMP)                   --本月第4天凌晨
           AND S1.REPORT_TIME >=CAST(TRUNC(SYSDATE,'MONTH') AS TIMESTAMP)                     --本月第1天凌晨
           AND S1.SEND_TIME >=CAST(TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1)))-2 AS TIMESTAMP)    --月底倒数第3天
           AND S1.SEND_TIME <= CAST(TRUNC(SYSDATE,'MONTH') AS TIMESTAMP)                       --月底最后1天
           AND S1.RETURN_FEE =1                                                              --返回费用:已返回费用
         GROUP BY S1.USER_ID, U.PAY_MODE, O.FEE_MODE,S1.USER_ORGANIZATION,O.PAY_MODE;      
                 
     ONE_RECORD C_CONSUME%ROWTYPE;           --游标行
     ONE_MAIN C_MONTH_MAIN%ROWTYPE;          --游标行

BEGIN
       IF C_MONTH_MAIN%ISOPEN THEN --防止上次游标未关闭
          CLOSE C_MONTH_MAIN;
       END IF;
       IF C_CONSUME%ISOPEN THEN --防止上次游标未关闭
          CLOSE C_CONSUME;
       END IF;
       --把失败返还的短信加到上个月底的用户/机构余额里
       BEGIN 
           OPEN C_MONTH_MAIN;
                LOOP
                    FETCH C_MONTH_MAIN INTO ONE_MAIN;
                    EXIT WHEN C_MONTH_MAIN%NOTFOUND;
                    --自付费
                    IF ONE_MAIN.FEE_MODE = 0 THEN
                       UPDATE MONTH_MAIN_INFO MM 
                       SET MM.REMAIN_QUOTA = MM.REMAIN_QUOTA + nvl(ONE_MAIN.FAIL_QUATA,0) 
                       WHERE MM.USER_ID=ONE_MAIN.USER_ID 
                       AND MM.USER_TYPE=0 
                       AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                    END IF;
                    --组付费
                    IF ONE_MAIN.FEE_MODE=1 THEN
                       --金额付费
                       IF ONE_MAIN.ORGPAYMODE=1 THEN
                          UPDATE MONTH_MAIN_INFO MM 
                          SET MM.REMAIN_FEE = MM.REMAIN_FEE + nvl(ONE_MAIN.FAIL_FEE,0) 
                          WHERE MM.USER_ID = ONE_MAIN.ORGANIZATION_ID 
                          AND MM.USER_TYPE=1 
                          AND MM.TIME=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       END IF;
                       --配额付费
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
        --打开游标
        OPEN C_CONSUME;
        --循环游标
          LOOP
            FETCH C_CONSUME INTO ONE_RECORD; --提取游标
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
    --游标：查询用户余额
    cursor c_user is
        select u.user_id, u.user_quota
        from user_info u
        left join organization o on o.user_id = u.organization_id
        group by u.user_id,u.user_quota;
    --游标：查询机构余额    
    cursor c_org is 
      select o.user_id,o.parentid,o.pay_mode,o.user_quota,o.user_balance
      from organization o
      left join user_info u on u.organization_id=o.user_id
      group by o.user_id,o.parentid,o.pay_mode,o.user_quota,o.user_balance;
    
    c_user_each c_user%rowtype;  
    c_org_each c_org%rowtype; 

    v_moneyAdd organization.user_balance%type;         --金额充值
    v_moneySub organization.user_balance%type;         --金额冲账
    v_quotaAdd organization.user_quota%type;           --配额充值
    v_quotaSub organization.user_quota%type;           --配额冲账
    v_checkNum number;                                 --记录余额表中上月的数据数（如果为0，则插入余额表）
    v_blanceRemain organization.user_balance%type;     --中间值：记录金额渠道的总金额（所有子机构，用户的总和）
    v_quotaRemain  organization.user_quota%type;       --中间值：记录配额渠道的总金额（所有子机构，用户的总和）
    
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
                   --用户充值，补帐
                   select sum(p.payment_quota) into v_quotaAdd  from payment_record p 
                   where p.user_id = c_user_each.user_id
                   and p.payment_type = any(0,5) 
                   and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                   --用户冲账
                   select sum(p.payment_quota) into v_quotaSub  from payment_record p 
                   where p.user_id = c_user_each.user_id
                   and p.payment_type = 4 
                   and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                   
                   --插入自付费用户余额,充值条数
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
                   
                   --渠道子机构(全部为配额充值)
                   if c_org_each.parentid !='1' and c_org_each.parentid !='0' and c_org_each.user_id !='1' then
                       --充值，补帐
                       select sum(nvl(p.payment_quota,0)) into v_quotaAdd  
                       from payment_record p 
                       left join organization o on o.user_id=p.user_id
                       where 1=1
                       and p.user_id = c_org_each.user_id
                       and (p.payment_type=any(0,5) and p.is_online=0 or p.is_online=1)
                       and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                       --冲账
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
                        --插入机构余额
                       insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                       values (sys_guid(),c_org_each.user_id,1, nvl(v_quotaRemain,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                       
                   end if;
                   
                   --渠道(可以为金额或配额)
                   if c_org_each.parentid ='1' then
                         --配额渠道
                         if c_org_each.pay_mode=0 then
                             --充值，补帐
                             select sum(nvl(p.payment_quota,0)) into v_quotaAdd  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and (p.payment_type=any(0,5) and p.is_online=0 or p.is_online=1)
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --冲账
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
                              --插入机构余额,充值额
                             insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                             values (sys_guid(),c_org_each.user_id,1, nvl(v_quotaRemain,0), 0, nvl(v_quotaAdd,0)-nvl(v_quotaSub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                         end if;
                         
                         --金额渠道
                         if c_org_each.pay_mode=1 then
                             --充值，补帐
                             select sum(nvl(p.payment_money,0)) into v_moneyAdd  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and (p.payment_type=any(1,3) and p.is_online=0 or p.is_online=1)
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --冲账
                             select sum(nvl(p.payment_money,0)) into v_moneySub  
                             from payment_record p 
                             left join organization o on o.user_id=p.user_id
                             where 1=1
                             and p.user_id = c_org_each.user_id
                             and p.payment_type=2
                             and to_char(p.payment_time,'yyyymm')=TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM');
                             --查询子机构和用户总余额(换算成金额)
                             select sum(orb.sms_quota*orb.unit_price) into v_blanceRemain from 
                              org_remain_balance orb 
                              where orb.user_id in (select o.user_id from organization o where o.parentid=c_org_each.user_id)
                              or orb.user_id in (select u.user_id from user_info u 
                                                   left join organization o on o.user_id=u.organization_id
                                                   where o.user_id=c_org_each.user_id or o.parentid=c_org_each.user_id);
                             v_blanceRemain := c_org_each.user_balance + v_blanceRemain;
                              --插入机构余额,充值额
                             insert into month_main_info (MONTH_MAIN_INFO_ID, USER_ID, USER_TYPE, REMAIN_QUOTA, REMAIN_FEE, MONTH_PAYMENT, TIME)
                             values (sys_guid(),c_org_each.user_id,1, nvl(c_org_each.user_quota,0), nvl(v_blanceRemain,0), nvl(v_moneyAdd,0)-nvl(v_moneySub,0), TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'));
                         end if;    
                        
                   end if;                  
                
                   --和佳(没有哪个机构可以为和佳充值)
                   if c_org_each.parentid ='0' then
                         --插入机构余额,充值额
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
  
    orgCount number;   --查询机构余额是否已经存在余额表
    v_unitprice org_remain_balance.unit_price%type;
    v_payMode organization.pay_mode%type;
    v_parentid organization.parentid%type;
    v_operatorId user_info.user_id%type;
    v_extraQuota organization.user_quota%type; --子机构给用户充值，充值条数-当前协议价余额 的余额
    v_lastQuota organization.user_quota%type;  --时间最早的一个余额
    v_userQuota organization.user_quota%type;  --充值条数，根据充值类型，选择正数或负数，充值为正，冲账为负
    v_subOrgId  organization.user_id%type;     --中间值，存子机构id
begin
    orgCount :=0;
    v_unitprice :=0;
    v_userQuota :=0;
                
    if paymentType =4 then 
       v_userQuota := 0-userQuota;
    elsif paymentType !=4 then
       v_userQuota := userQuota;    
    end if;     
    
    --金额渠道子机构充值
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
    --用户充值
    if userType=0 then
        select o.parentid into v_parentid  from organization o where o.user_id=(select u.organization_id from user_info u where u.user_id=userId);
        --渠道用户
        if v_parentid='1' then
              SELECT up.unit_price,o.pay_mode into v_unitprice,v_payMode
              FROM organization o
              left join user_info u on u.organization_id=o.user_id
              left join unit_price_info up on up.organization_id=o.user_id
              where u.user_id=userId
              and up.effective=0;
               --金额渠道下的，子机构的用户
              if v_payMode=1 then
                    /* 插入用户的余额 
                    *  金额渠道仍然使用机构表的金额
                    */
                    select count(1) into orgCount 
                    from org_remain_balance orb 
                    where orb.user_id = userId
                    and orb.unit_price =v_unitprice
                    and orb.status=1;
                    --余额表中已存在此用户最新协议价余额，修改余额
                    if orgCount>0 then
                        update org_remain_balance orb 
                        set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate 
                        where orb.user_id = userId 
                        and orb.status=1 
                        and orb.unit_price=v_unitprice;
                     --余额表中不存在此用户最新协议价余额，插入余额
                    elsif orgCount=0 then
                         insert into org_remain_balance 
                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                         values 
                         (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                    end if;                                  
              end if;
                  
        end if;
        --下属机构用户
        if v_parentid !='1' and v_parentid !='0' then
              SELECT up.unit_price,o.pay_mode into v_unitprice,v_payMode
              FROM organization o
              left join unit_price_info up on up.organization_id=o.user_id
              where o.parentid='1'
              and up.effective=0
              START WITH o.user_id=(select u.organization_id from user_info u where u.user_id=userId)
              CONNECT BY PRIOR o.parentid=o.user_id;
              --金额渠道下的，子机构的用户
              if v_payMode=1 then
                    --如果是和佳Admin给子机构用户越级充值，直接加到用户的最新余额里
                    if operatorId = '1' then 
                          --查询用户是否有最新的协议价余额
                          select count(1) into orgCount 
                          from org_remain_balance orb 
                          where orb.user_id = userId 
                          and orb.status=1
                          and orb.unit_price =v_unitprice;
                          --余额表中已存在此用户最新协议价余额，修改余额
                           if orgCount>0 then
                              update org_remain_balance orb 
                              set orb.sms_quota = orb.sms_quota+ v_userQuota, orb.last_update_quota_date =sysdate 
                              where orb.user_id = userId 
                              and orb.status=1 
                              and orb.unit_price=v_unitprice;
                           --余额表中不存在此用户最新协议价余额，插入余额
                           elsif orgCount=0 then
                               insert into org_remain_balance 
                               (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                               values 
                               (sys_guid(), userId,1, v_userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                           end if;
                     /*子机构管理员给本机构用户充值 */     
                    elsif  operatorId != '1' then 
                             -- 查询充值操作人(如果是子机构的管理员，则执行充值算法)
                             select u.user_id into v_operatorId 
                             from user_info u 
                             where u.user_type=1 
                             and u.user_stat=1
                             and u.organization_id=(select ui.organization_id from user_info ui where ui.user_id=userId and ui.user_stat=1);
                             --如果子机构管理员给自己用户充值，子机构扣除相应的条数
                             if v_operatorId =operatorId then
                                  --查询子机构的id
                                  select u.organization_id into v_subOrgId from user_info u where u.user_stat = 1 and u.user_id = userId;
                             
                                  if v_userQuota >0 then 
                                      
                                      begin
                                          --查询子机构余额大于零且协议价最早的子机构余额
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
                                               /* 插入用户的余额 */
                                               select count(1) into orgCount 
                                               from org_remain_balance orb 
                                               where orb.user_id = userId
                                               and orb.status =1 
                                               and orb.unit_price =v_unitprice;
                                                --余额表中已存在此用户最新协议价余额，修改余额
                                               if orgCount>0 then
                                                  update org_remain_balance orb 
                                                  set orb.sms_quota = orb.sms_quota+ userQuota, orb.last_update_quota_date =sysdate 
                                                  where orb.user_id = userId 
                                                  and orb.status=1 
                                                  and orb.unit_price=v_unitprice;
                                               --余额表中不存在此用户最新协议价余额，插入余额
                                               elsif orgCount=0 then
                                                   insert into org_remain_balance 
                                                   (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                   values 
                                                   (sys_guid(), userId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                               end if;
                                              /* 充值额比最早的协议价余额小，扣除相应的子机构余额 */
                                              update org_remain_balance orb 
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate 
                                              where orb.user_id = v_subOrgId
                                              and orb.status=1 
                                              and orb.unit_price=v_unitprice;
                                         /* end if;
                                         --算法：子机构给自己用户充值,使用循环 
                                         if v_extraQuota >0 then*/
                                         else
                                            loop
                                              --查询子机构余额大于零且协议价最早的子机构余额
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
                                              DBMS_OUTPUT.PUT_LINE('算法：子机构给自己用户充值,开始循环 v_lastQuota' ||v_lastQuota||' v_unitprice'||v_unitprice  );           
                                              --从时间最早的一个协议价余额开始减
                                              v_extraQuota := v_extraQuota - v_lastQuota;
                                              DBMS_OUTPUT.PUT_LINE('v_extraQuota '||v_extraQuota);  
                                               --如果充值额比上一个协议价还大
                                              if v_extraQuota >=0 then
                                              /* 插入用户的余额 */
                                                  select count(1) into orgCount 
                                                  from org_remain_balance orb 
                                                  where orb.user_id = userId
                                                  and orb.status =1 
                                                  and orb.unit_price =v_unitprice;
                                                  DBMS_OUTPUT.PUT_LINE('开始插入用户余额 orgCount '||orgCount);  
                                                  --余额表中已存在此用户最新协议价余额，修改余额
                                                   if orgCount>0 then
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = orb.sms_quota+ v_lastQuota, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId 
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice;
                                                   --余额表中不存在此用户最新协议价余额，插入余额
                                                   elsif orgCount=0 then
                                                       insert into org_remain_balance 
                                                       (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                       values 
                                                       (sys_guid(), userId,1, v_lastQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                                   end if;
                                               /* 上一个协议价的余额比充值额小，子机构的余额清零 */
                                                    update org_remain_balance orb 
                                                    set orb.sms_quota = 0, orb.last_update_quota_date =sysdate 
                                                    where orb.user_id = v_subOrgId 
                                                    and orb.status=1 
                                                    and orb.unit_price=v_unitprice; 
                                              --充值额比上一个最早的协议价余额小    
                                              elsif v_extraQuota <0 then
                                                   /* 插入用户的余额 */
                                                   select count(1) into orgCount 
                                                   from org_remain_balance orb 
                                                   where orb.user_id = userId
                                                   and orb.status =1 
                                                   and orb.unit_price =v_unitprice;
                                                    --余额表中已存在此用户最新协议价余额，修改余额
                                                   if orgCount>0 then
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = orb.sms_quota+ v_lastQuota+v_extraQuota, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId 
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice;
                                                   --余额表中不存在此用户最新协议价余额，插入余额
                                                   elsif orgCount=0 then
                                                       insert into org_remain_balance 
                                                       (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                       values 
                                                       (sys_guid(), userId,1, v_lastQuota+v_extraQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 0,0);
                                                   end if;
                                                  /* 充值额比最早的协议价余额小，扣除相应的子机构余额 */
                                                  update org_remain_balance orb 
                                                  set orb.sms_quota = orb.sms_quota - (v_lastQuota+v_extraQuota), orb.last_update_quota_date =sysdate 
                                                  where orb.user_id = v_subOrgId
                                                  and orb.status=1 
                                                  and orb.unit_price=v_unitprice;
                                              end if;
                                              --充值额减最早的协议价余额，小于0则退出循环
                                              exit when v_extraQuota <=0;
                                          end loop;        
                                         end if;
                                         
                                      end;
                                  --用户冲账    
                                  elsif v_userQuota <0  then 
                                        begin
                                          --查询用户余额大于零且协议价最早的子机构余额
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
                                              /* 插入子机构的余额 */
                                               select count(1) into orgCount 
                                               from org_remain_balance orb 
                                               where orb.user_id = v_subOrgId
                                               and orb.status =1 
                                               and orb.unit_price =v_unitprice;
                                                --余额表中已存在此用户最新协议价余额，修改余额
                                               if orgCount>0 then
                                                  update org_remain_balance orb 
                                                  set orb.sms_quota = orb.sms_quota+ userQuota, orb.last_update_quota_date =sysdate 
                                                  where orb.user_id = v_subOrgId 
                                                  and orb.status=1 
                                                  and orb.unit_price=v_unitprice;
                                               --余额表中不存在此用户最新协议价余额，插入余额
                                               elsif orgCount=0 then
                                                   insert into org_remain_balance 
                                                   (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                   values 
                                                   (sys_guid(), v_subOrgId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                               end if;
                                              /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
                                              update org_remain_balance orb 
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate 
                                              where orb.user_id = userId
                                              and orb.status=1 
                                              and orb.unit_price=v_unitprice;
                                          /*end if;*/
                                          else
                                            loop
                                                --查询用户余额大于零且协议价最早的子机构余额
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
                                                --从时间最早的一个协议价余额开始减
                                                v_extraQuota := v_extraQuota - v_lastQuota;
                                                --如果充值额比上一个协议价还大
                                                if v_extraQuota >=0 then
                                                    /* 插入子机构的余额 */
                                                    select count(1) into orgCount 
                                                    from org_remain_balance orb 
                                                    where orb.user_id = v_subOrgId 
                                                    and orb.status =1 
                                                    and orb.unit_price =v_unitprice;
                                                    --余额表中已存在此子机构最新协议价余额，修改余额
                                                     if orgCount>0 then
                                                        update org_remain_balance orb 
                                                        set orb.sms_quota = orb.sms_quota+ v_lastQuota, orb.last_update_quota_date =sysdate 
                                                        where orb.user_id = v_subOrgId 
                                                        and orb.status=1 
                                                        and orb.unit_price=v_unitprice;
                                                     --余额表中不存在此用户最新协议价余额，插入余额
                                                     elsif orgCount=0 then
                                                         insert into org_remain_balance 
                                                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                         values 
                                                         (sys_guid(), v_subOrgId,1, v_lastQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                                     end if;
                                                 /* 上一个协议价的余额比充值额小，用户的余额清零 */
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = 0, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice; 
                                                
                                                 --充值额比上一个最早的协议价余额小       
                                                elsif v_extraQuota <0 then
                                                     /* 插入子机构的余额 */
                                                     select count(1) into orgCount 
                                                     from org_remain_balance orb 
                                                     where orb.user_id = v_subOrgId
                                                     and orb.status =1 
                                                     and orb.unit_price =v_unitprice;
                                                      --余额表中已存在此用户最新协议价余额，修改余额
                                                     if orgCount>0 then
                                                        update org_remain_balance orb 
                                                        set orb.sms_quota = orb.sms_quota+ v_lastQuota+v_extraQuota, orb.last_update_quota_date =sysdate 
                                                        where orb.user_id = v_subOrgId 
                                                        and orb.status=1 
                                                        and orb.unit_price=v_unitprice;
                                                     --余额表中不存在此用户最新协议价余额，插入余额
                                                     elsif orgCount=0 then
                                                         insert into org_remain_balance 
                                                         (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                                                         values 
                                                         (sys_guid(), v_subOrgId,1, userQuota, v_unitprice,0, sysdate, nvl(operatorId,''), nvl(rechargeExplain,''), sysdate, 1,0);
                                                     end if;
                                                    /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
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
                             /*渠道管理员给子机构用户充值*/     
                             else
                                    --用户充值，补帐
                                  if v_userQuota >0 then 
                                       --查询最新协议价余额
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
                                       
                                  --用户冲账    
                                  elsif v_userQuota <0  then 
                                        begin
                                          --查询用户余额大于零且协议价最早的子机构余额
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
                                          --充值额比最早的一个协议价余额少
                                          if (userQuota - v_lastQuota) <=0 then
                                               /*在java代码中已经减过渠道的金额，此处无须再减
                                               充值额比最早的协议价余额小，扣除相应的用户余额*/ 
                                              update org_remain_balance orb 
                                              set orb.sms_quota = orb.sms_quota - userQuota, orb.last_update_quota_date =sysdate 
                                              where orb.user_id = userId
                                              and orb.status=1 
                                              and orb.unit_price=v_unitprice;
                                          --充值额比最早的一个协议价余额多    
                                          else
                                            loop
                                                --查询用户余额大于零且协议价最早的子机构余额
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
                                                --从时间最早的一个协议价余额开始减
                                                v_extraQuota := v_extraQuota - v_lastQuota;
                                                --如果充值额比上一个协议价还大
                                                if v_extraQuota >=0 then 
                                                 /* 上一个协议价的余额比充值额小，用户的余额清零 */
                                                      update org_remain_balance orb 
                                                      set orb.sms_quota = 0, orb.last_update_quota_date =sysdate 
                                                      where orb.user_id = userId
                                                      and orb.status=1 
                                                      and orb.unit_price=v_unitprice; 
                                                 --充值额比上一个最早的协议价余额小       
                                                elsif v_extraQuota <0 then
                                                    /* 充值额比最早的协议价余额小，扣除相应的用户余额 */
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
    
        --最后提交
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
  --查询长短信最后一条短信
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
  c_sinature_pool   cur_rs;--存放签名的游标
  r_signature_pool  sgw_signature_pool%rowtype;

  v_msg_total             varchar2(2000);--拼接的信息
  v_msg_count       number :=0;
  v_signature_ok    number :=0;
  v_has_total       number :=1; --是否完整的短信
  v_send_id         varchar2(2000);

  errormessage      exception;
begin

  --更新不需要进行签名池校验的数据
  --update send t set t.send_status = 0 where t.send_status = -1 and t.charge = 1;
  --commit;

  open send_cur;

      --检查短信
      loop
          fetch send_cur into r_send;

          v_msg_total    := '';
          v_msg_count    := 0;
          v_signature_ok := 0;
          v_has_total    := 1;
          v_send_id      := '';

          --查询其余短信
          --循环和拼接短信
          FOR a_send IN (
                         select *
                                from send t
                                where     t.send_status = -1
                                      and t.mobile_to = r_send.mobile_to
                                      and t.longsms_tag = r_send.longsms_tag
                                 order by t.current_pageno )
          LOOP
              v_msg_count := v_msg_count + 1;

              --检查短信序号情况
              if v_msg_count != to_number(a_send.current_pageno) THEN
                 --序号不一致，则推出循环和trigger
                 v_has_total := 0;
                 exit;
              end if;
              --拼接长短信
              v_msg_total := v_msg_total||a_send.send_msg;
              if length(v_send_id) > 0 then
                   v_send_id := v_send_id||','||''''||a_send.send_id||'''';
              else
                   v_send_id := ''''||a_send.send_id||'''';
              end if;
          END LOOP;

          --可以拼接成长短信
          if v_has_total = 1 and v_msg_count = r_send.originalsms_totalpages then
            --检查是否在签名中
            open c_sinature_pool for
                 select pool.*
                        from sgw_signature_pool pool
                        LEFT JOIN sgw_customer customer ON pool.customer_id = customer.customer_id
                                                       AND  customer.org_id= r_send.user_organization;
                loop
                    fetch c_sinature_pool into r_signature_pool;
                    exit when c_sinature_pool%notfound;
                          --在签名池中
                          if instr(v_msg_total,r_signature_pool.signature,1,1) > 0 then
                             --更新短信状态
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
                             --退出循环
                             exit;
                          end if;
                end loop;
            close c_sinature_pool;

            --不在签名池中，则修改短信状态
            if v_signature_ok = 0 then
               execute immediate ('update send set send_status = 6, report = ''UD:0000'',err_msg = ''自主签名不在签名池'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               commit;
            end if;
          end if;
          exit when send_cur%notfound;
      end loop;
  close send_cur;

  --更新超时的短信,60分钟之前的
  update send t set t.send_status = -3, t.err_msg = '检验签名超时' where t.send_status = -1 and t.sys_time < (sysdate - 60/60/24);
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
user_id sms_send_analyze.user_id%type;--发送的用户id
stat_time sms_send_analyze.stat_time%type;--发送日期
quantity sms_send_analyze.quantity%type;--短信发送总量
org_id sms_send_analyze.org_id%type;--用户所属机构
cursor sms_cursor_result is select
 sum(MOBILE_QUANTITIES) quantity,
user_id,USER_ORGANIZATION as
 org_id,max(to_number(to_char(sysdate,'yyyymmdd')))
 as stat_time from send where sys_time<=sysdate
 and sys_time>trunc(sysdate,'dd') group by user_id,USER_ORGANIZATION;--统计机构当天的发送量
begin
if sms_cursor_result%isopen then--防止游标上次未关闭
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
       v_sendTime date;--存开始日期
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- 拼接的基础SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --删除三天前发送短信的统计的数据 开始
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_channel_analyze sca where sca.stat_time >= to_number ( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --删除三天前发送短信的统计的数据 结束
          -- commit;
           --预统计三天前发送短信数量

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
             --删除当天发送短信的统计的数据 开始
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date 格式 ：2012-11-08 14:00:00
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
         p_batchId in varchar2,           --批次号
         RUN_RESULT      OUT NUMBER,
         RUN_EXCEPTION   OUT VARCHAR
       )
is
       query_SQL varchar2(1000);    --查询计费表sql
       update_SQL varchar2(1000);   --修改用户余额sql

       NO_BATCHID_RECORD exception;   --批次号不存在异常

       NO_ORG_RECORD EXCEPTION; --机构不存在

       NO_USER_RECORD EXCEPTION; --用户不存在

       NO_PAY_MODE_RECORD EXCEPTION;  --计费单位不存在

       NO_FEE_MODE_RECORD EXCEPTION;  --扣费方式不存在

       TYPE My_CurType IS REF CURSOR;                              --定义游标类型
       c_consume My_CurType;                                       --指示c_consume的类型为My_CurType，而My_CurType是游标类型
       v_batchId consume_record_info.batch_id%type;                --批次号id
       v_organizationId consume_record_info.organization_id%type;  --机构id
       v_userId consume_record_info.consumer_id%type;              --用户userId
       v_payMode organization.pay_mode%type;                       --计费单位, 0:配额付费, 1:金额付费
       v_feeMode consume_record_info.fee_mode%type;                --扣费方式, 0:自付费, 1:组付费
       v_costFee consume_record_info.cost_fee%type;                --扣费金额
       v_sendQuantity consume_record_info.send_quantity%type;       --发送条数
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
             RAISE NO_BATCHID_RECORD; --批次号不存在时抛出异常
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
     /*  --调试代码:插入临时表，查看sql
       insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('查询计费用的sql'||query_SQL,sysdate);
     */

        if c_consume%isopen then --防止上次游标未关闭
          close c_consume;
        end if;

        open c_consume for query_SQL;

        loop
          fetch c_consume into v_batchId,v_sendQuantity,v_costFee,v_userId,v_organizationId,v_payMode,v_feeMode; --提取游标
            exit when c_consume%notfound;

             --异常处理
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

             --如果是组付费
             if v_feeMode is not null and v_payMode is not null and v_organizationId is not null then
                if v_feeMode=1 then
                   --如果是配额机构,返还短信条数
                   if v_payMode=0 then
                       update_SQL :='update organization o
                          set o.user_quota = o.user_quota + '||v_sendQuantity||' where o.user_id = '''||v_organizationId||'''';
                   end if;
                   --如果是金额机构,返还金额数
                   if v_payMode=1 then
                       update_SQL :='update organization o
                          set o.user_balance = o.user_balance + '||v_costFee||' where o.user_id = '''||v_organizationId||'''';
                   end if;
                end if;
            end if;

           --如果是自付费
             if v_feeMode is not null and v_payMode is not null and v_userId is not null then
                if v_feeMode=0 then
                   --如果是配额用户,返还短信条数
                   if v_payMode=0 then
                       update_SQL :='update user_info u
                          set u.user_quota = u.user_quota + '||v_sendQuantity||' where u.user_id = single_cursor.user_id';
                   end if;
                   --如果是金额用户,返还金额数
                   if v_payMode=1 then
                      update_SQL :='update user_info u
                         set u.user_balance = u.user_balance + '||v_costFee||' where u.user_id = single_cursor.user_id';
                   end if;
                 end if;
             end if;

            DBMS_OUTPUT.PUT_LINE(update_SQL);
         /*   --调试代码:插入临时表，查看sql
           insert into temp_table_test (CREATE_SQL, CREATE_TIME)values ('修改计费用的sql'||update_SQL,sysdate);
         */

            execute immediate update_SQL;
       end loop;

           commit;
           DBMS_OUTPUT.PUT_LINE('============返回费用成功==========');
       close c_consume;

       exception
             when NO_BATCHID_RECORD then
                   DBMS_OUTPUT.PUT_LINE('批次号为空');
                   RUN_RESULT    := 1;
                   RUN_EXCEPTION := '批次号为空';
                   ROLLBACK;
             when NO_ORG_RECORD then
                   DBMS_OUTPUT.PUT_LINE('机构不存在');
                   RUN_RESULT    := 2;
                   RUN_EXCEPTION := '机构不存在';
                   ROLLBACK;
             when NO_USER_RECORD then
                   DBMS_OUTPUT.PUT_LINE('用户不存在');
                   RUN_RESULT    := 3;
                   RUN_EXCEPTION := '用户不存在';
                   ROLLBACK;
             when NO_PAY_MODE_RECORD then
                   DBMS_OUTPUT.PUT_LINE('计费单位不存在');
                   RUN_RESULT    := 4;
                   RUN_EXCEPTION := '计费单位不存在';
                   ROLLBACK;
             when NO_FEE_MODE_RECORD then
                   DBMS_OUTPUT.PUT_LINE('扣费方式不存在');
                   RUN_RESULT    := 5;
                   RUN_EXCEPTION := '扣费方式不存在';
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
               --and s1.receive_id is null                        -- 非CMPP接口过来的短信
               and s1.send_status = 6                           --发送类型:发送失败
               and (s1.return_fee=0 or s1.return_fee is null)   --返回费用:未返回费用
               and o.deduct_mode=1                              --计费类型:成功计费
               and o.pay_type=0                                 --充值类型:预付费
               and ti.time_task=0                               --是否定时任务：0不是 1是
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
               --and s1.receive_id is null                        -- 非CMPP接口过来的短信
               and s1.send_status = 6                           --发送类型:发送失败
               and (s1.return_fee=0 or s1.return_fee is null)   --返回费用:未返回费用
               and o.deduct_mode=1                              --计费类型:成功计费
               and o.pay_type=0                                 --充值类型:预付费
               and ti.time_task=1                               --是否定时任务：0不是 1是
               and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3')) or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3')))
             group by s1.user_id,s1.unit_price,to_char(s1.send_time, 'yyyymmdd'), o.fee_mode,o.parentid, u.organization_id;

      single_cursor c_consume%rowtype;
      v_payMode organization.pay_mode%type;                     --用户所属的渠道计费单位, 0:配额付费, 1:金额付费
      orgCount number;                                          --查询机构余额是否已经存在余额表

begin
      if c_consume%isopen then
         close c_consume;
      end if;

      open c_consume;
           loop
             fetch c_consume into single_cursor;
               exit when c_consume%notfound;
               --DBMS_OUTPUT.PUT_LINE(single_cursor.user_id||'--'||nvl(single_cursor.failTotalFee,0)||'---'||single_cursor.fee_mode);
                --查询此用户的渠道的计费单位, 0:配额付费, 1:金额付费
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
               --如果是自付费
               if single_cursor.fee_mode is not null and single_cursor.user_id is not null then
                 if single_cursor.fee_mode=0 then
                   --无论是配额用户还是金额用户,都返还短信条数
                       update user_info u
                          set u.user_quota = u.user_quota + nvl(single_cursor.failTotalQuata,0)
                        where u.user_id = single_cursor.user_id;
                      /* 修改余额表,金额渠道若是自付费，渠道自身用户插入余额表
                       * 金额渠道下的子机构，若是自付费，也要插入余额表
                       */
                      if v_payMode = 1 then
                          --查询用户是否有这个协议价的余额
                          select count(1) into orgCount
                          from org_remain_balance orb
                          where orb.user_id = single_cursor.user_id
                          and orb.unit_price =single_cursor.unit_price
                          and orb.status=1;
                          --有此协议价余额，增加余额
                          if orgCount>0 then
                            update org_remain_balance orb
                            set orb.sms_quota = orb.sms_quota + nvl(single_cursor.failTotalQuata,0),
                            orb.last_update_quota_date = sysdate,orb.update_user='SYS_JOB_RETURN_FEE'
                            where orb.user_id = single_cursor.user_id
                            and orb.unit_price =single_cursor.unit_price;
                          --没有此协议价余额，插入余额
                          elsif orgCount=0 then
                             insert into org_remain_balance
                             (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                             values
                             (sys_guid(), single_cursor.user_id,1, nvl(single_cursor.failTotalQuata,0), single_cursor.unit_price,0, sysdate, 'SYS_JOB_RETURN_FEE', '返回用户费用插入余额表', sysdate, 0,0);
                          end if;
                      end if;
                 end if;
               end if;

               --如果是组付费
               if single_cursor.fee_mode is not null and v_payMode is not null then
                  if single_cursor.fee_mode=1 then
                     --渠道(分金额渠道，配额渠道)
                     if single_cursor.parentid = '1' or single_cursor.parentid = '0' then
                          --如果是配额机构,返还短信条数
                         if v_payMode=0 then
                             update organization o
                                set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                              where o.user_id = single_cursor.organization_id;
                         end if;
                         --如果是金额机构,返还金额数
                         if v_payMode=1 then
                             update organization o
                                set o.user_balance = o.user_balance + nvl(single_cursor.failTotalFee,0)
                              where o.user_id = single_cursor.organization_id;
                         end if;
                     --渠道下属的子机构（全是配额，直接返回条数）
                     elsif single_cursor.parentid != '1' and single_cursor.parentid != '0' then
                         --以后扣费时，金额下属机构的余额不再起作用，它的作用只是查看总条数
                         update organization o
                         set o.user_quota = o.user_quota + nvl(single_cursor.failTotalQuata,0)
                         where o.user_id = single_cursor.organization_id;

                         /*金额渠道，下属子机构，插入余额到余额表*/

                         if v_payMode=1 then
                            --查询用户是否有这个协议价的余额
                            select count(1) into orgCount
                            from org_remain_balance orb
                            where orb.user_id = single_cursor.organization_id
                            and orb.unit_price =single_cursor.unit_price
                            and orb.status=1;
                            --有此协议价余额，增加余额
                            if orgCount>0 then
                              update org_remain_balance orb
                              set orb.sms_quota = orb.sms_quota + nvl(single_cursor.failTotalQuata,0),
                              orb.last_update_quota_date = sysdate,orb.update_user='SYS_JOB_RETURN_FEE'
                              where orb.user_id = single_cursor.organization_id
                              and orb.unit_price =single_cursor.unit_price;
                            --没有此协议价余额，插入余额
                            elsif orgCount=0 then
                               insert into org_remain_balance
                               (ROW_ID, USER_ID, STATUS, SMS_QUOTA, UNIT_PRICE, GW_TYPE, UPDATE_UNITPRICE_DATE, UPDATE_USER, REMARK, LAST_UPDATE_QUOTA_DATE, USER_TYPE,MMS_QUOTA)
                               values
                               (sys_guid(), single_cursor.organization_id,1, nvl(single_cursor.failTotalQuata,0), single_cursor.unit_price,0, sysdate, 'SYS_JOB_RETURN_FEE', '返回机构费用插入余额表', sysdate, 1,0);
                            end if;
                         end if;
                     end if;


                  end if;
              end if;

              --修改短信状态为:已返费用
               update send s set s.return_fee=1 where s.send_id in
                 (select s1.send_id
                      from send s1
                      left join user_info u on s1.user_id = u.user_id
                      left join organization o on s1.user_organization = o.user_id
                      left join channel_info c on s1.channel_id = c.channel_id
                     where to_char(s1.send_time, 'yyyymmdd') =single_cursor.send_time
                       and s1.user_id=single_cursor.user_id
                       and s1.receive_id is null                        -- 非CMPP接口过来的短信
                       and s1.send_status = 6                           --发送类型:发送失败
                       and o.deduct_mode=1                              --计费类型:成功计费
                       and o.pay_type=0                                 --充值类型:预付费
                       --and s1.deduct_fee_status !=0                      --扣费状态:成功
                       and ((s1.is_original_sms=0 and c.link_mode != all('CMPP2','SGIP','SMGP3'))
                       or (s1.mobile_quantities=1 and c.link_mode = any('CMPP2','SGIP','SMGP3'))));

                --插入充值记录表
                 --如果是组付费
                 if single_cursor.fee_mode=1 then
                     --渠道
                     if single_cursor.parentid = '1' or single_cursor.parentid = '0' then
                          --如果是配额机构,返还短信条数
                         if v_payMode=0 then
                              insert into payment_record
                              (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE,IS_ONLINE, USER_TYPE,RECHARGE_EXPLAIN,QUOTA_TYPE,IS_SUCCESS)
                              values
                              (sys_guid(), single_cursor.organization_id,sysdate,0, nvl(single_cursor.failTotalQuata,0), 'SYS_JOB_RETURN_FEE', 6, 0,1, '返还发送失败短信配额',1, 1);
                         end if;
                         --如果是金额机构,返还金额数
                         if v_payMode=1 then
                              insert into payment_record
                              (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE, IS_ONLINE, USER_TYPE, RECHARGE_EXPLAIN, QUOTA_TYPE,IS_SUCCESS)
                              values
                              (sys_guid(),single_cursor.organization_id,sysdate, nvl(single_cursor.failTotalFee,0), 0, 'SYS_JOB_RETURN_FEE', 7, 0, 1, '返还发送失败短信金额',1, 1);
                         end if;
                     --渠道下属的子机构（全是配额，直接返回条数）
                     elsif single_cursor.parentid != '1' and single_cursor.parentid != '0' then
                             insert into payment_record
                             (PAYMENT_ID, USER_ID, PAYMENT_TIME, PAYMENT_MONEY, PAYMENT_QUOTA,OPERATOR_ID, PAYMENT_TYPE,IS_ONLINE, USER_TYPE,RECHARGE_EXPLAIN,QUOTA_TYPE,IS_SUCCESS)
                             values
                             (sys_guid(), single_cursor.organization_id,sysdate,0, nvl(single_cursor.failTotalQuata,0), 'SYS_JOB_RETURN_FEE', 6, 0,1, '返还发送失败短信配额',1, 1);
                     end if;
               end if;

               --如果是自付费
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
                           '返还发送失败短信配额',
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
       v_sendTime date;--存开始日期
       v_tempTime date;
       v_sendEndTime date;
       v_isHasTable varchar2(50);
       v_curTableName varchar2(50);
       v_count number(2);
       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_del_SQL varchar2(8000);
       v_child_SQL varchar2(8000);
       v_SQL_TMP varchar2(8000);
       v_SQL varchar2(8000); -- 拼接的基础SQL
begin
     v_isHasTable := '';
     v_SQL_TMP := '';
     v_del_SQL := '';
     v_curTableName := '';
     v_child_SQL := '';
     v_debug := 1;
     v_count := 0;

          if p_date is null  then
            --删除三天前发送短信的统计的数据 开始
            v_sendTime := trunc(sysdate -3);
            v_tempTime := v_sendTime;
            v_del_SQL :=  'delete from sms_send_analyze ssa where ssa.stat_time >= to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --删除三天前发送短信的统计的数据 结束
          -- commit;
           --预统计三天前发送短信数量

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
                                   --第三方通道(不拆分)
                               AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                                   --直连通道(需要拆分)
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
             --删除当天发送短信的统计的数据 开始
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXDATE(p_date); -- p_date 格式 ：2012-11-08 14:00:00
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

         --插入临时表
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

               --计算返回状态报告短信总量
               allCount := nvl(single_cursor.successQuota,0)+nvl(single_cursor.failurequota,0)+nvl(single_cursor.unkownquota,0);

               --修改task_info表返回状态报告的数量
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
       p_queryTime in varchar2,          --查询月份（年月)
       p_statType in number,             -- 查询类型 2 一般机构查询，1 渠道机构查询 0 超级管理员查询
       p_orgID in varchar2,              --机构ID 具体机构
       p_userID in varchar2,             --用户ID Admin 查所有
       p_userOrgId in varchar2,          --用户机构(从user对象的来)
       mycursor out sys_refcursor       --返回结果集游标
      )
 is
       v_debug number(1);                          --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000);                       -- 拼接的基础SQL
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

       if p_statType = 1  then   --渠道机构统计
           --如果机构查询条件为空，默认显示本机构所有人员
           if p_orgID is null then
                 v_SQL := v_SQL || ' and (o.parentid='''||p_userOrgId||''' or o.user_id='''|| p_userOrgId || ''')';
           end if;

           if p_userID is not null then
               v_SQL := v_SQL || ' and mri.user_id= '''|| p_userID || '''';
           end if;
           --查询条件不空，显示查询条件的人员
           if p_orgID is not null then
                 v_SQL := v_SQL || ' and ui.organization_id='''|| p_orgID || '''';
           end if;

           if p_queryTime is not null then
               v_SQL := v_SQL || ' and mri.ACCOUNT_TIME = ' || p_queryTime;
           end if;

      end if;

         if p_statType = 0  then --超级管理员机构统计

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
     --调试代码:插入临时表，查看sql
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
   --插入临时表
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
                  p_startTime in varchar2,--开始时间（年月日)
                  p_endTime in varchar2,--结束时间 （年月日)
                  p_statType in number, -- 统计类型 2 一般机构统计，1 渠道机构发送统计 0 超级管理员发送统计 3 委托人统计
                  p_userID in varchar2,--委托人

                  p_status in varchar2,-- 状态
                  p_operatorID in varchar2, --实际操作人
                  mycursor out sys_refcursor--返回结果集游标
                 )
is
       v_startTime number(8);--存开始日期
       v_endTime number(8);--存结束日期
       v_char_startTime number(8);--存开始日期
       v_char_endTime number(8);--存结束日期

       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000); -- 拼接的基础SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --处理查询开始日期
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

      if p_statType = 3  then --委托人统计
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
                   --按通道查询
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
                           --第三方通道(不拆分)
                           AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                           --直连通道(需要拆分)
                            OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                            OR SS.SEND_STATUS=any(7,8))
                 ) T
           WHERE 1=1
           AND T.SEND_STATUS =any(1,5,6,7,8)
           GROUP BY T.PARENT_ORG_ID, T.ORG_ID, T.OPERATOR_ID, T.USER_ID,T.SEND_STATUS,T.SYSDAT,T.GRANTER_ID';

           --委托人

               v_SQL := 'select u.user_name,ssa.status,sum(ssa.quantity) from ' || '(' || v_subSQL || ') ssa
                     left join user_info u on ssa.user_id = u.user_id
                   where 1=1' ;
                  --当前登录用户
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

        --插入临时表
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
                 p_startTime in varchar2,          --开始时间（年月日)
                 p_endTime in varchar2,            --结束时间 （年月日)
                 p_statType in number,             --查询类型 0 一般机构查询，1 渠道机构查询 2 超级管理员查询
                 p_orgID in varchar2,              --机构ID 具体机构
                 p_userID in varchar2,             --用户ID Admin 查所有
                 p_userOrgId in varchar2,          --用户机构
                 p_pageSize number,                --每一页有多少行数据
                 p_page number,                    --当前是第几页
                 p_count out number,               --总数量
                 mycursor out sys_refcursor        --返回结果集游标
                 )
 is
       v_startTime number(8);                      --存开始日期
       v_endTime number(8);                        --存结束日期
       v_debug number(1);                          --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000);                       -- 拼接的基础SQL
begin
       v_SQL := '';
       v_debug := 0;
       --------统计查询的数据总数
        if p_statType = 1  then   --渠道机构统计
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

        if p_statType = 2  then   --超级管理员机构统计
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


        --处理查询开始日期
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

       if p_statType = 1  then   --渠道机构统计
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


         if p_statType = 2  then --超级管理员机构统计
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
                  p_startTime in varchar2,--开始时间（年月日) 2012-12-13
                  p_endTime in varchar2,--结束时间 （年月日) 2012-12-13
                  p_statType in number, -- 统计类型 0   超级管理员通道统计，1  普通管理员通道统计
                  p_channelID in varchar2,--通道ID   1,2,3,....n 这种形式
                  p_orgID in varchar2,--机构ID 具体机构
                  p_status in varchar2,--状态
                  mycursor out sys_refcursor--返回结果集游标
                 )
is
       v_startTime number(8);--存开始日期
       v_endTime number(8);--存结束日期
       v_char_startTime number(8);--存开始日期
       v_char_endTime number(8);--存结束日期

       v_debug number(1); --是否打调试信息, 0:不打 ；1：打

       v_SQL varchar2(8000); -- 拼接的基础SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --处理查询开始日期
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
                   AND ( SS.SEND_STATUS IN (1,5,6,7,8) and ss.IS_ORIGINAL_SMS = 0 ) --各种状态的原始短信,分短信要更新原始短信
                   AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                   AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
         ) T
        GROUP BY T.CHANNEL_ID, T.PARENT_ORG_ID, T.ORG_ID, T.SEND_STATUS
        ';

     if v_debug = 1 then
       DBMS_OUTPUT.PUT_LINE('v_startTime > ' || v_startTime );
       DBMS_OUTPUT.PUT_LINE('v_endTime > ' || v_endTime );
     end if;
     if p_statType = 0 then --超级管理通道统计

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
     --拼执行SQL开始

      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);

     open mycursor for v_SQL ;

end QUERY_SMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_SMS_RECEIVE
prompt ====================================
prompt
create or replace procedure QUERY_SMS_RECEIVE(p_startTime    in varchar2, --开始时间（年月日)
                                              p_endTime      in varchar2, --结束时间 （年月日)
                                              p_statType     in number, -- 统计类型 0 针对机构统计上行短信，1 针对用户统计上行短信
                                              p_userID       in varchar2, --机构ID Admin 查所有
                                              p_parentOrgID  in varchar2, --机构ID 父机构
                                              p_orgID        in varchar2, --机构ID 具体机构
                                              p_pageNo       in number, --当前页面，从1开始
                                              p_pageSize     in number, --每页记录数
                                              outRecordCount out number, --返回记录总条数
                                              mycursor       out sys_refcursor --返回结果集游标
                                              ) is

  v_SQL            varchar2(8000); -- 拼接的基础SQL
  v_SQL_TotalCount varchar2(8000); -- 查询记录总条数SQL
  v_SQL_Result     varchar2(8000); -- 查询结果集SQL

  v_hiRownum number(8); --当前页记录对应最大的页码
  v_loRownum number(8); --当前页记录对应最小的页码
begin
  v_SQL      := '';
  v_hiRownum := 15;
  v_loRownum := 0;

  --拼执行SQL开始
  if p_statType = 0 then
    --针对机构统计上行短信
    if p_parentOrgID is not null then
      --统计所有机构子机构
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.sys_time >= to_date(''' ||
               p_startTime||''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <=to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id where o.parentid= ''' ||
               p_parentOrgID || ''' or o.user_id = ''' || p_parentOrgID ||
               ''' group by o.user_name';
    else
      --只统计某个机构
      v_SQL := 'select o.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.org_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.org_id) t left join organization o on t.org_id = o.user_id  group by o.user_name';
    end if;
  else
    --针对用户统计上行短信
    if p_userID is not null then
      --统计该机构某个用户
      v_SQL := 'select u.user_name,sum(t.receive_count) as receive_count
               from (
                  select  r.user_id ,count(r.receive_id) as receive_count from sms_receive r where r.org_id = ''' ||
               p_orgID || ''' and r.user_id =''' || p_userID ||
               ''' and r.sys_time  >= to_date(''' || p_startTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') and r.sys_time <= to_date(''' || p_endTime ||
               ''',''yyyy-MM-dd hh24:mi:ss'') group by r.user_id) t left join user_info u on t.user_id = u.user_id group by u.user_name';
    else
      -- 统计该机构所有用户
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
  --查询当前条件下记录总条数
  v_SQL_TotalCount := ' SELECT count(*) FROM ( ';
  v_SQL_TotalCount := v_SQL_TotalCount || v_SQL;
  v_SQL_TotalCount := v_SQL_TotalCount || ' ) ';
  --取记录总条数
  execute immediate v_SQL_TotalCount
    into outRecordCount;
  --处理分页的页码
  v_hiRownum := p_pageNo * p_pageSize;
  v_loRownum := v_hiRownum - p_pageSize + 1;
  --拼分页的查询SQL
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
                  p_startTime in varchar2,--开始时间（年月日)
                  p_endTime in varchar2,--结束时间 （年月日)
                  p_statType in number, -- 统计类型 2 一般机构统计，1 渠道机构发送统计 0 超级管理员发送统计
                  p_userID in varchar2,--用户ID Admin 查所有
                  p_parentOrgID in varchar2,--机构ID 父机构

                  p_orgID in varchar2,--机构ID 具体机构
                  p_status in varchar2,-- 状态
                  mycursor out sys_refcursor--返回结果集游标
                 )
is
       v_startTime number(8);--存开始日期
       v_endTime number(8);--存结束日期
       v_char_startTime number(8);--存开始日期
       v_char_endTime number(8);--存结束日期

       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000); -- 拼接的基础SQL
       v_subSQL varchar2(8000);
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --处理查询开始日期
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
                   --按通道查询
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
                          --第三方通道(不拆分)
                           AND (((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                           --直连通道(需要拆分)
                            OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
                            OR SS.SEND_STATUS=any(7,8))
                 ) T
           WHERE 1=1
           AND T.SEND_STATUS =any(1,5,6,7,8)
           GROUP BY T.PARENT_ORG_ID,T.DEDUCT_MODE,T.ORG_ID, T.USER_ID, T.SYSDAT, T.SEND_STATUS';
     --拼执行SQL开始
     if p_statType = 2  then --一般机构统计
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

      if p_statType = 1  then --渠道机构统计
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

      if p_statType = 0  then --超级管理员机构统计
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

        --插入临时表
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

    --重置用户状态为有效
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
--删除状态报告后，填写状态报告推送时间
BEGIN
    update send s set s.send_time = systimestamp where SEND_ID = :old.SEND_ID;

    BEGIN
      --国信证券的状态报告
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
  --删除状态报告后，将状态报告推送的信息归档，并增加归档时间字段
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
--删除状态报告推送任务信息后，将状态推送的信息归档，并增加归档时间字段
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
CREATE OR REPLACE TRIGGER trigger_afterinsert_receive --插入短信上行, 填写相应的数据
AFTER INSERT ON sms_receive
For each row

DECLARE

--需要上行的用户
CURSOR cmpp_org_cur IS
       SELECT user_id, user_name, ORGANIZATION_ID as org_id  from user_info where user_kind = 3;


BEGIN

    --检查是否可以找到相应的用户
    FOR s IN cmpp_org_cur LOOP
    if :NEW.user_id = s.user_id then
      --INSERT INTO sql_log VALUES(s.user_name, SYSDATE, 'trigger_afterinsert_receive userid');
      insert into SGW_MO_TASK (receive_id, mobile_from, sp_no, receive_msg, read_user_group_id, user_id, channel_id, receive_time, receive_status, next_push_time)
      values(sgw_mo_task_seq.nextval, :new.mobile_from, :new.sp_num, :new.receive_msg, :new.org_id, :new.user_id, :new.channel_id, :new.sys_time, 0, sysdate);
      exit;
        end if;
    END LOOP;

    --如果没有找到相应的用户，则按照相应的机构
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
--更新拆分短信后，更新原始短信
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

  IF :OLD.SEND_STATUS = 1 --原始状态是1
     AND (:NEW.SEND_STATUS = 5 OR :NEW.SEND_STATUS = 6) --新状态是5或者6
     AND :OLD.IS_ORIGINAL_SMS = 1 --是拆分短信
   THEN
    --更新原始短信
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
  --黑名单号码、违禁词、自主签名不在签名池, 进行状态报告推送
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
CREATE OR REPLACE TRIGGER "TRIGGER_INSERT_RECEIVE" --插入短信上行, 填写相应的数据
BEFORE INSERT ON SMS_RECEIVE_OLD
For each row

DECLARE
--查询发送信息
CURSOR send_cur IS
       SELECT t.send_id, t.mobile_to, t.ext_num, t.sys_id, t.msg_id, t.send_status, t.org_id
       FROM sms_send t
       WHERE
            t.mobile_to = :new.mobile_from
            and t.send_status in (1,5)
       ORDER BY t.send_time desc;

--查询特服号
CURSOR spnumber_cur IS
       SELECT *  from sms_spnumber order by spnumber asc;

--查询退订关键字
CURSOR key_cur IS
       SELECT KEY_WORD  from SMS_UNSUBSCRIBE_KEY_WORD where status = 1 order by KEY_WORD asc;

--查询是否是点播短信
CURSOR recdb_cur IS
       SELECT db_name,db_content  from recbiz_db;

--查询是否是短信调查
CURSOR survey_cur IS
       SELECT sms_survey_id,biz_number,thank_word,end_time,start_time,status,sms_directive  from sms_survey ;
survey_temp varchar2(200);
sp varchar2(200);
receive_sys_ext varchar(10);
sys_count number;
receive_sys_id varchar(20);
BEGIN
  sys_count:=0;
  --设置receive_id
  if :new.RECEIVE_ID is null then
    :new.RECEIVE_ID := SMS_RECEIVE_SEQ.nextval;
  end if;
  --设置上行日期
    :new.sys_date_id:=to_number(to_char(sysdate,'yyyyMMdd'));

  sp:='';
    --查询对应的短信信息, 填写系统编号SYS_ID, MSG_ID
    FOR s IN send_cur LOOP
        :new.sys_id := s.sys_id;
        :new.msg_id := s.msg_id;                     --业务系统的短信编号
        :new.org_id := s.org_id;  --机构编号
    END LOOP;

    --查询特服号, 设置扩展号,如果有特服号，那么sp就是出去特服号的上行号码
    FOR s IN spnumber_cur LOOP
    if substr(:new.sp_num, 0, length(s.spnumber)) = s.spnumber then
       sp := substr(:new.sp_num, length(s.spnumber) + 1);
      end if;
    END LOOP;
    --如果没有特服号，那么sp就是上行的全部号码
    if ''=sp then
      sp:=:new.sp_num;
      end if;
     --receive_sys_ext=截取sp的两位作为信息来源
     receive_sys_ext:=substr(sp,0,2);
     :new.sys_ext:=receive_sys_ext;
     select count(*) into sys_count from subsys_code s_code  where s_code.extend_number=receive_sys_ext;
     --如果信息来源不为空，查询subsys_code中的subsys_code_id，填充sms_receive表中的sys_id
     if sys_count!=0 then
       select s_code.subsys_code_id into receive_sys_id from subsys_code s_code  where s_code.extend_number=receive_sys_ext;
       :new.sys_id:=receive_sys_id;
     end if;
     --截取sp两位后的作为业务编号
     :new.ext_num:=substr(sp,3,length(sp));

    --检验短信中是否有退订关键字,有则自动加黑名单
    FOR s IN key_cur LOOP
    if INSTR(trim(:new.RECEIVE_MSG), trim(s.KEY_WORD), 1, 1) = 1 then --以退订关键字起始的短信
        insert into black (black_id, black_mobile,black_desc,black_time) values(sys_guid(), :new.mobile_from,'该客户上行退订关键字，系统于'||to_char(sysdate,'yyyy-MM-dd hh24:mi:ss')||'自动将该客户加入黑名单',sysdate);
      end if;
    END LOOP;

    --查询上行短信内容中是否包含点播的名字
    FOR s IN recdb_cur LOOP
    if NLS_UPPER(trim(:new.RECEIVE_MSG)) = s.db_name then
      :new.msg_key:=1;
      :new.reply_msg:=s.db_content;
     -- P_DIANBO_SEND(:new.mobile_from,s.db_content,sp);--调用向临时表中插入一条数据
      end if;
    END LOOP;

     --查询上行短信是否是短信调查
    FOR s IN survey_cur LOOP
    if :new.ext_num = s.biz_number and :new.sys_time>=s.start_time and :new.sys_time<=s.end_time and s.status!='9' then
      :new.msg_key:=2;
      :new.reply_msg:=s.thank_word;
     -- p_survey_send(:new.mobile_from,:new.receive_msg,:new.receive_id,s.sms_survey_id,sp);
      end if;
    END LOOP;

    --判断上行的短信是否是根据短信指令进行短信调查的
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
CREATE OR REPLACE TRIGGER "TRIGGER_INSERT_SMS_REPORT" --插入短信状态报告, 自动修改短信的状态和补全状态报告的其他信息
BEFORE INSERT ON sms_report
For each row
DECLARE
v_err_msg varchar2(30);--错误信息
err_code_count number:=0;
CURSOR send_cur IS
       SELECT t.send_id, t.org_id, t.batch_id, t.msg_id, t.originalsms_sendid,t.originalsms_totalpages,t.current_pageno, t.sys_id, t.is_original_sms  from sms_send t where t.sequence = :new.sequence;
BEGIN
    if :new.report_time is null then
        :new.report_time := sysdate;
    end if;

    --查询状态报告的错误信息,将相应的错误信息填写入ERR_MSG
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

    --更新相应的短信
    update sms_send t set t.send_status = :new.sms_status, t.err_id = :new.gw_status, t.err_msg = v_err_msg, t.report_time = :new.report_time where t.sequence = :new.sequence and t.send_status = 1;

    --表明成功更新短信状态
    :new.status := 1;

    --查询对应的短信信息
    FOR s IN send_cur LOOP
        :new.send_id := s.send_id;                          --短信编号
        :new.originalsms_sendid := s.originalsms_sendid;      --原始短信编号
        :new.batch_id := s.batch_id;                        --批号
        :new.msg_id := s.msg_id;                            --业务系统的短信编号
        :new.originalsms_totalpages := s.originalsms_totalpages;    --长短信条数
        :new.current_pageno := s.current_pageno;                --长短信中的第几条
        :new.sys_id := s.sys_id;                            --业务系统编号
        --不是原始短信, 说明此短信是长短信拆分后的短信, 需要同步更新原始短信的状态
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
       -- 0 不需要要上行 1 上行到机构 2 上行到用户
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
        dbms_output.put_line('机构触发器出现异常') ;
end;
/

prompt
prompt Creating trigger TRIGGER_RECEIVE_BEFORINSERT
prompt ============================================
prompt
CREATE OR REPLACE TRIGGER "TRIGGER_RECEIVE_BEFORINSERT" --插入短信上行, 填写相应的数据
BEFORE INSERT ON SMS_RECEIVE
For each row

DECLARE
  --查询特服号
  CURSOR SPNUMBER_CUR IS
    SELECT * FROM SMS_SPNUMBER ORDER BY SPNUMBER ASC;

  --机构扩展号
  CURSOR org_cur IS
         SELECT *  from ORGANIZATION order by extend_number asc;
  --用户扩展号
  CURSOR user_cur IS
         SELECT *  from USER_INFO order by extend_number asc;


  --查询退订关键字
  CURSOR KEY_CUR IS
    SELECT KEY_WORD
      FROM SMS_UNSUBSCRIBE_KEY_WORD
     WHERE STATUS = 1
     ORDER BY KEY_WORD ASC;

  --查询是否是点播短信
  /*
  CURSOR RECDB_CUR IS
    SELECT DB_NAME, DB_CONTENT FROM RECBIZ_DB;
   */

  EXT            VARCHAR2(200); --扩展号
  ORGEXT         VARCHAR2(200);
  USEREXT        VARCHAR2(200);
  v_ok           VARCHAR2(200);
  v_orgid        VARCHAR2(200);
  v_userid        VARCHAR2(200);
BEGIN
  v_ok := '0';
  v_orgid := '';
  v_userid := '';


  --设置receive_id
  IF :NEW.RECEIVE_ID IS NULL THEN
    :NEW.RECEIVE_ID := SMS_RECEIVE_SEQ.NEXTVAL;
  END IF;

  --通道为14，卜蜂莲花数据
  if :new.channel_id = 14 then
     :new.org_id := 'ff8080813fa793ec013fa80e75de0001';
     :new.user_id := 'ff8080813fa793ec013fa80f2e810002';
  end if;

  EXT := '';
  --查询对应的短信信息, 填写系统编号SYS_ID, MSG_ID

  --查询特服号, 设置扩展号,如果有特服号，那么sp就是出去特服号的上行号码
  FOR S IN SPNUMBER_CUR LOOP
    IF SUBSTR(:NEW.SP_NUM, 0, LENGTH(S.SPNUMBER)) = S.SPNUMBER THEN
      EXT := SUBSTR(:NEW.SP_NUM, LENGTH(S.SPNUMBER) + 1);
      :NEW.EXT_NUM := ext;
      EXIT;
    END IF;
  END LOOP;

  --INSERT INTO sql_log VALUES(EXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT');

  --根据机构信息截取机构编号
  --匹配规则, 先取1位, 再取2位, 最多4位
  v_ok := '0';
  IF length(ext) > 0 THEN
      BEGIN
        --支持机构扩展4位
        --for i in 1..4 LOOP
        for i IN Reverse 1..4 LOOP
          IF v_ok = '1' THEN
             EXIT;
          END IF;
          IF length(ext) >= i THEN
            ORGEXT :=  SUBSTR(EXT, 0, i);
            --INSERT INTO sql_log VALUES('orgext ' || ORGEXT, SYSDATE, 'TRIGGER_RECEIVE_BEFORINSERT 2');
            --循环检查
              FOR S IN org_cur LOOP
                IF length(s.extend_number) = i AND orgext = s.extend_number THEN
                  --截取剩下的扩展号
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
        --根据用户扩展号截取用户编号
        --确定机构后确定用户
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
              --循环检查
                FOR user_row IN user_cur LOOP
                  IF length(user_row.extend_number) = i AND userext = user_row.extend_number AND user_row.organization_id = v_orgid THEN
                    --截取剩下的扩展号
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



  --检验短信中是否有退订关键字,有则自动加黑名单
  FOR S IN KEY_CUR LOOP
    IF INSTR(TRIM(:NEW.RECEIVE_MSG), TRIM(S.KEY_WORD), 1, 1) = 1 THEN
      --以退订关键字起始的短信
      INSERT INTO BLACK
        (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME)
      VALUES
        (SYS_GUID(),
         :NEW.MOBILE_FROM,
         '该客户上行退订关键字，系统于' || TO_CHAR(SYSDATE, 'yyyy-MM-dd hh24:mi:ss') ||
         '自动将该客户加入黑名单',
         SYSDATE);
    END IF;
  END LOOP;

  --短信有所属机构，但是没有所属用户时，则设置机构管理员为其所属用户
  if :new.org_id is not null and :new.user_id is null then
     select t.user_id into :new.user_id from user_info t where t.organization_id = :new.org_id and t.user_type = 1 and rownum <= 1;
  end if;

  --中证热点特殊规则
  if INSTR(TRIM(:NEW.Sp_Num), '106903590528', 1, 1) = 1 then
     :new.org_id := 'ff8080814577e4ed0145cf15467f439e';
     :new.user_id := 'ff808081463c75c0014641d8dc5c072c';
  end if;

  /*
  --查询上行短信内容中是否包含点播的名字
  FOR S IN RECDB_CUR LOOP
    IF NLS_UPPER(TRIM(:NEW.RECEIVE_MSG)) = S.DB_NAME THEN
      :NEW.MSG_KEY   := 1;
      :NEW.REPLY_MSG := S.DB_CONTENT;
      -- P_DIANBO_SEND(:new.mobile_from,s.db_content,sp);--调用向临时表中插入一条数据
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
CREATE OR REPLACE TRIGGER trigger_report_send --插入短信状态报告, 填写相应的数据
AFTER UPDATE ON send
For each row
DECLARE
    pragma autonomous_transaction;
    v_spnumber VARCHAR2(20);

--需要状态报告的机构
BEGIN

       --机构编号, 状态报告从无到有， 状态为成功或者失败
      if :NEW.report is not null and :old.report is null and :NEW.send_status in(5,6) AND  substr(:NEW.Msg_Type,1,4) = 'CMPP' and :new.report != 'IA:0006' THEN
         --动态根据channel_id 找特服号
         SELECT ac.sp_number||nvl(:OLD.SP_SERV_NO,'') INTO v_spnumber
                FROM sgw_account_channel ac
                inner JOIN view_cmpp_account cmpp ON ac.sgw_id = cmpp.sgw_id
                                                   AND cmpp.user_id = :OLD.user_id
                WHERE ac.channel_id = :OLD.channel_id AND ac.mobile_com = :OLD.mobile_com ;

                --判断是否是透传短信
                --透传短信
                IF :OLD.ORIGINALSMS_SENDID IS NOT NULL THEN
                    --用拆分短信的状态，更新原始短信的状态
                    UPDATE send send SET send.send_status = :new.send_status,
                                         send.report      = :new.report,
                                         send.report_time = :new.report_time
                                   WHERE
                                         send.send_id     = :old.ORIGINALSMS_SENDID
                                    AND  send.send_status !=5;
                    --向任务表添加记录
                    insert into SGW_REPORT_TASK (task_id, send_id, mobile_to, stat, destnation_id, user_organization, user_id, channel_id, report_time, push_status, next_push_time, push_times,sys_time, submit_time, done_time)
                    values(SGW_REPORT_TASK_SEQ.NEXTVAL, :old.ORIGINALSMS_SENDID, :new.mobile_to, :new.report, v_spnumber || :new.sp_serv_no, :new.user_organization, :new.user_id, :new.channel_id, :new.report_time, 0, sysdate, 0,sysdate, sysdate, sysdate);

                ELSE  --非透传短信
                    --向任务表添加记录
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
        dbms_output.put_line('白名单机构配置触发器出现异常') ;
end;
/

prompt
prompt Creating trigger TRI_BEFOREINSERT_SMS_SEND
prompt ==========================================
prompt
CREATE OR REPLACE TRIGGER TRI_BEFOREINSERT_SMS_SEND
--插入SMS_SEND前，自动填写数据
before insert on SMS_SEND
for each row

begin

  --填写ID
  if :new.SEND_ID is null then
    :new.SEND_ID := SMS_SEND_SEQ.nextval;
  end if;

  if :new.sender_id is null then
    :new.sender_id := user; --数据库接口插入数据的时候,自动写入帐号信息,以便做审计
  end if;

    --自动填写SYS_DATE_ID,数字型
    :new.sys_date_id  := to_number(to_char(:new.sys_time,'yyyyMMdd'));
    --自动填写SYS_DATE_ID,数字型
    :new.send_date_id := to_number(to_char(:new.send_time,'yyyyMMdd'));



    --处理财务系统发过来的短信

    if :new.is_original_sms = 0 and :new.sys_id = 'FMS' then
      --检测临时表中有没有该号码的数据
      select count(*) into sms_whole_count.fms_send_count from fms_sms_send f ;

      if sms_whole_count.fms_send_count = 0 then
        --如果没有就添加到临时表中，添加时不能直接添加，需要从sms_send表中查询判断
        select max(s.pre_send_time) into sms_whole_count.fms_send_datetime from sms_send s where s.sys_id = 'FMS' and s.mobile_to=:new.mobile_to;
        if sms_whole_count.fms_send_datetime is null then
          insert into fms_sms_send(pre_send_time) values(:new.pre_send_time);
        else
          insert into fms_sms_send(pre_send_time) values(sms_whole_count.fms_send_datetime);
        end if;
      end if;
      select pre_send_time into sms_whole_count.fms_send_datetime from fms_sms_send;
      --该发送时间减去临时表中的发送时间是否大于10
      if (:new.pre_send_time-sms_whole_count.fms_send_datetime)*60*60*24<10 then
         --如果小于10，该短信的预发送时间就在临时表中的发送时间上加10秒，并更新临时表中发预发送时间
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
--插入SMS_SEND前，自动填写数据
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
