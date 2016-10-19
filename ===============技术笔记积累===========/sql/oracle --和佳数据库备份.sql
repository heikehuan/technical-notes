------------------------------------------------
-- Export file for user MC                    --
-- Created by liruimin on 2015/9/18, 16:09:21 --
------------------------------------------------

spool 333.log

prompt
prompt Creating table ADDRESS_GROUP_INFO
prompt =================================
prompt
create table mc.ADDRESS_GROUP_INFO
(
  group_id        VARCHAR2(50) not null,
  group_name      VARCHAR2(30),
  group_remark    VARCHAR2(200),
  create_user_id  VARCHAR2(200),
  organization_id VARCHAR2(200),
  create_time     DATE default sysdate,
  modify_time     DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ADDRESS_GROUP_INFO
  add primary key (GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ADDRESS_BOOK_INFO
prompt ================================
prompt
create table mc.ADDRESS_BOOK_INFO
(
  id              VARCHAR2(50) not null,
  name            VARCHAR2(30),
  phone_number    VARCHAR2(20),
  position        VARCHAR2(20),
  birthday        DATE,
  email           VARCHAR2(50),
  remark          VARCHAR2(200),
  organization_id VARCHAR2(200),
  create_user_id  VARCHAR2(200),
  create_time     DATE default sysdate,
  modify_time     DATE,
  group_id        VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ADDRESS_BOOK_INFO
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ADDRESS_BOOK_INFO
  add constraint FK7309B5999E4DF9FB foreign key (GROUP_ID)
  references mc.ADDRESS_GROUP_INFO (GROUP_ID);

prompt
prompt Creating table BIG_BLACK_MOBILE
prompt ===============================
prompt
create table mc.BIG_BLACK_MOBILE
(
  big_blackid   VARCHAR2(200) not null,
  black_channel VARCHAR2(200),
  black_enabled NUMBER(10),
  remark        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.BIG_BLACK_MOBILE
  add primary key (BIG_BLACKID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table BLACK
prompt ====================
prompt
create table mc.BLACK
(
  black_id     VARCHAR2(50) not null,
  black_mobile VARCHAR2(20),
  black_desc   VARCHAR2(100),
  black_time   DATE,
  black_type   VARCHAR2(20),
  group_id     VARCHAR2(200),
  oper_userid  VARCHAR2(50),
  oper_orgid   VARCHAR2(50),
  sys_id       VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.BLACK
  add primary key (BLACK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BLACK_CONFIG
prompt ===========================
prompt
create table mc.BLACK_CONFIG
(
  config_key   VARCHAR2(200) not null,
  config_value VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.BLACK_CONFIG
  add constraint PK_BLACK_CONFIG primary key (CONFIG_KEY)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table BLACK_CSMD
prompt =========================
prompt
create table mc.BLACK_CSMD
(
  black_mobilie VARCHAR2(20) not null,
  black_time    DATE,
  black_desc    VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 10M
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.BLACK_CSMD
  is '???????';
alter table mc.BLACK_CSMD
  add constraint PK_BLACK_CSMD primary key (BLACK_MOBILIE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 17M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table BLACK_LOG
prompt ========================
prompt
create table mc.BLACK_LOG
(
  black_log_id      VARCHAR2(200) not null,
  operate_user_id   VARCHAR2(200),
  operate_org_id    VARCHAR2(200),
  operate_type      VARCHAR2(20),
  mobile            VARCHAR2(255),
  remark            VARCHAR2(255),
  operate_time      DATE,
  operate_user_name VARCHAR2(255),
  operate_org_name  VARCHAR2(255),
  black_id          VARCHAR2(50),
  black_mobile      VARCHAR2(20),
  black_desc        VARCHAR2(100),
  log_time          DATE,
  operation         VARCHAR2(50),
  oper_user         VARCHAR2(200),
  sys_id            VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.BLACK_LOG
  add primary key (BLACK_LOG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_CFG_META_DATA
prompt ====================================
prompt
create table mc.CHANNEL_CFG_META_DATA
(
  link_mode            VARCHAR2(50) not null,
  message_type         VARCHAR2(50),
  param_name           VARCHAR2(50) not null,
  param_short_name     VARCHAR2(50),
  param_data_type      VARCHAR2(50),
  param_data_unit_type VARCHAR2(50),
  param_data_scope     VARCHAR2(50),
  param_data_reg_exp   VARCHAR2(1000),
  param_data_hint      VARCHAR2(200),
  param_default_value  VARCHAR2(200),
  param_description    VARCHAR2(2000),
  hidden_me            NUMBER(2),
  relation_field       VARCHAR2(50),
  display_index        NUMBER(2),
  tag_name             VARCHAR2(50),
  required             NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_CFG_META_DATA
  is '短信通道配置元数据表';
comment on column mc.CHANNEL_CFG_META_DATA.link_mode
  is '接入类型';
comment on column mc.CHANNEL_CFG_META_DATA.message_type
  is '信息类型, SMS-短信, MMS-彩信';
comment on column mc.CHANNEL_CFG_META_DATA.param_name
  is '参数名称';
comment on column mc.CHANNEL_CFG_META_DATA.param_short_name
  is '参数中文名称';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_type
  is '参数的数据类型';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_unit_type
  is '单位';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_scope
  is '参数的值域,检验方式, REGEXP:正则表达式, JS:javascript, ENUM:列表枚举';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_reg_exp
  is '参数的值域的正则表达式';
comment on column mc.CHANNEL_CFG_META_DATA.param_data_hint
  is '参数提示';
comment on column mc.CHANNEL_CFG_META_DATA.param_default_value
  is '参数的缺省值';
comment on column mc.CHANNEL_CFG_META_DATA.param_description
  is '参数的说明';
comment on column mc.CHANNEL_CFG_META_DATA.hidden_me
  is '是否不显示';
comment on column mc.CHANNEL_CFG_META_DATA.relation_field
  is '从业务数据的哪个字段取值';
comment on column mc.CHANNEL_CFG_META_DATA.display_index
  is '参数的说明';
comment on column mc.CHANNEL_CFG_META_DATA.tag_name
  is '此参数应用到哪个配置文件';
comment on column mc.CHANNEL_CFG_META_DATA.required
  is '必填';
alter table mc.CHANNEL_CFG_META_DATA
  add constraint PK_CHANNEL_CFG_META_DATA primary key (LINK_MODE, PARAM_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_CHECK_CONFIG
prompt ===================================
prompt
create table mc.CHANNEL_CHECK_CONFIG
(
  channel_id               NUMBER(4) not null,
  channel_name             VARCHAR2(200),
  backup_channel_id        NUMBER(4),
  backup_channel_name      VARCHAR2(200),
  backup_mobile_channel_id NUMBER(4),
  backup_union_channel_id  NUMBER(4),
  backup_dx_channel_id     NUMBER(4),
  check_frequence          NUMBER(10),
  fault_report_delay       NUMBER(10),
  check_type               VARCHAR2(20),
  status                   VARCHAR2(20),
  max_switch_quantity      NUMBER(10),
  min_sms_thredhold        NUMBER(10),
  max_sms_thredhold        NUMBER(10),
  send_rate                NUMBER(10),
  max_delay_minute         NUMBER(10),
  do_send_sms_alarm        VARCHAR2(20),
  do_send_email_alarm      VARCHAR2(20),
  sms_alarm_templat        VARCHAR2(20),
  email_alarm_template     VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CHANNEL_CHECK_CONFIG
  is '通道切换配置';
comment on column mc.CHANNEL_CHECK_CONFIG.channel_id
  is '通道编号';
comment on column mc.CHANNEL_CHECK_CONFIG.channel_name
  is '通道名称';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_channel_id
  is '备份通道编号';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_channel_name
  is '备份通道名称';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_mobile_channel_id
  is '移动备份通道编号';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_union_channel_id
  is '联通备份通道编号';
comment on column mc.CHANNEL_CHECK_CONFIG.backup_dx_channel_id
  is '电信备份通道编号';
comment on column mc.CHANNEL_CHECK_CONFIG.check_frequence
  is '检测频率, 单位:秒';
comment on column mc.CHANNEL_CHECK_CONFIG.fault_report_delay
  is '故障报警延迟时间, 单位:秒, 为减少误报, 当故障延续该时间后再报警,然后采取措施';
comment on column mc.CHANNEL_CHECK_CONFIG.check_type
  is '检验类型, QUANTITY:按堆积短信检测, TIME:按照时效检测';
comment on column mc.CHANNEL_CHECK_CONFIG.status
  is '状态, Y:生效,N:未生效';
comment on column mc.CHANNEL_CHECK_CONFIG.max_switch_quantity
  is '最大切换数量';
comment on column mc.CHANNEL_CHECK_CONFIG.min_sms_thredhold
  is '积压短信的最小阀值, 当待发短信数量高于该值时, 表明通道不正常';
comment on column mc.CHANNEL_CHECK_CONFIG.max_sms_thredhold
  is '积压短信的最大阀值, 当待发短信数量高于该值时, 需要切换通道';
comment on column mc.CHANNEL_CHECK_CONFIG.send_rate
  is '短信的发送速度, 单位:条/秒';
comment on column mc.CHANNEL_CHECK_CONFIG.max_delay_minute
  is '最长延迟时间, 单位:分钟';
comment on column mc.CHANNEL_CHECK_CONFIG.do_send_sms_alarm
  is '是否发送短信告警, Y:发送, N:不发送';
comment on column mc.CHANNEL_CHECK_CONFIG.do_send_email_alarm
  is '是否发送邮件告警, Y:发送, N:不发送';
comment on column mc.CHANNEL_CHECK_CONFIG.sms_alarm_templat
  is '短信告警模板';
comment on column mc.CHANNEL_CHECK_CONFIG.email_alarm_template
  is '邮件告警模板';
alter table mc.CHANNEL_CHECK_CONFIG
  add constraint PK_CHANNEL_CHECK_CONFIG primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_CONSOLE_CONFIG
prompt =====================================
prompt
create table mc.CHANNEL_CONSOLE_CONFIG
(
  channel_type   VARCHAR2(20) not null,
  status         VARCHAR2(20),
  check_interval NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_CONSOLE_CONFIG
  is '通道监控配置';
comment on column mc.CHANNEL_CONSOLE_CONFIG.channel_type
  is '通道类型, SMS:短信, MMS:彩信';
comment on column mc.CHANNEL_CONSOLE_CONFIG.status
  is '状态, N:不运行, Y:运行';
comment on column mc.CHANNEL_CONSOLE_CONFIG.check_interval
  is '检验间隔, 单位:秒';
alter table mc.CHANNEL_CONSOLE_CONFIG
  add constraint PK_CHANNEL_CONSOLE_CONFIG primary key (CHANNEL_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_INFO
prompt ===========================
prompt
create table mc.CHANNEL_INFO
(
  channel_id             NUMBER(4) not null,
  channel_name           VARCHAR2(500),
  sp_no_lt               VARCHAR2(50),
  sp_no_yd               VARCHAR2(50),
  sp_no_dx               VARCHAR2(50),
  channel_status         NUMBER(1) default 0,
  channel_clz            VARCHAR2(2000),
  channel_remark         VARCHAR2(2000),
  sort_id                NUMBER(3),
  channel_state          NUMBER(2),
  com_type               NUMBER(1),
  is_white               VARCHAR2(50),
  most_speed             VARCHAR2(50),
  normal_status          VARCHAR2(50),
  warn_status            VARCHAR2(50),
  busy_status            VARCHAR2(50),
  main_channel           VARCHAR2(50),
  ch_signature           VARCHAR2(50),
  en_signature           VARCHAR2(50),
  gateway                VARCHAR2(50),
  lowest_send            VARCHAR2(50),
  link_mode              VARCHAR2(50),
  parameters             VARCHAR2(4000),
  deploy_status          NUMBER(1) default 0,
  user_name              VARCHAR2(200),
  is_received            NUMBER(1) default 1,
  is_sendstatus          NUMBER(1) default 1,
  is_extended            NUMBER(1) default 1,
  is_longsms             NUMBER(1) default 1,
  spnumber_yd_type       VARCHAR2(50),
  spnumber_lt_type       VARCHAR2(50),
  spnumber_dx_type       VARCHAR2(50),
  sp_no_lt_up            VARCHAR2(50),
  sp_no_yd_up            VARCHAR2(50),
  sp_no_yd_dw            VARCHAR2(50),
  sp_no_lt_dw            VARCHAR2(50),
  sms_max_length_en      NUMBER,
  long_sms_per_length_en NUMBER,
  long_sms_max_length_en NUMBER,
  is_complaint           NUMBER(5),
  sms_max_length_ch      NUMBER,
  long_sms_per_length_ch NUMBER,
  long_sms_max_length_ch NUMBER,
  unsubscribe_keyword    VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_INFO
  is '短信通道信息表';
comment on column mc.CHANNEL_INFO.channel_id
  is '通道ID';
comment on column mc.CHANNEL_INFO.channel_name
  is '通道名称';
comment on column mc.CHANNEL_INFO.sp_no_lt
  is '联通特服号';
comment on column mc.CHANNEL_INFO.sp_no_yd
  is '移动特服号';
comment on column mc.CHANNEL_INFO.sp_no_dx
  is '电信特服号';
comment on column mc.CHANNEL_INFO.channel_status
  is '通道状态,0:有效, 1:无效';
comment on column mc.CHANNEL_INFO.channel_clz
  is '通道调用的类和参数名';
comment on column mc.CHANNEL_INFO.channel_remark
  is '备注';
comment on column mc.CHANNEL_INFO.sort_id
  is '通道排序id';
comment on column mc.CHANNEL_INFO.channel_state
  is '通道发送状态';
comment on column mc.CHANNEL_INFO.com_type
  is '支持号段类型,1:只移动, 2:只联通,3:只电信,0:全支持';
comment on column mc.CHANNEL_INFO.is_white
  is '是否开启白名单 0-开启 ，1不开启';
comment on column mc.CHANNEL_INFO.most_speed
  is '最高速度';
comment on column mc.CHANNEL_INFO.normal_status
  is '正常状态, 单位为分钟';
comment on column mc.CHANNEL_INFO.warn_status
  is '故障状态, 单位为分钟';
comment on column mc.CHANNEL_INFO.busy_status
  is '繁忙状态, 单位为分钟';
comment on column mc.CHANNEL_INFO.main_channel
  is '主通道, 1:是,0:否';
comment on column mc.CHANNEL_INFO.ch_signature
  is '中文签名';
comment on column mc.CHANNEL_INFO.en_signature
  is '英文签名';
comment on column mc.CHANNEL_INFO.gateway
  is '签名方式, 0：无签名，1:网关签名，2:自动添加签名';
comment on column mc.CHANNEL_INFO.lowest_send
  is '最低发送量';
comment on column mc.CHANNEL_INFO.link_mode
  is '接入类型，CMPP、SGIP、SMGP...';
comment on column mc.CHANNEL_INFO.parameters
  is '配置数据，JSON格式保存';
comment on column mc.CHANNEL_INFO.deploy_status
  is '部署状态, 0-未部署,1-已部署';
comment on column mc.CHANNEL_INFO.user_name
  is '常用用户';
comment on column mc.CHANNEL_INFO.is_received
  is '是否支持上行,0:否,1:是';
comment on column mc.CHANNEL_INFO.is_sendstatus
  is '是否支持状态报告,0:否,1:是';
comment on column mc.CHANNEL_INFO.is_extended
  is '是否支持扩展码,0:否,1:是';
comment on column mc.CHANNEL_INFO.is_longsms
  is '是否支持长短信,0:否,1:是';
comment on column mc.CHANNEL_INFO.spnumber_yd_type
  is '移动特服号类型';
comment on column mc.CHANNEL_INFO.spnumber_lt_type
  is '联通特服号类型';
comment on column mc.CHANNEL_INFO.spnumber_dx_type
  is '电信特服号类型';
comment on column mc.CHANNEL_INFO.sms_max_length_en
  is '普通短信的最大长度,一般最大为70(英文)';
comment on column mc.CHANNEL_INFO.long_sms_per_length_en
  is '长短信中每个分短信的长度,一般为67(英文)';
comment on column mc.CHANNEL_INFO.long_sms_max_length_en
  is '长短信的最大长度,例如250,300(英文)';
comment on column mc.CHANNEL_INFO.sms_max_length_ch
  is '普通短信的最大长度,一般最大为70(中文)';
comment on column mc.CHANNEL_INFO.long_sms_per_length_ch
  is '长短信中每个分短信的长度,一般为67(中文)';
comment on column mc.CHANNEL_INFO.long_sms_max_length_ch
  is '长短信的最大长度,例如250,300(中文)';
comment on column mc.CHANNEL_INFO.unsubscribe_keyword
  is '退订关键字';
alter table mc.CHANNEL_INFO
  add constraint PK_CHANNEL_INFO primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_PRICE_POLICY
prompt ===================================
prompt
create table mc.CHANNEL_PRICE_POLICY
(
  policy_id           VARCHAR2(200) not null,
  channel_id          NUMBER(2),
  policy_type         VARCHAR2(30),
  direct_number       VARCHAR2(30),
  direct_price        VARCHAR2(30),
  direct_add_price    VARCHAR2(20),
  indirect_min_number NUMBER(18),
  indirect_max_number VARCHAR2(30),
  indirect_price      VARCHAR2(30)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CHANNEL_PRICE_POLICY
  is '通道价格策略表，用于费用统计';
comment on column mc.CHANNEL_PRICE_POLICY.policy_id
  is '价格策略的ID';
comment on column mc.CHANNEL_PRICE_POLICY.channel_id
  is '通道编号';
comment on column mc.CHANNEL_PRICE_POLICY.policy_type
  is '策略类型：1--是直连通道，2--是用第三方通道';
comment on column mc.CHANNEL_PRICE_POLICY.direct_number
  is '直连时，月基本条数';
comment on column mc.CHANNEL_PRICE_POLICY.direct_price
  is '直连时，月基本条数的价格';
comment on column mc.CHANNEL_PRICE_POLICY.direct_add_price
  is '直连时，增值业务的每条价格';
comment on column mc.CHANNEL_PRICE_POLICY.indirect_min_number
  is '使用第三方通道时，最小发送量';
comment on column mc.CHANNEL_PRICE_POLICY.indirect_max_number
  is '使用第三方通道时，最大发送量';
comment on column mc.CHANNEL_PRICE_POLICY.indirect_price
  is '使用第三方通道时，发送每条的单价';
alter table mc.CHANNEL_PRICE_POLICY
  add constraint PK_CHANNEL_PRICE_POLICY primary key (POLICY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_SWITCH_CONFIG
prompt ====================================
prompt
create table mc.CHANNEL_SWITCH_CONFIG
(
  pid                VARCHAR2(200) not null,
  channel_id         NUMBER(10) not null,
  ip                 VARCHAR2(200) not null,
  port               NUMBER(10) not null,
  heartbeat_enabled  NUMBER(1) not null,
  dir                VARCHAR2(500),
  heartbeat_interval NUMBER(19)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CHANNEL_SWITCH_CONFIG
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_SWITCH_LOG
prompt =================================
prompt
create table mc.CHANNEL_SWITCH_LOG
(
  pid                   VARCHAR2(200) not null,
  rule_id               VARCHAR2(200),
  match_user_id         VARCHAR2(200),
  match_org_id          VARCHAR2(200),
  dest_channel_id       NUMBER(10) not null,
  original_channel_id   NUMBER(10) not null,
  operator_id           VARCHAR2(200),
  match_quantity        NUMBER(19),
  match_mobile          VARCHAR2(100),
  match_batch_id        VARCHAR2(200),
  match_content         VARCHAR2(200),
  match_operator        NUMBER(3) not null,
  direction             NUMBER(3) not null,
  operation_date        DATE not null,
  operation_result      NUMBER(3),
  operation_result_desc VARCHAR2(500)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.CHANNEL_SWITCH_LOG
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_SWITCH_RULE
prompt ==================================
prompt
create table mc.CHANNEL_SWITCH_RULE
(
  pid                 VARCHAR2(200) not null,
  original_channel_id NUMBER(10) not null,
  match_org_id        VARCHAR2(200),
  match_user_id       VARCHAR2(200),
  match_quantity      NUMBER(19),
  match_mobile        VARCHAR2(100),
  match_batch_id      VARCHAR2(200),
  match_content       VARCHAR2(200),
  match_operator      NUMBER(3) not null,
  direction           NUMBER(3) not null,
  dest_channel_id     NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.CHANNEL_SWITCH_RULE
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CHANNEL_TEST
prompt ===========================
prompt
create table mc.CHANNEL_TEST
(
  channel_test_id VARCHAR2(200) not null,
  mobile_to       VARCHAR2(2000) not null,
  send_msg        VARCHAR2(4000),
  send_time       VARCHAR2(30) default sysdate,
  channel_id      NUMBER(4) default 1,
  create_time     DATE default sysdate,
  remark          VARCHAR2(500),
  trigger_name    VARCHAR2(80) not null,
  ext_num         VARCHAR2(80)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CHANNEL_TEST
  is '通道测试定时任务表';
comment on column mc.CHANNEL_TEST.channel_test_id
  is '主键';
comment on column mc.CHANNEL_TEST.mobile_to
  is '目标手机号';
comment on column mc.CHANNEL_TEST.send_msg
  is '短信内容';
comment on column mc.CHANNEL_TEST.send_time
  is '平台发送该短信的时间';
comment on column mc.CHANNEL_TEST.channel_id
  is '通道ID';
comment on column mc.CHANNEL_TEST.create_time
  is '创建定时任务时间';
comment on column mc.CHANNEL_TEST.remark
  is '备注信息，作为外部系统扩展用，CC短信系统该字段填写基金账号';
comment on column mc.CHANNEL_TEST.trigger_name
  is '定时任务名';
comment on column mc.CHANNEL_TEST.ext_num
  is '自定义扩展码';
alter table mc.CHANNEL_TEST
  add constraint PK_CHANNEL_TEST primary key (CHANNEL_TEST_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_INFO
prompt ========================
prompt
create table mc.USER_INFO
(
  user_id              VARCHAR2(200) not null,
  user_name            VARCHAR2(200),
  user_pass            VARCHAR2(200),
  user_stat            NUMBER(1),
  user_mome            VARCHAR2(200),
  user_def_role        VARCHAR2(200),
  user_type            NUMBER(1),
  user_balance         NUMBER(20,3),
  create_time          DATE,
  organization_id      VARCHAR2(200),
  eng_signature        VARCHAR2(20),
  chn_signature        VARCHAR2(40),
  use_user_signature   NUMBER(1),
  extend_number        VARCHAR2(20),
  user_quota           NUMBER(22) default 0,
  pay_type             NUMBER(1),
  pay_mode             NUMBER(1),
  fee_mode             NUMBER(1),
  channel_type         NUMBER(1),
  mobile_type          NUMBER(1),
  email                VARCHAR2(200),
  mobile               VARCHAR2(200),
  sms_alert            NUMBER(1),
  mms_quota            NUMBER(22) default 0,
  recharge_explain     VARCHAR2(200),
  nick_name            VARCHAR2(200),
  user_kind            NUMBER(1),
  is_instead_send      NUMBER(1),
  login_error_num      NUMBER(10),
  last_update_psw_date DATE,
  valid_ip             VARCHAR2(2000),
  valid_mobile         VARCHAR2(200),
  ip_status            NUMBER(1) default 0,
  mobile_status        NUMBER(1) default 0,
  sys_code             VARCHAR2(20),
  sms_type             VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_INFO
  is '用户表';
comment on column mc.USER_INFO.user_id
  is '用户编号';
comment on column mc.USER_INFO.user_name
  is '用户名称';
comment on column mc.USER_INFO.user_pass
  is '密码';
comment on column mc.USER_INFO.user_stat
  is '状态, 0:无效, 1:有效,2:已删除,3:已锁定 ';
comment on column mc.USER_INFO.user_mome
  is '备注';
comment on column mc.USER_INFO.user_def_role
  is '用户默认角色';
comment on column mc.USER_INFO.user_type
  is '用户类型, 2:普通员工, 1:组管理员';
comment on column mc.USER_INFO.user_balance
  is '用户可用费用';
comment on column mc.USER_INFO.create_time
  is '创建时间';
comment on column mc.USER_INFO.organization_id
  is '机构ID';
comment on column mc.USER_INFO.eng_signature
  is '用户的英文签名';
comment on column mc.USER_INFO.chn_signature
  is '用户的中文签名';
comment on column mc.USER_INFO.use_user_signature
  is '是否需要用户签名, 0:需要, 1:不需要';
comment on column mc.USER_INFO.extend_number
  is '用户扩展号';
comment on column mc.USER_INFO.user_quota
  is '短信配额';
comment on column mc.USER_INFO.pay_type
  is '充值类型, 0:预付费, 1:后付费';
comment on column mc.USER_INFO.pay_mode
  is '计费单位, 0:配额付费, 1:金额付费';
comment on column mc.USER_INFO.fee_mode
  is '扣费方式, 0:自付费, 1:组付费';
comment on column mc.USER_INFO.channel_type
  is '是否区分通道, 0:不区分, 1:区分';
comment on column mc.USER_INFO.mobile_type
  is '是否区分号段, 0:不区分, 1:区分';
comment on column mc.USER_INFO.email
  is 'E-mail';
comment on column mc.USER_INFO.mobile
  is '手机号码';
comment on column mc.USER_INFO.sms_alert
  is '审批短信提醒, 0:是, 1:否';
comment on column mc.USER_INFO.mms_quota
  is '彩信配额';
comment on column mc.USER_INFO.recharge_explain
  is '充值说明';
comment on column mc.USER_INFO.user_kind
  is '用户种类：1：Web平台用户；2：WebService接口用户；3：CMPP接口用户；4：HTTP接口用户';
comment on column mc.USER_INFO.is_instead_send
  is '是否允许代发信息   0:否  1：是';
comment on column mc.USER_INFO.login_error_num
  is '登录失败次数  如果次数等于3，修改用户状态为无效，不允许再继续登录';
comment on column mc.USER_INFO.valid_ip
  is '用户绑定的IP地址';
comment on column mc.USER_INFO.valid_mobile
  is '用户绑定的手机号码';
comment on column mc.USER_INFO.ip_status
  is '用户IP绑定的状态, 0:不绑定 , 1:绑定 ';
comment on column mc.USER_INFO.mobile_status
  is '用户手机号码绑定的状态, 0:不绑定 , 1:绑定 ';
alter table mc.USER_INFO
  add constraint PK_USER_INFO primary key (USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CHANNEL_USER
prompt ===========================
prompt
create table mc.CHANNEL_USER
(
  id              VARCHAR2(20) not null,
  user_id         VARCHAR2(200) not null,
  channel_id      NUMBER(4) not null,
  create_user     VARCHAR2(200),
  create_time     DATE,
  com_type        NUMBER(1),
  cascade_id      VARCHAR2(1000),
  defalut_channel NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.CHANNEL_USER.id
  is '主键';
comment on column mc.CHANNEL_USER.user_id
  is '用户id';
comment on column mc.CHANNEL_USER.channel_id
  is '通道id';
comment on column mc.CHANNEL_USER.create_user
  is '创建人';
comment on column mc.CHANNEL_USER.create_time
  is '创建时间';
comment on column mc.CHANNEL_USER.com_type
  is '1:移动, 2:联通,3:电信,0:全支持';
comment on column mc.CHANNEL_USER.cascade_id
  is '级联id:用于对表级联删除或更新';
alter table mc.CHANNEL_USER
  add constraint PK_ID primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CHANNEL_USER
  add constraint FK_CID foreign key (CHANNEL_ID)
  references mc.CHANNEL_INFO (CHANNEL_ID) on delete cascade;
alter table mc.CHANNEL_USER
  add constraint FK_UID foreign key (USER_ID)
  references mc.USER_INFO (USER_ID) on delete cascade;

prompt
prompt Creating table COMMON_MODULE_INFO
prompt =================================
prompt
create table mc.COMMON_MODULE_INFO
(
  module_id     NUMBER(18) not null,
  p_module_id   NUMBER(18),
  module_name   VARCHAR2(50),
  module_url    VARCHAR2(200),
  module_remark VARCHAR2(500),
  module_sort   NUMBER(4),
  module_level  NUMBER(2),
  module_status CHAR(1) default '1'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.COMMON_MODULE_INFO
  is '公共管理平台模块表';
comment on column mc.COMMON_MODULE_INFO.module_id
  is '模块ID';
comment on column mc.COMMON_MODULE_INFO.p_module_id
  is '父模块ID';
comment on column mc.COMMON_MODULE_INFO.module_name
  is '模块名称';
comment on column mc.COMMON_MODULE_INFO.module_url
  is '模块URL';
comment on column mc.COMMON_MODULE_INFO.module_remark
  is '模块备注';
comment on column mc.COMMON_MODULE_INFO.module_sort
  is '显示顺序';
comment on column mc.COMMON_MODULE_INFO.module_level
  is '模块级别';
comment on column mc.COMMON_MODULE_INFO.module_status
  is '模块状态 0:停用, 1:启用';
alter table mc.COMMON_MODULE_INFO
  add constraint PK_COMMON_MODULE_INFO primary key (MODULE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CONSUME_RECORD_INFO
prompt ==================================
prompt
create table mc.CONSUME_RECORD_INFO
(
  record_id       VARCHAR2(200) not null,
  consumer_id     VARCHAR2(200),
  consumer_name   VARCHAR2(200),
  send_time       DATE default sysdate,
  send_quantity   NUMBER(10),
  send_type       NUMBER(10) default 0,
  remain_quota    NUMBER(10),
  unit_price      NUMBER(10,3),
  cost_fee        NUMBER(10,3),
  remark          VARCHAR2(200),
  send_msg        VARCHAR2(2000),
  gw_type         NUMBER(10) default 0,
  biz_type        NUMBER(3) default 0,
  channel_id      NUMBER(10) default 0,
  user_mome       VARCHAR2(200),
  batch_id        VARCHAR2(200),
  remain_balance  NUMBER(10,3) default 0.00,
  organization_id VARCHAR2(200),
  fee_mode        NUMBER(1),
  pay_type        NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.CONSUME_RECORD_INFO
  is '消费流水记录';
comment on column mc.CONSUME_RECORD_INFO.record_id
  is 'id';
comment on column mc.CONSUME_RECORD_INFO.consumer_id
  is '用户id';
comment on column mc.CONSUME_RECORD_INFO.consumer_name
  is '用户登录名';
comment on column mc.CONSUME_RECORD_INFO.send_time
  is '发送时间';
comment on column mc.CONSUME_RECORD_INFO.send_quantity
  is '发送量';
comment on column mc.CONSUME_RECORD_INFO.send_type
  is '发送类型。0普通发送,1批量发送,2回复短信,3群组发送,4socket发送,5webservice发送,6手工发送,7预警短信,8调查问卷,9生日祝福,10普通彩信,11账单彩信,20普通email';
comment on column mc.CONSUME_RECORD_INFO.remain_quota
  is '剩余配额';
comment on column mc.CONSUME_RECORD_INFO.unit_price
  is '单价';
comment on column mc.CONSUME_RECORD_INFO.cost_fee
  is '本次短信费用';
comment on column mc.CONSUME_RECORD_INFO.remark
  is '备注';
comment on column mc.CONSUME_RECORD_INFO.send_msg
  is '该批次短信的内容(批量发送方式只记录第一条短信的内容)';
comment on column mc.CONSUME_RECORD_INFO.gw_type
  is '号段类型。0-全网路，1-移动号段，2-联通号段，3-小灵通号段';
comment on column mc.CONSUME_RECORD_INFO.biz_type
  is '业务类型。0-普通短信业务，1-彩信业务，2-email业务';
comment on column mc.CONSUME_RECORD_INFO.channel_id
  is '发送通道。0-所有通道';
comment on column mc.CONSUME_RECORD_INFO.user_mome
  is '用户简介';
comment on column mc.CONSUME_RECORD_INFO.batch_id
  is '批次号';
comment on column mc.CONSUME_RECORD_INFO.remain_balance
  is '剩余金额';
comment on column mc.CONSUME_RECORD_INFO.organization_id
  is '机构id ';
comment on column mc.CONSUME_RECORD_INFO.fee_mode
  is '机构的付费类型 0:自付费, 1:组付费';
comment on column mc.CONSUME_RECORD_INFO.pay_type
  is '充值类型, 0:预付费, 1:后付费';
alter table mc.CONSUME_RECORD_INFO
  add primary key (RECORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table COUNT_SEND_STATUS
prompt ================================
prompt
create table mc.COUNT_SEND_STATUS
(
  id            VARCHAR2(200) not null,
  all_count     VARCHAR2(50),
  sending_count VARCHAR2(50),
  create_time   DATE,
  sent_count    VARCHAR2(50),
  receive_count VARCHAR2(50),
  suc_count     VARCHAR2(50),
  channel_id    VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.COUNT_SEND_STATUS
  is '各状态的总数表';
comment on column mc.COUNT_SEND_STATUS.id
  is '主键';
comment on column mc.COUNT_SEND_STATUS.all_count
  is '总数';
comment on column mc.COUNT_SEND_STATUS.sending_count
  is '待发送总数';
comment on column mc.COUNT_SEND_STATUS.create_time
  is '创建的时间';
comment on column mc.COUNT_SEND_STATUS.sent_count
  is '已提交总数';
comment on column mc.COUNT_SEND_STATUS.receive_count
  is '上行总数';
comment on column mc.COUNT_SEND_STATUS.suc_count
  is '成功总数';
comment on column mc.COUNT_SEND_STATUS.channel_id
  is '0为所有通道';
alter table mc.COUNT_SEND_STATUS
  add constraint PK_COUNT_SEND_STATUS primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMER
prompt =======================
prompt
create table mc.CUSTOMER
(
  customer_id        VARCHAR2(50) not null,
  mobile             VARCHAR2(50),
  mobile_user_name   VARCHAR2(200),
  birthday           DATE,
  email              VARCHAR2(200),
  mobile_remark      VARCHAR2(200),
  create_user_id     VARCHAR2(50),
  organization_id    VARCHAR2(200),
  create_time        DATE,
  modify_time        DATE,
  customer_type_id   VARCHAR2(100),
  define_column_1    VARCHAR2(100),
  define_column_2    VARCHAR2(100),
  define_column_3    VARCHAR2(100),
  define_column_4    VARCHAR2(100),
  define_column_5    VARCHAR2(100),
  define_column_6    VARCHAR2(100),
  define_column_7    VARCHAR2(100),
  define_column_8    VARCHAR2(100),
  define_column_9    VARCHAR2(100),
  define_column_10   VARCHAR2(100),
  define_column_11   VARCHAR2(100),
  define_column_12   VARCHAR2(100),
  define_column_13   VARCHAR2(100),
  define_column_14   VARCHAR2(100),
  define_column_15   VARCHAR2(100),
  group_id           VARCHAR2(4000),
  mobile_type        VARCHAR2(50),
  mobile_user_fundid VARCHAR2(50),
  secucode           VARCHAR2(200),
  order_start_date   DATE,
  order_du_date      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER
  add primary key (CUSTOMER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table GROUP_INFO
prompt =========================
prompt
create table mc.GROUP_INFO
(
  group_id          VARCHAR2(50) not null,
  user_id           VARCHAR2(200) not null,
  group_name        VARCHAR2(30),
  group_remark      VARCHAR2(100),
  create_time       DATE,
  modify_time       DATE,
  organization_id   VARCHAR2(200),
  create_user_id    VARCHAR2(200),
  is_share          NUMBER(1) default 0,
  parent_group_id   VARCHAR2(50),
  parent_group_type VARCHAR2(20),
  is_public         VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table mc.GROUP_INFO
  add primary key (GROUP_ID, USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUSTOMER_GROUP
prompt =============================
prompt
create table mc.CUSTOMER_GROUP
(
  group_id    VARCHAR2(50) not null,
  user_id     VARCHAR2(200) not null,
  customer_id VARCHAR2(50) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_GROUP
  add primary key (CUSTOMER_ID, GROUP_ID, USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_GROUP
  add constraint FK3B0AF2BE327A2DB0 foreign key (GROUP_ID, USER_ID)
  references mc.GROUP_INFO (GROUP_ID, USER_ID);
alter table mc.CUSTOMER_GROUP
  add constraint FK3B0AF2BED11A972F foreign key (CUSTOMER_ID)
  references mc.CUSTOMER (CUSTOMER_ID);

prompt
prompt Creating table CUSTOMER_INFO
prompt ============================
prompt
create table mc.CUSTOMER_INFO
(
  customer_id      VARCHAR2(50) not null,
  mobile_user_name VARCHAR2(50),
  mobile           VARCHAR2(50),
  group_id         VARCHAR2(50),
  create_time      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CUSTOMER_INFO
  is '客户表';
comment on column mc.CUSTOMER_INFO.customer_id
  is '客户表的主键';
comment on column mc.CUSTOMER_INFO.mobile_user_name
  is '客户的名字';
comment on column mc.CUSTOMER_INFO.mobile
  is '客户手机号';
comment on column mc.CUSTOMER_INFO.group_id
  is '客户所属的组';
comment on column mc.CUSTOMER_INFO.create_time
  is '添加客户时的时间';
alter table mc.CUSTOMER_INFO
  add constraint PK_CUSTOMER_INFO primary key (CUSTOMER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_CU_MOBILE on mc.CUSTOMER_INFO (MOBILE, MOBILE_USER_NAME, GROUP_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMER_LOG
prompt ===========================
prompt
create table mc.CUSTOMER_LOG
(
  log_id           VARCHAR2(50) not null,
  mobile           VARCHAR2(200),
  oper_user        VARCHAR2(50),
  oper_group       VARCHAR2(50),
  type             NUMBER(1),
  createtime       DATE,
  modifytime       VARCHAR2(200),
  reservedint      NUMBER(1),
  reservedchar     VARCHAR2(200),
  productid        VARCHAR2(200),
  organizationid   VARCHAR2(200),
  message          VARCHAR2(2000),
  order_start_date DATE,
  order_du_date    DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.CUSTOMER_LOG
  is '客户信息表';
alter table mc.CUSTOMER_LOG
  add constraint PK_CUSTOMER_LOG primary key (LOG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table CUSTOMER_TYPE
prompt ============================
prompt
create table mc.CUSTOMER_TYPE
(
  customer_type_id   VARCHAR2(100) not null,
  customer_type_name VARCHAR2(100),
  create_user        VARCHAR2(50),
  create_time        DATE,
  modify_time        DATE,
  description        VARCHAR2(200),
  organization_id    VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_TYPE
  add primary key (CUSTOMER_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUSTOMER_TYPE_ATTR
prompt =================================
prompt
create table mc.CUSTOMER_TYPE_ATTR
(
  customer_type_id VARCHAR2(100) not null,
  attr_name        VARCHAR2(100) not null,
  define_column    NUMBER(10),
  description      VARCHAR2(200),
  js_validate      VARCHAR2(500),
  attr_type        NUMBER(10),
  id               VARCHAR2(100),
  create_time      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.CUSTOMER_TYPE_ATTR
  add primary key (CUSTOMER_TYPE_ID, ATTR_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DAILY_RECKONING_INFO
prompt ===================================
prompt
create table mc.DAILY_RECKONING_INFO
(
  daily_reckoning_id   VARCHAR2(200) not null,
  user_id              VARCHAR2(200) not null,
  user_name            VARCHAR2(200),
  send_status          VARCHAR2(200),
  send_quantity        INTEGER,
  sub_total_fee        NUMBER(13,3),
  remain_message_quota NUMBER(10),
  remain_mms_quota     NUMBER(10),
  reckoning_date       DATE,
  record_date          DATE default sysdate,
  pay_mode             NUMBER(1) default 0,
  remain_balance       NUMBER(10,3) default 0.000,
  user_mome            VARCHAR2(200),
  mobile_com           NUMBER(2),
  channel_id           NUMBER(4),
  unit_price           NUMBER(10,3)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.DAILY_RECKONING_INFO
  is '日结单表';
comment on column mc.DAILY_RECKONING_INFO.daily_reckoning_id
  is 'id';
comment on column mc.DAILY_RECKONING_INFO.user_id
  is '账户id';
comment on column mc.DAILY_RECKONING_INFO.user_name
  is '账户名';
comment on column mc.DAILY_RECKONING_INFO.send_status
  is '短信状态(现只计提交和发送成功的)';
comment on column mc.DAILY_RECKONING_INFO.send_quantity
  is '计费短信的数量';
comment on column mc.DAILY_RECKONING_INFO.sub_total_fee
  is '短信费用';
comment on column mc.DAILY_RECKONING_INFO.remain_message_quota
  is '剩余短信配额';
comment on column mc.DAILY_RECKONING_INFO.remain_mms_quota
  is '剩余彩信配额';
comment on column mc.DAILY_RECKONING_INFO.reckoning_date
  is '短信发送的日期';
comment on column mc.DAILY_RECKONING_INFO.record_date
  is '记录日期';
comment on column mc.DAILY_RECKONING_INFO.pay_mode
  is '计费模式';
comment on column mc.DAILY_RECKONING_INFO.remain_balance
  is '剩余金额';
comment on column mc.DAILY_RECKONING_INFO.user_mome
  is '账户名称';
comment on column mc.DAILY_RECKONING_INFO.mobile_com
  is '运营商ID，1为移动，2为联通,3为电信,0为全网 ';
comment on column mc.DAILY_RECKONING_INFO.channel_id
  is '通道ID';
alter table mc.DAILY_RECKONING_INFO
  add constraint PK_DAILY_RECKONING_INFO primary key (DAILY_RECKONING_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DATA_SOURCE_TYPE
prompt ===============================
prompt
create table mc.DATA_SOURCE_TYPE
(
  data_source_type_id   VARCHAR2(20) not null,
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.DATA_SOURCE_TYPE
  add constraint PK_DATA_SOURCE_TYPE primary key (DATA_SOURCE_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DT_SRC_TP_TXCRTS on mc.DATA_SOURCE_TYPE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DT_SRC_TP_TXSTMP on mc.DATA_SOURCE_TYPE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table DATA_SOURCE
prompt ==========================
prompt
create table mc.DATA_SOURCE
(
  data_source_id        VARCHAR2(20) not null,
  data_source_type_id   VARCHAR2(20),
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.DATA_SOURCE
  add constraint PK_DATA_SOURCE primary key (DATA_SOURCE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.DATA_SOURCE
  add constraint DATA_SRC_TYP foreign key (DATA_SOURCE_TYPE_ID)
  references mc.DATA_SOURCE_TYPE (DATA_SOURCE_TYPE_ID);
create index mc.DATA_SOURCE_TXCRTS on mc.DATA_SOURCE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DATA_SOURCE_TXSTMP on mc.DATA_SOURCE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.DATA_SRC_TYP on mc.DATA_SOURCE (DATA_SOURCE_TYPE_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table DB_INTERFACE_INFO
prompt ================================
prompt
create table mc.DB_INTERFACE_INFO
(
  db_interface_id   VARCHAR2(200) not null,
  zhang_hao         VARCHAR2(200),
  pass_word         VARCHAR2(200),
  send_select_limit VARCHAR2(30),
  send_insert_limit VARCHAR2(30),
  receive_limit     VARCHAR2(30),
  pro_class_limit   VARCHAR2(30),
  pro_limit         VARCHAR2(30)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.DB_INTERFACE_INFO
  is '数据库接口';
comment on column mc.DB_INTERFACE_INFO.db_interface_id
  is '数据库接口的ID';
comment on column mc.DB_INTERFACE_INFO.zhang_hao
  is '账号';
comment on column mc.DB_INTERFACE_INFO.pass_word
  is '密码';
comment on column mc.DB_INTERFACE_INFO.send_select_limit
  is 'sms_send表的权限:select--查询权限';
comment on column mc.DB_INTERFACE_INFO.send_insert_limit
  is 'sms_send表的权限:insert--插入权限';
comment on column mc.DB_INTERFACE_INFO.receive_limit
  is 'sms_receive表的权限：select--查询权限';
comment on column mc.DB_INTERFACE_INFO.pro_class_limit
  is '发送违禁词分类的权限：select--查询权限';
comment on column mc.DB_INTERFACE_INFO.pro_limit
  is '发送违禁词的权限：select--查询权限';
alter table mc.DB_INTERFACE_INFO
  add constraint PK_DB_INTERFACE_INFO primary key (DB_INTERFACE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table DEMO
prompt ===================
prompt
create table mc.DEMO
(
  channelid VARCHAR2(200),
  status    VARCHAR2(200),
  devile    VARCHAR2(200),
  errmsg    VARCHAR2(200),
  mobile_to VARCHAR2(200),
  sequence  VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table DIC_ALL_KIND
prompt ===========================
prompt
create table mc.DIC_ALL_KIND
(
  kind_code      VARCHAR2(128) not null,
  kind_name      VARCHAR2(128) not null,
  memo           VARCHAR2(128),
  operation_kind VARCHAR2(32) not null,
  operation_name VARCHAR2(128) not null,
  user_id        VARCHAR2(128)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.DIC_ALL_KIND
  is '系统字典表';
comment on column mc.DIC_ALL_KIND.kind_code
  is '字典代码';
comment on column mc.DIC_ALL_KIND.kind_name
  is '字典名称';
comment on column mc.DIC_ALL_KIND.memo
  is '备注';
comment on column mc.DIC_ALL_KIND.operation_kind
  is '操作类型';
comment on column mc.DIC_ALL_KIND.operation_name
  is '操作类型描述';
comment on column mc.DIC_ALL_KIND.user_id
  is '用户id';

prompt
prompt Creating table DRAFT_INFO
prompt =========================
prompt
create table mc.DRAFT_INFO
(
  draft_id    VARCHAR2(200) not null,
  context     VARCHAR2(4000),
  mobile_to   VARCHAR2(4000),
  user_id     VARCHAR2(200),
  create_date DATE,
  content     VARCHAR2(2000),
  group_ids   CLOB,
  group_names CLOB,
  mobile      CLOB,
  create_time TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.DRAFT_INFO
  is '短信草稿';
comment on column mc.DRAFT_INFO.draft_id
  is '草稿编号';
comment on column mc.DRAFT_INFO.context
  is '短信内容';
comment on column mc.DRAFT_INFO.mobile_to
  is '手机号';
comment on column mc.DRAFT_INFO.user_id
  is '用户编号';
comment on column mc.DRAFT_INFO.create_date
  is '创建日期';
alter table mc.DRAFT_INFO
  add constraint PK_DRAFT_INFO primary key (DRAFT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table D_ORG_INFO
prompt =========================
prompt
create table mc.D_ORG_INFO
(
  org_id        VARCHAR2(200) not null,
  org_name      VARCHAR2(200),
  org_full_name VARCHAR2(200),
  org_sts       VARCHAR2(200),
  org_type_code VARCHAR2(200),
  super_org_no  VARCHAR2(200),
  is_frz        VARCHAR2(200),
  extend_str    VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.D_ORG_INFO
  is '临时机构信息表';
comment on column mc.D_ORG_INFO.org_id
  is '机构编号';
comment on column mc.D_ORG_INFO.org_name
  is '机构名称';
comment on column mc.D_ORG_INFO.org_full_name
  is '机构全名';
comment on column mc.D_ORG_INFO.org_sts
  is '机构状态0 正常,9 注销';
comment on column mc.D_ORG_INFO.org_type_code
  is '机构类型代码，01:代表处，02：营业部';
comment on column mc.D_ORG_INFO.super_org_no
  is '上级机构编号';
comment on column mc.D_ORG_INFO.is_frz
  is '是否冻结 0 未冻结,1 冻结';
comment on column mc.D_ORG_INFO.extend_str
  is '预留';
alter table mc.D_ORG_INFO
  add constraint PK_D_ORG_INFO primary key (ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table D_SYS_CODE
prompt =========================
prompt
create table mc.D_SYS_CODE
(
  subsys_code_id   VARCHAR2(20) not null,
  subsys_code_name VARCHAR2(200),
  description      VARCHAR2(200),
  sys_id           NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.D_SYS_CODE
  is '临时信息来源数据字典';
comment on column mc.D_SYS_CODE.subsys_code_id
  is '信息来源编号';
comment on column mc.D_SYS_CODE.subsys_code_name
  is '信息来源名称';
comment on column mc.D_SYS_CODE.description
  is '备注';
comment on column mc.D_SYS_CODE.sys_id
  is '信息来源扩展号';
alter table mc.D_SYS_CODE
  add constraint PK_D_SYS_CODE primary key (SUBSYS_CODE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_GROUP
prompt ===========================
prompt
create table mc.ENTITY_GROUP
(
  entity_group_id       VARCHAR2(20) not null,
  entity_group_name     VARCHAR2(100),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_GROUP
  add constraint PK_ENTITY_GROUP primary key (ENTITY_GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTT_GRP_TXCRTS on mc.ENTITY_GROUP (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTT_GRP_TXSTMP on mc.ENTITY_GROUP (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_GROUP_ENTRY
prompt =================================
prompt
create table mc.ENTITY_GROUP_ENTRY
(
  entity_group_id       VARCHAR2(20) not null,
  entity_or_package     VARCHAR2(255) not null,
  appl_enum_id          VARCHAR2(20),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_GROUP_ENTRY
  add constraint PK_ENTITY_GROUP_ENTRY primary key (ENTITY_GROUP_ID, ENTITY_OR_PACKAGE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_GROUP_ENTRY
  add constraint ENTGRP_GRP foreign key (ENTITY_GROUP_ID)
  references mc.ENTITY_GROUP (ENTITY_GROUP_ID);
create index mc.ENTGRP_GRP on mc.ENTITY_GROUP_ENTRY (ENTITY_GROUP_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_GRP_ENR_TXCRTS on mc.ENTITY_GROUP_ENTRY (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_GRP_ENR_TXSTMP on mc.ENTITY_GROUP_ENTRY (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_KEY_STORE
prompt ===============================
prompt
create table mc.ENTITY_KEY_STORE
(
  key_name              VARCHAR2(255) not null,
  key_text              VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENTITY_KEY_STORE
  add constraint PK_ENTITY_KEY_STORE primary key (KEY_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENTT_K_STR_TXCRTS on mc.ENTITY_KEY_STORE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENTT_K_STR_TXSTMP on mc.ENTITY_KEY_STORE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ENTITY_SYNC
prompt ==========================
prompt
create table mc.ENTITY_SYNC
(
  entity_sync_id               VARCHAR2(20) not null,
  run_status_id                VARCHAR2(20),
  last_successful_synch_time   TIMESTAMP(6),
  last_history_start_date      TIMESTAMP(6),
  pre_offline_synch_time       TIMESTAMP(6),
  offline_sync_split_millis    NUMBER(18),
  sync_split_millis            NUMBER(18),
  sync_end_buffer_millis       NUMBER(18),
  max_running_no_update_millis NUMBER(18),
  target_service_name          VARCHAR2(255),
  target_delegator_name        VARCHAR2(255),
  keep_remove_info_hours       NUMBER(18,6),
  for_pull_only                CHAR(1),
  for_push_only                CHAR(1),
  last_updated_stamp           TIMESTAMP(6),
  last_updated_tx_stamp        TIMESTAMP(6),
  created_stamp                TIMESTAMP(6),
  created_tx_stamp             TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC
  add constraint PK_ENTITY_SYNC primary key (ENTITY_SYNC_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTITY_SYNC_TXCRTS on mc.ENTITY_SYNC (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTITY_SYNC_TXSTMP on mc.ENTITY_SYNC (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_HISTORY
prompt ==================================
prompt
create table mc.ENTITY_SYNC_HISTORY
(
  entity_sync_id             VARCHAR2(20) not null,
  start_date                 TIMESTAMP(6) not null,
  run_status_id              VARCHAR2(20),
  beginning_synch_time       TIMESTAMP(6),
  last_successful_synch_time TIMESTAMP(6),
  last_candidate_end_time    TIMESTAMP(6),
  last_split_start_time      NUMBER(18),
  to_create_inserted         NUMBER(18),
  to_create_updated          NUMBER(18),
  to_create_not_updated      NUMBER(18),
  to_store_inserted          NUMBER(18),
  to_store_updated           NUMBER(18),
  to_store_not_updated       NUMBER(18),
  to_remove_deleted          NUMBER(18),
  to_remove_already_deleted  NUMBER(18),
  total_rows_exported        NUMBER(18),
  total_rows_to_create       NUMBER(18),
  total_rows_to_store        NUMBER(18),
  total_rows_to_remove       NUMBER(18),
  total_splits               NUMBER(18),
  total_store_calls          NUMBER(18),
  running_time_millis        NUMBER(18),
  per_split_min_millis       NUMBER(18),
  per_split_max_millis       NUMBER(18),
  per_split_min_items        NUMBER(18),
  per_split_max_items        NUMBER(18),
  last_updated_stamp         TIMESTAMP(6),
  last_updated_tx_stamp      TIMESTAMP(6),
  created_stamp              TIMESTAMP(6),
  created_tx_stamp           TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_HISTORY
  add constraint PK_ENTITY_SYNC_HISTORY primary key (ENTITY_SYNC_ID, START_DATE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_SYNC_HISTORY
  add constraint ENTSYNC_HSTSNC foreign key (ENTITY_SYNC_ID)
  references mc.ENTITY_SYNC (ENTITY_SYNC_ID);
create index mc.ENTSYNC_HSTSNC on mc.ENTITY_SYNC_HISTORY (ENTITY_SYNC_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_HSR_TXCRTS on mc.ENTITY_SYNC_HISTORY (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_HSR_TXSTMP on mc.ENTITY_SYNC_HISTORY (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_INCLUDE
prompt ==================================
prompt
create table mc.ENTITY_SYNC_INCLUDE
(
  entity_sync_id        VARCHAR2(20) not null,
  entity_or_package     VARCHAR2(255) not null,
  appl_enum_id          VARCHAR2(20),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE
  add constraint PK_ENTITY_SYNC_INCLUDE primary key (ENTITY_SYNC_ID, ENTITY_OR_PACKAGE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE
  add constraint ENTSYNC_INCSNC foreign key (ENTITY_SYNC_ID)
  references mc.ENTITY_SYNC (ENTITY_SYNC_ID);
create index mc.ENTSYNC_INCSNC on mc.ENTITY_SYNC_INCLUDE (ENTITY_SYNC_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_INCD_TXCRS on mc.ENTITY_SYNC_INCLUDE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_INCD_TXSTP on mc.ENTITY_SYNC_INCLUDE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_INCLUDE_GROUP
prompt ========================================
prompt
create table mc.ENTITY_SYNC_INCLUDE_GROUP
(
  entity_sync_id        VARCHAR2(20) not null,
  entity_group_id       VARCHAR2(20) not null,
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE_GROUP
  add constraint PK_ENTITY_SYNC_INCLUDE_GROUP primary key (ENTITY_SYNC_ID, ENTITY_GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.ENTITY_SYNC_INCLUDE_GROUP
  add constraint ENTSNCGU_GRP foreign key (ENTITY_GROUP_ID)
  references mc.ENTITY_GROUP (ENTITY_GROUP_ID);
alter table mc.ENTITY_SYNC_INCLUDE_GROUP
  add constraint ENTSNCGU_SNC foreign key (ENTITY_SYNC_ID)
  references mc.ENTITY_SYNC (ENTITY_SYNC_ID);
create index mc.ENTSNCGU_GRP on mc.ENTITY_SYNC_INCLUDE_GROUP (ENTITY_GROUP_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENTSNCGU_SNC on mc.ENTITY_SYNC_INCLUDE_GROUP (ENTITY_SYNC_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_IND_GRP_TP on mc.ENTITY_SYNC_INCLUDE_GROUP (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_IND_GRP_TS on mc.ENTITY_SYNC_INCLUDE_GROUP (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENTITY_SYNC_REMOVE
prompt =================================
prompt
create table mc.ENTITY_SYNC_REMOVE
(
  entity_sync_remove_id VARCHAR2(20) not null,
  primary_key_removed   CLOB,
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.ENTITY_SYNC_REMOVE
  add constraint PK_ENTITY_SYNC_REMOVE primary key (ENTITY_SYNC_REMOVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_RMV_TXCRTS on mc.ENTITY_SYNC_REMOVE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.ENT_SNC_RMV_TXSTMP on mc.ENTITY_SYNC_REMOVE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ENUMERATION_TYPE
prompt ===============================
prompt
create table mc.ENUMERATION_TYPE
(
  enum_type_id          VARCHAR2(60) not null,
  parent_type_id        VARCHAR2(20),
  has_table             CHAR(1),
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION_TYPE
  add constraint PK_ENUMERATION_TYPE primary key (ENUM_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION_TYPE
  add constraint ENUM_TYPE_PARENT foreign key (PARENT_TYPE_ID)
  references mc.ENUMERATION_TYPE (ENUM_TYPE_ID);
create index mc.ENMRTN_TP_TXCRTS on mc.ENUMERATION_TYPE (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENMRTN_TP_TXSTMP on mc.ENUMERATION_TYPE (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENUM_TYPE_PARENT on mc.ENUMERATION_TYPE (PARENT_TYPE_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ENUMERATION
prompt ==========================
prompt
create table mc.ENUMERATION
(
  enum_id               VARCHAR2(60) not null,
  enum_type_id          VARCHAR2(60),
  enum_code             VARCHAR2(60),
  sequence_id           VARCHAR2(20),
  description           VARCHAR2(255),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION
  add constraint PK_ENUMERATION primary key (ENUM_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ENUMERATION
  add constraint ENUM_TO_TYPE foreign key (ENUM_TYPE_ID)
  references mc.ENUMERATION_TYPE (ENUM_TYPE_ID);
create index mc.ENUMERATION_TXCRTS on mc.ENUMERATION (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENUMERATION_TXSTMP on mc.ENUMERATION (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.ENUM_TO_TYPE on mc.ENUMERATION (ENUM_TYPE_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table EXCEL
prompt ====================
prompt
create table mc.EXCEL
(
  excel_id      VARCHAR2(50) not null,
  excel_name    VARCHAR2(50),
  mobile_to     VARCHAR2(2000),
  send_msg      VARCHAR2(600),
  prior_id      VARCHAR2(10),
  pre_send_time VARCHAR2(50),
  remark        VARCHAR2(500),
  channel_id    VARCHAR2(10),
  user_id       VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.EXCEL
  add constraint PK_EXCEL primary key (EXCEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table GROUPINFO
prompt ========================
prompt
create table mc.GROUPINFO
(
  group_id        VARCHAR2(50) not null,
  group_name      VARCHAR2(30),
  status          NUMBER(1),
  group_type      NUMBER(1),
  is_public       VARCHAR2(10),
  create_time     DATE,
  modify_time     DATE,
  user_id         VARCHAR2(200),
  organization_id VARCHAR2(200),
  parent_id       VARCHAR2(50),
  group_remark    VARCHAR2(50),
  sort            NUMBER(1),
  reservedint     NUMBER(1),
  reservedchar    VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.GROUPINFO
  is '客户管理模块组信息表';
alter table mc.GROUPINFO
  add constraint PK_GROUPINFO primary key (GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table GROUP_EXCEL_INFO
prompt ===============================
prompt
create table mc.GROUP_EXCEL_INFO
(
  excel_id         VARCHAR2(200) not null,
  excel_name       VARCHAR2(200),
  mobile           VARCHAR2(24),
  mobile_user_name VARCHAR2(50),
  group_id         VARCHAR2(200),
  mobile_remark    VARCHAR2(200),
  birthday         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.GROUP_EXCEL_INFO
  is '群组EXCEL导入手机号码';
comment on column mc.GROUP_EXCEL_INFO.excel_id
  is '编号';
comment on column mc.GROUP_EXCEL_INFO.excel_name
  is 'Excel名称';
comment on column mc.GROUP_EXCEL_INFO.mobile
  is '手机号';
comment on column mc.GROUP_EXCEL_INFO.mobile_user_name
  is '用户名';
comment on column mc.GROUP_EXCEL_INFO.group_id
  is '所属机构';
comment on column mc.GROUP_EXCEL_INFO.mobile_remark
  is '备注';
comment on column mc.GROUP_EXCEL_INFO.birthday
  is '生日';
alter table mc.GROUP_EXCEL_INFO
  add constraint PK_GROUP_EXCEL_INFO primary key (EXCEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table GROUP_ORDER_INFO
prompt ===============================
prompt
create table mc.GROUP_ORDER_INFO
(
  order_id              VARCHAR2(200) not null,
  product_id            VARCHAR2(200),
  organization_id       VARCHAR2(200),
  order_type            NUMBER(1) default 0,
  order_address         VARCHAR2(200),
  group_id              VARCHAR2(200),
  order_params          VARCHAR2(200),
  begin_time            DATE default sysdate,
  end_time              DATE default sysdate,
  order_status          NUMBER(1) default 0,
  order_time            DATE default sysdate,
  order_deprecated_flag VARCHAR2(200),
  product_name          VARCHAR2(200),
  customer_id           VARCHAR2(200),
  notify_status         NUMBER(1) default 0,
  user_name             VARCHAR2(200),
  prority               NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.GROUP_ORDER_INFO
  is '客户组订阅产品的模型';
comment on column mc.GROUP_ORDER_INFO.order_id
  is '订购编号';
comment on column mc.GROUP_ORDER_INFO.product_id
  is '产品编号';
comment on column mc.GROUP_ORDER_INFO.organization_id
  is '机构编号';
comment on column mc.GROUP_ORDER_INFO.order_type
  is '定制方式，0：短信、1：彩信';
comment on column mc.GROUP_ORDER_INFO.order_address
  is '定制的地址:	手机号或email';
comment on column mc.GROUP_ORDER_INFO.group_id
  is '定制组编号';
comment on column mc.GROUP_ORDER_INFO.order_params
  is '定制参数:股票代码，可多只';
comment on column mc.GROUP_ORDER_INFO.begin_time
  is '定制开始时间';
comment on column mc.GROUP_ORDER_INFO.end_time
  is '定制结束时间';
comment on column mc.GROUP_ORDER_INFO.order_status
  is '定制有效状态，0：正常、1：未开始、2过期、3：作废、4：暂停、5：退订';
comment on column mc.GROUP_ORDER_INFO.order_time
  is '定制日期';
comment on column mc.GROUP_ORDER_INFO.order_deprecated_flag
  is '过期、删除标记。订单正常状态下该值为空。订单作废、过期、暂停、未开始状态时，随机生成一个标记，用于与正常订单定制地址区别(主要用于数据库判重)';
comment on column mc.GROUP_ORDER_INFO.product_name
  is '服务产品名称';
comment on column mc.GROUP_ORDER_INFO.customer_id
  is '客户编号。由客户自行维护';
comment on column mc.GROUP_ORDER_INFO.notify_status
  is '发送告知短信的状态，0：未发送、1：已发送';
comment on column mc.GROUP_ORDER_INFO.user_name
  is '操作当前记录客户姓名';
comment on column mc.GROUP_ORDER_INFO.prority
  is '订单优先级越小越优先';
alter table mc.GROUP_ORDER_INFO
  add constraint PK_GROUP_ORDER_INFO primary key (ORDER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table LOGIN_SMS_VERCODE
prompt ================================
prompt
create table mc.LOGIN_SMS_VERCODE
(
  vercode_id   VARCHAR2(200) not null,
  vercode      VARCHAR2(10) not null,
  mobile_to    VARCHAR2(20) not null,
  user_id      VARCHAR2(200) not null,
  send_msg     VARCHAR2(200),
  send_time    DATE default sysdate,
  vercode_type NUMBER(1) not null,
  remark       VARCHAR2(200),
  status       NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.LOGIN_SMS_VERCODE
  is '平台登录手机验证码表';
comment on column mc.LOGIN_SMS_VERCODE.vercode_id
  is '主键';
comment on column mc.LOGIN_SMS_VERCODE.vercode
  is '系统为本次登录生成的6位验证码';
comment on column mc.LOGIN_SMS_VERCODE.mobile_to
  is '接收的手机号';
comment on column mc.LOGIN_SMS_VERCODE.user_id
  is '接收手机验证码的用户ID';
comment on column mc.LOGIN_SMS_VERCODE.send_msg
  is '为本次登录发送的短信内容';
comment on column mc.LOGIN_SMS_VERCODE.send_time
  is '发送时间';
comment on column mc.LOGIN_SMS_VERCODE.vercode_type
  is '验证码类型 0：找回密码  1：手机验证码登录';
comment on column mc.LOGIN_SMS_VERCODE.remark
  is '备注';
comment on column mc.LOGIN_SMS_VERCODE.status
  is '是否有效状态值  0：无效  1:有效';
alter table mc.LOGIN_SMS_VERCODE
  add constraint VERCODE_ID primary key (VERCODE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MLOG$_ORGANIZATION
prompt =================================
prompt
create table mc.MLOG$_ORGANIZATION
(
  user_id         VARCHAR2(200),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MLOG$_ORGANIZATION
  is 'snapshot log for master table MESSAGECHANNEL.ORGANIZATION';

prompt
prompt Creating table MLOG$_SEND
prompt =========================
prompt
create table mc.MLOG$_SEND
(
  send_id         VARCHAR2(200),
  snaptime$$      DATE,
  dmltype$$       VARCHAR2(1),
  old_new$$       VARCHAR2(1),
  change_vector$$ RAW(255),
  xid$$           NUMBER
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MLOG$_SEND
  is 'snapshot log for master table MESSAGECHANNEL.SEND';

prompt
prompt Creating table MMS_CHANNEL_ANALYZE
prompt ==================================
prompt
create table mc.MMS_CHANNEL_ANALYZE
(
  channel_id    NUMBER(5),
  org_id        VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table MMS_CHANNEL_INFO
prompt ===============================
prompt
create table mc.MMS_CHANNEL_INFO
(
  channel_id     NUMBER(10) not null,
  channel_name   VARCHAR2(500),
  channel_status NUMBER(10),
  channel_remark VARCHAR2(2000),
  sort_id        NUMBER(10),
  channel_state  NUMBER(2),
  com_type       NUMBER(1),
  sp_no_yd       VARCHAR2(50),
  sp_no_lt       VARCHAR2(50),
  sp_no_dx       VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_CHANNEL_INFO
  is '彩信通道表';
comment on column mc.MMS_CHANNEL_INFO.channel_id
  is '通道ID';
comment on column mc.MMS_CHANNEL_INFO.channel_name
  is '通道名称';
comment on column mc.MMS_CHANNEL_INFO.channel_status
  is '通道状态，0启动,1,停止,2未启动';
comment on column mc.MMS_CHANNEL_INFO.channel_remark
  is '备注';
comment on column mc.MMS_CHANNEL_INFO.sort_id
  is '通道排序id';
comment on column mc.MMS_CHANNEL_INFO.channel_state
  is '通道发送状态(此字段无效)';
comment on column mc.MMS_CHANNEL_INFO.com_type
  is '支持号段类型：1-只移动,2-只联通,3-电信  0-全支持';
comment on column mc.MMS_CHANNEL_INFO.sp_no_yd
  is '移动特服号';
comment on column mc.MMS_CHANNEL_INFO.sp_no_lt
  is '联通特服号';
comment on column mc.MMS_CHANNEL_INFO.sp_no_dx
  is '电信特服号';
alter table mc.MMS_CHANNEL_INFO
  add constraint PK_MMS_CHANNEL_INFO primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_CHANNEL_RULE_SET
prompt ===================================
prompt
create table mc.MMS_CHANNEL_RULE_SET
(
  rule_set_id       VARCHAR2(20) not null,
  rule_set_name     VARCHAR2(200),
  rule_set_type     VARCHAR2(20),
  dc_file_path      VARCHAR2(200),
  rule_status       VARCHAR2(20),
  user_organization VARCHAR2(50),
  user_org_name     VARCHAR2(20),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(20),
  descriptions      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_CHANNEL_RULE_SET
  is '彩信通道规则表';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_set_id
  is '规则编号';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_set_name
  is '规则名称';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_set_type
  is '规则类型, ITEMS:手工输入的规则, DECISIONTABLE:决策表';
comment on column mc.MMS_CHANNEL_RULE_SET.dc_file_path
  is '决策表保存路径';
comment on column mc.MMS_CHANNEL_RULE_SET.rule_status
  is '状态, -1:草稿状态, 0:备选, 1:生效';
comment on column mc.MMS_CHANNEL_RULE_SET.user_organization
  is '机构编号';
comment on column mc.MMS_CHANNEL_RULE_SET.user_org_name
  is '机构名称';
comment on column mc.MMS_CHANNEL_RULE_SET.user_id
  is '用户编号';
comment on column mc.MMS_CHANNEL_RULE_SET.user_name
  is '用户名称';
comment on column mc.MMS_CHANNEL_RULE_SET.descriptions
  is '备注';
alter table mc.MMS_CHANNEL_RULE_SET
  add constraint PK_MMS_CHANNEL_RULE_SET primary key (RULE_SET_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create table mc.MMS_CHANNEL_RULE_SET_ITEM
(
  rule_set_id               VARCHAR2(20),
  rule_set_item_id          VARCHAR2(200) not null,
  rule_set_item_name        VARCHAR2(200),
  salience                  NUMBER(7),
  message_type              VARCHAR2(4000),
  org_id                    VARCHAR2(4000),
  user_id                   VARCHAR2(4000),
  mobile_com                NUMBER(4),
  num_scope                 VARCHAR2(2000),
  num_region                VARCHAR2(2000),
  mobile                    CLOB,
  channel_id                VARCHAR2(200),
  msg_type                  VARCHAR2(40),
  day_start_time            DATE,
  day_end_time              DATE,
  night_start_time          DATE,
  night_end_time            DATE,
  default_channel_id        NUMBER(4),
  default_mobile_channel_id NUMBER(4),
  default_union_channel_id  NUMBER(4),
  default_dx_channel_id     NUMBER(4),
  use_channel_id            NUMBER(4),
  use_status                NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_CHANNEL_RULE_SET_ITEM
  is '短信通道规则表明细表';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.rule_set_id
  is '规则编号';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.rule_set_item_id
  is '规则明细编号';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.rule_set_item_name
  is '规则明细名称';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.salience
  is '优先级';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.message_type
  is '信息性质, 可以多选';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.org_id
  is '机构编号, 可以多选';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.user_id
  is '用户编号, 可以多选';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.mobile_com
  is '运营商, 可以多选';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.num_scope
  is '号段, 可以填写多个, 以英文逗号分割';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.num_region
  is '手机所属区域, 可以填写多个, 以英文逗号分';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.mobile
  is '手机号码, 可以填写多个';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.channel_id
  is '所选通道';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.msg_type
  is '信息类型';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.day_start_time
  is '白天开始时间';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.day_end_time
  is '白天结束时间';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.night_start_time
  is '夜间开始时间';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.night_end_time
  is '夜间结束时间';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_channel_id
  is '缺省使用的通道';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_mobile_channel_id
  is '缺省使用的移动通道';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_union_channel_id
  is '缺省使用的联通通道';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.default_dx_channel_id
  is '缺省使用的电信通道';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.use_channel_id
  is '最终使用的通道编号';
comment on column mc.MMS_CHANNEL_RULE_SET_ITEM.use_status
  is '彩信的缺省状态';
alter table mc.MMS_CHANNEL_RULE_SET_ITEM
  add constraint PK_MMS_CHANNEL_RULE_SET_ITEM primary key (RULE_SET_ITEM_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_HIS
prompt ======================
prompt
create table mc.MMS_HIS
(
  mms_his_id        VARCHAR2(200) not null,
  send_status       NUMBER(2),
  user_organization VARCHAR2(200),
  channel_id        NUMBER(4),
  mobile_com        NUMBER(2),
  sys_id            VARCHAR2(200),
  message_type      VARCHAR2(200),
  batch_id          VARCHAR2(200),
  mobile_quantities NUMBER(4),
  send_time         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_HIS
  is '彩信归档表';
comment on column mc.MMS_HIS.mms_his_id
  is 'id';
comment on column mc.MMS_HIS.send_status
  is '发送状态';
comment on column mc.MMS_HIS.user_organization
  is '机构';
comment on column mc.MMS_HIS.channel_id
  is '通道';
comment on column mc.MMS_HIS.mobile_com
  is '运营商';
comment on column mc.MMS_HIS.sys_id
  is '信息来源';
comment on column mc.MMS_HIS.message_type
  is '信息性质';
comment on column mc.MMS_HIS.batch_id
  is '批次号';
comment on column mc.MMS_HIS.mobile_quantities
  is '发送总量';
comment on column mc.MMS_HIS.send_time
  is '发送时间';
alter table mc.MMS_HIS
  add constraint PK_MMS_HIS primary key (MMS_HIS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_RECEIVE
prompt ==========================
prompt
create table mc.MMS_RECEIVE
(
  receive_id      VARCHAR2(200) not null,
  mobile_from     VARCHAR2(30),
  subject         VARCHAR2(40),
  receive_msg     BLOB,
  receive_time    DATE,
  sp_no           VARCHAR2(20),
  sp_serv_no      VARCHAR2(20),
  receive_status  NUMBER(1),
  read_time       DATE,
  channel_id      NUMBER(2),
  organization_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_RECEIVE
  is '彩信上行信息表';
comment on column mc.MMS_RECEIVE.receive_id
  is '上行彩信编号';
comment on column mc.MMS_RECEIVE.mobile_from
  is '上行手机号';
comment on column mc.MMS_RECEIVE.subject
  is '彩信标题';
comment on column mc.MMS_RECEIVE.receive_msg
  is '彩信内容';
comment on column mc.MMS_RECEIVE.receive_time
  is '上行时间';
comment on column mc.MMS_RECEIVE.sp_no
  is '特服号';
comment on column mc.MMS_RECEIVE.sp_serv_no
  is '业务编号';
comment on column mc.MMS_RECEIVE.receive_status
  is '上行状态';
comment on column mc.MMS_RECEIVE.read_time
  is '阅读时间';
comment on column mc.MMS_RECEIVE.channel_id
  is '通道编号';
comment on column mc.MMS_RECEIVE.organization_id
  is '所属机构';
alter table mc.MMS_RECEIVE
  add constraint PK_MMS_RECEIVE primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_SCHED_MOBILE_TEMP
prompt ====================================
prompt
create table mc.MMS_SCHED_MOBILE_TEMP
(
  schedule_id VARCHAR2(200) not null,
  mobile      VARCHAR2(20) not null,
  import_type VARCHAR2(200),
  batch_id    VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_SCHED_MOBILE_TEMP
  is '彩信发送导入手机号的临时表';
comment on column mc.MMS_SCHED_MOBILE_TEMP.schedule_id
  is '彩信发送记录编号';
comment on column mc.MMS_SCHED_MOBILE_TEMP.mobile
  is '手机号码';
comment on column mc.MMS_SCHED_MOBILE_TEMP.import_type
  is '导入方式';
comment on column mc.MMS_SCHED_MOBILE_TEMP.batch_id
  is '导入批号, 用于统计导入数量';
alter table mc.MMS_SCHED_MOBILE_TEMP
  add constraint PK_MMS_SCHED_MOBILE_TEMP primary key (SCHEDULE_ID, MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_SEND
prompt =======================
prompt
create table mc.MMS_SEND
(
  mms_send_id          NUMBER(32) not null,
  subject              VARCHAR2(100),
  mobile_to            VARCHAR2(20),
  ext_num              VARCHAR2(20),
  prior_id             NUMBER(1) default 8,
  send_status          NUMBER(1),
  sys_time             DATE default sysdate,
  sys_date_id          NUMBER(18),
  pre_send_time        DATE,
  event_latest_time    DATE,
  morning_earlest_time DATE,
  morning_latest_time  DATE,
  send_time            DATE default sysdate,
  send_date_id         NUMBER(18),
  com_rtn_time         DATE,
  err_msg              VARCHAR2(100),
  fail_resend_times    NUMBER(1) default 0,
  err_id               VARCHAR2(20),
  report_time          DATE,
  gw_send_time         DATE,
  gw_report_time       DATE,
  channel_id           NUMBER(4),
  mobile_quantities    NUMBER(4),
  resend_times         NUMBER(1) default 0,
  org_name             VARCHAR2(40),
  org_id               VARCHAR2(50),
  user_id              VARCHAR2(40),
  user_name            VARCHAR2(40),
  batch_id             VARCHAR2(40),
  gw_batch             VARCHAR2(40),
  sequence             VARCHAR2(40),
  send_type            NUMBER(4),
  mobile_com           NUMBER(2),
  message_type         VARCHAR2(20),
  sys_id               VARCHAR2(10),
  msg_id               VARCHAR2(80),
  sender_id            VARCHAR2(100),
  remark               VARCHAR2(500)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_SEND
  is '下行彩信信息表';
comment on column mc.MMS_SEND.mms_send_id
  is '彩信编号';
comment on column mc.MMS_SEND.subject
  is '彩信标题';
comment on column mc.MMS_SEND.mobile_to
  is '手机号';
comment on column mc.MMS_SEND.ext_num
  is '扩展号码';
comment on column mc.MMS_SEND.prior_id
  is '优先级';
comment on column mc.MMS_SEND.send_status
  is '发送状态, -2:生成中, 0,未发送, 1:已提交, 2:发送中, 5:发送成功, 6:发送失败, 7:系统黑名单';
comment on column mc.MMS_SEND.sys_time
  is '入库时间';
comment on column mc.MMS_SEND.sys_date_id
  is '彩信入库日期';
comment on column mc.MMS_SEND.pre_send_time
  is '预计发送时间';
comment on column mc.MMS_SEND.event_latest_time
  is '晚间最晚发送时间';
comment on column mc.MMS_SEND.morning_earlest_time
  is '早晨最早发送时间';
comment on column mc.MMS_SEND.morning_latest_time
  is '早晨最晚发送时间';
comment on column mc.MMS_SEND.send_time
  is '平台发送该短信的时间';
comment on column mc.MMS_SEND.send_date_id
  is '平台发送彩信的日期';
comment on column mc.MMS_SEND.com_rtn_time
  is '发送后移动或联通网关返回结果的时间';
comment on column mc.MMS_SEND.err_msg
  is '发送失败时，运营商网关返回的错误信息，只有在发送失败时，该字段有值，其余时候未空';
comment on column mc.MMS_SEND.fail_resend_times
  is '发送失败次数';
comment on column mc.MMS_SEND.err_id
  is '错误代码，包含短息平台错误代码和彩信网关错误代码';
comment on column mc.MMS_SEND.report_time
  is '手机接收状态报告返回时间';
comment on column mc.MMS_SEND.gw_send_time
  is '网关发送彩信时间';
comment on column mc.MMS_SEND.gw_report_time
  is '网关接收状态报告时间';
comment on column mc.MMS_SEND.channel_id
  is '通道编号';
comment on column mc.MMS_SEND.mobile_quantities
  is '本条信息的手机数量';
comment on column mc.MMS_SEND.resend_times
  is '重发此数';
comment on column mc.MMS_SEND.org_name
  is '机构名称';
comment on column mc.MMS_SEND.org_id
  is '机构编号';
comment on column mc.MMS_SEND.user_id
  is '用户编号';
comment on column mc.MMS_SEND.user_name
  is '用户名称';
comment on column mc.MMS_SEND.batch_id
  is '彩信批号';
comment on column mc.MMS_SEND.gw_batch
  is '彩信网关返回的批号';
comment on column mc.MMS_SEND.sequence
  is '彩信网关返回的彩信编号';
comment on column mc.MMS_SEND.send_type
  is '发送类型';
comment on column mc.MMS_SEND.mobile_com
  is '运营商编号, 1:移动, 2:联通,3:电信,0:错误号码';
comment on column mc.MMS_SEND.message_type
  is '信息性质';
comment on column mc.MMS_SEND.sys_id
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column mc.MMS_SEND.msg_id
  is '生成彩信的业务系统的彩信编号';
comment on column mc.MMS_SEND.sender_id
  is '接口用户编号';
comment on column mc.MMS_SEND.remark
  is '备注信息，保留字段，扩展时使用';
alter table mc.MMS_SEND
  add constraint PK_MMS_SEND primary key (MMS_SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_MMSSEND_SEND_TIME on mc.MMS_SEND (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_SEND_ANALYZE
prompt ===============================
prompt
create table mc.MMS_SEND_ANALYZE
(
  org_id        VARCHAR2(200),
  user_id       VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;

prompt
prompt Creating table MMS_SEND_CONTENT
prompt ===============================
prompt
create table mc.MMS_SEND_CONTENT
(
  batch_id          VARCHAR2(200) not null,
  subject           VARCHAR2(200),
  sys_time          DATE,
  send_msg          CLOB,
  user_organization VARCHAR2(200),
  user_org_name     VARCHAR2(200),
  user_id           VARCHAR2(200),
  user_name         VARCHAR2(200),
  sender_id         VARCHAR2(200),
  gw_mms_id         VARCHAR2(200),
  gw_mms_id1        VARCHAR2(200),
  gw_mms_id2        VARCHAR2(200),
  gw_mms_id3        VARCHAR2(200),
  gw_mms_id4        VARCHAR2(200),
  gw_mms_id5        VARCHAR2(200),
  gw_mms_id6        VARCHAR2(200),
  gw_mms_id7        VARCHAR2(200),
  gw_mms_id8        VARCHAR2(200),
  gw_mms_id9        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_SEND_CONTENT
  is '彩信发送内容表';
comment on column mc.MMS_SEND_CONTENT.batch_id
  is '批号';
comment on column mc.MMS_SEND_CONTENT.subject
  is '彩信标题';
comment on column mc.MMS_SEND_CONTENT.sys_time
  is '入库时间';
comment on column mc.MMS_SEND_CONTENT.send_msg
  is '彩信内容';
comment on column mc.MMS_SEND_CONTENT.user_organization
  is '机构编号';
comment on column mc.MMS_SEND_CONTENT.user_org_name
  is '机构名称';
comment on column mc.MMS_SEND_CONTENT.user_id
  is '用户编号';
comment on column mc.MMS_SEND_CONTENT.user_name
  is '用户名称';
comment on column mc.MMS_SEND_CONTENT.sender_id
  is '接口用户编号';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id
  is '网关返回的彩信编号';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id1
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id2
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id3
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id4
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id5
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id6
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id7
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id8
  is '网关返回的彩信编号(保留字段)';
comment on column mc.MMS_SEND_CONTENT.gw_mms_id9
  is '网关返回的彩信编号(保留字段)';
alter table mc.MMS_SEND_CONTENT
  add constraint PK_MMS_SEND_CONTENT primary key (BATCH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_SEND_HIS
prompt ===========================
prompt
create table mc.MMS_SEND_HIS
(
  mms_send_id          NUMBER(32) not null,
  subject              VARCHAR2(100),
  mobile_to            VARCHAR2(20),
  ext_num              VARCHAR2(20),
  prior_id             NUMBER(1) default 8,
  send_status          NUMBER(1),
  sys_time             DATE default sysdate,
  sys_date_id          NUMBER(18),
  pre_send_time        DATE,
  event_latest_time    DATE,
  morning_earlest_time DATE,
  morning_latest_time  DATE,
  send_time            DATE default sysdate,
  send_date_id         NUMBER(18),
  com_rtn_time         DATE,
  err_msg              VARCHAR2(100),
  fail_resend_times    NUMBER(1) default 0,
  err_id               VARCHAR2(20),
  report_time          DATE,
  gw_send_time         DATE,
  gw_report_time       DATE,
  channel_id           NUMBER(4),
  mobile_quantities    NUMBER(4),
  resend_times         NUMBER(1) default 0,
  org_name             VARCHAR2(40),
  org_id               VARCHAR2(50),
  user_id              VARCHAR2(40),
  user_name            VARCHAR2(40),
  batch_id             VARCHAR2(40),
  gw_batch             VARCHAR2(40),
  sequence             VARCHAR2(40),
  send_type            NUMBER(4),
  mobile_com           NUMBER(2),
  message_type         VARCHAR2(20),
  sys_id               VARCHAR2(10),
  msg_id               VARCHAR2(80),
  sender_id            VARCHAR2(100),
  remark               VARCHAR2(500)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MMS_SEND_HIS
  is '下行彩信信息表';
comment on column mc.MMS_SEND_HIS.mms_send_id
  is '彩信编号';
comment on column mc.MMS_SEND_HIS.subject
  is '彩信标题';
comment on column mc.MMS_SEND_HIS.mobile_to
  is '手机号';
comment on column mc.MMS_SEND_HIS.ext_num
  is '扩展号码';
comment on column mc.MMS_SEND_HIS.prior_id
  is '优先级';
comment on column mc.MMS_SEND_HIS.send_status
  is '发送状态, -2:生成中, 0,未发送, 1:已提交, 2:发送中, 5:发送成功, 6:发送失败, 7:系统黑名单';
comment on column mc.MMS_SEND_HIS.sys_time
  is '入库时间';
comment on column mc.MMS_SEND_HIS.sys_date_id
  is '彩信入库日期';
comment on column mc.MMS_SEND_HIS.pre_send_time
  is '预计发送时间';
comment on column mc.MMS_SEND_HIS.event_latest_time
  is '晚间最晚发送时间';
comment on column mc.MMS_SEND_HIS.morning_earlest_time
  is '早晨最早发送时间';
comment on column mc.MMS_SEND_HIS.morning_latest_time
  is '早晨最晚发送时间';
comment on column mc.MMS_SEND_HIS.send_time
  is '平台发送该短信的时间';
comment on column mc.MMS_SEND_HIS.send_date_id
  is '平台发送彩信的日期';
comment on column mc.MMS_SEND_HIS.com_rtn_time
  is '发送后移动或联通网关返回结果的时间';
comment on column mc.MMS_SEND_HIS.err_msg
  is '发送失败时，运营商网关返回的错误信息，只有在发送失败时，该字段有值，其余时候未空';
comment on column mc.MMS_SEND_HIS.fail_resend_times
  is '发送失败次数';
comment on column mc.MMS_SEND_HIS.err_id
  is '错误代码，包含短息平台错误代码和彩信网关错误代码';
comment on column mc.MMS_SEND_HIS.report_time
  is '手机接收状态报告返回时间';
comment on column mc.MMS_SEND_HIS.gw_send_time
  is '网关发送彩信时间';
comment on column mc.MMS_SEND_HIS.gw_report_time
  is '网关接收状态报告时间';
comment on column mc.MMS_SEND_HIS.channel_id
  is '通道编号';
comment on column mc.MMS_SEND_HIS.mobile_quantities
  is '本条信息的手机数量';
comment on column mc.MMS_SEND_HIS.resend_times
  is '重发此数';
comment on column mc.MMS_SEND_HIS.org_name
  is '机构名称';
comment on column mc.MMS_SEND_HIS.org_id
  is '机构编号';
comment on column mc.MMS_SEND_HIS.user_id
  is '用户编号';
comment on column mc.MMS_SEND_HIS.user_name
  is '用户名称';
comment on column mc.MMS_SEND_HIS.batch_id
  is '彩信批号';
comment on column mc.MMS_SEND_HIS.gw_batch
  is '彩信网关返回的批号';
comment on column mc.MMS_SEND_HIS.sequence
  is '彩信网关返回的彩信编号';
comment on column mc.MMS_SEND_HIS.send_type
  is '发送类型';
comment on column mc.MMS_SEND_HIS.mobile_com
  is '运营商编号, 1:移动, 2:联通,3:电信,0:错误号码';
comment on column mc.MMS_SEND_HIS.message_type
  is '信息性质';
comment on column mc.MMS_SEND_HIS.sys_id
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column mc.MMS_SEND_HIS.msg_id
  is '生成彩信的业务系统的彩信编号';
comment on column mc.MMS_SEND_HIS.sender_id
  is '接口用户编号';
comment on column mc.MMS_SEND_HIS.remark
  is '备注信息，保留字段，扩展时使用';
alter table mc.MMS_SEND_HIS
  add constraint PK_MMS_SEND_HIS primary key (MMS_SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_MMSSENDHIS_SEND_TIME on mc.MMS_SEND_HIS (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_SEND_SCHEDULE
prompt ================================
prompt
create table mc.MMS_SEND_SCHEDULE
(
  mms_send_schedule_id VARCHAR2(200) not null,
  mms_template_id      VARCHAR2(200),
  subject              VARCHAR2(200),
  mobile_to            CLOB,
  groups               CLOB,
  groups_name          CLOB,
  data_file            BLOB,
  data_file_type       VARCHAR2(20),
  send_msg             CLOB,
  prior_id             NUMBER(1),
  send_status          NUMBER(1),
  sys_time             DATE,
  pre_send_time        DATE,
  channel_id           NUMBER(4),
  mobile_quantities    NUMBER(7),
  temp_temp            BLOB,
  temp_msg             BLOB,
  param_map            BLOB,
  mobile_list_id       VARCHAR2(200),
  user_organization    VARCHAR2(200),
  user_org_name        VARCHAR2(200),
  user_id              VARCHAR2(200),
  user_name            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_SEND_SCHEDULE
  is '彩信发送记录表';
comment on column mc.MMS_SEND_SCHEDULE.mms_send_schedule_id
  is '编号';
comment on column mc.MMS_SEND_SCHEDULE.mms_template_id
  is '模板编号';
comment on column mc.MMS_SEND_SCHEDULE.subject
  is '彩信标题';
comment on column mc.MMS_SEND_SCHEDULE.mobile_to
  is '手机号,以逗号分隔';
comment on column mc.MMS_SEND_SCHEDULE.groups
  is '客户群组, 以英文分号分割';
comment on column mc.MMS_SEND_SCHEDULE.groups_name
  is '客户组名字, 以英文分号分割';
comment on column mc.MMS_SEND_SCHEDULE.data_file
  is '手机号码文件';
comment on column mc.MMS_SEND_SCHEDULE.data_file_type
  is '号码文件类型';
comment on column mc.MMS_SEND_SCHEDULE.send_msg
  is '彩信内容';
comment on column mc.MMS_SEND_SCHEDULE.prior_id
  is '优先级';
comment on column mc.MMS_SEND_SCHEDULE.send_status
  is '发送状态, -2:生成中, 0:待发送, 1:已发送, 2:发送中, 5:发送成功, 6:发送失败, 7:黑名单';
comment on column mc.MMS_SEND_SCHEDULE.sys_time
  is '入库时间';
comment on column mc.MMS_SEND_SCHEDULE.pre_send_time
  is '预定发送时间';
comment on column mc.MMS_SEND_SCHEDULE.channel_id
  is '通道编号';
comment on column mc.MMS_SEND_SCHEDULE.mobile_quantities
  is '本条信息的手机数量';
comment on column mc.MMS_SEND_SCHEDULE.temp_temp
  is '缓存模板内容';
comment on column mc.MMS_SEND_SCHEDULE.temp_msg
  is '缓存彩信内容';
comment on column mc.MMS_SEND_SCHEDULE.param_map
  is '提交信息时候的参数';
comment on column mc.MMS_SEND_SCHEDULE.mobile_list_id
  is '缓存手机号码的队列';
comment on column mc.MMS_SEND_SCHEDULE.user_organization
  is '机构编号';
comment on column mc.MMS_SEND_SCHEDULE.user_org_name
  is '机构名称';
comment on column mc.MMS_SEND_SCHEDULE.user_id
  is '用户编号';
comment on column mc.MMS_SEND_SCHEDULE.user_name
  is '用户名称';
alter table mc.MMS_SEND_SCHEDULE
  add constraint PK_MMS_SEND_SCHEDULE primary key (MMS_SEND_SCHEDULE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_STOCK_PAPER
prompt ==============================
prompt
create table mc.MMS_STOCK_PAPER
(
  mms_stock_paper_id  NUMBER(18) not null,
  product_id          VARCHAR2(50),
  status              NUMBER(18),
  user_id             VARCHAR2(50),
  user_name           VARCHAR2(50),
  organization_id     VARCHAR2(50),
  organization_name   VARCHAR2(50),
  create_time         DATE,
  audit_time          DATE,
  send_time           DATE,
  title               VARCHAR2(50),
  send_msg            CLOB,
  mms_content         CLOB,
  subscribe_number    NUMBER(18),
  edit_headtail_frame VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MMS_STOCK_PAPER
  add constraint PK_MMS_STOCK_PAPER primary key (MMS_STOCK_PAPER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MMS_TEMPLATE
prompt ===========================
prompt
create table mc.MMS_TEMPLATE
(
  mms_template_id   VARCHAR2(200) not null,
  subject           VARCHAR2(200),
  frame_size        NUMBER(19),
  content_size      NUMBER(19),
  duration          NUMBER(19),
  user_organization VARCHAR2(200),
  user_org_name     VARCHAR2(200),
  user_id           VARCHAR2(200),
  user_name         VARCHAR2(200),
  is_default        VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_TEMPLATE
  is '彩信模板';
comment on column mc.MMS_TEMPLATE.mms_template_id
  is '模板编号';
comment on column mc.MMS_TEMPLATE.subject
  is '彩信标题';
comment on column mc.MMS_TEMPLATE.frame_size
  is '帧数';
comment on column mc.MMS_TEMPLATE.content_size
  is '彩信大小';
comment on column mc.MMS_TEMPLATE.duration
  is '持续时间, 单位:秒';
comment on column mc.MMS_TEMPLATE.user_organization
  is '机构编号';
comment on column mc.MMS_TEMPLATE.user_org_name
  is '机构名称';
comment on column mc.MMS_TEMPLATE.user_id
  is '用户编号';
comment on column mc.MMS_TEMPLATE.user_name
  is '用户名称';
comment on column mc.MMS_TEMPLATE.is_default
  is '是否是缺省模板';
alter table mc.MMS_TEMPLATE
  add constraint PK_MMS_TEMPLATE primary key (MMS_TEMPLATE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MMS_TMPL_FRAME
prompt =============================
prompt
create table mc.MMS_TMPL_FRAME
(
  mms_tmpl_frame_id VARCHAR2(200) not null,
  mms_template_id   VARCHAR2(200),
  sequence_id       VARCHAR2(20),
  duration          NUMBER(19),
  frame_size        NUMBER(19),
  picture_name      VARCHAR2(200),
  picture_type      VARCHAR2(8),
  picture_size      NUMBER(19),
  picture_file      BLOB,
  audio_name        VARCHAR2(200),
  audio_type        VARCHAR2(8),
  audio_size        NUMBER(19),
  audio_file        BLOB,
  message_content   VARCHAR2(4000),
  message_size      NUMBER(19),
  message_location  VARCHAR2(8)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MMS_TMPL_FRAME
  is '彩信模板中的帧';
comment on column mc.MMS_TMPL_FRAME.mms_tmpl_frame_id
  is '帧编号';
comment on column mc.MMS_TMPL_FRAME.mms_template_id
  is '模板编号';
comment on column mc.MMS_TMPL_FRAME.sequence_id
  is '顺序号';
comment on column mc.MMS_TMPL_FRAME.duration
  is '持续时间, 单位:秒';
comment on column mc.MMS_TMPL_FRAME.frame_size
  is '帧的大小';
comment on column mc.MMS_TMPL_FRAME.picture_name
  is '图片名称';
comment on column mc.MMS_TMPL_FRAME.picture_type
  is '图片类型';
comment on column mc.MMS_TMPL_FRAME.picture_size
  is '图片大小';
comment on column mc.MMS_TMPL_FRAME.picture_file
  is '图片文件';
comment on column mc.MMS_TMPL_FRAME.audio_name
  is '音乐名称';
comment on column mc.MMS_TMPL_FRAME.audio_type
  is '音乐类型';
comment on column mc.MMS_TMPL_FRAME.audio_size
  is '音乐大小';
comment on column mc.MMS_TMPL_FRAME.audio_file
  is '音乐文件';
comment on column mc.MMS_TMPL_FRAME.message_content
  is '文字内容';
comment on column mc.MMS_TMPL_FRAME.message_size
  is '文字大小';
comment on column mc.MMS_TMPL_FRAME.message_location
  is '文字位置, TOP:上方, BOTTOM:下方';
alter table mc.MMS_TMPL_FRAME
  add constraint PK_MMS_TMPL_FRAME primary key (MMS_TMPL_FRAME_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MMS_TMPL_FRAME
  add constraint FK_MMS_TMPL_FRAME foreign key (MMS_TEMPLATE_ID)
  references mc.MMS_TEMPLATE (MMS_TEMPLATE_ID);

prompt
prompt Creating table MOBILENUM_REGION
prompt ===============================
prompt
create table mc.MOBILENUM_REGION
(
  numscope   VARCHAR2(20) not null,
  province   VARCHAR2(60),
  city       VARCHAR2(50),
  card_type  VARCHAR2(200),
  region_num VARCHAR2(2000)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILENUM_REGION
  is '手机号段归属地表';
comment on column mc.MOBILENUM_REGION.numscope
  is '手机号段';
comment on column mc.MOBILENUM_REGION.province
  is '手机号段所属省';
comment on column mc.MOBILENUM_REGION.city
  is '手机号段所属城市';
comment on column mc.MOBILENUM_REGION.card_type
  is '手机卡类型';
comment on column mc.MOBILENUM_REGION.region_num
  is '邮政编码';
alter table mc.MOBILENUM_REGION
  add constraint PK_MOBILENUM_REGION primary key (NUMSCOPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_COM
prompt =========================
prompt
create table mc.MOBILE_COM
(
  numscope   VARCHAR2(50) not null,
  mobile_com NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MOBILE_COM
  is '手机号段所属运营商表的数据字典表';
comment on column mc.MOBILE_COM.numscope
  is '手机号段';
comment on column mc.MOBILE_COM.mobile_com
  is '运营商编号, 1:移动, 2:联通, 3:电信';
alter table mc.MOBILE_COM
  add constraint PK_MOBILE_COM primary key (NUMSCOPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MOBILE_EXCEL_INFO
prompt ================================
prompt
create table mc.MOBILE_EXCEL_INFO
(
  excel_id   VARCHAR2(200) not null,
  excel_name VARCHAR2(200),
  mobile     VARCHAR2(2000) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MOBILE_EXCEL_INFO
  add constraint PK_MOBILE_EXCEL_INFO primary key (EXCEL_ID, MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_INVALID
prompt =============================
prompt
create table mc.MOBILE_INVALID
(
  mobile_id     VARCHAR2(50) not null,
  mobile        VARCHAR2(50),
  mobile_type   VARCHAR2(50),
  mobile_remark VARCHAR2(50),
  create_time   DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_INVALID
  is '无效手机号码';
comment on column mc.MOBILE_INVALID.mobile_id
  is '无效手机号表的主键';
comment on column mc.MOBILE_INVALID.mobile
  is '无效手机号';
comment on column mc.MOBILE_INVALID.mobile_type
  is '类型, 1:短信, 2:彩信';
comment on column mc.MOBILE_INVALID.mobile_remark
  is '无效手机号的注释';
comment on column mc.MOBILE_INVALID.create_time
  is '添加无效手机号时的时间';
alter table mc.MOBILE_INVALID
  add constraint PK_MOBILE_INVALID primary key (MOBILE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_TEMP
prompt ==========================
prompt
create table mc.MOBILE_TEMP
(
  mobile VARCHAR2(2000) not null,
  type   VARCHAR2(2000)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_TEMP
  is '手机号码临时存放表';
comment on column mc.MOBILE_TEMP.mobile
  is '手机号';
comment on column mc.MOBILE_TEMP.type
  is '类型';
alter table mc.MOBILE_TEMP
  add constraint PK_MOBILE_TEMP primary key (MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_TO_OPERATORS
prompt ==================================
prompt
create table mc.MOBILE_TO_OPERATORS
(
  mobile     VARCHAR2(20) not null,
  mobile_com NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_TO_OPERATORS
  is '维护带号转网号码表';
comment on column mc.MOBILE_TO_OPERATORS.mobile
  is '手机号';
comment on column mc.MOBILE_TO_OPERATORS.mobile_com
  is '运营商编号, 1:移动,2:联通, 3:电信';
alter table mc.MOBILE_TO_OPERATORS
  add constraint PK_MOBILE_TO_OPERATORS primary key (MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_WHITE_LIST
prompt ================================
prompt
create table mc.MOBILE_WHITE_LIST
(
  white_list_id VARCHAR2(200) not null,
  mobile        VARCHAR2(200),
  mobile_com    NUMBER(2),
  batch_id      VARCHAR2(200),
  create_time   DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_WHITE_LIST
  is '所有的白名单';
comment on column mc.MOBILE_WHITE_LIST.white_list_id
  is '白名单编号';
comment on column mc.MOBILE_WHITE_LIST.mobile
  is '手机号码';
comment on column mc.MOBILE_WHITE_LIST.mobile_com
  is '运营商编号, 1:移动, 2:联通, 3:电信';
comment on column mc.MOBILE_WHITE_LIST.batch_id
  is '批号';
comment on column mc.MOBILE_WHITE_LIST.create_time
  is '时间';
alter table mc.MOBILE_WHITE_LIST
  add constraint PK_MOBILE_WHITE_LIST primary key (WHITE_LIST_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_WHITE_MOBILE on mc.MOBILE_WHITE_LIST (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_WHITE_LIST_CHANNEL
prompt ========================================
prompt
create table mc.MOBILE_WHITE_LIST_CHANNEL
(
  white_list_channel_id VARCHAR2(200) not null,
  mobile                VARCHAR2(200),
  channel_id            NUMBER(4),
  status                NUMBER(4),
  create_time           DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_WHITE_LIST_CHANNEL
  is '通道的白名单';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.white_list_channel_id
  is '白名单编号';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.mobile
  is '手机号码';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.channel_id
  is '运营商编号, 1:移动, 2:联通, 3:电信';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.status
  is '状态, 0:未同步到移动的通道, 1:同步成功, -1:同步失败';
comment on column mc.MOBILE_WHITE_LIST_CHANNEL.create_time
  is '创建时间';
alter table mc.MOBILE_WHITE_LIST_CHANNEL
  add constraint PK_MOBILE_WHITE_LIST_CHANNEL primary key (WHITE_LIST_CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_WHITE_MOBILE_CHANNEL on mc.MOBILE_WHITE_LIST_CHANNEL (MOBILE, CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MOBILE_WHITE_LIST_CONFIG
prompt =======================================
prompt
create table mc.MOBILE_WHITE_LIST_CONFIG
(
  config_key   VARCHAR2(200) not null,
  config_value VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MOBILE_WHITE_LIST_CONFIG
  is '白名单相关配置表';
comment on column mc.MOBILE_WHITE_LIST_CONFIG.config_key
  is '配置项';
comment on column mc.MOBILE_WHITE_LIST_CONFIG.config_value
  is '配置值';
alter table mc.MOBILE_WHITE_LIST_CONFIG
  add constraint PK_MOBILE_WHITE_LIST_CONFIG primary key (CONFIG_KEY)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MONITOR_DETAIL
prompt =============================
prompt
create table mc.MONITOR_DETAIL
(
  id             VARCHAR2(200) not null,
  not_sendcount  VARCHAR2(20),
  submitedcount  VARCHAR2(20),
  send_succount  VARCHAR2(20),
  send_failcount VARCHAR2(20),
  sys_time       VARCHAR2(50),
  mo_count       VARCHAR2(20),
  channel        VARCHAR2(20),
  speed          VARCHAR2(20),
  create_time    DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.MONITOR_DETAIL
  is '监控数据详细表,主要用于查询之前的走势图查询';
comment on column mc.MONITOR_DETAIL.id
  is '系统id';
comment on column mc.MONITOR_DETAIL.not_sendcount
  is '待发短信条数(状态包括0,2)';
comment on column mc.MONITOR_DETAIL.submitedcount
  is '已提交短信条数';
comment on column mc.MONITOR_DETAIL.send_succount
  is '成功短信条数';
comment on column mc.MONITOR_DETAIL.send_failcount
  is '失败短信条数(状态包括6,7,8)';
comment on column mc.MONITOR_DETAIL.sys_time
  is '获取信息的时间';
comment on column mc.MONITOR_DETAIL.mo_count
  is '上行短信的条数';
comment on column mc.MONITOR_DETAIL.channel
  is '通道号码';
comment on column mc.MONITOR_DETAIL.speed
  is '速度';
comment on column mc.MONITOR_DETAIL.create_time
  is '创建时间';
alter table mc.MONITOR_DETAIL
  add constraint PK_MONITOR_DETAIL primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MONTH_MAIN_INFO
prompt ==============================
prompt
create table mc.MONTH_MAIN_INFO
(
  month_main_info_id VARCHAR2(200) not null,
  user_id            VARCHAR2(200),
  user_type          NUMBER(1),
  remain_quota       NUMBER(22),
  remain_fee         FLOAT,
  month_payment      VARCHAR2(200),
  time               VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MONTH_MAIN_INFO
  add primary key (MONTH_MAIN_INFO_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MONTH_RECKONING_INFO
prompt ===================================
prompt
create table mc.MONTH_RECKONING_INFO
(
  month_reckoning_id  VARCHAR2(200) not null,
  user_id             VARCHAR2(200),
  organization_id     VARCHAR2(200),
  month_payment       NUMBER(9,2),
  month_begin_balance NUMBER(9,2),
  month_end_balance   NUMBER(9,2),
  send_quantity       NUMBER(9),
  cost_fee            NUMBER(9,2),
  record_date         DATE default sysdate,
  inner_payment       NUMBER(9,2) default 0.00,
  mobile_com          NUMBER(2),
  channel_id          NUMBER(4),
  account_time        VARCHAR2(20),
  unit_price          NUMBER(10,3)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.MONTH_RECKONING_INFO
  is '月结单表';
comment on column mc.MONTH_RECKONING_INFO.month_reckoning_id
  is 'id';
comment on column mc.MONTH_RECKONING_INFO.user_id
  is '账户id';
comment on column mc.MONTH_RECKONING_INFO.organization_id
  is '机构名称';
comment on column mc.MONTH_RECKONING_INFO.month_payment
  is '本期充值';
comment on column mc.MONTH_RECKONING_INFO.month_begin_balance
  is '起初账户余额';
comment on column mc.MONTH_RECKONING_INFO.month_end_balance
  is '期末账户余额';
comment on column mc.MONTH_RECKONING_INFO.send_quantity
  is '当月发送数量';
comment on column mc.MONTH_RECKONING_INFO.cost_fee
  is '费用合计';
comment on column mc.MONTH_RECKONING_INFO.record_date
  is '记录时间';
comment on column mc.MONTH_RECKONING_INFO.inner_payment
  is '组内账户充值';
comment on column mc.MONTH_RECKONING_INFO.mobile_com
  is '运营商ID，1为移动，2为联通,3为电信,0为全网 ';
comment on column mc.MONTH_RECKONING_INFO.channel_id
  is '通道ID';
comment on column mc.MONTH_RECKONING_INFO.account_time
  is '结算日期';
comment on column mc.MONTH_RECKONING_INFO.unit_price
  is '短信单价';
alter table mc.MONTH_RECKONING_INFO
  add constraint PK_MONTH_RECKONING_INFO primary key (MONTH_RECKONING_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ
prompt =====================
prompt
create table mc.MO_BIZ
(
  mo_biz_id      VARCHAR2(100) not null,
  mo_biz_name    VARCHAR2(100),
  is_default_biz NUMBER(1),
  mo_type        VARCHAR2(20),
  sms_command    VARCHAR2(100),
  ext_number     VARCHAR2(100),
  parent_biz_id  VARCHAR2(100),
  node_type      VARCHAR2(100),
  biz_status     NUMBER(1),
  process_type   VARCHAR2(8),
  push_type      VARCHAR2(8),
  push_config_id VARCHAR2(100),
  reply_msg      VARCHAR2(200),
  mo_count       NUMBER(12),
  match_type     NUMBER(1),
  case_sensitive NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MO_BIZ
  add constraint PK_MO_BIZ primary key (MO_BIZ_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ_CONFIG
prompt ============================
prompt
create table mc.MO_BIZ_CONFIG
(
  id           VARCHAR2(100) not null,
  config_key   VARCHAR2(100),
  config_value VARCHAR2(100),
  priority     NUMBER(2),
  remark       VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MO_BIZ_CONFIG
  add constraint PK_MO_BIZ_CONFIG primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ_DBPUSH
prompt ============================
prompt
create table mc.MO_BIZ_DBPUSH
(
  push_id       VARCHAR2(100) not null,
  push_name     VARCHAR2(100),
  status        NUMBER(1),
  db_type       VARCHAR2(100),
  driver        VARCHAR2(200),
  url           VARCHAR2(200),
  user_name     VARCHAR2(100),
  password      VARCHAR2(100),
  insert_type   NUMBER(1),
  table_name    VARCHAR2(100),
  mo_id_field   VARCHAR2(100),
  sp_field      VARCHAR2(100),
  mobile_field  VARCHAR2(100),
  msg_field     VARCHAR2(200),
  ext_field     VARCHAR2(100),
  insert_sql    VARCHAR2(100),
  max           VARCHAR2(100),
  min           VARCHAR2(100),
  init          VARCHAR2(100),
  wait_time     VARCHAR2(100),
  has_ext_field NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.MO_BIZ_DBPUSH
  add constraint PK_MO_BIZ_DBPUSH primary key (PUSH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MO_BIZ_HTTPPUSH
prompt ==============================
prompt
create table mc.MO_BIZ_HTTPPUSH
(
  push_id          VARCHAR2(100) not null,
  push_name        VARCHAR2(120),
  is_batch         NUMBER(1),
  http_uri         VARCHAR2(500),
  pre_mobile       VARCHAR2(100),
  pre_m_o_megs     VARCHAR2(100),
  pre_receive_time VARCHAR2(100),
  pre_sp_no        VARCHAR2(100),
  pre_ext          VARCHAR2(100),
  status           NUMBER(1),
  check_frequency  VARCHAR2(100),
  create_time      TIMESTAMP(6),
  modify_time      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_BIZ_HTTPPUSH
  add constraint PK_MO_BIZ_HTTPPUSH primary key (PUSH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MO_BIZ_TASK
prompt ==========================
prompt
create table mc.MO_BIZ_TASK
(
  mo_biz_task_id VARCHAR2(100) not null,
  mobile         VARCHAR2(100),
  mobile_to      VARCHAR2(100),
  msg            VARCHAR2(200),
  cmd            VARCHAR2(100),
  ext            VARCHAR2(100),
  push_status    NUMBER(1),
  resend_times   NUMBER(1),
  error_msg      VARCHAR2(200),
  sys_time       TIMESTAMP(6),
  send_time      TIMESTAMP(6),
  done_time      TIMESTAMP(6),
  process_type   VARCHAR2(8),
  push_type      VARCHAR2(8),
  push_config_id VARCHAR2(100),
  reply_msg      VARCHAR2(1000),
  mo_biz_id      VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_BIZ_TASK
  add constraint PK_MO_BIZ_TASK primary key (MO_BIZ_TASK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MO_BIZ_WSPUSH
prompt ============================
prompt
create table mc.MO_BIZ_WSPUSH
(
  push_id        VARCHAR2(100) not null,
  push_name      VARCHAR2(128),
  is_batch       NUMBER(1),
  api_f_q_name   VARCHAR2(100),
  api_class_name VARCHAR2(500),
  status         NUMBER(1),
  create_time    TIMESTAMP(6),
  modify_time    TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_BIZ_WSPUSH
  add constraint PK_MO_BIZ_WSPUSH primary key (PUSH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table MO_LAST_EXPORT_TIME
prompt ==================================
prompt
create table mc.MO_LAST_EXPORT_TIME
(
  id               VARCHAR2(60) not null,
  org_id           VARCHAR2(60) not null,
  user_id          VARCHAR2(60) not null,
  last_export_time DATE,
  status           NUMBER,
  create_time      DATE,
  description      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.MO_LAST_EXPORT_TIME
  is '机构上行短信的导出时间的记录表';
comment on column mc.MO_LAST_EXPORT_TIME.id
  is '主键id';
comment on column mc.MO_LAST_EXPORT_TIME.org_id
  is '机构id';
comment on column mc.MO_LAST_EXPORT_TIME.user_id
  is '用户id';
comment on column mc.MO_LAST_EXPORT_TIME.last_export_time
  is '上次导出时间';
comment on column mc.MO_LAST_EXPORT_TIME.status
  is '是否使用状态 0 不用  1 使用';
comment on column mc.MO_LAST_EXPORT_TIME.create_time
  is '该条创建日期';
comment on column mc.MO_LAST_EXPORT_TIME.description
  is '描述信息';
alter table mc.MO_LAST_EXPORT_TIME
  add constraint PK_MO_LAST_EXPORT_TIME primary key (ID)
  disable;

prompt
prompt Creating table MO_LOGGER
prompt ========================
prompt
create table mc.MO_LOGGER
(
  id          VARCHAR2(100) not null,
  log_type    NUMBER(1),
  sys_time    TIMESTAMP(6),
  log_source  VARCHAR2(100),
  log_message VARCHAR2(1000)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.MO_LOGGER
  add constraint PK_MO_LOGGER primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table NOTICE
prompt =====================
prompt
create table mc.NOTICE
(
  id             VARCHAR2(100) not null,
  content        VARCHAR2(4000),
  upload_date    DATE,
  operator_id    VARCHAR2(100),
  title          VARCHAR2(200),
  viable_date    DATE,
  send_user_type NUMBER(3),
  is_pastdue     NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.NOTICE
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table NOTICE_USER
prompt ==========================
prompt
create table mc.NOTICE_USER
(
  id          VARCHAR2(100) not null,
  user_id     VARCHAR2(200) not null,
  notice_id   VARCHAR2(100) not null,
  select_date DATE,
  is_read     NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.NOTICE_USER
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.NOTICE_USER
  add constraint FK596518D2871E1EFE foreign key (NOTICE_ID)
  references mc.NOTICE (ID);
alter table mc.NOTICE_USER
  add constraint FK596518D2D5594142 foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);

prompt
prompt Creating table ORDER_INFO
prompt =========================
prompt
create table mc.ORDER_INFO
(
  id            VARCHAR2(50) not null,
  orderid       VARCHAR2(30) not null,
  subject       VARCHAR2(50),
  price         NUMBER(10,3),
  total_fee     NUMBER not null,
  quantity      NUMBER,
  gift_quantity NUMBER,
  orgid         VARCHAR2(100) not null,
  creater       VARCHAR2(50),
  type          CHAR(2) not null,
  infotype      CHAR(2),
  trade_state   CHAR(2),
  createtime    DATE,
  tradetime     DATE,
  endtime       DATE,
  state         CHAR(2),
  remark        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.ORDER_INFO
  is '在线支付订单表';
comment on column mc.ORDER_INFO.id
  is 'id';
comment on column mc.ORDER_INFO.orderid
  is '订单编号 系统唯一';
comment on column mc.ORDER_INFO.subject
  is '产品名称';
comment on column mc.ORDER_INFO.price
  is '价格（金额充值无该项）';
comment on column mc.ORDER_INFO.total_fee
  is '充值金额';
comment on column mc.ORDER_INFO.quantity
  is '充值总条数（金额充值无该项）';
comment on column mc.ORDER_INFO.gift_quantity
  is '赠送数量（金额充值无该项）';
comment on column mc.ORDER_INFO.orgid
  is '充值机构id';
comment on column mc.ORDER_INFO.creater
  is '充值人';
comment on column mc.ORDER_INFO.type
  is '金额充值 / 配额充值 ： 0/1';
comment on column mc.ORDER_INFO.infotype
  is '短信 / 彩信 ： 0/1  （金额充值无该项）';
comment on column mc.ORDER_INFO.trade_state
  is '交易状态 0：待付款；1：充值中；2：充值成功；3：充值失败;4:交易关闭';
comment on column mc.ORDER_INFO.createtime
  is '创建订单时间';
comment on column mc.ORDER_INFO.tradetime
  is '交易订单时间';
comment on column mc.ORDER_INFO.endtime
  is '交易结束时间';
comment on column mc.ORDER_INFO.state
  is '订单状态   （默认0：显示；1：交易成功后页面删除订单(隐藏)）';
comment on column mc.ORDER_INFO.remark
  is '备注';
alter table mc.ORDER_INFO
  add constraint ORDER_INFO_PK primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORGANIZATION
prompt ===========================
prompt
create table mc.ORGANIZATION
(
  user_id             VARCHAR2(200) not null,
  user_name           VARCHAR2(200),
  user_mome           VARCHAR2(200),
  user_balance        NUMBER(20,3) default 0,
  create_time         DATE,
  user_stat           NUMBER(1),
  extend_number       VARCHAR2(8),
  eng_signature       VARCHAR2(20),
  chn_signature       VARCHAR2(60),
  user_quota          NUMBER(22) default 0,
  pay_type            NUMBER(1),
  pay_mode            NUMBER(1),
  fee_mode            NUMBER(1),
  channel_type        NUMBER(1),
  mobile_type         NUMBER(1),
  super_org_no        VARCHAR2(200),
  parentid            VARCHAR2(200),
  organ_type          VARCHAR2(20),
  mo_type             NUMBER(1) default 0,
  recharge_explain    VARCHAR2(200),
  mms_quota           NUMBER(22) default 0,
  customer_manager_id VARCHAR2(200),
  deduct_mode         NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.ORGANIZATION
  is '机构信息表';
comment on column mc.ORGANIZATION.user_id
  is '机构编号';
comment on column mc.ORGANIZATION.user_name
  is '机构名称';
comment on column mc.ORGANIZATION.user_mome
  is '注释';
comment on column mc.ORGANIZATION.user_balance
  is '可用费用';
comment on column mc.ORGANIZATION.create_time
  is '创建时间';
comment on column mc.ORGANIZATION.user_stat
  is '状态, 0:有效, 1:无效';
comment on column mc.ORGANIZATION.extend_number
  is '扩展号';
comment on column mc.ORGANIZATION.eng_signature
  is '英文签名';
comment on column mc.ORGANIZATION.chn_signature
  is '中文签名';
comment on column mc.ORGANIZATION.user_quota
  is '短信配额';
comment on column mc.ORGANIZATION.pay_type
  is '充值类型, 0:预付费, 1:后付费';
comment on column mc.ORGANIZATION.pay_mode
  is '计费单位, 0:配额付费, 1:金额付费';
comment on column mc.ORGANIZATION.fee_mode
  is '扣费方式, 0:自付费, 1:组付费';
comment on column mc.ORGANIZATION.channel_type
  is '是否区分通道, 0:不区分, 1:区分';
comment on column mc.ORGANIZATION.mobile_type
  is '是否区分号段, 0:不区分, 1:区分';
comment on column mc.ORGANIZATION.super_org_no
  is '机构分类，用于联系人树状显示，6000：营业部；7000：代表处；8000：本部；9000：子公司';
comment on column mc.ORGANIZATION.organ_type
  is '0:渠道 1:直客';
comment on column mc.ORGANIZATION.mo_type
  is '0:不接收上行 1:上行到机构 2:上行到用户';
comment on column mc.ORGANIZATION.recharge_explain
  is '充值说明';
comment on column mc.ORGANIZATION.mms_quota
  is '彩信配额';
comment on column mc.ORGANIZATION.deduct_mode
  is '扣费方式 0:提交扣费 1:成功扣费';
alter table mc.ORGANIZATION
  add constraint PK_ORGANIZATION primary key (USER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORG_CONFIG
prompt =========================
prompt
create table mc.ORG_CONFIG
(
  id              VARCHAR2(20) not null,
  organization_id VARCHAR2(50) not null,
  logo            VARCHAR2(200),
  domain_name     VARCHAR2(200),
  copyright       VARCHAR2(200),
  company_tel     VARCHAR2(50),
  company_cn      VARCHAR2(100),
  company_en      VARCHAR2(100),
  company_email   VARCHAR2(200),
  service_qq      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.ORG_CONFIG
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ORG_MMS_SEND_CONFIG
prompt ==================================
prompt
create table mc.ORG_MMS_SEND_CONFIG
(
  config_id     VARCHAR2(200) not null,
  org_id        VARCHAR2(500),
  org_name      VARCHAR2(500),
  priority_code NUMBER(10),
  create_time   TIMESTAMP(6),
  start_time    TIMESTAMP(6),
  end_time      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.ORG_MMS_SEND_CONFIG
  is '机构彩信发送调配表';
alter table mc.ORG_MMS_SEND_CONFIG
  add constraint PK_ORG_MMS_SEND_CONFIG primary key (CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ORG_REMAIN_BALANCE
prompt =================================
prompt
create table mc.ORG_REMAIN_BALANCE
(
  row_id                 VARCHAR2(200) not null,
  user_id                VARCHAR2(200) not null,
  status                 NUMBER(1),
  sms_quota              NUMBER(22),
  unit_price             NUMBER(5,3),
  gw_type                NUMBER(1),
  update_unitprice_date  DATE,
  update_user            VARCHAR2(200),
  remark                 VARCHAR2(200),
  last_update_quota_date DATE,
  user_type              NUMBER(1),
  mms_quota              NUMBER(22)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.ORG_REMAIN_BALANCE
  is '金额机构余额表';
comment on column mc.ORG_REMAIN_BALANCE.row_id
  is '主键';
comment on column mc.ORG_REMAIN_BALANCE.user_id
  is '机构ID';
comment on column mc.ORG_REMAIN_BALANCE.status
  is '状态, 1:有效, 0:无效';
comment on column mc.ORG_REMAIN_BALANCE.sms_quota
  is '可用短信条数';
comment on column mc.ORG_REMAIN_BALANCE.unit_price
  is '单价';
comment on column mc.ORG_REMAIN_BALANCE.gw_type
  is '号段类型。0-全网路，1-移动号段，2-联通号段，3-小灵通号段';
comment on column mc.ORG_REMAIN_BALANCE.update_unitprice_date
  is '修改协议价时间';
comment on column mc.ORG_REMAIN_BALANCE.update_user
  is '修改人';
comment on column mc.ORG_REMAIN_BALANCE.remark
  is '备注';
comment on column mc.ORG_REMAIN_BALANCE.last_update_quota_date
  is '最近一次修改余额时间';
comment on column mc.ORG_REMAIN_BALANCE.user_type
  is '用户类型: 0用户  1机构';
comment on column mc.ORG_REMAIN_BALANCE.mms_quota
  is '可用彩信条数';
alter table mc.ORG_REMAIN_BALANCE
  add constraint PK_ROW_ID primary key (ROW_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PAYMENT_RECORD
prompt =============================
prompt
create table mc.PAYMENT_RECORD
(
  payment_id       VARCHAR2(200) not null,
  user_id          VARCHAR2(200) not null,
  payment_time     DATE,
  payment_money    NUMBER(20,3) default 0,
  payment_quota    NUMBER(22) default 0,
  operator_id      VARCHAR2(200),
  payment_type     NUMBER(1),
  is_online        NUMBER(1),
  user_type        NUMBER(1),
  recharge_explain VARCHAR2(200),
  quota_type       NUMBER(1) default 1,
  is_success       NUMBER(1) default 1
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.PAYMENT_RECORD.payment_id
  is '主键';
comment on column mc.PAYMENT_RECORD.user_id
  is '充值的用户或者机构';
comment on column mc.PAYMENT_RECORD.payment_time
  is '充值时间';
comment on column mc.PAYMENT_RECORD.payment_money
  is '充值的金额';
comment on column mc.PAYMENT_RECORD.payment_quota
  is '充值的配额';
comment on column mc.PAYMENT_RECORD.operator_id
  is '充值操作者';
comment on column mc.PAYMENT_RECORD.payment_type
  is '充值类型 1:金额  0:配额 2:金额冲账 3:金额补账 4:配额冲账 5:配额补账';
comment on column mc.PAYMENT_RECORD.is_online
  is '是否是在线充值 1:是 0:否';
comment on column mc.PAYMENT_RECORD.user_type
  is '被记录的用户类型 1:机构 0:用户';
comment on column mc.PAYMENT_RECORD.recharge_explain
  is '记录充值说明';
comment on column mc.PAYMENT_RECORD.quota_type
  is '配额类型 1:短信 0:彩信';
comment on column mc.PAYMENT_RECORD.is_success
  is '是否充值成功 1:成功 0:失败';
alter table mc.PAYMENT_RECORD
  add constraint PK_PAYMENTID primary key (PAYMENT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PB_LIST_OF_VALUE
prompt ===============================
prompt
create table mc.PB_LIST_OF_VALUE
(
  row_id        VARCHAR2(40) not null,
  status        VARCHAR2(40),
  stand_code    VARCHAR2(40),
  type_id       VARCHAR2(40),
  type_name     VARCHAR2(40),
  display_value VARCHAR2(40),
  value_desc    VARCHAR2(40)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column mc.PB_LIST_OF_VALUE.row_id
  is '主键';
comment on column mc.PB_LIST_OF_VALUE.status
  is '状态:0无效,1,有效';
comment on column mc.PB_LIST_OF_VALUE.stand_code
  is '字段编码';
comment on column mc.PB_LIST_OF_VALUE.type_id
  is '类型';
comment on column mc.PB_LIST_OF_VALUE.type_name
  is '类型名';
comment on column mc.PB_LIST_OF_VALUE.display_value
  is '显示名';
comment on column mc.PB_LIST_OF_VALUE.value_desc
  is '值注释';
alter table mc.PB_LIST_OF_VALUE
  add constraint PK_PB_LIST_OF_VALUE primary key (ROW_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PERMIT_WORD
prompt ==========================
prompt
create table mc.PERMIT_WORD
(
  id                 NUMBER(18) not null,
  permit_word        VARCHAR2(50) not null,
  description        VARCHAR2(200),
  createtime         DATE default SYSDATE,
  modifytime         DATE,
  create_user_id     VARCHAR2(200),
  permit_word_status CHAR(1) default '1'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PERMIT_WORD
  is '许可词表';
comment on column mc.PERMIT_WORD.id
  is '主键';
comment on column mc.PERMIT_WORD.permit_word
  is '许可词';
comment on column mc.PERMIT_WORD.description
  is '备注';
comment on column mc.PERMIT_WORD.createtime
  is '创建时间';
comment on column mc.PERMIT_WORD.modifytime
  is '修改时间';
comment on column mc.PERMIT_WORD.create_user_id
  is '创建者';
comment on column mc.PERMIT_WORD.permit_word_status
  is '状态, 0:停用, 1:启用';
alter table mc.PERMIT_WORD
  add constraint PK_PERMIT_WORD primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.UDX_PERMIT_WORD on mc.PERMIT_WORD (PERMIT_WORD)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PHRASE_GROUP
prompt ===========================
prompt
create table mc.PHRASE_GROUP
(
  group_id     VARCHAR2(50) not null,
  group_name   VARCHAR2(200),
  group_remark VARCHAR2(200),
  user_id      VARCHAR2(200),
  create_time  DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PHRASE_GROUP
  is '常用短语组';
comment on column mc.PHRASE_GROUP.group_id
  is '常用短语组编号';
comment on column mc.PHRASE_GROUP.group_name
  is '常用短语组名称';
comment on column mc.PHRASE_GROUP.group_remark
  is '备注';
comment on column mc.PHRASE_GROUP.user_id
  is '用户编号';
comment on column mc.PHRASE_GROUP.create_time
  is '创建时间';
alter table mc.PHRASE_GROUP
  add constraint PK_PHRASE_GROUP primary key (GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PHRASE_INFO
prompt ==========================
prompt
create table mc.PHRASE_INFO
(
  phrase_id      VARCHAR2(50) not null,
  phrase_name    VARCHAR2(1000),
  phrase_content VARCHAR2(1000),
  phrase_remark  VARCHAR2(1000),
  group_id       VARCHAR2(50),
  create_time    DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PHRASE_INFO
  is '常用短语';
comment on column mc.PHRASE_INFO.phrase_id
  is '短语编号';
comment on column mc.PHRASE_INFO.phrase_name
  is '短语名称';
comment on column mc.PHRASE_INFO.phrase_content
  is '短语内容';
comment on column mc.PHRASE_INFO.phrase_remark
  is '备注';
comment on column mc.PHRASE_INFO.group_id
  is '常用短语组编号';
comment on column mc.PHRASE_INFO.create_time
  is '创建时间';
alter table mc.PHRASE_INFO
  add constraint PK_PHRASE_INFO primary key (PHRASE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PLAT_LOG
prompt =======================
prompt
create table mc.PLAT_LOG
(
  plat_log_id            VARCHAR2(200) not null,
  user_id                VARCHAR2(200),
  user_name              VARCHAR2(200),
  user_organization      VARCHAR2(200),
  user_organization_name VARCHAR2(200),
  log_type               VARCHAR2(20),
  description            VARCHAR2(500),
  log_time               DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PLAT_LOG
  is '短信平台日志表';
comment on column mc.PLAT_LOG.plat_log_id
  is '日志编号';
comment on column mc.PLAT_LOG.user_id
  is '操作者编号';
comment on column mc.PLAT_LOG.user_name
  is '操作者用户名';
comment on column mc.PLAT_LOG.user_organization
  is '操作者所属机构编号';
comment on column mc.PLAT_LOG.user_organization_name
  is '操作者所属机构名称';
comment on column mc.PLAT_LOG.log_type
  is '日志类型, 1:登入\登出, 4:系统开启\关闭, 8：日常信息, 9：错误信息';
comment on column mc.PLAT_LOG.description
  is '详细信息';
comment on column mc.PLAT_LOG.log_time
  is '日志时间';
alter table mc.PLAT_LOG
  add constraint PK_PLAT_LOG primary key (PLAT_LOG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRICING_PACKAGE_INFO
prompt ===================================
prompt
create table mc.PRICING_PACKAGE_INFO
(
  id          VARCHAR2(200) not null,
  packagename VARCHAR2(100) not null,
  type        VARCHAR2(2) not null,
  rule        VARCHAR2(2) not null,
  infonum1    NUMBER(10),
  infonum2    NUMBER(10),
  price       NUMBER(10,3),
  coupon      VARCHAR2(2),
  infonum3    NUMBER(10),
  infonum4    NUMBER(10),
  createdate  DATE,
  creater     VARCHAR2(100),
  remark      VARCHAR2(200),
  state       VARCHAR2(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PRICING_PACKAGE_INFO
  is '套餐表';
comment on column mc.PRICING_PACKAGE_INFO.id
  is '主键id';
comment on column mc.PRICING_PACKAGE_INFO.packagename
  is '套餐名称';
comment on column mc.PRICING_PACKAGE_INFO.type
  is '套餐类型（0：短信/1：彩信）';
comment on column mc.PRICING_PACKAGE_INFO.rule
  is '套餐规则标志  0：多条一下；1：多少条到多少条间；2：多少条以上';
comment on column mc.PRICING_PACKAGE_INFO.infonum1
  is '套餐条数1';
comment on column mc.PRICING_PACKAGE_INFO.infonum2
  is '套餐条数2';
comment on column mc.PRICING_PACKAGE_INFO.price
  is '单价';
comment on column mc.PRICING_PACKAGE_INFO.coupon
  is '是否优惠(0:是；1:否)';
comment on column mc.PRICING_PACKAGE_INFO.infonum3
  is '优惠条数1';
comment on column mc.PRICING_PACKAGE_INFO.infonum4
  is '优惠条数2';
comment on column mc.PRICING_PACKAGE_INFO.createdate
  is '创建日期';
comment on column mc.PRICING_PACKAGE_INFO.creater
  is '创建人';
comment on column mc.PRICING_PACKAGE_INFO.remark
  is '备注';
comment on column mc.PRICING_PACKAGE_INFO.state
  is '状态 0：启用;1:停用';
alter table mc.PRICING_PACKAGE_INFO
  add constraint PRICING_PACKAGE_INFO_PK primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PRODUCT
prompt ======================
prompt
create table mc.PRODUCT
(
  productid    VARCHAR2(50) not null,
  productname  VARCHAR2(50),
  catalogid    VARCHAR2(50) default 10000,
  description  VARCHAR2(500),
  reservedint  NUMBER(1),
  reservedchar VARCHAR2(2000),
  stautus      NUMBER(1) default 0,
  createtime   DATE default sysdate,
  modifytime   DATE default sysdate,
  user_id      VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PRODUCT
  is '产品信息';
comment on column mc.PRODUCT.productid
  is '必须，服务产品唯一标识，该编号由管理员手工编写，短信编号为D001…，彩信产品为C001…该字段为主键';
comment on column mc.PRODUCT.productname
  is '必须，服务产品简要名称';
comment on column mc.PRODUCT.catalogid
  is '服务目录的ID';
comment on column mc.PRODUCT.description
  is '服务产品特性等的说明文字';
comment on column mc.PRODUCT.reservedint
  is '备用';
comment on column mc.PRODUCT.reservedchar
  is 'JSON格式串记录此能发布产品内容的机构ID格式';
comment on column mc.PRODUCT.stautus
  is '0:可用，1:冻结；暂保留功能';
comment on column mc.PRODUCT.createtime
  is '产品创建时间';
comment on column mc.PRODUCT.modifytime
  is '产品修改时间';
comment on column mc.PRODUCT.user_id
  is '用户编号';
alter table mc.PRODUCT
  add constraint PK_PRODUCT primary key (PRODUCTID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PRODUCT_ORGANIZATION_ITEMS
prompt =========================================
prompt
create table mc.PRODUCT_ORGANIZATION_ITEMS
(
  id             VARCHAR2(50) not null,
  productid      VARCHAR2(50),
  organizationid VARCHAR2(200),
  status         NUMBER(1) default 0,
  itemsjson      VARCHAR2(2000),
  createtime     DATE default sysdate,
  modifytime     DATE default sysdate,
  reservedint    NUMBER(1),
  reservedchar   VARCHAR2(200),
  isextends      NUMBER(1) default 0,
  groupid        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PRODUCT_ORGANIZATION_ITEMS
  is '为机构配置产品的配置项';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.id
  is 'ID';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.productid
  is '产品编号';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.organizationid
  is '机构编号';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.status
  is '记录状态';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.itemsjson
  is '当前机构针对当前产品的配置项信息';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.createtime
  is '创建时间';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.modifytime
  is '修改时间';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.reservedint
  is 'INT备用字段,记录了当前配置的优先级1-8数字越大优先级越高';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.reservedchar
  is 'CHAR备用字段';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.isextends
  is '对应组是否可以继承所在机构对应产品配置项信息；0:不继随；1：继承';
comment on column mc.PRODUCT_ORGANIZATION_ITEMS.groupid
  is '组ID';
alter table mc.PRODUCT_ORGANIZATION_ITEMS
  add constraint PK_PRODUCT_ORGANIZATION_ITEMS primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PROHIBITEDWORD
prompt =============================
prompt
create table mc.PROHIBITEDWORD
(
  id             VARCHAR2(50) not null,
  prohibitedword VARCHAR2(200),
  description    VARCHAR2(200),
  createtime     DATE,
  modifytime     DATE,
  create_user    VARCHAR2(200),
  class_id       VARCHAR2(200),
  status         NUMBER(4)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.PROHIBITEDWORD
  is '违禁词表';
comment on column mc.PROHIBITEDWORD.id
  is '主键';
comment on column mc.PROHIBITEDWORD.prohibitedword
  is '违禁词';
comment on column mc.PROHIBITEDWORD.description
  is '备注';
comment on column mc.PROHIBITEDWORD.createtime
  is '创建时间';
comment on column mc.PROHIBITEDWORD.modifytime
  is '修改时间';
comment on column mc.PROHIBITEDWORD.create_user
  is '创建者';
comment on column mc.PROHIBITEDWORD.class_id
  is '违禁词分类Id';
comment on column mc.PROHIBITEDWORD.status
  is '违禁词状态, 0:停用, 1:启用';
alter table mc.PROHIBITEDWORD
  add constraint PK_PROHIBITEDWORD primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PROHIBITEDWORD_CLASS
prompt ===================================
prompt
create table mc.PROHIBITEDWORD_CLASS
(
  id          VARCHAR2(50) not null,
  name        VARCHAR2(200),
  description VARCHAR2(200),
  createtime  DATE,
  create_user VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PROHIBITEDWORD_CLASS
  is '违禁词分类表';
comment on column mc.PROHIBITEDWORD_CLASS.id
  is '主键';
comment on column mc.PROHIBITEDWORD_CLASS.name
  is '分类名字';
comment on column mc.PROHIBITEDWORD_CLASS.description
  is '备注';
comment on column mc.PROHIBITEDWORD_CLASS.createtime
  is '创建时间';
comment on column mc.PROHIBITEDWORD_CLASS.create_user
  is '创建者';
alter table mc.PROHIBITEDWORD_CLASS
  add constraint PK_PROHIBITEDWORD_CLASS primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table PROHIBITED_CHANNEL_TYPE_INFO
prompt ===========================================
prompt
create table mc.PROHIBITED_CHANNEL_TYPE_INFO
(
  channel_type_id   VARCHAR2(50) not null,
  channel_type_name VARCHAR2(50),
  description       VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.PROHIBITED_CHANNEL_TYPE_INFO
  add primary key (CHANNEL_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.PROHIBITED_CHANNEL_TYPE_INFO
  add unique (CHANNEL_TYPE_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table PROHIBITED_WORD
prompt ==============================
prompt
create table mc.PROHIBITED_WORD
(
  id                VARCHAR2(50) not null,
  prohibited_word   VARCHAR2(200),
  description       VARCHAR2(200),
  status            NUMBER(10),
  create_time       DATE,
  modify_time       DATE,
  reserved_int      NUMBER(10) default -1,
  reserved_char     VARCHAR2(4),
  channel_type_code VARCHAR2(50),
  channel_id        NUMBER(10) default -1,
  create_user       VARCHAR2(50),
  channel_type_id   VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.PROHIBITED_WORD
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.PROHIBITED_WORD
  add unique (CHANNEL_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.PROHIBITED_WORD
  add constraint FKBB08CBEB1147B70E foreign key (CHANNEL_TYPE_ID)
  references mc.PROHIBITED_CHANNEL_TYPE_INFO (CHANNEL_TYPE_ID);

prompt
prompt Creating table PROHIBIT_WORD
prompt ============================
prompt
create table mc.PROHIBIT_WORD
(
  id                     VARCHAR2(50) not null,
  prohibit_word          VARCHAR2(200) not null,
  description            VARCHAR2(200),
  createtime             DATE default SYSDATE,
  modifytime             DATE,
  create_user_id         VARCHAR2(200),
  prohibited_word_status CHAR(1) default '1'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.PROHIBIT_WORD
  is '违禁词表';
comment on column mc.PROHIBIT_WORD.id
  is '主键';
comment on column mc.PROHIBIT_WORD.prohibit_word
  is '违禁词';
comment on column mc.PROHIBIT_WORD.description
  is '备注';
comment on column mc.PROHIBIT_WORD.createtime
  is '创建时间';
comment on column mc.PROHIBIT_WORD.modifytime
  is '修改时间';
comment on column mc.PROHIBIT_WORD.create_user_id
  is '创建者ID';
comment on column mc.PROHIBIT_WORD.prohibited_word_status
  is '违禁词状态, 0:停用, 1:启用';
alter table mc.PROHIBIT_WORD
  add constraint PK_PROHIBIT_WORD primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.IDX_PROHIBITWORD on mc.PROHIBIT_WORD (PROHIBIT_WORD)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_JOB_DETAILS
prompt ===============================
prompt
create table mc.QRTZ_JOB_DETAILS
(
  job_name          VARCHAR2(80) not null,
  job_group         VARCHAR2(80) not null,
  description       VARCHAR2(120),
  job_class_name    VARCHAR2(128) not null,
  is_durable        VARCHAR2(1) not null,
  is_volatile       VARCHAR2(1) not null,
  is_stateful       VARCHAR2(1) not null,
  requests_recovery VARCHAR2(1) not null,
  job_data          BLOB
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_JOB_DETAILS
  add primary key (JOB_NAME, JOB_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_J_REQ_RECOVERY on mc.QRTZ_JOB_DETAILS (REQUESTS_RECOVERY)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_TRIGGERS
prompt ============================
prompt
create table mc.QRTZ_TRIGGERS
(
  trigger_name   VARCHAR2(80) not null,
  trigger_group  VARCHAR2(80) not null,
  job_name       VARCHAR2(80) not null,
  job_group      VARCHAR2(80) not null,
  is_volatile    VARCHAR2(1) not null,
  description    VARCHAR2(120),
  next_fire_time NUMBER(13),
  prev_fire_time NUMBER(13),
  priority       NUMBER(13),
  trigger_state  VARCHAR2(16) not null,
  trigger_type   VARCHAR2(8) not null,
  start_time     NUMBER(13) not null,
  end_time       NUMBER(13),
  calendar_name  VARCHAR2(80),
  misfire_instr  NUMBER(2),
  job_data       BLOB
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_TRIGGERS
  add foreign key (JOB_NAME, JOB_GROUP)
  references mc.QRTZ_JOB_DETAILS (JOB_NAME, JOB_GROUP);
create index mc.IDX_QRTZ_T_NEXT_FIRE_TIME on mc.QRTZ_TRIGGERS (NEXT_FIRE_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_T_NFT_ST on mc.QRTZ_TRIGGERS (NEXT_FIRE_TIME, TRIGGER_STATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_T_STATE on mc.QRTZ_TRIGGERS (TRIGGER_STATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_T_VOLATILE on mc.QRTZ_TRIGGERS (IS_VOLATILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_BLOB_TRIGGERS
prompt =================================
prompt
create table mc.QRTZ_BLOB_TRIGGERS
(
  trigger_name  VARCHAR2(80) not null,
  trigger_group VARCHAR2(80) not null,
  blob_data     BLOB
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_BLOB_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.QRTZ_BLOB_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_CALENDARS
prompt =============================
prompt
create table mc.QRTZ_CALENDARS
(
  calendar_name VARCHAR2(80) not null,
  calendar      BLOB not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_CALENDARS
  add primary key (CALENDAR_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_CRON_TRIGGERS
prompt =================================
prompt
create table mc.QRTZ_CRON_TRIGGERS
(
  trigger_name    VARCHAR2(80) not null,
  trigger_group   VARCHAR2(80) not null,
  cron_expression VARCHAR2(80) not null,
  time_zone_id    VARCHAR2(80)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_CRON_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_CRON_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_FIRED_TRIGGERS
prompt ==================================
prompt
create table mc.QRTZ_FIRED_TRIGGERS
(
  entry_id          VARCHAR2(95) not null,
  trigger_name      VARCHAR2(80) not null,
  trigger_group     VARCHAR2(80) not null,
  is_volatile       VARCHAR2(1) not null,
  instance_name     VARCHAR2(80) not null,
  fired_time        NUMBER(13) not null,
  priority          NUMBER(13) not null,
  state             VARCHAR2(16) not null,
  job_name          VARCHAR2(80),
  job_group         VARCHAR2(80),
  is_stateful       VARCHAR2(1),
  requests_recovery VARCHAR2(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_FIRED_TRIGGERS
  add primary key (ENTRY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_GROUP on mc.QRTZ_FIRED_TRIGGERS (JOB_GROUP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_NAME on mc.QRTZ_FIRED_TRIGGERS (JOB_NAME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_REQ_RECOVERY on mc.QRTZ_FIRED_TRIGGERS (REQUESTS_RECOVERY)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_JOB_STATEFUL on mc.QRTZ_FIRED_TRIGGERS (IS_STATEFUL)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_GROUP on mc.QRTZ_FIRED_TRIGGERS (TRIGGER_GROUP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_INST_NAME on mc.QRTZ_FIRED_TRIGGERS (INSTANCE_NAME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_NAME on mc.QRTZ_FIRED_TRIGGERS (TRIGGER_NAME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_NM_GP on mc.QRTZ_FIRED_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_QRTZ_FT_TRIG_VOLATILE on mc.QRTZ_FIRED_TRIGGERS (IS_VOLATILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_JOB_LISTENERS
prompt =================================
prompt
create table mc.QRTZ_JOB_LISTENERS
(
  job_name     VARCHAR2(80) not null,
  job_group    VARCHAR2(80) not null,
  job_listener VARCHAR2(80) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_JOB_LISTENERS
  add primary key (JOB_NAME, JOB_GROUP, JOB_LISTENER)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.QRTZ_JOB_LISTENERS
  add foreign key (JOB_NAME, JOB_GROUP)
  references mc.QRTZ_JOB_DETAILS (JOB_NAME, JOB_GROUP);

prompt
prompt Creating table QRTZ_LOCKS
prompt =========================
prompt
create table mc.QRTZ_LOCKS
(
  lock_name VARCHAR2(40) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_LOCKS
  add primary key (LOCK_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table QRTZ_PAUSED_TRIGGER_GRPS
prompt =======================================
prompt
create table mc.QRTZ_PAUSED_TRIGGER_GRPS
(
  trigger_group VARCHAR2(80) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_PAUSED_TRIGGER_GRPS
  add primary key (TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_SCHEDULER_STATE
prompt ===================================
prompt
create table mc.QRTZ_SCHEDULER_STATE
(
  instance_name     VARCHAR2(80) not null,
  last_checkin_time NUMBER(13) not null,
  checkin_interval  NUMBER(13) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_SCHEDULER_STATE
  add primary key (INSTANCE_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table QRTZ_SIMPLE_TRIGGERS
prompt ===================================
prompt
create table mc.QRTZ_SIMPLE_TRIGGERS
(
  trigger_name    VARCHAR2(80) not null,
  trigger_group   VARCHAR2(80) not null,
  repeat_count    NUMBER(7) not null,
  repeat_interval NUMBER(12) not null,
  times_triggered NUMBER(7) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_SIMPLE_TRIGGERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.QRTZ_SIMPLE_TRIGGERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table QRTZ_TRIGGER_LISTENERS
prompt =====================================
prompt
create table mc.QRTZ_TRIGGER_LISTENERS
(
  trigger_name     VARCHAR2(80) not null,
  trigger_group    VARCHAR2(80) not null,
  trigger_listener VARCHAR2(80) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.QRTZ_TRIGGER_LISTENERS
  add primary key (TRIGGER_NAME, TRIGGER_GROUP, TRIGGER_LISTENER)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.QRTZ_TRIGGER_LISTENERS
  add foreign key (TRIGGER_NAME, TRIGGER_GROUP)
  references mc.QRTZ_TRIGGERS (TRIGGER_NAME, TRIGGER_GROUP);

prompt
prompt Creating table RECBIZ_DB
prompt ========================
prompt
create table mc.RECBIZ_DB
(
  db_id           VARCHAR2(50) not null,
  db_name         VARCHAR2(50),
  db_content      VARCHAR2(100),
  db_channel      VARCHAR2(200),
  db_user         VARCHAR2(4000),
  db_service      VARCHAR2(4000),
  remark          VARCHAR2(4000),
  organization_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.RECBIZ_DB
  is '点播短信管理';
comment on column mc.RECBIZ_DB.db_id
  is '编号';
comment on column mc.RECBIZ_DB.db_name
  is '点播的名字';
comment on column mc.RECBIZ_DB.db_content
  is '点播的内容';
comment on column mc.RECBIZ_DB.db_channel
  is '点播的通道';
comment on column mc.RECBIZ_DB.db_user
  is '添加点播的机构';
comment on column mc.RECBIZ_DB.db_service
  is '点播的特服号';
comment on column mc.RECBIZ_DB.remark
  is '备注';
comment on column mc.RECBIZ_DB.organization_id
  is '机构id';
alter table mc.RECBIZ_DB
  add constraint PK_RECBIZ_DB primary key (DB_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RESOURCE_INFO
prompt ============================
prompt
create table mc.RESOURCE_INFO
(
  resource_id        VARCHAR2(200) not null,
  resource_name      VARCHAR2(200),
  resource_content   VARCHAR2(500),
  resource_type_id   VARCHAR2(200),
  resource_remark    VARCHAR2(500),
  resource_parentid  VARCHAR2(200),
  resource_access    VARCHAR2(100),
  resource_image     VARCHAR2(40),
  resource_sort      VARCHAR2(50),
  is_default         VARCHAR2(10),
  resource_role_type VARCHAR2(200),
  resource_path      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.RESOURCE_INFO
  is '资源表';
comment on column mc.RESOURCE_INFO.resource_id
  is '资源编号';
comment on column mc.RESOURCE_INFO.resource_name
  is '资源名称';
comment on column mc.RESOURCE_INFO.resource_content
  is '资源内容';
comment on column mc.RESOURCE_INFO.resource_type_id
  is '资源类型';
comment on column mc.RESOURCE_INFO.resource_remark
  is '资源备注';
comment on column mc.RESOURCE_INFO.resource_parentid
  is '父资源id';
comment on column mc.RESOURCE_INFO.resource_access
  is '资源访问属性,0:普通资源, 1:系统资源';
comment on column mc.RESOURCE_INFO.resource_image
  is '显示图片';
comment on column mc.RESOURCE_INFO.resource_sort
  is '显示顺序';
comment on column mc.RESOURCE_INFO.is_default
  is '是否是默认显示';
comment on column mc.RESOURCE_INFO.resource_role_type
  is '资源权限类型，SYSTEM:系统权限，ORGADMIN：机构管理员，COMMON：普通权限';
alter table mc.RESOURCE_INFO
  add constraint PK_RESOURCE_INFO primary key (RESOURCE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_ACQUIRE_TIMESTAMP
prompt ===================================
prompt
create table mc.RT_ACQUIRE_TIMESTAMP
(
  id                VARCHAR2(200) not null,
  org_id            VARCHAR2(2000),
  user_id           VARCHAR2(2000),
  qcquire_url       VARCHAR2(2000),
  qcquire_timestamp DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.RT_ACQUIRE_TIMESTAMP
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table RT_RECEIVE
prompt =========================
prompt
create table mc.RT_RECEIVE
(
  rt_receive_id  VARCHAR2(200) not null,
  org_id         VARCHAR2(200),
  user_id        VARCHAR2(200),
  sp_no          VARCHAR2(20),
  sp_serv_no     VARCHAR2(20),
  mobile         VARCHAR2(20),
  receive_msg    VARCHAR2(200),
  receive_time   DATE,
  pushed_time    DATE,
  is_pushed      NUMBER(10),
  reserved_char1 VARCHAR2(200),
  reserved_char2 VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE
  add primary key (RT_RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_RECEIVE_BACKUP
prompt ================================
prompt
create table mc.RT_RECEIVE_BACKUP
(
  rt_receive_id  VARCHAR2(200) not null,
  org_id         VARCHAR2(200),
  sp_no          VARCHAR2(20),
  sp_serv_no     VARCHAR2(20),
  mobile         VARCHAR2(20),
  receive_msg    VARCHAR2(200),
  receive_time   DATE,
  pushed_time    DATE,
  is_pushed      NUMBER(10),
  reserved_char1 VARCHAR2(200),
  reserved_char2 VARCHAR2(200),
  user_id        VARCHAR2(200),
  backup_time    DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE_BACKUP
  add primary key (RT_RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_RECEIVE_REPORT_CONFIG
prompt =======================================
prompt
create table mc.RT_RECEIVE_REPORT_CONFIG
(
  config_id             VARCHAR2(200) not null,
  type                  NUMBER(10),
  push_max_nums         NUMBER(10),
  push_frequency        NUMBER(10),
  push_timeout          NUMBER(10),
  push_margin           NUMBER(10),
  max_no_response_times NUMBER(10),
  cpu_usered            FLOAT,
  sms_send_nums         NUMBER(10),
  status                NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE_REPORT_CONFIG
  add primary key (CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_RECEIVE_REPORT_URL
prompt ====================================
prompt
create table mc.RT_RECEIVE_REPORT_URL
(
  url_id           VARCHAR2(200) not null,
  user_id          VARCHAR2(200),
  push_channel     NUMBER(10),
  format_str       NUMBER(10),
  push_url         VARCHAR2(200),
  push_url_type    NUMBER(10),
  create_time      DATE,
  status           NUMBER(10),
  is_certification NUMBER(10),
  user_name        VARCHAR2(200),
  pass_word        VARCHAR2(200),
  uanswer_times    NUMBER(10),
  next_push_time   DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_RECEIVE_REPORT_URL
  add primary key (URL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_REPORT
prompt ========================
prompt
create table mc.RT_REPORT
(
  sms_id      VARCHAR2(200) not null,
  seq_id      VARCHAR2(200),
  org_id      VARCHAR2(200),
  user_id     VARCHAR2(200),
  mobile      VARCHAR2(200),
  report_time DATE,
  pushed_time DATE,
  send_status NUMBER(10),
  error_msg   VARCHAR2(200),
  is_pushed   NUMBER(10),
  channel_id  NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_REPORT
  add primary key (SMS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RT_REPORT_BACKUP
prompt ===============================
prompt
create table mc.RT_REPORT_BACKUP
(
  sms_id      VARCHAR2(200) not null,
  seq_id      VARCHAR2(200),
  org_id      VARCHAR2(200),
  user_id     VARCHAR2(200),
  mobile      VARCHAR2(200),
  report_time DATE,
  pushed_time DATE,
  backup_time DATE,
  send_status NUMBER(10),
  error_msg   VARCHAR2(200),
  is_pushed   NUMBER(10),
  channel_id  NUMBER(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.RT_REPORT_BACKUP
  add primary key (SMS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RUPD$_ORGANIZATION
prompt =================================
prompt
create global temporary table mc.RUPD$_ORGANIZATION
(
  user_id         VARCHAR2(200),
  dmltype$$       VARCHAR2(1),
  snapid          INTEGER,
  change_vector$$ RAW(255)
)
on commit preserve rows;
comment on table mc.RUPD$_ORGANIZATION
  is 'temporary updatable snapshot log';

prompt
prompt Creating table RUPD$_SEND
prompt =========================
prompt
create global temporary table mc.RUPD$_SEND
(
  send_id         VARCHAR2(200),
  dmltype$$       VARCHAR2(1),
  snapid          INTEGER,
  change_vector$$ RAW(255)
)
on commit preserve rows;
comment on table mc.RUPD$_SEND
  is 'temporary updatable snapshot log';

prompt
prompt Creating table SEC_ACL
prompt ======================
prompt
create table mc.SEC_ACL
(
  resource_id           VARCHAR2(100) not null,
  resource_type         VARCHAR2(20) not null,
  role_id               VARCHAR2(20) not null,
  party_id              VARCHAR2(100) not null,
  party_type            VARCHAR2(20) not null,
  created_by            VARCHAR2(100),
  created_by_name       VARCHAR2(100),
  is_default            VARCHAR2(10),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEC_ACL
  is '访问控制列表，授予用户对某资源有某角色（即一组权限）';
comment on column mc.SEC_ACL.resource_id
  is '资源编号';
comment on column mc.SEC_ACL.resource_type
  is '资源类型,ColumnCategory为栏目，ColumnInfo为栏目分类';
comment on column mc.SEC_ACL.role_id
  is '角色编号';
comment on column mc.SEC_ACL.party_id
  is '被授权人';
comment on column mc.SEC_ACL.party_type
  is '被授权类型';
comment on column mc.SEC_ACL.created_by
  is '操作人';
comment on column mc.SEC_ACL.created_by_name
  is '操作人名称';
comment on column mc.SEC_ACL.is_default
  is '是否缺省用户';
alter table mc.SEC_ACL
  add constraint PK_SEC_ACL primary key (RESOURCE_ID, RESOURCE_TYPE, ROLE_ID, PARTY_ID, PARTY_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SEC_ACL_TXCRTS on mc.SEC_ACL (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SEC_ACL_TXSTMP on mc.SEC_ACL (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEC_PARTY_ROLE
prompt =============================
prompt
create table mc.SEC_PARTY_ROLE
(
  party_type VARCHAR2(100) not null,
  party_id   VARCHAR2(200) not null,
  role_id    VARCHAR2(200) not null,
  is_default VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_PARTY_ROLE
  is 'Party和角色';
comment on column mc.SEC_PARTY_ROLE.party_type
  is 'Party类型';
comment on column mc.SEC_PARTY_ROLE.party_id
  is 'Party编号';
comment on column mc.SEC_PARTY_ROLE.role_id
  is '角色编号';
comment on column mc.SEC_PARTY_ROLE.is_default
  is '是否缺省用户';
alter table mc.SEC_PARTY_ROLE
  add constraint PK_SEC_PARTY_ROLE primary key (PARTY_TYPE, PARTY_ID, ROLE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_PERMISSION
prompt =============================
prompt
create table mc.SEC_PERMISSION
(
  resource_type   VARCHAR2(100) not null,
  permission_type VARCHAR2(200) not null,
  description     VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_PERMISSION
  is '权限的数据字典';
comment on column mc.SEC_PERMISSION.resource_type
  is '资源类型：菜单、栏目、栏目分类、客户';
comment on column mc.SEC_PERMISSION.permission_type
  is '操作权限，例如VIEW、CREATE......';
comment on column mc.SEC_PERMISSION.description
  is '备注';
alter table mc.SEC_PERMISSION
  add constraint PK_SEC_PERMISSION primary key (RESOURCE_TYPE, PERMISSION_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_RESOURCE_TYPE
prompt ================================
prompt
create table mc.SEC_RESOURCE_TYPE
(
  resource_type      VARCHAR2(100) not null,
  sequence_id        NUMBER(2),
  resource_type_code VARCHAR2(100),
  resource_type_name VARCHAR2(200),
  is_for_instance    VARCHAR2(10),
  description        VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_RESOURCE_TYPE
  is '资源类型表';
comment on column mc.SEC_RESOURCE_TYPE.resource_type
  is '资源类型, 菜单、栏目、栏目分类、客户';
comment on column mc.SEC_RESOURCE_TYPE.sequence_id
  is '序号';
comment on column mc.SEC_RESOURCE_TYPE.resource_type_code
  is '资源类型编号';
comment on column mc.SEC_RESOURCE_TYPE.resource_type_name
  is '资源类型名称';
comment on column mc.SEC_RESOURCE_TYPE.is_for_instance
  is '此种资源是否需要向资源实例授权，Y则不可以直接授权给用户该类资源的角色，N则可以';
comment on column mc.SEC_RESOURCE_TYPE.description
  is '备注';
alter table mc.SEC_RESOURCE_TYPE
  add constraint PK_SEC_RESOURCE_TYPE primary key (RESOURCE_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_ROLE
prompt =======================
prompt
create table mc.SEC_ROLE
(
  role_id        VARCHAR2(100) not null,
  role_type      VARCHAR2(100),
  resource_type  VARCHAR2(100),
  role_name      VARCHAR2(200),
  description    VARCHAR2(200),
  organizationid VARCHAR2(200),
  is_public      NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_ROLE
  is '角色实体';
comment on column mc.SEC_ROLE.role_id
  is '系统编号';
comment on column mc.SEC_ROLE.role_type
  is '角色类型，对于类型是SYSTEM的角色页面不可见、不可编辑，但是后台会使用，COMMON则可以';
comment on column mc.SEC_ROLE.resource_type
  is '资源类型：菜单、栏目、栏目分类、客户';
comment on column mc.SEC_ROLE.role_name
  is '角色名称';
comment on column mc.SEC_ROLE.description
  is '备注';
alter table mc.SEC_ROLE
  add constraint PK_SEC_ROLE primary key (ROLE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_ROLE_PERMISSION
prompt ==================================
prompt
create table mc.SEC_ROLE_PERMISSION
(
  role_id        VARCHAR2(100) not null,
  resource_type  VARCHAR2(200),
  resource_id    VARCHAR2(200) not null,
  parent_role_id VARCHAR2(200) not null,
  id             VARCHAR2(400) not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_ROLE_PERMISSION
  is '角色拥有的权限';
comment on column mc.SEC_ROLE_PERMISSION.role_id
  is '角色的编号';
comment on column mc.SEC_ROLE_PERMISSION.resource_type
  is '资源类型';
comment on column mc.SEC_ROLE_PERMISSION.resource_id
  is '权限';
alter table mc.SEC_ROLE_PERMISSION
  add constraint PK_SEC_ROLE_PERMISSION primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEC_ROLE_TYPE
prompt ============================
prompt
create table mc.SEC_ROLE_TYPE
(
  role_type   VARCHAR2(100) not null,
  role_name   VARCHAR2(200),
  description VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SEC_ROLE_TYPE
  is '角色类型';
comment on column mc.SEC_ROLE_TYPE.role_type
  is '角色类型，对于类型是SYSTEM的角色页面不可见、不可编辑，但是后台会使用，COMMON则可以';
comment on column mc.SEC_ROLE_TYPE.role_name
  is '角色名称';
comment on column mc.SEC_ROLE_TYPE.description
  is '备注';
alter table mc.SEC_ROLE_TYPE
  add constraint PK_SEC_ROLE_TYPE primary key (ROLE_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEND
prompt ===================
prompt
create table mc.SEND
(
  send_id                VARCHAR2(200) not null,
  mobile_to              VARCHAR2(20) not null,
  send_msg               VARCHAR2(4000),
  sp_serv_no             VARCHAR2(20),
  sys_time               TIMESTAMP(6) default sysdate,
  prior_id               NUMBER(1) default 3,
  pre_send_time          TIMESTAMP(6) default sysdate,
  send_status            NUMBER(2) default 0,
  send_time              TIMESTAMP(6),
  com_rtn_time           TIMESTAMP(6),
  err_msg                VARCHAR2(500),
  report                 VARCHAR2(100),
  report_time            TIMESTAMP(6),
  channel_id             NUMBER(4) default 1,
  mobile_com             NUMBER(2),
  remark                 VARCHAR2(500),
  user_id                VARCHAR2(200),
  sequence               VARCHAR2(128),
  mobile_quantities      NUMBER(4) default 1,
  resend_times           NUMBER(1) default 0,
  signature              VARCHAR2(40),
  user_organization      VARCHAR2(200),
  batch_id               VARCHAR2(200),
  msg_type               VARCHAR2(50),
  consume_send_id        VARCHAR2(200),
  is_longsms             NUMBER(3) default 0,
  is_original_sms        NUMBER(3) default 0,
  originalsms_sendid     VARCHAR2(200),
  current_pageno         NUMBER(3),
  originalsms_totalpages NUMBER(3),
  longsms_tag            NUMBER(4),
  longsms_splited        NUMBER(1) default 0,
  gw_submit_time         TIMESTAMP(6),
  gw_done_time           TIMESTAMP(6),
  unit_price             NUMBER(10,3),
  return_fee             NUMBER(1) default 0,
  receive_id             VARCHAR2(200),
  operator_id            VARCHAR2(200),
  extra_keyword_num      VARCHAR2(200),
  mobile_from            VARCHAR2(2000),
  fee_mobile             VARCHAR2(2000),
  fee                    NUMBER(10,5),
  page_no                NUMBER(3),
  downsms_id             VARCHAR2(200),
  task_id                VARCHAR2(200),
  send_time2             DATE,
  com_rtn_time2          DATE,
  err_msg2               VARCHAR2(500),
  charge                 NUMBER(1),
  fail_resend_times      NUMBER(1),
  biz_type               NUMBER(3),
  cuurent_pageno         NUMBER(3),
  sort_id                NUMBER(3),
  submit_sequence_id     NUMBER(10),
  message_type           VARCHAR2(200),
  sys_id                 VARCHAR2(200),
  tmp_id                 VARCHAR2(200),
  wappush_url            VARCHAR2(200),
  return_msg_flag        VARCHAR2(200),
  md5                    VARCHAR2(100),
  sender_id              VARCHAR2(100),
  sender_orgid           VARCHAR2(100),
  return_mas_flag        VARCHAR2(300),
  send_deadline          TIMESTAMP(6),
  jx_smid                NUMBER(22),
  sms_author             VARCHAR2(200),
  account                VARCHAR2(200)
)
partition by range (SYS_TIME)
(
  partition P1 values less than (TIMESTAMP' 2013-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P923 values less than (TIMESTAMP' 2013-04-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P924 values less than (TIMESTAMP' 2013-04-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P21 values less than (TIMESTAMP' 2013-06-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P22 values less than (TIMESTAMP' 2013-06-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P23 values less than (TIMESTAMP' 2013-06-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P24 values less than (TIMESTAMP' 2013-06-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P25 values less than (TIMESTAMP' 2013-06-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P26 values less than (TIMESTAMP' 2013-06-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P27 values less than (TIMESTAMP' 2013-07-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P41 values less than (TIMESTAMP' 2013-07-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P43 values less than (TIMESTAMP' 2013-07-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P44 values less than (TIMESTAMP' 2013-07-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P45 values less than (TIMESTAMP' 2013-07-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P46 values less than (TIMESTAMP' 2013-07-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P47 values less than (TIMESTAMP' 2013-07-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P48 values less than (TIMESTAMP' 2013-07-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P49 values less than (TIMESTAMP' 2013-07-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P50 values less than (TIMESTAMP' 2013-07-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P61 values less than (TIMESTAMP' 2013-07-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P62 values less than (TIMESTAMP' 2013-07-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P63 values less than (TIMESTAMP' 2013-07-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P81 values less than (TIMESTAMP' 2013-07-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P82 values less than (TIMESTAMP' 2013-07-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P83 values less than (TIMESTAMP' 2013-07-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P84 values less than (TIMESTAMP' 2013-07-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P85 values less than (TIMESTAMP' 2013-07-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P86 values less than (TIMESTAMP' 2013-07-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P87 values less than (TIMESTAMP' 2013-07-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P88 values less than (TIMESTAMP' 2013-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P90 values less than (TIMESTAMP' 2013-08-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P101 values less than (TIMESTAMP' 2013-08-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P102 values less than (TIMESTAMP' 2013-08-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P103 values less than (TIMESTAMP' 2013-08-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P104 values less than (TIMESTAMP' 2013-08-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P105 values less than (TIMESTAMP' 2013-08-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P106 values less than (TIMESTAMP' 2013-08-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P107 values less than (TIMESTAMP' 2013-08-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P108 values less than (TIMESTAMP' 2013-08-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P109 values less than (TIMESTAMP' 2013-08-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P110 values less than (TIMESTAMP' 2013-08-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P111 values less than (TIMESTAMP' 2013-08-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P112 values less than (TIMESTAMP' 2013-08-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P113 values less than (TIMESTAMP' 2013-08-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P114 values less than (TIMESTAMP' 2013-08-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P115 values less than (TIMESTAMP' 2013-08-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P116 values less than (TIMESTAMP' 2013-08-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P117 values less than (TIMESTAMP' 2013-08-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P118 values less than (TIMESTAMP' 2013-08-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P119 values less than (TIMESTAMP' 2013-08-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P120 values less than (TIMESTAMP' 2013-08-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P121 values less than (TIMESTAMP' 2013-08-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P122 values less than (TIMESTAMP' 2013-08-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P123 values less than (TIMESTAMP' 2013-08-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P124 values less than (TIMESTAMP' 2013-08-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P125 values less than (TIMESTAMP' 2013-08-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P126 values less than (TIMESTAMP' 2013-08-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P127 values less than (TIMESTAMP' 2013-09-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P129 values less than (TIMESTAMP' 2013-09-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P130 values less than (TIMESTAMP' 2013-09-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P141 values less than (TIMESTAMP' 2013-09-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P142 values less than (TIMESTAMP' 2013-09-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P143 values less than (TIMESTAMP' 2013-09-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P161 values less than (TIMESTAMP' 2013-09-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P162 values less than (TIMESTAMP' 2013-09-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P163 values less than (TIMESTAMP' 2013-09-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P164 values less than (TIMESTAMP' 2013-09-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P165 values less than (TIMESTAMP' 2013-09-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P166 values less than (TIMESTAMP' 2013-09-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P181 values less than (TIMESTAMP' 2013-09-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P201 values less than (TIMESTAMP' 2013-09-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P221 values less than (TIMESTAMP' 2013-09-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P222 values less than (TIMESTAMP' 2013-09-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P241 values less than (TIMESTAMP' 2013-09-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P261 values less than (TIMESTAMP' 2013-09-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P281 values less than (TIMESTAMP' 2013-09-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P301 values less than (TIMESTAMP' 2013-09-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P302 values less than (TIMESTAMP' 2013-09-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P321 values less than (TIMESTAMP' 2013-09-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P341 values less than (TIMESTAMP' 2013-09-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P361 values less than (TIMESTAMP' 2013-09-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P381 values less than (TIMESTAMP' 2013-09-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P401 values less than (TIMESTAMP' 2013-09-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P421 values less than (TIMESTAMP' 2013-09-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P441 values less than (TIMESTAMP' 2013-09-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P442 values less than (TIMESTAMP' 2013-09-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P443 values less than (TIMESTAMP' 2013-10-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P481 values less than (TIMESTAMP' 2013-10-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P501 values less than (TIMESTAMP' 2013-10-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P502 values less than (TIMESTAMP' 2013-10-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P521 values less than (TIMESTAMP' 2013-10-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P541 values less than (TIMESTAMP' 2013-10-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P561 values less than (TIMESTAMP' 2013-10-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P581 values less than (TIMESTAMP' 2013-10-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P601 values less than (TIMESTAMP' 2013-10-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P602 values less than (TIMESTAMP' 2013-10-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P621 values less than (TIMESTAMP' 2013-10-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P641 values less than (TIMESTAMP' 2013-10-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P642 values less than (TIMESTAMP' 2013-10-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P661 values less than (TIMESTAMP' 2013-10-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P681 values less than (TIMESTAMP' 2013-10-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P682 values less than (TIMESTAMP' 2013-10-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P701 values less than (TIMESTAMP' 2013-10-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P702 values less than (TIMESTAMP' 2013-10-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P721 values less than (TIMESTAMP' 2013-10-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P741 values less than (TIMESTAMP' 2013-10-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P761 values less than (TIMESTAMP' 2013-10-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P781 values less than (TIMESTAMP' 2013-10-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P782 values less than (TIMESTAMP' 2013-10-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P783 values less than (TIMESTAMP' 2013-10-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P784 values less than (TIMESTAMP' 2013-10-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P785 values less than (TIMESTAMP' 2013-10-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P786 values less than (TIMESTAMP' 2013-11-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P802 values less than (TIMESTAMP' 2013-11-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P803 values less than (TIMESTAMP' 2013-11-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P821 values less than (TIMESTAMP' 2013-11-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P841 values less than (TIMESTAMP' 2013-11-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P42 values less than (TIMESTAMP' 2013-11-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P64 values less than (TIMESTAMP' 2013-11-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P89 values less than (TIMESTAMP' 2013-11-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P91 values less than (TIMESTAMP' 2013-11-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P128 values less than (TIMESTAMP' 2013-11-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P131 values less than (TIMESTAMP' 2013-11-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P132 values less than (TIMESTAMP' 2013-11-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P133 values less than (TIMESTAMP' 2013-11-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P134 values less than (TIMESTAMP' 2013-11-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P135 values less than (TIMESTAMP' 2013-11-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P136 values less than (TIMESTAMP' 2013-11-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P144 values less than (TIMESTAMP' 2013-11-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P167 values less than (TIMESTAMP' 2013-12-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P182 values less than (TIMESTAMP' 2013-12-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P223 values less than (TIMESTAMP' 2013-12-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P242 values less than (TIMESTAMP' 2013-12-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P262 values less than (TIMESTAMP' 2013-12-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P282 values less than (TIMESTAMP' 2013-12-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P303 values less than (TIMESTAMP' 2013-12-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P322 values less than (TIMESTAMP' 2013-12-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P342 values less than (TIMESTAMP' 2013-12-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P362 values less than (TIMESTAMP' 2013-12-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P363 values less than (TIMESTAMP' 2013-12-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P364 values less than (TIMESTAMP' 2013-12-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P382 values less than (TIMESTAMP' 2013-12-28 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P402 values less than (TIMESTAMP' 2013-12-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P403 values less than (TIMESTAMP' 2014-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P422 values less than (TIMESTAMP' 2014-01-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P423 values less than (TIMESTAMP' 2014-01-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P444 values less than (TIMESTAMP' 2014-01-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P463 values less than (TIMESTAMP' 2014-01-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P482 values less than (TIMESTAMP' 2014-01-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P503 values less than (TIMESTAMP' 2014-01-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P522 values less than (TIMESTAMP' 2014-01-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P542 values less than (TIMESTAMP' 2014-01-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P562 values less than (TIMESTAMP' 2014-01-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P582 values less than (TIMESTAMP' 2014-01-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P603 values less than (TIMESTAMP' 2014-01-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P622 values less than (TIMESTAMP' 2014-02-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P623 values less than (TIMESTAMP' 2014-02-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P643 values less than (TIMESTAMP' 2014-02-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P662 values less than (TIMESTAMP' 2014-02-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P683 values less than (TIMESTAMP' 2014-02-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P722 values less than (TIMESTAMP' 2014-02-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P684 values less than (TIMESTAMP' 2014-02-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P703 values less than (TIMESTAMP' 2014-03-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P704 values less than (TIMESTAMP' 2014-03-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P724 values less than (TIMESTAMP' 2014-03-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P723 values less than (TIMESTAMP' 2014-03-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P762 values less than (TIMESTAMP' 2014-03-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P787 values less than (TIMESTAMP' 2014-03-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P804 values less than (TIMESTAMP' 2014-03-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P842 values less than (TIMESTAMP' 2014-03-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P861 values less than (TIMESTAMP' 2014-03-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P881 values less than (TIMESTAMP' 2014-03-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P902 values less than (TIMESTAMP' 2014-03-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P922 values less than (TIMESTAMP' 2014-03-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P942 values less than (TIMESTAMP' 2014-04-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P943 values less than (TIMESTAMP' 2014-04-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P962 values less than (TIMESTAMP' 2014-04-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P963 values less than (TIMESTAMP' 2014-04-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1062 values less than (TIMESTAMP' 2014-04-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1063 values less than (TIMESTAMP' 2014-04-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P51 values less than (TIMESTAMP' 2014-04-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P65 values less than (TIMESTAMP' 2014-04-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P92 values less than (TIMESTAMP' 2014-04-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P93 values less than (TIMESTAMP' 2014-04-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P94 values less than (TIMESTAMP' 2014-04-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P137 values less than (TIMESTAMP' 2014-04-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P52 values less than (TIMESTAMP' 2014-04-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P138 values less than (TIMESTAMP' 2014-05-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P139 values less than (TIMESTAMP' 2014-05-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P140 values less than (TIMESTAMP' 2014-05-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P66 values less than (TIMESTAMP' 2014-05-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P95 values less than (TIMESTAMP' 2014-05-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P145 values less than (TIMESTAMP' 2014-05-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P243 values less than (TIMESTAMP' 2014-05-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P244 values less than (TIMESTAMP' 2014-05-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P323 values less than (TIMESTAMP' 2014-05-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P343 values less than (TIMESTAMP' 2014-05-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P365 values less than (TIMESTAMP' 2014-05-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P366 values less than (TIMESTAMP' 2014-06-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P367 values less than (TIMESTAMP' 2014-06-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P368 values less than (TIMESTAMP' 2014-06-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P369 values less than (TIMESTAMP' 2014-06-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P370 values less than (TIMESTAMP' 2014-06-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P168 values less than (TIMESTAMP' 2014-07-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P183 values less than (TIMESTAMP' 2014-07-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P383 values less than (TIMESTAMP' 2014-07-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P372 values less than (TIMESTAMP' 2014-07-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P424 values less than (TIMESTAMP' 2014-07-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P483 values less than (TIMESTAMP' 2014-07-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P445 values less than (TIMESTAMP' 2014-07-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P446 values less than (TIMESTAMP' 2014-07-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P461 values less than (TIMESTAMP' 2014-07-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P484 values less than (TIMESTAMP' 2014-07-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P504 values less than (TIMESTAMP' 2014-07-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P505 values less than (TIMESTAMP' 2014-07-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P523 values less than (TIMESTAMP' 2014-07-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P524 values less than (TIMESTAMP' 2014-07-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P525 values less than (TIMESTAMP' 2014-07-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P526 values less than (TIMESTAMP' 2014-07-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P543 values less than (TIMESTAMP' 2014-07-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P544 values less than (TIMESTAMP' 2014-07-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P545 values less than (TIMESTAMP' 2014-07-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P546 values less than (TIMESTAMP' 2014-07-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P547 values less than (TIMESTAMP' 2014-07-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P563 values less than (TIMESTAMP' 2014-07-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P564 values less than (TIMESTAMP' 2014-07-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P202 values less than (TIMESTAMP' 2014-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P245 values less than (TIMESTAMP' 2014-08-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P224 values less than (TIMESTAMP' 2014-08-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P225 values less than (TIMESTAMP' 2014-08-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P604 values less than (TIMESTAMP' 2014-08-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P263 values less than (TIMESTAMP' 2014-08-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P644 values less than (TIMESTAMP' 2014-08-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P404 values less than (TIMESTAMP' 2014-08-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P283 values less than (TIMESTAMP' 2014-08-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P304 values less than (TIMESTAMP' 2014-08-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P583 values less than (TIMESTAMP' 2014-08-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P624 values less than (TIMESTAMP' 2014-08-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P663 values less than (TIMESTAMP' 2014-08-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P707 values less than (TIMESTAMP' 2014-08-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P685 values less than (TIMESTAMP' 2014-08-24 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P705 values less than (TIMESTAMP' 2014-08-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P706 values less than (TIMESTAMP' 2014-08-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P708 values less than (TIMESTAMP' 2014-09-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P709 values less than (TIMESTAMP' 2014-09-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P727 values less than (TIMESTAMP' 2014-10-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P725 values less than (TIMESTAMP' 2014-10-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P726 values less than (TIMESTAMP' 2014-10-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P763 values less than (TIMESTAMP' 2014-11-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P742 values less than (TIMESTAMP' 2014-11-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P788 values less than (TIMESTAMP' 2014-11-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P801 values less than (TIMESTAMP' 2014-12-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P96 values less than (TIMESTAMP' 2014-12-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P146 values less than (TIMESTAMP' 2014-12-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P169 values less than (TIMESTAMP' 2014-12-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P184 values less than (TIMESTAMP' 2014-12-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P203 values less than (TIMESTAMP' 2014-12-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P226 values less than (TIMESTAMP' 2014-12-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P246 values less than (TIMESTAMP' 2014-12-12 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P264 values less than (TIMESTAMP' 2014-12-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P284 values less than (TIMESTAMP' 2014-12-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P285 values less than (TIMESTAMP' 2014-12-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P305 values less than (TIMESTAMP' 2014-12-27 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P324 values less than (TIMESTAMP' 2014-12-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P325 values less than (TIMESTAMP' 2014-12-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P344 values less than (TIMESTAMP' 2015-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P345 values less than (TIMESTAMP' 2015-01-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P346 values less than (TIMESTAMP' 2015-01-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P371 values less than (TIMESTAMP' 2015-01-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P384 values less than (TIMESTAMP' 2015-01-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P405 values less than (TIMESTAMP' 2015-01-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P425 values less than (TIMESTAMP' 2015-01-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P447 values less than (TIMESTAMP' 2015-01-13 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P462 values less than (TIMESTAMP' 2015-01-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P485 values less than (TIMESTAMP' 2015-01-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P506 values less than (TIMESTAMP' 2015-01-16 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P527 values less than (TIMESTAMP' 2015-01-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P548 values less than (TIMESTAMP' 2015-01-20 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P565 values less than (TIMESTAMP' 2015-01-21 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P584 values less than (TIMESTAMP' 2015-01-22 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P605 values less than (TIMESTAMP' 2015-01-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P625 values less than (TIMESTAMP' 2015-01-29 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P645 values less than (TIMESTAMP' 2015-01-31 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P664 values less than (TIMESTAMP' 2015-02-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P686 values less than (TIMESTAMP' 2015-02-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P710 values less than (TIMESTAMP' 2015-03-14 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P764 values less than (TIMESTAMP' 2015-04-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P765 values less than (TIMESTAMP' 2015-04-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P766 values less than (TIMESTAMP' 2015-04-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P767 values less than (TIMESTAMP' 2015-04-07 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P768 values less than (TIMESTAMP' 2015-04-08 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P769 values less than (TIMESTAMP' 2015-04-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P770 values less than (TIMESTAMP' 2015-04-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P862 values less than (TIMESTAMP' 2015-04-23 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P789 values less than (TIMESTAMP' 2015-04-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P863 values less than (TIMESTAMP' 2015-06-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P864 values less than (TIMESTAMP' 2015-06-03 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P882 values less than (TIMESTAMP' 2015-06-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P901 values less than (TIMESTAMP' 2015-06-05 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P921 values less than (TIMESTAMP' 2015-06-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P941 values less than (TIMESTAMP' 2015-06-09 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P961 values less than (TIMESTAMP' 2015-06-10 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P964 values less than (TIMESTAMP' 2015-06-11 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P981 values less than (TIMESTAMP' 2015-06-19 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1001 values less than (TIMESTAMP' 2015-06-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1002 values less than (TIMESTAMP' 2015-06-26 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1021 values less than (TIMESTAMP' 2015-07-02 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1041 values less than (TIMESTAMP' 2015-07-15 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1042 values less than (TIMESTAMP' 2015-07-17 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1043 values less than (TIMESTAMP' 2015-07-18 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1061 values less than (TIMESTAMP' 2015-07-25 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1081 values less than (TIMESTAMP' 2015-07-30 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1101 values less than (TIMESTAMP' 2015-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1121 values less than (TIMESTAMP' 2015-08-04 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1141 values less than (TIMESTAMP' 2015-08-06 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table mc.SEND
  is '下行短信信息表';
comment on column mc.SEND.send_id
  is '下行短信序号，下行短信的唯一标识';
comment on column mc.SEND.mobile_to
  is '目标手机号';
comment on column mc.SEND.send_msg
  is '短信内容';
comment on column mc.SEND.sp_serv_no
  is '扩展号';
comment on column mc.SEND.sys_time
  is '入库时间';
comment on column mc.SEND.prior_id
  is '优先级，只有3个优先级，3为最高 ,8为最低，5为中等优先级';
comment on column mc.SEND.pre_send_time
  is '预计发送时间';
comment on column mc.SEND.send_status
  is '发送状态 -2未计费, 0待发, 1已提交, 2发送中, 4已删除, 5发送成功, 6发送失败, 7系统黑名单.8 违禁词保留如下状态：-1计划任务 3重发中 8二次重发失败。其它待定';
comment on column mc.SEND.send_time
  is '平台发送该短信的时间';
comment on column mc.SEND.com_rtn_time
  is '发送后移动或联通网关返回结果的时间';
comment on column mc.SEND.err_msg
  is '发送失败时，移动联通网关返回的错误信息，只有在发送失败时，该字段有值，其余时候未空';
comment on column mc.SEND.report
  is '手机接收状态报告。保留字段';
comment on column mc.SEND.report_time
  is '手机接收状态报告返回时间';
comment on column mc.SEND.channel_id
  is '通道ID';
comment on column mc.SEND.mobile_com
  is '运营商ID，1为移动，2为联通,3为电信';
comment on column mc.SEND.remark
  is '备注信息，作为外部系统扩展用，CC短信系统该字段填写基金账号';
comment on column mc.SEND.user_id
  is '由用户id更改为短信所属人';
comment on column mc.SEND.sequence
  is '网关序列';
comment on column mc.SEND.mobile_quantities
  is '本条信息的数量';
comment on column mc.SEND.resend_times
  is '平台向网关提交该短信的次数';
comment on column mc.SEND.signature
  is '签名';
comment on column mc.SEND.user_organization
  is '用户组id';
comment on column mc.SEND.batch_id
  is '批次号';
comment on column mc.SEND.msg_type
  is '信息类型,记录短信产生的方式';
comment on column mc.SEND.consume_send_id
  is '客户端短信id。';
comment on column mc.SEND.is_longsms
  is '该短信是否是长短信,0:不是长短信,1:是长短信';
comment on column mc.SEND.is_original_sms
  is '该短信是否是原始短信,非原始短信指长短信发送时拆分出的短信,0:是原始短信, 1:不是原始短信';
comment on column mc.SEND.originalsms_sendid
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column mc.SEND.current_pageno
  is '当前短信的页号,即长短信的第几条短短信';
comment on column mc.SEND.originalsms_totalpages
  is '本条短短信所属长短信共有短信的页数';
comment on column mc.SEND.longsms_tag
  is '长短信都标识符：同一条长短信的短短信该标识相同';
comment on column mc.SEND.longsms_splited
  is '长短信是否被拆分：0没有被拆分或者是普通短信；1已经被拆分。被拆分的短信查询统计时不应计算数量。默认0';
comment on column mc.SEND.gw_submit_time
  is '提交到网关的时间';
comment on column mc.SEND.gw_done_time
  is '手机收到短信的时间';
comment on column mc.SEND.unit_price
  is '短信单价';
comment on column mc.SEND.return_fee
  is '是否已给这条短信返还费用,0:没返还,1:已返还';
comment on column mc.SEND.receive_id
  is 'CMPP账号';
comment on column mc.SEND.operator_id
  is '短信发送人(短信发送的操作者)';
alter table mc.SEND
  add constraint PK_SEND primary key (SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_BATCH_ID on mc.SEND (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_CHANNEL on mc.SEND (CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_ID_STATUS on mc.SEND (SEND_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_MOBILE on mc.SEND (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_SEQUENCE on mc.SEND (SEQUENCE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_STATS_CHAN on mc.SEND (CHANNEL_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SEND_SYS_TIME on mc.SEND (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SEND_SPEED_TIME
prompt ==============================
prompt
create table mc.SEND_SPEED_TIME
(
  id            VARCHAR2(200) not null,
  not_sendcount VARCHAR2(20),
  channel       VARCHAR2(20),
  speed         VARCHAR2(20),
  time          VARCHAR2(100),
  status        NUMBER(2),
  sys_time      VARCHAR2(50),
  create_time   DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEND_SPEED_TIME
  is '保留每次计算发送完短信需要到的时间记录';
comment on column mc.SEND_SPEED_TIME.id
  is '系统id';
comment on column mc.SEND_SPEED_TIME.not_sendcount
  is '待发短信条数(状态包括0,2)';
comment on column mc.SEND_SPEED_TIME.channel
  is '通道号码';
comment on column mc.SEND_SPEED_TIME.speed
  is '速度';
comment on column mc.SEND_SPEED_TIME.time
  is '需要花费的时间,单位是秒';
comment on column mc.SEND_SPEED_TIME.status
  is '1正常,2繁忙,3异常';
comment on column mc.SEND_SPEED_TIME.sys_time
  is '获取信息的时间';
comment on column mc.SEND_SPEED_TIME.create_time
  is '创建时间';
alter table mc.SEND_SPEED_TIME
  add constraint PK_SEND_SPEED_TIME primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEND_STATICS_QUANTITY
prompt ====================================
prompt
create table mc.SEND_STATICS_QUANTITY
(
  channel_id          NUMBER(18) not null,
  total_quantity      NUMBER(18) default 0,
  wait_send_quantity  NUMBER(18) default 0,
  sending_quantity    NUMBER(18) default 0,
  sent_quantity       NUMBER(18) default 0,
  success_quantity    NUMBER(18) default 0,
  failed_quantity     NUMBER(18) default 0,
  black_quantity      NUMBER(18) default 0,
  prohibited_quantity NUMBER(18) default 0,
  receive_quantity    NUMBER(18) default 0,
  create_time         DATE not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEND_STATICS_QUANTITY
  is '各状态的总数表';
comment on column mc.SEND_STATICS_QUANTITY.channel_id
  is '0为所有通道';
comment on column mc.SEND_STATICS_QUANTITY.total_quantity
  is '总数';
comment on column mc.SEND_STATICS_QUANTITY.wait_send_quantity
  is '待发送总数,状态为0';
comment on column mc.SEND_STATICS_QUANTITY.sending_quantity
  is '待发送总数,状态为2';
comment on column mc.SEND_STATICS_QUANTITY.sent_quantity
  is '已提交总数';
comment on column mc.SEND_STATICS_QUANTITY.success_quantity
  is '成功总数';
comment on column mc.SEND_STATICS_QUANTITY.failed_quantity
  is '失败总数';
comment on column mc.SEND_STATICS_QUANTITY.black_quantity
  is '黑名单总数';
comment on column mc.SEND_STATICS_QUANTITY.prohibited_quantity
  is '违禁词总数';
comment on column mc.SEND_STATICS_QUANTITY.receive_quantity
  is '上行总数';
comment on column mc.SEND_STATICS_QUANTITY.create_time
  is '创建的时间';
alter table mc.SEND_STATICS_QUANTITY
  add constraint PK_SEND_STATICS_QUANTITY primary key (CHANNEL_ID, CREATE_TIME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEND_STATICS_QUANTITY_TEMP
prompt =========================================
prompt
create table mc.SEND_STATICS_QUANTITY_TEMP
(
  channel_id          NUMBER(18) not null,
  total_quantity      NUMBER(18) default 0,
  wait_send_quantity  NUMBER(18) default 0,
  sending_quantity    NUMBER(18) default 0,
  sent_quantity       NUMBER(18) default 0,
  success_quantity    NUMBER(18) default 0,
  failed_quantity     NUMBER(18) default 0,
  black_quantity      NUMBER(18) default 0,
  prohibited_quantity NUMBER(18) default 0,
  receive_quantity    NUMBER(18) default 0,
  create_time         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SEND_STATICS_QUANTITY_TEMP
  is '各状态的总数表';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.channel_id
  is '0为所有通道';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.total_quantity
  is '总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.wait_send_quantity
  is '待发送总数,状态为0';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.sending_quantity
  is '待发送总数,状态为2';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.sent_quantity
  is '已提交总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.success_quantity
  is '成功总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.failed_quantity
  is '失败总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.black_quantity
  is '黑名单总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.prohibited_quantity
  is '违禁词总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.receive_quantity
  is '上行总数';
comment on column mc.SEND_STATICS_QUANTITY_TEMP.create_time
  is '创建的时间';
alter table mc.SEND_STATICS_QUANTITY_TEMP
  add constraint PK_SEND_STATICS_QUANTITY_TEMP primary key (CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SEQUENCE_VALUE_ITEM
prompt ==================================
prompt
create table mc.SEQUENCE_VALUE_ITEM
(
  seq_name              VARCHAR2(60) not null,
  seq_id                NUMBER(18),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SEQUENCE_VALUE_ITEM
  add constraint PK_SEQUENCE_VALUE_ITEM primary key (SEQ_NAME)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SQNC_VL_ITM_TXCRTS on mc.SEQUENCE_VALUE_ITEM (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SQNC_VL_ITM_TXSTMP on mc.SEQUENCE_VALUE_ITEM (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_ACCOUNT_CHANNEL
prompt ==================================
prompt
create table mc.SGW_ACCOUNT_CHANNEL
(
  id                NUMBER(18) not null,
  sgw_id            NUMBER(18),
  sp_number         VARCHAR2(20) not null,
  channel_id        NUMBER(4) not null,
  sub_extend_number VARCHAR2(5),
  mobile_com        NUMBER(1) not null,
  channel_status    CHAR(1) default '1' not null,
  sys_time          DATE default SYSDATE not null
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_ACCOUNT_CHANNEL
  is 'CMPP账户通道表';
comment on column mc.SGW_ACCOUNT_CHANNEL.id
  is '主键';
comment on column mc.SGW_ACCOUNT_CHANNEL.sgw_id
  is '网关ID';
comment on column mc.SGW_ACCOUNT_CHANNEL.sp_number
  is '特服号';
comment on column mc.SGW_ACCOUNT_CHANNEL.channel_id
  is '通道ID';
comment on column mc.SGW_ACCOUNT_CHANNEL.sub_extend_number
  is '子扩展号';
comment on column mc.SGW_ACCOUNT_CHANNEL.mobile_com
  is '运营商编号, 1:移动, 2:联通, 3:电信';
comment on column mc.SGW_ACCOUNT_CHANNEL.channel_status
  is '通道状态 0:停用, 1:启用';
comment on column mc.SGW_ACCOUNT_CHANNEL.sys_time
  is '入库时间';
alter table mc.SGW_ACCOUNT_CHANNEL
  add constraint PK_SGW_ACCOUNT_CHANNEL primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_ACCOUNT_INFO
prompt ===============================
prompt
create table mc.SGW_ACCOUNT_INFO
(
  sgw_id               NUMBER(18) not null,
  user_id              VARCHAR2(200),
  account_pass         VARCHAR2(16),
  registed_ip          VARCHAR2(200),
  prior_id             CHAR(1),
  flux_limit           NUMBER(4),
  mt_worker_num        NUMBER(4),
  mt_cache_num         NUMBER(10),
  server_active_test   CHAR(1),
  is_channel_account   CHAR(1),
  signature_type       CHAR(1),
  check_prohibitedword CHAR(1),
  comments             VARCHAR2(200),
  sys_time             DATE default SYSDATE,
  trustedaccount       VARCHAR2(5) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_ACCOUNT_INFO
  is 'CMPP网关信息表';
comment on column mc.SGW_ACCOUNT_INFO.sgw_id
  is '网关ID';
comment on column mc.SGW_ACCOUNT_INFO.user_id
  is '用户UUID';
comment on column mc.SGW_ACCOUNT_INFO.account_pass
  is 'CMPP账户明文密码';
comment on column mc.SGW_ACCOUNT_INFO.registed_ip
  is '认证IP';
comment on column mc.SGW_ACCOUNT_INFO.prior_id
  is '优先级';
comment on column mc.SGW_ACCOUNT_INFO.flux_limit
  is '流控';
comment on column mc.SGW_ACCOUNT_INFO.mt_worker_num
  is '下行处理线程数量';
comment on column mc.SGW_ACCOUNT_INFO.mt_cache_num
  is '下行缓存队列长度';
comment on column mc.SGW_ACCOUNT_INFO.server_active_test
  is '服务端发送链路检测 0:不发送, 1:发送';
comment on column mc.SGW_ACCOUNT_INFO.is_channel_account
  is '是否渠道账号， 0:否, 1:是';
comment on column mc.SGW_ACCOUNT_INFO.signature_type
  is '签名类型：1：普通网关签名；2：子端口网关签名；3：自主签名（需要通过签名池过滤检查）';
comment on column mc.SGW_ACCOUNT_INFO.check_prohibitedword
  is '是否检查违禁词， 0:否, 1:是';
comment on column mc.SGW_ACCOUNT_INFO.comments
  is '备注';
comment on column mc.SGW_ACCOUNT_INFO.sys_time
  is '入库时间';
comment on column mc.SGW_ACCOUNT_INFO.trustedaccount
  is '是否是可信用户。0或null时是不可信账户，1：可信账户';
alter table mc.SGW_ACCOUNT_INFO
  add constraint PK_SGW_ACCOUNT_INFO primary key (SGW_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SGW_ACCOUNT_INFO
  add constraint FK_SGW_ACCO_REFERENCE_USER_INF foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);
create index mc.IDX_SGW_ACCOUNT_INFO_ID_UID on mc.SGW_ACCOUNT_INFO (SGW_ID, USER_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_CUSTOMER
prompt ===========================
prompt
create table mc.SGW_CUSTOMER
(
  customer_id       NUMBER(18) not null,
  customer_name     VARCHAR2(100),
  p_customer_id     NUMBER(18) not null,
  user_id           VARCHAR2(200) not null,
  org_id            VARCHAR2(200) not null,
  sub_extend_number VARCHAR2(5),
  comments          VARCHAR2(200),
  customer_status   CHAR(1),
  sys_time          DATE default SYSDATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_CUSTOMER
  is '网关客户表';
comment on column mc.SGW_CUSTOMER.customer_id
  is '客户ID';
comment on column mc.SGW_CUSTOMER.customer_name
  is '客户名称';
comment on column mc.SGW_CUSTOMER.p_customer_id
  is '父客户ID：顶级为0';
comment on column mc.SGW_CUSTOMER.user_id
  is '用户UUID';
comment on column mc.SGW_CUSTOMER.org_id
  is '机构编号';
comment on column mc.SGW_CUSTOMER.sub_extend_number
  is '子扩展号';
comment on column mc.SGW_CUSTOMER.comments
  is '备注';
comment on column mc.SGW_CUSTOMER.customer_status
  is '账号状态 0:停用, 1:启用';
comment on column mc.SGW_CUSTOMER.sys_time
  is '入库时间';
alter table mc.SGW_CUSTOMER
  add constraint PK_SGW_CHANNEL_CUSTOMER primary key (CUSTOMER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_MO_TASK
prompt ==========================
prompt
create table mc.SGW_MO_TASK
(
  receive_id         NUMBER(18) not null,
  mobile_from        VARCHAR2(30),
  receive_msg        VARCHAR2(200),
  sp_no              VARCHAR2(20),
  read_user_group_id VARCHAR2(200),
  user_id            VARCHAR2(50),
  channel_id         NUMBER(2),
  receive_time       DATE,
  receive_status     CHAR(1),
  next_push_time     DATE,
  push_times         NUMBER(18)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_MO_TASK
  is '上行短信任务非HTTP推送处理表';
comment on column mc.SGW_MO_TASK.mobile_from
  is '上行手机号码';
alter table mc.SGW_MO_TASK
  add constraint PK_SGW_MO_TASK primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_REPORT_TASK
prompt ==============================
prompt
create table mc.SGW_REPORT_TASK
(
  task_id           NUMBER(18) not null,
  send_id           VARCHAR2(200),
  mobile_to         VARCHAR2(30),
  destnation_id     VARCHAR2(30),
  msg_id            VARCHAR2(20),
  user_organization VARCHAR2(200),
  user_id           VARCHAR2(50),
  channel_id        NUMBER(2),
  sys_time          DATE,
  submit_time       DATE,
  done_time         DATE,
  report_time       DATE,
  push_status       CHAR(1),
  next_push_time    DATE,
  push_times        NUMBER(18),
  stat              VARCHAR2(20) default 'DELIVRD'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_REPORT_TASK
  is '短信网关状态报告任务表';
comment on column mc.SGW_REPORT_TASK.task_id
  is '任务编号';
comment on column mc.SGW_REPORT_TASK.send_id
  is '短信编号';
comment on column mc.SGW_REPORT_TASK.mobile_to
  is '手机号';
comment on column mc.SGW_REPORT_TASK.destnation_id
  is '特服号';
comment on column mc.SGW_REPORT_TASK.msg_id
  is '分配给客户端的短信编号';
comment on column mc.SGW_REPORT_TASK.user_organization
  is '机构编号';
comment on column mc.SGW_REPORT_TASK.user_id
  is '用户编号';
comment on column mc.SGW_REPORT_TASK.channel_id
  is '通道编号';
comment on column mc.SGW_REPORT_TASK.sys_time
  is '入库时间';
comment on column mc.SGW_REPORT_TASK.submit_time
  is '短信提交时间';
comment on column mc.SGW_REPORT_TASK.done_time
  is '短信发送时间';
comment on column mc.SGW_REPORT_TASK.report_time
  is '状态报告时间';
comment on column mc.SGW_REPORT_TASK.push_status
  is '推送状态：0：待推送；2：推送中；5：推送成功；6：推送失败';
comment on column mc.SGW_REPORT_TASK.next_push_time
  is '下次推送时间';
comment on column mc.SGW_REPORT_TASK.push_times
  is '推送次数';
comment on column mc.SGW_REPORT_TASK.stat
  is '状态码';
alter table mc.SGW_REPORT_TASK
  add constraint PK_SGW_REPORT_TASK primary key (TASK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SGW_REPORT_TASK_SENDID on mc.SGW_REPORT_TASK (SEND_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_REPORT_TASK_HIS
prompt ==================================
prompt
create table mc.SGW_REPORT_TASK_HIS
(
  task_id           NUMBER(18) not null,
  send_id           VARCHAR2(200),
  mobile_to         VARCHAR2(30),
  destnation_id     VARCHAR2(30),
  stat              VARCHAR2(20),
  msg_id            VARCHAR2(20),
  user_organization VARCHAR2(200),
  user_id           VARCHAR2(50),
  channel_id        NUMBER(2),
  sys_time          DATE,
  submit_time       DATE,
  done_time         DATE,
  report_time       DATE,
  push_status       CHAR(1),
  next_push_time    DATE,
  push_times        NUMBER(18),
  log_time          DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_REPORT_TASK_HIS
  is '网关状态报告任务处理历史表';
comment on column mc.SGW_REPORT_TASK_HIS.task_id
  is '任务编号';
comment on column mc.SGW_REPORT_TASK_HIS.send_id
  is '短信编号';
comment on column mc.SGW_REPORT_TASK_HIS.mobile_to
  is '手机号';
comment on column mc.SGW_REPORT_TASK_HIS.destnation_id
  is '特服号';
comment on column mc.SGW_REPORT_TASK_HIS.stat
  is '状态码';
comment on column mc.SGW_REPORT_TASK_HIS.msg_id
  is '分配给客户端的短信编号';
comment on column mc.SGW_REPORT_TASK_HIS.user_organization
  is '机构编号';
comment on column mc.SGW_REPORT_TASK_HIS.user_id
  is '用户编号';
comment on column mc.SGW_REPORT_TASK_HIS.channel_id
  is '通道编号';
comment on column mc.SGW_REPORT_TASK_HIS.sys_time
  is '入库时间';
comment on column mc.SGW_REPORT_TASK_HIS.submit_time
  is '短信提交时间';
comment on column mc.SGW_REPORT_TASK_HIS.done_time
  is '短信发送时间';
comment on column mc.SGW_REPORT_TASK_HIS.report_time
  is '状态报告时间';
comment on column mc.SGW_REPORT_TASK_HIS.push_status
  is '推送状态';
comment on column mc.SGW_REPORT_TASK_HIS.next_push_time
  is '下次推送时间';
comment on column mc.SGW_REPORT_TASK_HIS.push_times
  is '推送次数';
alter table mc.SGW_REPORT_TASK_HIS
  add constraint PK_SGW_REPORT_TASK_HIS primary key (TASK_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SGW_REPORT_TASK_HIS_SENDID on mc.SGW_REPORT_TASK_HIS (SEND_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SGW_SIGNATURE_POOL
prompt =================================
prompt
create table mc.SGW_SIGNATURE_POOL
(
  signature_id     NUMBER(18) not null,
  customer_id      NUMBER(18),
  signature        VARCHAR2(40) not null,
  description      VARCHAR2(200),
  sort_index       NUMBER(4),
  do_append_msg    CHAR(1),
  append_msg       VARCHAR2(100),
  black_level      CHAR(1) default '0' not null,
  comments         VARCHAR2(200),
  signature_status CHAR(1) default '1',
  sys_time         DATE default SYSDATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SGW_SIGNATURE_POOL
  is '网关客户签名池表';
comment on column mc.SGW_SIGNATURE_POOL.signature_id
  is '签名ID';
comment on column mc.SGW_SIGNATURE_POOL.customer_id
  is '客户ID';
comment on column mc.SGW_SIGNATURE_POOL.signature
  is '签名';
comment on column mc.SGW_SIGNATURE_POOL.description
  is '描述';
comment on column mc.SGW_SIGNATURE_POOL.sort_index
  is '排序编号';
comment on column mc.SGW_SIGNATURE_POOL.do_append_msg
  is '是否自动添加短信内容 0:不添加, 1:添加';
comment on column mc.SGW_SIGNATURE_POOL.append_msg
  is '自动添加的短信内容';
comment on column mc.SGW_SIGNATURE_POOL.black_level
  is '黑名单级别：0：只检测BLACK黑名单；1：检测BLACK和BLACK_CSMD黑名单；2：检测BLACK和BLACK_CSMD、BLACK_ZHUOYUE黑名单';
comment on column mc.SGW_SIGNATURE_POOL.comments
  is '备注';
comment on column mc.SGW_SIGNATURE_POOL.signature_status
  is '状态 0:停用, 1:启用';
comment on column mc.SGW_SIGNATURE_POOL.sys_time
  is '入库时间';
alter table mc.SGW_SIGNATURE_POOL
  add constraint PK_SGW_SIGNATURE_POOL primary key (SIGNATURE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.UDX_SGW_SIGNATURE on mc.SGW_SIGNATURE_POOL (SIGNATURE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_BIR_CONFIG
prompt =============================
prompt
create table mc.SMS_BIR_CONFIG
(
  sms_bir_config_id      VARCHAR2(200) not null,
  user_group_id          VARCHAR2(200) not null,
  user_group_name        VARCHAR2(200),
  do_congratulations     VARCHAR2(20),
  source_entity_name     VARCHAR2(40),
  account_name_field     VARCHAR2(200),
  account_birthday_field VARCHAR2(200),
  mobile_number_field    VARCHAR2(200),
  message_template       VARCHAR2(200),
  send_time              DATE,
  use_account_info       VARCHAR2(20),
  use_ods                VARCHAR2(20),
  group_ids              VARCHAR2(2000),
  user_id                VARCHAR2(200),
  user_name              VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.SMS_BIR_CONFIG.user_group_id
  is '所属用户组';
comment on column mc.SMS_BIR_CONFIG.user_group_name
  is ' 所属用户组名称';
comment on column mc.SMS_BIR_CONFIG.do_congratulations
  is '是否进行生日祝福';
comment on column mc.SMS_BIR_CONFIG.source_entity_name
  is '数据源名称';
comment on column mc.SMS_BIR_CONFIG.account_name_field
  is '客户姓名字段';
comment on column mc.SMS_BIR_CONFIG.account_birthday_field
  is '生日字段';
comment on column mc.SMS_BIR_CONFIG.mobile_number_field
  is '手机号码字段';
comment on column mc.SMS_BIR_CONFIG.message_template
  is '短信模板';
comment on column mc.SMS_BIR_CONFIG.send_time
  is '短信发送时间';
comment on column mc.SMS_BIR_CONFIG.group_ids
  is '群组ID';
comment on column mc.SMS_BIR_CONFIG.user_id
  is ' 所属用户';
comment on column mc.SMS_BIR_CONFIG.user_name
  is ' 所属用户名称';
alter table mc.SMS_BIR_CONFIG
  add primary key (SMS_BIR_CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_BIR_RECORD
prompt =============================
prompt
create table mc.SMS_BIR_RECORD
(
  sms_bir_record_id VARCHAR2(200) not null,
  user_group_id     VARCHAR2(200),
  user_group_name   VARCHAR2(200),
  user_id           VARCHAR2(200),
  send_time         DATE,
  status            VARCHAR2(20),
  send_quantity     VARCHAR2(40),
  template          VARCHAR2(200),
  user_name         VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column mc.SMS_BIR_RECORD.user_id
  is '发送时间';
comment on column mc.SMS_BIR_RECORD.send_time
  is '短信发送时间';
comment on column mc.SMS_BIR_RECORD.status
  is '2:已发送';
comment on column mc.SMS_BIR_RECORD.send_quantity
  is '发送数量';
comment on column mc.SMS_BIR_RECORD.template
  is '短信模板';
comment on column mc.SMS_BIR_RECORD.user_name
  is '用户名';
alter table mc.SMS_BIR_RECORD
  add primary key (SMS_BIR_RECORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_BIR_RECORD_DETAIL
prompt ====================================
prompt
create table mc.SMS_BIR_RECORD_DETAIL
(
  sms_bir_record_detail_id VARCHAR2(200) not null,
  sms_bir_record_id        VARCHAR2(200),
  user_group_id            VARCHAR2(200),
  user_group_name          VARCHAR2(200),
  user_id                  VARCHAR2(200),
  mobile_number            VARCHAR2(200),
  account_name             VARCHAR2(200),
  message_content          VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_BIR_RECORD_DETAIL
  add primary key (SMS_BIR_RECORD_DETAIL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_CHANNEL_ANALYZE
prompt ==================================
prompt
create table mc.SMS_CHANNEL_ANALYZE
(
  channel_id    NUMBER(5),
  org_id        VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_CHANNEL_RULE_SET
prompt ===================================
prompt
create table mc.SMS_CHANNEL_RULE_SET
(
  rule_set_id       VARCHAR2(20) not null,
  rule_set_name     VARCHAR2(200),
  rule_set_type     VARCHAR2(20),
  dc_file_path      VARCHAR2(200),
  rule_status       VARCHAR2(20),
  user_organization VARCHAR2(50),
  user_org_name     VARCHAR2(20),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(20),
  descriptions      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_CHANNEL_RULE_SET
  is '短信通道规则表';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_set_id
  is '规则编号';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_set_name
  is '规则名称';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_set_type
  is '规则类型, ITEMS:手工输入的规则, DECISIONTABLE:决策表';
comment on column mc.SMS_CHANNEL_RULE_SET.dc_file_path
  is '决策表保存路径';
comment on column mc.SMS_CHANNEL_RULE_SET.rule_status
  is '状态, -1:草稿状态, 0:备选, 1:生效';
comment on column mc.SMS_CHANNEL_RULE_SET.user_organization
  is '机构编号';
comment on column mc.SMS_CHANNEL_RULE_SET.user_org_name
  is '机构名称';
comment on column mc.SMS_CHANNEL_RULE_SET.user_id
  is '用户编号';
comment on column mc.SMS_CHANNEL_RULE_SET.user_name
  is '用户名称';
comment on column mc.SMS_CHANNEL_RULE_SET.descriptions
  is '备注';
alter table mc.SMS_CHANNEL_RULE_SET
  add constraint PK_SMS_CHANNEL_RULE_SET primary key (RULE_SET_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create table mc.SMS_CHANNEL_RULE_SET_ITEM
(
  rule_set_id               VARCHAR2(20),
  rule_set_item_id          VARCHAR2(200) not null,
  rule_set_item_name        VARCHAR2(200),
  salience                  NUMBER(7),
  message_class             VARCHAR2(4000),
  sys_id                    VARCHAR2(4000),
  message_type              VARCHAR2(4000),
  org_id                    VARCHAR2(4000),
  user_id                   VARCHAR2(4000),
  mobile_com                NUMBER(4),
  is_wappush                VARCHAR2(10),
  num_scope                 VARCHAR2(200),
  num_region                VARCHAR2(2000),
  mobile                    VARCHAR2(4000),
  is_long_sms               VARCHAR2(10),
  channel_id                VARCHAR2(200),
  msg_type                  VARCHAR2(4000),
  day_start_time            DATE,
  day_end_time              DATE,
  night_start_time          DATE,
  night_end_time            DATE,
  default_channel_id        NUMBER(4),
  default_mobile_channel_id NUMBER(4),
  default_union_channel_id  NUMBER(4),
  default_dx_channel_id     NUMBER(4),
  use_channel_id            NUMBER(4),
  use_long_sms              VARCHAR2(10)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_CHANNEL_RULE_SET_ITEM
  is '短信通道规则表明细表';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.rule_set_id
  is '规则编号';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.rule_set_item_id
  is '规则明细编号';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.rule_set_item_name
  is '规则名称';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.salience
  is '优先级';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.message_class
  is '信息分类, 可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.sys_id
  is '信息来源, 可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.message_type
  is '信息性质, 可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.org_id
  is '机构编号, 可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.user_id
  is '用户编号, 可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.mobile_com
  is '运营商, 可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.is_wappush
  is '是否是WAPPUSH短信, true:是, false:不是';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.num_scope
  is '号段';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.num_region
  is '手机所属区域';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.mobile
  is '手机号码，可以多选';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.is_long_sms
  is '是否是长短信，用于在选择规则时进行判断';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.channel_id
  is '所选通道';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.msg_type
  is '信息类型';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.day_start_time
  is '白天开始时间';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.day_end_time
  is '白天结束时间';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.night_start_time
  is '夜间开始时间';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.night_end_time
  is '夜间结束时间';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_channel_id
  is '缺省使用的通道';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_mobile_channel_id
  is '缺省使用的移动通道';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_union_channel_id
  is '缺省使用的联通通道';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.default_dx_channel_id
  is '缺省使用的电信通道';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.use_channel_id
  is '最终使用的通道编号';
comment on column mc.SMS_CHANNEL_RULE_SET_ITEM.use_long_sms
  is '是否使用长短信方式发送';
alter table mc.SMS_CHANNEL_RULE_SET_ITEM
  add constraint PK_SMS_CHANNEL_RULE_SET_ITEM primary key (RULE_SET_ITEM_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_ERR_CODE
prompt ===========================
prompt
create table mc.SMS_ERR_CODE
(
  channel_id  NUMBER(4) not null,
  err_code    VARCHAR2(200) not null,
  err_desc    VARCHAR2(200),
  suggestion  VARCHAR2(200),
  description VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_ERR_CODE
  is '短信通道状态报告表';
comment on column mc.SMS_ERR_CODE.channel_id
  is '通道编号';
comment on column mc.SMS_ERR_CODE.err_code
  is '错误码';
comment on column mc.SMS_ERR_CODE.err_desc
  is '说明';
comment on column mc.SMS_ERR_CODE.suggestion
  is '处理建议';
comment on column mc.SMS_ERR_CODE.description
  is '备注';
alter table mc.SMS_ERR_CODE
  add constraint PK_SMS_ERR_CODE primary key (CHANNEL_ID, ERR_CODE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_HIS
prompt ======================
prompt
create table mc.SMS_HIS
(
  sms_his_id        VARCHAR2(200) not null,
  send_status       NUMBER(2),
  user_organization VARCHAR2(200),
  channel_id        NUMBER(4),
  mobile_com        NUMBER(2),
  sys_id            VARCHAR2(200),
  message_type      VARCHAR2(200),
  message_class     VARCHAR2(20),
  batch_id          VARCHAR2(200),
  mobile_quantities NUMBER(4),
  send_time         DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_HIS
  is '短信归档表';
comment on column mc.SMS_HIS.sms_his_id
  is 'id';
comment on column mc.SMS_HIS.send_status
  is '发送状态';
comment on column mc.SMS_HIS.user_organization
  is '机构';
comment on column mc.SMS_HIS.channel_id
  is '通道';
comment on column mc.SMS_HIS.mobile_com
  is '运营商';
comment on column mc.SMS_HIS.sys_id
  is '信息来源';
comment on column mc.SMS_HIS.message_type
  is '信息性质';
comment on column mc.SMS_HIS.message_class
  is '信息分类';
comment on column mc.SMS_HIS.batch_id
  is '批次号';
comment on column mc.SMS_HIS.mobile_quantities
  is '发送总量';
comment on column mc.SMS_HIS.send_time
  is '发送时间';
alter table mc.SMS_HIS
  add constraint PK_SMS_HIS primary key (SMS_HIS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_MESSAGE_CLASS
prompt ================================
prompt
create table mc.SMS_MESSAGE_CLASS
(
  sms_message_class_id   VARCHAR2(200) not null,
  sms_message_class_name VARCHAR2(200),
  description            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_MESSAGE_CLASS
  is '信息分类数据字典';
alter table mc.SMS_MESSAGE_CLASS
  add constraint PK_SMS_MESSAGE_CLASS primary key (SMS_MESSAGE_CLASS_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_MESSAGE_TYPE
prompt ===============================
prompt
create table mc.SMS_MESSAGE_TYPE
(
  sms_message_type_id   VARCHAR2(20) not null,
  sms_message_type_name VARCHAR2(2000),
  default_priority      NUMBER(2),
  max_priority          NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_MESSAGE_TYPE
  is '信息性质数据字典';
comment on column mc.SMS_MESSAGE_TYPE.sms_message_type_id
  is '信息性质编号';
comment on column mc.SMS_MESSAGE_TYPE.sms_message_type_name
  is '信息性质名称';
comment on column mc.SMS_MESSAGE_TYPE.default_priority
  is '缺省的优先级';
comment on column mc.SMS_MESSAGE_TYPE.max_priority
  is '最高优先级';
alter table mc.SMS_MESSAGE_TYPE
  add constraint PK_SMS_MESSAGE_TYPE primary key (SMS_MESSAGE_TYPE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_MO_DISPATCH
prompt ==============================
prompt
create table mc.SMS_MO_DISPATCH
(
  sms_mo_dispatch_id VARCHAR2(200) not null,
  biz_type           VARCHAR2(200),
  biz_entity_id      VARCHAR2(200),
  dispatch_type      VARCHAR2(200),
  dispatch_content   VARCHAR2(20),
  discription        VARCHAR2(40),
  create_time        DATE,
  start_time         DATE,
  end_time           DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_MO_DISPATCH
  is '业务短信分派表';
alter table mc.SMS_MO_DISPATCH
  add constraint PK_SMS_MO_DISPATCH primary key (SMS_MO_DISPATCH_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_MO_DISPATCH_TYPE
prompt ===================================
prompt
create table mc.SMS_MO_DISPATCH_TYPE
(
  biz_type        VARCHAR2(200) not null,
  dispatch_class  VARCHAR2(200),
  dispatch_method VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_MO_DISPATCH_TYPE
  is '业务短信分派类型表';
alter table mc.SMS_MO_DISPATCH_TYPE
  add constraint PK_SMS_MO_DISPATCH_TYPE primary key (BIZ_TYPE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_RECEIVE
prompt ==========================
prompt
create table mc.SMS_RECEIVE
(
  receive_id     VARCHAR2(50) not null,
  mobile_from    VARCHAR2(30),
  receive_msg    VARCHAR2(200),
  sys_time       TIMESTAMP(6) default sysdate,
  sp_num         VARCHAR2(20),
  ext_num        VARCHAR2(20),
  channel_id     NUMBER(2) default 0,
  org_id         VARCHAR2(200),
  user_id        VARCHAR2(200),
  receive_status NUMBER(1) default 0,
  read_time      TIMESTAMP(6),
  msg_id         VARCHAR2(200),
  remark         VARCHAR2(200),
  msg_type       NUMBER(1) default 0,
  msg_key        VARCHAR2(200),
  reply_msg      VARCHAR2(600),
  sys_date_id    NUMBER(19),
  read_status    NUMBER(19),
  sys_ext        VARCHAR2(20),
  sys_id         VARCHAR2(200)
)
partition by range (SYS_TIME)
(
  partition P1 values less than (TIMESTAMP' 2013-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P102 values less than (TIMESTAMP' 2013-05-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P121 values less than (TIMESTAMP' 2013-07-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P42 values less than (TIMESTAMP' 2013-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P89 values less than (TIMESTAMP' 2013-09-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P128 values less than (TIMESTAMP' 2013-10-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P461 values less than (TIMESTAMP' 2013-11-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P801 values less than (TIMESTAMP' 2013-12-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1044 values less than (TIMESTAMP' 2014-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1146 values less than (TIMESTAMP' 2014-02-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1147 values less than (TIMESTAMP' 2014-03-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1183 values less than (TIMESTAMP' 2014-04-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1342 values less than (TIMESTAMP' 2014-05-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1842 values less than (TIMESTAMP' 2014-06-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P2343 values less than (TIMESTAMP' 2014-07-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P2862 values less than (TIMESTAMP' 2014-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P3443 values less than (TIMESTAMP' 2014-09-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P3963 values less than (TIMESTAMP' 2014-10-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P4523 values less than (TIMESTAMP' 2014-11-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P4556 values less than (TIMESTAMP' 2014-12-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P4612 values less than (TIMESTAMP' 2015-01-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition SYS_P1022 values less than (TIMESTAMP' 2015-08-01 00:00:00')
    tablespace MC
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 8M
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on column mc.SMS_RECEIVE.receive_id
  is '上行Id';
comment on column mc.SMS_RECEIVE.mobile_from
  is '上行号码';
comment on column mc.SMS_RECEIVE.receive_msg
  is '上行短信';
comment on column mc.SMS_RECEIVE.sys_time
  is '上行时间';
comment on column mc.SMS_RECEIVE.sp_num
  is '特服号，上行短信时输入或回复的完整号码';
comment on column mc.SMS_RECEIVE.ext_num
  is '扩展号';
comment on column mc.SMS_RECEIVE.channel_id
  is '上行短信的通道编号 默认0';
comment on column mc.SMS_RECEIVE.org_id
  is '上行所属机构';
comment on column mc.SMS_RECEIVE.user_id
  is '上行所属用户';
comment on column mc.SMS_RECEIVE.receive_status
  is '短信状态, 0:未被业务系统读取, 1:已被业务系统读取, 业务系统读取上行短信后应将该字段置为1 默认0';
comment on column mc.SMS_RECEIVE.read_time
  is '业务系统读取短信的时间';
comment on column mc.SMS_RECEIVE.msg_id
  is '生成短信的业务系统的短信编号';
comment on column mc.SMS_RECEIVE.remark
  is '保留字段';
comment on column mc.SMS_RECEIVE.msg_type
  is '上行短信的类型：0:咨询短信，1：点播短信,2：短信调查 默认值0';
comment on column mc.SMS_RECEIVE.reply_msg
  is '回复内容';

prompt
prompt Creating table SMS_RECEIVE_CLIENT
prompt =================================
prompt
create table mc.SMS_RECEIVE_CLIENT
(
  sms_receive_client_id VARCHAR2(100) not null,
  user_name             VARCHAR2(100),
  pass_word             VARCHAR2(100),
  receive_id            VARCHAR2(100),
  sp                    VARCHAR2(100),
  mobile                VARCHAR2(100),
  motime                VARCHAR2(100),
  msg                   VARCHAR2(2000),
  sys_time              DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_RECEIVE_CLIENT
  add primary key (SMS_RECEIVE_CLIENT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_RECEIVE_HIS
prompt ==============================
prompt
create table mc.SMS_RECEIVE_HIS
(
  receive_id     NUMBER(32) not null,
  mobile_from    VARCHAR2(30),
  receive_msg    VARCHAR2(200),
  sys_time       DATE,
  sys_date_id    NUMBER(8),
  sp_num         VARCHAR2(20),
  sys_ext        VARCHAR2(20),
  ext_num        VARCHAR2(20),
  channel_id     NUMBER(2),
  org_id         VARCHAR2(200),
  receive_status NUMBER(1),
  read_time      DATE,
  sys_id         VARCHAR2(200),
  msg_id         VARCHAR2(200),
  remark         VARCHAR2(200),
  msg_key        VARCHAR2(200),
  reply_msg      VARCHAR2(600)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_RECEIVE_HIS
  add constraint PK_SMS_RECEIVE_HIS primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_RECEIVEHIS_MOBILE on mc.SMS_RECEIVE_HIS (MOBILE_FROM)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_RECEIVEHIS_RECEIVETIME on mc.SMS_RECEIVE_HIS (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_RECEIVE_OLD
prompt ==============================
prompt
create table mc.SMS_RECEIVE_OLD
(
  receive_id     NUMBER(32) not null,
  mobile_from    VARCHAR2(30),
  receive_msg    VARCHAR2(200),
  sys_time       DATE default sysdate,
  sys_date_id    NUMBER(8),
  sp_num         VARCHAR2(20),
  sys_ext        VARCHAR2(20),
  ext_num        VARCHAR2(20),
  channel_id     NUMBER(2),
  org_id         VARCHAR2(200),
  receive_status NUMBER(1) default 0,
  read_time      DATE,
  sys_id         VARCHAR2(200),
  msg_id         VARCHAR2(200),
  remark         VARCHAR2(200),
  msg_key        VARCHAR2(200) default 0,
  reply_msg      VARCHAR2(600)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_RECEIVE_OLD
  is '接收表';
comment on column mc.SMS_RECEIVE_OLD.receive_id
  is '上行短信编号, UUID';
comment on column mc.SMS_RECEIVE_OLD.mobile_from
  is '上行短信的手机号';
comment on column mc.SMS_RECEIVE_OLD.receive_msg
  is '上行短信内容';
comment on column mc.SMS_RECEIVE_OLD.sys_time
  is '上行短信时间';
comment on column mc.SMS_RECEIVE_OLD.sys_date_id
  is '上行短信日期(格式YYYYMMDD)';
comment on column mc.SMS_RECEIVE_OLD.sp_num
  is '特服号，上行短信时输入或回复的完整号码';
comment on column mc.SMS_RECEIVE_OLD.sys_ext
  is '信息来源（各业务系统）对应的扩展号（如上行特服号SP_NUM为95551121234，则SYS_EXT内容为12[（参照业务系统对应扩展号表字典）是否制定为2位，各系统对应的机构如何发布给各业务系统]。各业务系统根据“业务系统对应扩展号”来匹配哪条上行信息属于本系统的短信';
comment on column mc.SMS_RECEIVE_OLD.ext_num
  is '业务扩展码，对应业务系统的业务编号（如上行特服号SP_NUM为95551121234，则BIZ_EXT内容为1234，匹配下行表sms_send中的EXT_NUM[建议名称统一]字段）';
comment on column mc.SMS_RECEIVE_OLD.channel_id
  is '上行短信的通道编号';
comment on column mc.SMS_RECEIVE_OLD.org_id
  is '上行短信所属机构';
comment on column mc.SMS_RECEIVE_OLD.receive_status
  is '短信状态, 0:未被业务系统读取, 1:已被业务系统读取, 业务系统读取上行短信后应将该字段置为1,以免重复读取';
comment on column mc.SMS_RECEIVE_OLD.read_time
  is '业务系统读取短信的时间';
comment on column mc.SMS_RECEIVE_OLD.sys_id
  is '业务系统的编号, 用于标识短信属于哪个业务系统,例如客户关系管理系统为CRM';
comment on column mc.SMS_RECEIVE_OLD.msg_id
  is '生成短信的业务系统的短信编号';
comment on column mc.SMS_RECEIVE_OLD.remark
  is '保留字段，无用';
comment on column mc.SMS_RECEIVE_OLD.msg_key
  is '上行短信的类型：0:咨询短信，1：点播短信,2：短信调查';
comment on column mc.SMS_RECEIVE_OLD.reply_msg
  is '咨询短信的回复信息';
alter table mc.SMS_RECEIVE_OLD
  add constraint PK_SMS_RECEIVE primary key (RECEIVE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSRECEIVE_MOBILE on mc.SMS_RECEIVE_OLD (MOBILE_FROM)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSRECEIVE_RECEIVETIME on mc.SMS_RECEIVE_OLD (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_REPORT
prompt =========================
prompt
create table mc.SMS_REPORT
(
  sequence               VARCHAR2(200) not null,
  channel_id             NUMBER(4),
  gw_status              VARCHAR2(50),
  gw_status_desc         VARCHAR2(100),
  sms_status             NUMBER(2),
  submit_time            TIMESTAMP(6),
  report_time            TIMESTAMP(6) default systimestamp,
  sys_time               TIMESTAMP(6) default systimestamp,
  send_id                VARCHAR2(200),
  originalsms_sendid     VARCHAR2(200),
  originalsms_totalpages NUMBER(1),
  current_pageno         NUMBER(1),
  batch_id               VARCHAR2(200),
  msg_id                 VARCHAR2(200),
  sys_id                 VARCHAR2(50),
  mobile_to              VARCHAR2(50),
  status                 NUMBER(1) default 0,
  fetch_status           NUMBER(1) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_REPORT
  is '短信状态报告';
comment on column mc.SMS_REPORT.sequence
  is '短信在短信网关的编号';
comment on column mc.SMS_REPORT.channel_id
  is '通道编号';
comment on column mc.SMS_REPORT.gw_status
  is '网关的状态报告';
comment on column mc.SMS_REPORT.gw_status_desc
  is '网关的状态报告描述';
comment on column mc.SMS_REPORT.sms_status
  is '此状态报告对应短信平台的状态,1:已提交, 5:客户收到短信, 6:客户未收到短信';
comment on column mc.SMS_REPORT.submit_time
  is '短信提交到短信网关的时间';
comment on column mc.SMS_REPORT.report_time
  is '客户收到短信时间';
comment on column mc.SMS_REPORT.sys_time
  is '状态报告入库时间';
comment on column mc.SMS_REPORT.send_id
  is '状态报告对应的短信的编号';
comment on column mc.SMS_REPORT.originalsms_sendid
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column mc.SMS_REPORT.originalsms_totalpages
  is '本条短短信所属长短信共有短信的页数';
comment on column mc.SMS_REPORT.current_pageno
  is '当前短信的页号,即长短信的第几条短短信';
comment on column mc.SMS_REPORT.batch_id
  is '短信批号,用于标识同一批短信';
comment on column mc.SMS_REPORT.msg_id
  is '对应业务系统的短信编号';
comment on column mc.SMS_REPORT.sys_id
  is '信息来源, 即改短信来自哪个业务系统';
comment on column mc.SMS_REPORT.mobile_to
  is '对应手机号';
comment on column mc.SMS_REPORT.status
  is '状态报告状态，0：未成功更新短信, 1:成功更新短信状态';
comment on column mc.SMS_REPORT.fetch_status
  is '业务系统读取状态报告的状态，0：未读取, 1:已读取';
alter table mc.SMS_REPORT
  add constraint PK_SMS_REPORT primary key (SEQUENCE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_B on mc.SMS_REPORT (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_M on mc.SMS_REPORT (MSG_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_MT on mc.SMS_REPORT (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_REPORT_S on mc.SMS_REPORT (SYS_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_REPORT_CLIENT
prompt ================================
prompt
create table mc.SMS_REPORT_CLIENT
(
  sms_report_client_id VARCHAR2(100) not null,
  user_name            VARCHAR2(100),
  pass_word            VARCHAR2(100),
  msg_id               VARCHAR2(100),
  mobile               VARCHAR2(100),
  status               VARCHAR2(100),
  status_desc          VARCHAR2(100),
  report_time          VARCHAR2(100),
  sys_time             DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_REPORT_CLIENT
  add primary key (SMS_REPORT_CLIENT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_REPORT_HIS
prompt =============================
prompt
create table mc.SMS_REPORT_HIS
(
  sms_report_id          VARCHAR2(40) not null,
  channel_id             NUMBER(4),
  submit_time            TIMESTAMP(6),
  done_time              TIMESTAMP(6),
  report_time            TIMESTAMP(6),
  status                 NUMBER(1),
  status_code            VARCHAR2(40),
  status_code_desc       VARCHAR2(200),
  mobile                 VARCHAR2(20),
  gw_msg_id              VARCHAR2(100),
  smsreport_id           VARCHAR2(200),
  sequence               VARCHAR2(200),
  gw_status              VARCHAR2(50),
  gw_status_desc         VARCHAR2(100),
  sms_status             NUMBER(2),
  sys_time               TIMESTAMP(6),
  send_id                VARCHAR2(200),
  originalsms_sendid     VARCHAR2(200),
  originalsms_totalpages NUMBER(1),
  current_pageno         NUMBER(1),
  batch_id               VARCHAR2(200),
  msg_id                 VARCHAR2(200),
  sys_id                 VARCHAR2(50),
  mobile_to              VARCHAR2(50),
  fetch_status           NUMBER(1)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_REPORT_HIS
  add constraint PK_SMS_REPORT_HIS primary key (SMS_REPORT_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_SMS_REPORT_HIS_GWMSGID on mc.SMS_REPORT_HIS (GW_MSG_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_SEND
prompt =======================
prompt
create table mc.SMS_SEND
(
  send_id                NUMBER(32) not null,
  mobile_to              VARCHAR2(20),
  send_msg               VARCHAR2(600),
  org_id                 VARCHAR2(50) default '0000',
  sys_id                 VARCHAR2(10),
  prior_id               NUMBER(1) default 8,
  pre_send_time          DATE default sysdate,
  ext_num                VARCHAR2(20),
  user_id                VARCHAR2(40),
  cust_id                VARCHAR2(40),
  batch_id               VARCHAR2(40),
  msg_id                 VARCHAR2(80),
  message_class          VARCHAR2(20) default '00',
  message_type           VARCHAR2(20) default '00',
  wappush_url            VARCHAR2(200),
  send_deadline          TIMESTAMP(6),
  send_status            NUMBER(2) default -2,
  sys_time               DATE default sysdate,
  sys_date_id            NUMBER(18),
  send_time              DATE default sysdate,
  send_date_id           NUMBER(18),
  send_weekdate          CHAR(1) default 0,
  com_rtn_time           DATE,
  report_time            DATE,
  channel_id             NUMBER(4) default 0,
  mobile_com             NUMBER(2),
  sequence               VARCHAR2(40),
  mobile_quantities      NUMBER(4) default 1,
  resend_times           NUMBER(1) default 0,
  signature              VARCHAR2(40),
  msg_type               VARCHAR2(50),
  err_id                 VARCHAR2(20),
  err_msg                VARCHAR2(100),
  is_longsms             NUMBER(1) default 0,
  is_original_sms        NUMBER(1) default 0,
  originalsms_sendid     VARCHAR2(200),
  current_pageno         NUMBER(1),
  originalsms_totalpages NUMBER(1),
  longsms_tag            NUMBER(4),
  longsms_splited        NUMBER(1) default 0,
  remark                 VARCHAR2(500),
  sender_id              VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SEND
  is '下行短信信息表';
comment on column mc.SMS_SEND.send_id
  is '下行短信序号，下行短信的唯一标识';
comment on column mc.SMS_SEND.mobile_to
  is '目标手机号(一个手机号码）';
comment on column mc.SMS_SEND.send_msg
  is '短信内容,最长为300字';
comment on column mc.SMS_SEND.org_id
  is '机构编号';
comment on column mc.SMS_SEND.sys_id
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column mc.SMS_SEND.prior_id
  is '优先级';
comment on column mc.SMS_SEND.pre_send_time
  is '预计发送时间';
comment on column mc.SMS_SEND.ext_num
  is '扩展号码';
comment on column mc.SMS_SEND.user_id
  is '用户编号';
comment on column mc.SMS_SEND.cust_id
  is '编写短信的客户编号, 客户自写短信时记录';
comment on column mc.SMS_SEND.batch_id
  is '短信批号,用于标识同一批短信';
comment on column mc.SMS_SEND.msg_id
  is '生成短信的业务系统的短信编号';
comment on column mc.SMS_SEND.message_class
  is '信息分类的编号';
comment on column mc.SMS_SEND.message_type
  is '信息性质';
comment on column mc.SMS_SEND.wappush_url
  is 'WAPPUSH链接, 此字段填写值时表明该短信为WAPPUSH短信, 系统将以WAPPUSH方式发送该短信';
comment on column mc.SMS_SEND.send_deadline
  is '发送的截止时间, 但发送时间晚于该时间时, 系统将取消该短信的发送';
comment on column mc.SMS_SEND.send_status
  is '发送状态,-2:已入库未开始发送, 0:未发送, 1:已发送, 2:发送中, 5:发送成功, 6:发送失败（如值相应的失败原因编号请查看ERR_ID表)';
comment on column mc.SMS_SEND.sys_time
  is '短信入库时间';
comment on column mc.SMS_SEND.sys_date_id
  is '短信入库日期（格式YYYYMMDD）';
comment on column mc.SMS_SEND.send_time
  is '平台发送该短信的时间';
comment on column mc.SMS_SEND.send_date_id
  is '平台发送该短信的日期，归档表将以此作为分区（格式YYYYMMDD）';
comment on column mc.SMS_SEND.send_weekdate
  is '平台发送该短信的时间为周几, 0:未发送, 1:周日, 2:周一, 3:周二, 4:周三, 5:周四, 6:周五, 7:周六';
comment on column mc.SMS_SEND.com_rtn_time
  is '短信网关返回提交应答的时间';
comment on column mc.SMS_SEND.report_time
  is '状态报告时间';
comment on column mc.SMS_SEND.channel_id
  is '通道编号 系统处理失败（如号码在黑名单、信息中包含敏感词）则填写0（';
comment on column mc.SMS_SEND.mobile_com
  is '运营商编号, 1:移动,2:联通, 3:电信 0:错误号码';
comment on column mc.SMS_SEND.sequence
  is '短信网关的短信编号, 短信网关返回状态报告时用于匹配原始短信';
comment on column mc.SMS_SEND.mobile_quantities
  is '本条短信的短信条数';
comment on column mc.SMS_SEND.resend_times
  is '短信的重发次数';
comment on column mc.SMS_SEND.signature
  is '短信签名';
comment on column mc.SMS_SEND.msg_type
  is '信息类型,用于标识短信的生成方式或者来源';
comment on column mc.SMS_SEND.err_id
  is '错误代码，包含短息平台错误代码和短信网关错误代码 短信错误代码 1007：黑名单号码 1008：短信包含违禁词 1009：错误手机号 1010：SYS_ID 填写错误';
comment on column mc.SMS_SEND.err_msg
  is '错误代码的说明信息';
comment on column mc.SMS_SEND.is_longsms
  is '该短信是否是长短信,0:不是长短信,1:是长短信';
comment on column mc.SMS_SEND.is_original_sms
  is '该短信是否是原始短信,非原始短信指长短信发送时拆分出的短信,0:是原始短信, 1:不是原始短信';
comment on column mc.SMS_SEND.originalsms_sendid
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column mc.SMS_SEND.current_pageno
  is '当前短信的页号,即长短信的第几条短短信';
comment on column mc.SMS_SEND.originalsms_totalpages
  is '本条短短信所属长短信共有短信的页数';
comment on column mc.SMS_SEND.longsms_tag
  is '长短信都标识符：同一条长短信的短短信该标识相同';
comment on column mc.SMS_SEND.longsms_splited
  is '长短信是否被拆分：0没有被拆分或者是普通短信；1已经被拆分。被拆分的短信查询统计时不应计算数量。默认0';
comment on column mc.SMS_SEND.remark
  is '备注信息，保留字段，扩展时使用';
comment on column mc.SMS_SEND.sender_id
  is '发送者ID，数据库接口时，就是数据库帐号';
alter table mc.SMS_SEND
  add constraint PK_SMS_SEND primary key (SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_BATCH_ID on mc.SMS_SEND (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_CHANNEL on mc.SMS_SEND (CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_MOBILE on mc.SMS_SEND (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_PRIOR_ID on mc.SMS_SEND (PRIOR_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEND_DATE on mc.SMS_SEND (SEND_WEEKDATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEND_STATUS on mc.SMS_SEND (SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEND_TIME on mc.SMS_SEND (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SEQUENCE on mc.SMS_SEND (SEQUENCE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_STATS_CHAN on mc.SMS_SEND (CHANNEL_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SYSDATE_MSGID on mc.SMS_SEND (SYS_DATE_ID, MSG_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMSSEND_SYS_TIME on mc.SMS_SEND (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SEND_ANALYZE
prompt ===============================
prompt
create table mc.SMS_SEND_ANALYZE
(
  org_id        VARCHAR2(200),
  user_id       VARCHAR2(200),
  stat_time     NUMBER(10),
  status        NUMBER(5),
  quantity      NUMBER(10),
  parent_org_id VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_SEND_HIS
prompt ===========================
prompt
create table mc.SMS_SEND_HIS
(
  send_id                NUMBER(32) not null,
  mobile_to              VARCHAR2(20),
  send_msg               VARCHAR2(600),
  org_id                 VARCHAR2(50) default '0000',
  sys_id                 VARCHAR2(10),
  prior_id               NUMBER(1) default 8,
  pre_send_time          DATE default sysdate,
  ext_num                VARCHAR2(20),
  user_id                VARCHAR2(40),
  cust_id                VARCHAR2(40),
  batch_id               VARCHAR2(40),
  msg_id                 VARCHAR2(80),
  message_class          VARCHAR2(20) default '00',
  message_type           VARCHAR2(20) default '00',
  wappush_url            VARCHAR2(200),
  send_deadline          TIMESTAMP(6),
  send_status            NUMBER(2) default -2,
  sys_time               DATE default sysdate,
  sys_date_id            NUMBER(18),
  send_time              DATE default sysdate,
  send_date_id           NUMBER(18),
  send_weekdate          CHAR(1) default 0,
  com_rtn_time           DATE,
  report_time            DATE,
  channel_id             NUMBER(4) default 0,
  mobile_com             NUMBER(2),
  sequence               VARCHAR2(40),
  mobile_quantities      NUMBER(4) default 1,
  resend_times           NUMBER(1) default 0,
  signature              VARCHAR2(40),
  msg_type               VARCHAR2(50),
  err_id                 VARCHAR2(20),
  err_msg                VARCHAR2(100),
  is_longsms             NUMBER(1) default 0,
  is_original_sms        NUMBER(1) default 0,
  originalsms_sendid     VARCHAR2(200),
  current_pageno         NUMBER(1),
  originalsms_totalpages NUMBER(1),
  longsms_tag            NUMBER(5),
  longsms_splited        NUMBER(1) default 0,
  remark                 VARCHAR2(500),
  sender_id              VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SEND_HIS
  is '下行短信信息表';
comment on column mc.SMS_SEND_HIS.send_id
  is '下行短信序号，下行短信的唯一标识';
comment on column mc.SMS_SEND_HIS.mobile_to
  is '目标手机号(一个手机号码）';
comment on column mc.SMS_SEND_HIS.send_msg
  is '短信内容,最长为300字';
comment on column mc.SMS_SEND_HIS.org_id
  is '机构编号';
comment on column mc.SMS_SEND_HIS.sys_id
  is '业务系统的编号, 用于标识短信来着哪个业务系统的编号 （如填写错误则ERR_ID字段显示1010错误)';
comment on column mc.SMS_SEND_HIS.prior_id
  is '优先级';
comment on column mc.SMS_SEND_HIS.pre_send_time
  is '预计发送时间';
comment on column mc.SMS_SEND_HIS.ext_num
  is '扩展号码';
comment on column mc.SMS_SEND_HIS.user_id
  is '用户编号';
comment on column mc.SMS_SEND_HIS.cust_id
  is '编写短信的客户编号, 客户自写短信时记录';
comment on column mc.SMS_SEND_HIS.batch_id
  is '短信批号,用于标识同一批短信';
comment on column mc.SMS_SEND_HIS.msg_id
  is '生成短信的业务系统的短信编号';
comment on column mc.SMS_SEND_HIS.message_class
  is '信息分类的编号';
comment on column mc.SMS_SEND_HIS.message_type
  is '信息性质';
comment on column mc.SMS_SEND_HIS.wappush_url
  is 'WAPPUSH链接, 此字段填写值时表明该短信为WAPPUSH短信, 系统将以WAPPUSH方式发送该短信';
comment on column mc.SMS_SEND_HIS.send_deadline
  is '发送的截止时间, 但发送时间晚于该时间时, 系统将取消该短信的发送';
comment on column mc.SMS_SEND_HIS.send_status
  is '发送状态,-2:已入库未开始发送, 0:未发送, 1:已发送, 2:发送中, 5:发送成功, 6:发送失败（如值相应的失败原因编号请查看ERR_ID表)';
comment on column mc.SMS_SEND_HIS.sys_time
  is '短信入库时间';
comment on column mc.SMS_SEND_HIS.sys_date_id
  is '短信入库日期（格式YYYYMMDD）';
comment on column mc.SMS_SEND_HIS.send_time
  is '平台发送该短信的时间';
comment on column mc.SMS_SEND_HIS.send_date_id
  is '平台发送该短信的日期，归档表将以此作为分区（格式YYYYMMDD）';
comment on column mc.SMS_SEND_HIS.send_weekdate
  is '平台发送该短信的时间为周几, 0:未发送, 1:周日, 2:周一, 3:周二, 4:周三, 5:周四, 6:周五, 7:周六';
comment on column mc.SMS_SEND_HIS.com_rtn_time
  is '短信网关返回提交应答的时间';
comment on column mc.SMS_SEND_HIS.report_time
  is '状态报告时间';
comment on column mc.SMS_SEND_HIS.channel_id
  is '通道编号 系统处理失败（如号码在黑名单、信息中包含敏感词）则填写0（';
comment on column mc.SMS_SEND_HIS.mobile_com
  is '运营商编号, 1:移动,2:联通, 3:电信 0:错误号码';
comment on column mc.SMS_SEND_HIS.sequence
  is '短信网关的短信编号, 短信网关返回状态报告时用于匹配原始短信';
comment on column mc.SMS_SEND_HIS.mobile_quantities
  is '本条短信的短信条数';
comment on column mc.SMS_SEND_HIS.resend_times
  is '短信的重发次数';
comment on column mc.SMS_SEND_HIS.signature
  is '短信签名';
comment on column mc.SMS_SEND_HIS.msg_type
  is '信息类型,用于标识短信的生成方式或者来源';
comment on column mc.SMS_SEND_HIS.err_id
  is '错误代码，包含短息平台错误代码和短信网关错误代码 短信错误代码 1007：黑名单号码 1008：短信包含违禁词 1009：错误手机号 1010：SYS_ID 填写错误';
comment on column mc.SMS_SEND_HIS.err_msg
  is '错误代码的说明信息';
comment on column mc.SMS_SEND_HIS.is_longsms
  is '该短信是否是长短信,0:不是长短信,1:是长短信';
comment on column mc.SMS_SEND_HIS.is_original_sms
  is '该短信是否是原始短信,非原始短信指长短信发送时拆分出的短信,0:是原始短信, 1:不是原始短信';
comment on column mc.SMS_SEND_HIS.originalsms_sendid
  is '原始短信编号，当本短信为由长短信拆分成的短短信时, 可以依据此编号查询到原始短信';
comment on column mc.SMS_SEND_HIS.current_pageno
  is '当前短信的页号,即长短信的第几条短短信';
comment on column mc.SMS_SEND_HIS.originalsms_totalpages
  is '本条短短信所属长短信共有短信的页数';
comment on column mc.SMS_SEND_HIS.longsms_tag
  is '长短信都标识符：同一条长短信的短短信该标识相同';
comment on column mc.SMS_SEND_HIS.longsms_splited
  is '长短信是否被拆分：0没有被拆分或者是普通短信；1已经被拆分。被拆分的短信查询统计时不应计算数量。默认0';
comment on column mc.SMS_SEND_HIS.remark
  is '备注信息，保留字段，扩展时使用';
comment on column mc.SMS_SEND_HIS.sender_id
  is '发送者ID，数据库接口时，就是数据库帐号';
alter table mc.SMS_SEND_HIS
  add constraint PK_SMS_SEND_HIS primary key (SEND_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_BATCH_ID on mc.SMS_SEND_HIS (BATCH_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_CHANNEL on mc.SMS_SEND_HIS (CHANNEL_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_MOBILE on mc.SMS_SEND_HIS (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_PRIOR_ID on mc.SMS_SEND_HIS (PRIOR_ID)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SENDDATE on mc.SMS_SEND_HIS (SEND_WEEKDATE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SENDTIME on mc.SMS_SEND_HIS (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SEQUENCE on mc.SMS_SEND_HIS (SEQUENCE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_STATS_CHAN on mc.SMS_SEND_HIS (CHANNEL_ID, SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_STATUS on mc.SMS_SEND_HIS (SEND_STATUS)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SENDHIS_SYSTIME on mc.SMS_SEND_HIS (SYS_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SEND_PAPER
prompt =============================
prompt
create table mc.SMS_SEND_PAPER
(
  sms_send_paper_id VARCHAR2(100) not null,
  status            NUMBER(1),
  prior_id          NUMBER(1),
  is_check          NUMBER(1),
  subject           VARCHAR2(1000),
  content           CLOB,
  mobiles           CLOB,
  groups            CLOB,
  file_url          VARCHAR2(200),
  file_name         VARCHAR2(200),
  sys_time          DATE default sysdate,
  pre_send_time     DATE,
  send_time         DATE,
  check_time        DATE,
  creator           VARCHAR2(100),
  creator_name      VARCHAR2(100),
  creator_org       VARCHAR2(100),
  creator_org_name  VARCHAR2(100),
  auditor           VARCHAR2(100),
  auditor_name      VARCHAR2(100),
  auditor_org       VARCHAR2(100),
  auditor_org_name  VARCHAR2(100),
  batch_id          VARCHAR2(100),
  send_type         VARCHAR2(50),
  msg_type          VARCHAR2(50),
  product_id        VARCHAR2(100),
  product_name      VARCHAR2(100),
  product_item_id   VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SEND_PAPER
  is '短信普通发送历史记录表';
comment on column mc.SMS_SEND_PAPER.sms_send_paper_id
  is '系统编号';
comment on column mc.SMS_SEND_PAPER.status
  is '是否启用，0刚提交审核（未审核）,1审核通过，3审核流程失败，5短信发送成功，6短信发送失败';
comment on column mc.SMS_SEND_PAPER.prior_id
  is '优先级';
comment on column mc.SMS_SEND_PAPER.is_check
  is '是否需要审核  0为不需要，1为需要';
comment on column mc.SMS_SEND_PAPER.subject
  is '如果是彩信的话，这里内容不为空';
comment on column mc.SMS_SEND_PAPER.content
  is '内容';
comment on column mc.SMS_SEND_PAPER.mobiles
  is '手机号码';
comment on column mc.SMS_SEND_PAPER.groups
  is '客户群组';
comment on column mc.SMS_SEND_PAPER.file_url
  is '文件地址';
comment on column mc.SMS_SEND_PAPER.file_name
  is '文件名称';
comment on column mc.SMS_SEND_PAPER.sys_time
  is '创建时间';
comment on column mc.SMS_SEND_PAPER.pre_send_time
  is '预计发送时间';
comment on column mc.SMS_SEND_PAPER.send_time
  is '发送时间';
comment on column mc.SMS_SEND_PAPER.check_time
  is '提交审核时间';
comment on column mc.SMS_SEND_PAPER.creator
  is '创建者';
comment on column mc.SMS_SEND_PAPER.creator_name
  is '创建者';
comment on column mc.SMS_SEND_PAPER.creator_org
  is '创建者机构';
comment on column mc.SMS_SEND_PAPER.creator_org_name
  is '创建者机构';
comment on column mc.SMS_SEND_PAPER.auditor
  is '审核者';
comment on column mc.SMS_SEND_PAPER.auditor_name
  is '审核者';
comment on column mc.SMS_SEND_PAPER.auditor_org
  is '审核者机构';
comment on column mc.SMS_SEND_PAPER.auditor_org_name
  is '审核者机构';
comment on column mc.SMS_SEND_PAPER.batch_id
  is '短信的批次号，批量发送的时候使用';
comment on column mc.SMS_SEND_PAPER.send_type
  is '发送类型，COMMON：普通发送、BATCH：批量发送、TEMPLATE：模板发送、PRODUCT：栏目发送';
comment on column mc.SMS_SEND_PAPER.msg_type
  is '信息类型，SMS：短信、MMS：彩信';
comment on column mc.SMS_SEND_PAPER.product_id
  is '栏目编号';
comment on column mc.SMS_SEND_PAPER.product_name
  is '栏目名称';
comment on column mc.SMS_SEND_PAPER.product_item_id
  is '栏目发送历史记录的编号';
alter table mc.SMS_SEND_PAPER
  add constraint PK_SMS_SEND_PAPER primary key (SMS_SEND_PAPER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SPNUMBER
prompt ===========================
prompt
create table mc.SMS_SPNUMBER
(
  sms_spnumber_id   VARCHAR2(20) not null,
  spnumber          VARCHAR2(20),
  status            NUMBER(1),
  spnumber_type     VARCHAR2(100),
  description       VARCHAR2(200),
  sort_index        VARCHAR2(20),
  organization_id   VARCHAR2(50),
  organization_name VARCHAR2(200),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(200),
  create_time       DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_SPNUMBER
  is '短信特服号表';
comment on column mc.SMS_SPNUMBER.sms_spnumber_id
  is '特服号编号';
comment on column mc.SMS_SPNUMBER.spnumber
  is '特服号';
comment on column mc.SMS_SPNUMBER.status
  is '状态, 0:失效, 1:生效';
comment on column mc.SMS_SPNUMBER.spnumber_type
  is '类型, PREFIX:前缀, REGEXP:正则表达式';
comment on column mc.SMS_SPNUMBER.description
  is '备注';
comment on column mc.SMS_SPNUMBER.sort_index
  is '排序编号';
comment on column mc.SMS_SPNUMBER.organization_id
  is '机构编号';
comment on column mc.SMS_SPNUMBER.organization_name
  is '机构名称';
comment on column mc.SMS_SPNUMBER.user_id
  is '用户编号';
comment on column mc.SMS_SPNUMBER.user_name
  is '用户名称';
comment on column mc.SMS_SPNUMBER.create_time
  is '创建时间';
alter table mc.SMS_SPNUMBER
  add constraint PK_SMS_SPNUMBER primary key (SMS_SPNUMBER_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SPNUMBER_SORTIDX on mc.SMS_SPNUMBER (SORT_INDEX)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_STATICS_CHANNEL
prompt ==================================
prompt
create table mc.SMS_STATICS_CHANNEL
(
  sms_statics_channel_id VARCHAR2(200) not null,
  send_time              DATE,
  channel_id             NUMBER(4),
  mobile_com             NUMBER(2),
  send_status            NUMBER(2),
  mobile_quantities      NUMBER(10),
  sys_time               TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_CHANNEL
  add constraint PK_SMS_STATICS_CHANNEL primary key (SMS_STATICS_CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSCH_TIME on mc.SMS_STATICS_CHANNEL (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_STATICS_DATE
prompt ===============================
prompt
create table mc.SMS_STATICS_DATE
(
  sms_statics_date_id VARCHAR2(20) not null,
  send_time           DATE,
  sys_time            TIMESTAMP(6),
  statics_use_time    NUMBER(10),
  status              NUMBER(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_DATE
  add constraint PK_SMS_STATICS_DATE primary key (SMS_STATICS_DATE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSDATE_SENDTIME on mc.SMS_STATICS_DATE (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_STATICS_ORG
prompt ==============================
prompt
create table mc.SMS_STATICS_ORG
(
  sms_statics_org_id VARCHAR2(200) not null,
  send_time          DATE,
  org_id             VARCHAR2(200),
  send_status        NUMBER(2),
  mobile_quantities  NUMBER(10),
  sys_time           TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_ORG
  add constraint PK_SMS_STATICS_ORG primary key (SMS_STATICS_ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSORG_TIME on mc.SMS_STATICS_ORG (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_STATICS_ORG_CHANNEL
prompt ======================================
prompt
create table mc.SMS_STATICS_ORG_CHANNEL
(
  sms_statics_org_channel_id VARCHAR2(200) not null,
  send_time                  DATE,
  org_id                     VARCHAR2(200),
  channel_id                 NUMBER(4),
  send_status                NUMBER(2),
  mobile_quantities          NUMBER(10),
  sys_time                   TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.SMS_STATICS_ORG_CHANNEL
  add constraint PK_SMS_STATICS_ORG_CHANNEL primary key (SMS_STATICS_ORG_CHANNEL_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.IDX_SMS_STCSORGCH_TIME on mc.SMS_STATICS_ORG_CHANNEL (SEND_TIME)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY
prompt =========================
prompt
create table mc.SMS_SURVEY
(
  sms_survey_id         VARCHAR2(200) not null,
  sms_survey_name       VARCHAR2(80),
  survey_type           VARCHAR2(20),
  option_number         NUMBER(18),
  status                VARCHAR2(20),
  start_time            DATE,
  end_time              DATE,
  user_id               VARCHAR2(200),
  user_name             VARCHAR2(200),
  user_group_id         VARCHAR2(200),
  user_group_name       VARCHAR2(200),
  biz_number            VARCHAR2(20),
  sms_directive         VARCHAR2(20),
  survey_template       VARCHAR2(200),
  thank_word            VARCHAR2(200),
  spec_response         VARCHAR2(20),
  contact_groups        CLOB,
  black_groups          CLOB,
  survey_valid_type     VARCHAR2(20),
  max_vote_number       VARCHAR2(20),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_SURVEY
  is '短信调查';
comment on column mc.SMS_SURVEY.sms_survey_name
  is '调查名称';
comment on column mc.SMS_SURVEY.survey_type
  is '调查类型';
comment on column mc.SMS_SURVEY.option_number
  is '选项数量';
comment on column mc.SMS_SURVEY.status
  is '状态';
comment on column mc.SMS_SURVEY.start_time
  is '开始时间';
comment on column mc.SMS_SURVEY.end_time
  is '结束时间';
comment on column mc.SMS_SURVEY.user_id
  is '用户id';
comment on column mc.SMS_SURVEY.user_name
  is '用户名';
comment on column mc.SMS_SURVEY.user_group_id
  is '用户群组id';
comment on column mc.SMS_SURVEY.user_group_name
  is '用户群组名';
comment on column mc.SMS_SURVEY.sms_directive
  is '短信指令';
comment on column mc.SMS_SURVEY.survey_template
  is '调查模板';
comment on column mc.SMS_SURVEY.thank_word
  is '感谢语';
comment on column mc.SMS_SURVEY.spec_response
  is '是否限定调查对象';
comment on column mc.SMS_SURVEY.contact_groups
  is '联系群组';
comment on column mc.SMS_SURVEY.black_groups
  is '黑名单';
comment on column mc.SMS_SURVEY.survey_valid_type
  is '有效回复';
comment on column mc.SMS_SURVEY.max_vote_number
  is '次数限制';
comment on column mc.SMS_SURVEY.created_stamp
  is '创建时间';
alter table mc.SMS_SURVEY
  add constraint PK_SMS_SURVEY primary key (SMS_SURVEY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index mc.IDX_SMS_DIRECTIVE on mc.SMS_SURVEY (SMS_DIRECTIVE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SMS_SURVEY_TXCRTS on mc.SMS_SURVEY (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.SMS_SURVEY_TXSTMP on mc.SMS_SURVEY (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_SURVEY_GROUP
prompt ===============================
prompt
create table mc.SMS_SURVEY_GROUP
(
  sms_survey_id         VARCHAR2(200) not null,
  group_id              VARCHAR2(200) not null,
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_GROUP
  is '短信调查被访组';
alter table mc.SMS_SURVEY_GROUP
  add constraint PK_SMS_SURVEY_GROUP primary key (SMS_SURVEY_ID, GROUP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_GRP_TXCRTS on mc.SMS_SURVEY_GROUP (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_GRP_TXSTMP on mc.SMS_SURVEY_GROUP (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY_ITEM
prompt ==============================
prompt
create table mc.SMS_SURVEY_ITEM
(
  sms_survey_id         VARCHAR2(200) not null,
  surv_item_code        VARCHAR2(10) not null,
  surv_item_name        VARCHAR2(80),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_ITEM
  is '短信调查选项';
alter table mc.SMS_SURVEY_ITEM
  add constraint PK_SMS_SURVEY_ITEM primary key (SMS_SURVEY_ID, SURV_ITEM_CODE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_ITM_TXCRTS on mc.SMS_SURVEY_ITEM (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_ITM_TXSTMP on mc.SMS_SURVEY_ITEM (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY_RECORD
prompt ================================
prompt
create table mc.SMS_SURVEY_RECORD
(
  sms_survey_record_id  VARCHAR2(200) not null,
  sms_survey_id         VARCHAR2(200),
  mobile_number         VARCHAR2(20),
  sms_surv_item_code    VARCHAR2(40),
  message_content       VARCHAR2(40),
  message_id            VARCHAR2(200),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_RECORD
  is '调查记录';
alter table mc.SMS_SURVEY_RECORD
  add constraint PK_SMS_SURVEY_RECORD primary key (SMS_SURVEY_RECORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RCD_TXCRTS on mc.SMS_SURVEY_RECORD (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RCD_TXSTMP on mc.SMS_SURVEY_RECORD (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_SURVEY_RESPONDENT
prompt ====================================
prompt
create table mc.SMS_SURVEY_RESPONDENT
(
  sms_survey_id         VARCHAR2(200) not null,
  mobile_number         VARCHAR2(20) not null,
  user_name             VARCHAR2(40),
  last_updated_stamp    TIMESTAMP(6),
  last_updated_tx_stamp TIMESTAMP(6),
  created_stamp         TIMESTAMP(6),
  created_tx_stamp      TIMESTAMP(6)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_SURVEY_RESPONDENT
  is '短信调查被访者';
alter table mc.SMS_SURVEY_RESPONDENT
  add constraint PK_SMS_SURVEY_RESPONDENT primary key (SMS_SURVEY_ID, MOBILE_NUMBER)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RSPNT_TXCS on mc.SMS_SURVEY_RESPONDENT (CREATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create index mc.SMS_SRV_RSPNT_TXSP on mc.SMS_SURVEY_RESPONDENT (LAST_UPDATED_TX_STAMP)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_TEST_SEND
prompt ============================
prompt
create table mc.SMS_TEST_SEND
(
  id                  VARCHAR2(200) not null,
  content             VARCHAR2(2000),
  submit_time         DATE,
  mobile_to           VARCHAR2(2000),
  msg_id              VARCHAR2(200),
  user_id             VARCHAR2(200),
  organization_id     VARCHAR2(200),
  wappush_url         VARCHAR2(200),
  date_interval_start NUMBER(4),
  date_interval_end   NUMBER(4),
  time_interval_start VARCHAR2(200),
  time_interval_end   VARCHAR2(200),
  interval            VARCHAR2(200),
  type                NUMBER(2),
  status              NUMBER(2),
  hour_minute         NUMBER(2),
  sys_id              VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SMS_TEST_SEND
  is '测试短信策略表';
comment on column mc.SMS_TEST_SEND.id
  is '编号';
comment on column mc.SMS_TEST_SEND.content
  is '内容，会自动追加时间';
comment on column mc.SMS_TEST_SEND.submit_time
  is '提交时间';
comment on column mc.SMS_TEST_SEND.mobile_to
  is '手机号, 以英文逗号分割';
comment on column mc.SMS_TEST_SEND.msg_id
  is '信息性质编号';
comment on column mc.SMS_TEST_SEND.user_id
  is '提交者编号';
comment on column mc.SMS_TEST_SEND.organization_id
  is '提交者所属机构';
comment on column mc.SMS_TEST_SEND.wappush_url
  is 'WAPPUSH短信的链接地址';
comment on column mc.SMS_TEST_SEND.date_interval_start
  is '测试短信日期间隔的开始时间, 2:星期一, 3:星期二, 4:星期三, 5:星期四, 6:星期五, 7:星期六, 8:星期日';
comment on column mc.SMS_TEST_SEND.date_interval_end
  is '测试短信日期间隔的开始时间, 2:星期一, 3:星期二, 4:星期三, 5:星期四, 6:星期五, 7:星期六, 8:星期日';
comment on column mc.SMS_TEST_SEND.time_interval_start
  is '测试短信时间间隔的开始时间';
comment on column mc.SMS_TEST_SEND.time_interval_end
  is '测试短信时间间隔的结束时间';
comment on column mc.SMS_TEST_SEND.interval
  is '测试短信的间隔发送';
comment on column mc.SMS_TEST_SEND.type
  is '0:普通短信, 1:WAPPUSH短信';
comment on column mc.SMS_TEST_SEND.status
  is '0:初稿, 1:生效, 2:失效';
comment on column mc.SMS_TEST_SEND.hour_minute
  is '0:小时, 1:分钟';
comment on column mc.SMS_TEST_SEND.sys_id
  is '信息来源';
alter table mc.SMS_TEST_SEND
  add constraint PK_SMS_TEST_SEND primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SMS_UNSUBSCRIBE_KEY_WORD
prompt =======================================
prompt
create table mc.SMS_UNSUBSCRIBE_KEY_WORD
(
  key_word_id       VARCHAR2(20) not null,
  key_word          VARCHAR2(200),
  status            NUMBER(1),
  description       VARCHAR2(200),
  sort_index        VARCHAR2(20),
  organization_id   VARCHAR2(50),
  organization_name VARCHAR2(200),
  user_id           VARCHAR2(50),
  user_name         VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SMS_UNSUBSCRIBE_KEY_WORD
  is '退订关键字表';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.key_word_id
  is '关键字编号';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.key_word
  is '关键字';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.status
  is '状态, 0:失效, 1:生效';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.description
  is '备注';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.sort_index
  is '排序编号';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.organization_id
  is '机构编号';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.organization_name
  is '机构名称';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.user_id
  is '用户编号';
comment on column mc.SMS_UNSUBSCRIBE_KEY_WORD.user_name
  is '用户名称';
alter table mc.SMS_UNSUBSCRIBE_KEY_WORD
  add constraint PK_SMS_UNSUBSCRIBE_KEY_WORD primary key (KEY_WORD_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SMS_VIP
prompt ======================
prompt
create table mc.SMS_VIP
(
  sms_vip_id         VARCHAR2(50) not null,
  sms_vip_name       VARCHAR2(50),
  sms_vip_share      NUMBER(1) default 0,
  sms_vip_mark       VARCHAR2(100),
  sms_vip_group_id   VARCHAR2(200),
  sms_vip_user_id    VARCHAR2(200),
  phone_number       VARCHAR2(20),
  sms_vip_position   VARCHAR2(50),
  sms_vip_group_name VARCHAR2(100),
  sms_vip_user_name  VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.SMS_VIP
  add primary key (SMS_VIP_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SQL_LOG
prompt ======================
prompt
create table mc.SQL_LOG
(
  sql_txt  CLOB,
  sys_time TIMESTAMP(6),
  place    VARCHAR2(100)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STYLE_BASE
prompt =========================
prompt
create table mc.STYLE_BASE
(
  style_id   NUMBER(7) not null,
  subject    VARCHAR2(100),
  style_key  VARCHAR2(10),
  thumbnail  VARCHAR2(100),
  status     NUMBER(1),
  creat_time DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.STYLE_BASE
  is '平台主题基础信息表';
comment on column mc.STYLE_BASE.style_id
  is '编号';
comment on column mc.STYLE_BASE.subject
  is '主题名称';
comment on column mc.STYLE_BASE.style_key
  is '主题对应的英文KEY';
comment on column mc.STYLE_BASE.thumbnail
  is '主题缩略图名称';
comment on column mc.STYLE_BASE.status
  is '是否启用, 0:无效主题, 1:有效主题';
comment on column mc.STYLE_BASE.creat_time
  is '创建时间';
alter table mc.STYLE_BASE
  add constraint PK_STYLE_BASE primary key (STYLE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table STYLE_USER_CONFIG
prompt ================================
prompt
create table mc.STYLE_USER_CONFIG
(
  style_config_id NUMBER(7) not null,
  user_id         VARCHAR2(100),
  user_name       VARCHAR2(100),
  f_id            NUMBER(7),
  creat_time      DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.STYLE_USER_CONFIG
  is '用户对应主题配置表';
comment on column mc.STYLE_USER_CONFIG.style_config_id
  is '编号';
comment on column mc.STYLE_USER_CONFIG.user_id
  is '用户编号, 这个字段需要设置唯一性';
comment on column mc.STYLE_USER_CONFIG.user_name
  is '用户名称';
comment on column mc.STYLE_USER_CONFIG.f_id
  is '配置的主题编号';
comment on column mc.STYLE_USER_CONFIG.creat_time
  is '创建时间';
alter table mc.STYLE_USER_CONFIG
  add constraint PK_STYLE_USER_CONFIG primary key (STYLE_CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SUBSYS_CODE
prompt ==========================
prompt
create table mc.SUBSYS_CODE
(
  id               VARCHAR2(200) not null,
  subsys_code_id   VARCHAR2(20),
  subsys_code_name VARCHAR2(200),
  extend_number    VARCHAR2(20),
  description      VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.SUBSYS_CODE
  is '信息来源数据字典';
comment on column mc.SUBSYS_CODE.id
  is '表主键';
comment on column mc.SUBSYS_CODE.subsys_code_id
  is '信息来源编号';
comment on column mc.SUBSYS_CODE.subsys_code_name
  is '信息来源名称';
comment on column mc.SUBSYS_CODE.extend_number
  is '扩展号';
comment on column mc.SUBSYS_CODE.description
  is '备注';
alter table mc.SUBSYS_CODE
  add constraint PK_SUBSYS_CODE primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
create unique index mc.IDX_SUBSYSCODE_EXTNUM on mc.SUBSYS_CODE (EXTEND_NUMBER)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table SYS_CONFIG
prompt =========================
prompt
create table mc.SYS_CONFIG
(
  config_key   VARCHAR2(200) not null,
  config_value VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.SYS_CONFIG
  is '系统使用的配置数据';
comment on column mc.SYS_CONFIG.config_key
  is '配置项, InitedData(是否已经初始化数据),0:未初始化,1:已经初始化，已经初始化则不再初始化, PROHIBITEDWORD_POWER, 0:关闭违禁词, 1:开启违禁词';
comment on column mc.SYS_CONFIG.config_value
  is '配置值';
alter table mc.SYS_CONFIG
  add constraint PK_SYS_CONFIG primary key (CONFIG_KEY)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TASK_INFO
prompt ========================
prompt
create table mc.TASK_INFO
(
  id                    VARCHAR2(200) not null,
  org_id                VARCHAR2(200),
  name                  VARCHAR2(200),
  file_url              VARCHAR2(2000),
  content               VARCHAR2(3000),
  type                  NUMBER(10),
  send_status           NUMBER(1),
  reply                 NUMBER(1),
  signature             NUMBER(1),
  prior_id              NUMBER(10),
  time_task             NUMBER(1),
  extend_code           NUMBER(1),
  sub_time_task         NUMBER(19),
  valid_mobile_count    NUMBER(19),
  run_time              DATE,
  create_time           DATE,
  invalid_mobile_count  NUMBER(19),
  user_id               VARCHAR2(200),
  status                NUMBER(10),
  sms_user_type         NUMBER(10),
  send_count            NUMBER(19),
  end_time              DATE,
  client_group          VARCHAR2(2000),
  batch_id              VARCHAR2(2000),
  untreated_mobile      CLOB,
  excel_name            VARCHAR2(2000),
  lose_reason           VARCHAR2(1000),
  original_mobile_count NUMBER(19) default 0,
  black_num             NUMBER(19) default 0,
  prohibited_word_num   NUMBER(19) default 0,
  repeat_num_count      NUMBER(19) default 0,
  illegal_num_count     NUMBER(19) default 0,
  repeat_num            CLOB,
  illegal_num           CLOB,
  report_all_count      NUMBER(19) default 0,
  report_success_count  NUMBER(19) default 0,
  report_failure_count  NUMBER(19) default 0,
  report_unknown_count  NUMBER(19) default 0,
  granter_id            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column mc.TASK_INFO.id
  is '主键';
comment on column mc.TASK_INFO.org_id
  is '机构id';
comment on column mc.TASK_INFO.name
  is '任务名';
comment on column mc.TASK_INFO.file_url
  is '保存模板发送的文件位置';
comment on column mc.TASK_INFO.content
  is '短信内容';
comment on column mc.TASK_INFO.type
  is '发送类型 0:短信 1:彩信';
comment on column mc.TASK_INFO.send_status
  is '发送状态';
comment on column mc.TASK_INFO.signature
  is '用户签名';
comment on column mc.TASK_INFO.prior_id
  is '优先级';
comment on column mc.TASK_INFO.time_task
  is '是否是定时任务 0:不是 1:是';
comment on column mc.TASK_INFO.extend_code
  is '用户扩展号';
comment on column mc.TASK_INFO.valid_mobile_count
  is '有效的电话号码总条数';
comment on column mc.TASK_INFO.run_time
  is '任务启动时间';
comment on column mc.TASK_INFO.create_time
  is '任务创建时间';
comment on column mc.TASK_INFO.invalid_mobile_count
  is '无效的电话号码总条数';
comment on column mc.TASK_INFO.user_id
  is '记录发送的用户id';
comment on column mc.TASK_INFO.status
  is '发送状态 0:未启动 1:发送中 2:暂停 3:停止 4:发送结束';
comment on column mc.TASK_INFO.sms_user_type
  is '用户类型';
comment on column mc.TASK_INFO.send_count
  is '发送总条数';
comment on column mc.TASK_INFO.end_time
  is '任务结束时间';
comment on column mc.TASK_INFO.client_group
  is '群组的id';
comment on column mc.TASK_INFO.batch_id
  is '批量发送短信的批次号';
comment on column mc.TASK_INFO.untreated_mobile
  is '未处理的号码,用于保存普通发送的号码';
comment on column mc.TASK_INFO.excel_name
  is '保存批量发送的excel_name';
comment on column mc.TASK_INFO.lose_reason
  is '发送失败原因';
comment on column mc.TASK_INFO.report_all_count
  is '返回状态报告总条数';
comment on column mc.TASK_INFO.report_success_count
  is '返回状态报告成功条数';
comment on column mc.TASK_INFO.report_failure_count
  is '返回状态报告失败条数';
comment on column mc.TASK_INFO.report_unknown_count
  is '没有返回状态报告条数';
comment on column mc.TASK_INFO.granter_id
  is '短信委托人';
alter table mc.TASK_INFO
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEMP_NOT_SEND
prompt ============================
prompt
create table mc.TEMP_NOT_SEND
(
  mobile VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDXXXX on mc.TEMP_NOT_SEND (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEMP_TABLE_TEST
prompt ==============================
prompt
create table mc.TEMP_TABLE_TEST
(
  create_sql  CLOB,
  create_time DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEST_MOBILE
prompt ==========================
prompt
create table mc.TEST_MOBILE
(
  mobile VARCHAR2(20),
  times  NUMBER
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TEST_STRM
prompt ========================
prompt
create table mc.TEST_STRM
(
  id   NUMBER(2) not null,
  name VARCHAR2(50)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.TEST_STRM
  add primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table TMP_MOBILE_MEDIA
prompt ===============================
prompt
create table mc.TMP_MOBILE_MEDIA
(
  mobile_to VARCHAR2(20),
  sys_time  TIMESTAMP(6),
  status    NUMBER,
  report    VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.IDX_TMP_MOBILE_MEDIA_MOBILE on mc.TMP_MOBILE_MEDIA (MOBILE_TO)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table UNIT_PRICE_INFO
prompt ==============================
prompt
create table mc.UNIT_PRICE_INFO
(
  price_id          VARCHAR2(200) not null,
  organization_id   VARCHAR2(200) not null,
  unit_price        NUMBER(5,3) not null,
  start_date        DATE not null,
  end_date          DATE,
  create_date       DATE default sysdate,
  effective         NUMBER,
  remark            VARCHAR2(200),
  organization_name VARCHAR2(200),
  gw_type           NUMBER(1) default 0,
  biz_type          NUMBER(1) default 0,
  channel_id        NUMBER(5) default 0
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.UNIT_PRICE_INFO
  is '机构价格信息表';
comment on column mc.UNIT_PRICE_INFO.price_id
  is 'ID';
comment on column mc.UNIT_PRICE_INFO.organization_id
  is '机构组id';
comment on column mc.UNIT_PRICE_INFO.unit_price
  is '组单价';
comment on column mc.UNIT_PRICE_INFO.start_date
  is '起始日期';
comment on column mc.UNIT_PRICE_INFO.end_date
  is '终止日期';
comment on column mc.UNIT_PRICE_INFO.create_date
  is '创建时间';
comment on column mc.UNIT_PRICE_INFO.effective
  is '是否历史单价   0：非历史单价；1：历史单价';
comment on column mc.UNIT_PRICE_INFO.remark
  is '备注';
comment on column mc.UNIT_PRICE_INFO.organization_name
  is '机构组名称';
comment on column mc.UNIT_PRICE_INFO.gw_type
  is '号段类型。0-全网路，1-移动号段，2-联通号段，3-小灵通号段';
comment on column mc.UNIT_PRICE_INFO.biz_type
  is '业务类型。0-普通短信业务，1-彩信业务，2-email业务';
comment on column mc.UNIT_PRICE_INFO.channel_id
  is '发送通道。0-所有通道';
alter table mc.UNIT_PRICE_INFO
  add constraint UNIT_PRICE_INFO_PK primary key (PRICE_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_COMMON_CONFIG
prompt =================================
prompt
create table mc.USER_COMMON_CONFIG
(
  id                      NUMBER(18) not null,
  user_id                 VARCHAR2(200),
  black_level             CHAR(1) default '0' not null,
  is_sensitive_time_delay CHAR(1) default '0'
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_COMMON_CONFIG
  is '用户公共属性配置表';
comment on column mc.USER_COMMON_CONFIG.id
  is '主键';
comment on column mc.USER_COMMON_CONFIG.user_id
  is '用户UUID';
comment on column mc.USER_COMMON_CONFIG.black_level
  is '黑名单级别表：0：只检测BLACK黑名单；1：检测BLACK和BLACK_CSMD黑名单；2：检测BLACK和BLACK_CSMD、BLACK_ZHUOYUE黑名单';
comment on column mc.USER_COMMON_CONFIG.is_sensitive_time_delay
  is '是否对敏感时间延迟：1：对敏感时间延迟；0：对敏感时间不延迟';
alter table mc.USER_COMMON_CONFIG
  add constraint PK_USER_COMMON_CONFIG primary key (ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.USER_COMMON_CONFIG
  add constraint FK_USER_COM_REFERENCE_USER_INF foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);

prompt
prompt Creating table USER_CONFIG_INFO
prompt ===============================
prompt
create table mc.USER_CONFIG_INFO
(
  config_id  VARCHAR2(200) not null,
  channel_id VARCHAR2(200),
  key        VARCHAR2(50),
  value      VARCHAR2(100),
  remark     VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_CONFIG_INFO
  is '用户配置';
comment on column mc.USER_CONFIG_INFO.config_id
  is '配置编号';
comment on column mc.USER_CONFIG_INFO.channel_id
  is '通道编号';
comment on column mc.USER_CONFIG_INFO.key
  is '关键字';
comment on column mc.USER_CONFIG_INFO.value
  is '值';
comment on column mc.USER_CONFIG_INFO.remark
  is '备注';
alter table mc.USER_CONFIG_INFO
  add constraint PK_USER_CONFIG_INFO primary key (CONFIG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table USER_CONFIG_KEY_INFO
prompt ===================================
prompt
create table mc.USER_CONFIG_KEY_INFO
(
  config_key_id   VARCHAR2(200) not null,
  config_key_name VARCHAR2(50),
  remark          VARCHAR2(200),
  config_key_type VARCHAR2(2)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table mc.USER_CONFIG_KEY_INFO
  is '用户配置关键字字典表';
comment on column mc.USER_CONFIG_KEY_INFO.config_key_id
  is '配置关键字编号';
comment on column mc.USER_CONFIG_KEY_INFO.config_key_name
  is '关键字';
comment on column mc.USER_CONFIG_KEY_INFO.remark
  is '备注';
comment on column mc.USER_CONFIG_KEY_INFO.config_key_type
  is '关键字类型, -1:全通道配置, 1:单通道配置';
alter table mc.USER_CONFIG_KEY_INFO
  add constraint PK_USER_CONFIG_KEY_INFO primary key (CONFIG_KEY_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table USER_SEND_GRANT
prompt ==============================
prompt
create table mc.USER_SEND_GRANT
(
  id           VARCHAR2(100) not null,
  grantee_id   VARCHAR2(100) not null,
  granter_id   VARCHAR2(100) not null,
  grant_type   VARCHAR2(10) not null,
  grant_remark VARCHAR2(200),
  system_time  DATE default sysdate
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table mc.USER_SEND_GRANT
  is '用户代发授权表';
comment on column mc.USER_SEND_GRANT.id
  is 'id';
comment on column mc.USER_SEND_GRANT.grantee_id
  is '被授权人id 即短信实际发送人';
comment on column mc.USER_SEND_GRANT.granter_id
  is '授权人id 即短信实际所属者';
comment on column mc.USER_SEND_GRANT.grant_type
  is '操作类型。分为为机构代发和为个人代发。授权人id受该字段影响分别可以是机构id和用户id。 机构用1表示，用户用0表示';
comment on column mc.USER_SEND_GRANT.grant_remark
  is '备注信息';
comment on column mc.USER_SEND_GRANT.system_time
  is '授权关系的日期';
alter table mc.USER_SEND_GRANT
  add constraint PK_USER_SEND_GRANT primary key (ID)
  disable;

prompt
prompt Creating table VIEW_CHANNEL_SWITCH_LOG
prompt ======================================
prompt
create table mc.VIEW_CHANNEL_SWITCH_LOG
(
  pid                   VARCHAR2(200) not null,
  original_channel_id   NUMBER(5),
  original_channel_name VARCHAR2(500),
  dest_channel_id       NUMBER(5),
  dest_channel_name     VARCHAR2(500),
  match_org_id          VARCHAR2(200),
  match_org_name        VARCHAR2(200),
  match_user_id         VARCHAR2(200),
  match_user_name       VARCHAR2(200),
  match_quantity        NUMBER(19),
  match_mobile          VARCHAR2(100),
  match_batch_id        VARCHAR2(200),
  match_content         VARCHAR2(200),
  match_operator        NUMBER(3),
  direction             NUMBER(3),
  operator_id           VARCHAR2(200),
  operator_user_name    VARCHAR2(200),
  operation_date        DATE,
  operation_result      NUMBER(3),
  operation_result_desc VARCHAR2(500),
  belong_pid            VARCHAR2(200)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.VIEW_CHANNEL_SWITCH_LOG
  add primary key (PID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table VIP_SPECIAL_INFO
prompt ===============================
prompt
create table mc.VIP_SPECIAL_INFO
(
  vip_special_info_id NUMBER(18) not null,
  send_msg            VARCHAR2(600),
  status              NUMBER(18),
  subscribe_number    VARCHAR2(50),
  user_id             VARCHAR2(50),
  user_name           VARCHAR2(50),
  organization_id     VARCHAR2(50),
  organization_name   VARCHAR2(50),
  create_time         DATE,
  audit_time          DATE,
  send_time           DATE,
  product_id          VARCHAR2(600)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.VIP_SPECIAL_INFO
  add constraint PK_VIP_SPECIAL_INFO primary key (VIP_SPECIAL_INFO_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WHITE_INFO
prompt =========================
prompt
create table mc.WHITE_INFO
(
  org_id                VARCHAR2(50) not null,
  user_id               VARCHAR2(200) not null,
  mobile                VARCHAR2(50) not null,
  user_name             VARCHAR2(50),
  created_stamp         DATE,
  created_tx_stamp      DATE default sysdate,
  last_updated_stamp    DATE,
  last_updated_tx_stamp DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.WHITE_INFO
  add primary key (ORG_ID, USER_ID, MOBILE)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;
alter table mc.WHITE_INFO
  add constraint FK2E115F24D5594142 foreign key (USER_ID)
  references mc.USER_INFO (USER_ID);

prompt
prompt Creating table WHITE_JOB_CONFIG
prompt ===============================
prompt
create table mc.WHITE_JOB_CONFIG
(
  org_id             VARCHAR2(50) not null,
  do_congratulations VARCHAR2(20),
  action_time        DATE
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255;
alter table mc.WHITE_JOB_CONFIG
  add primary key (ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WHITE_ORG_CONFIG
prompt ===============================
prompt
create table mc.WHITE_ORG_CONFIG
(
  org_id   VARCHAR2(50) not null,
  mo_owner VARCHAR2(12)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table mc.WHITE_ORG_CONFIG
  add primary key (ORG_ID)
  using index 
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table Z_BOFENG_ALL
prompt ===========================
prompt
create table mc.Z_BOFENG_ALL
(
  mobile VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index mc.Z_BF_M_ALL on mc.Z_BOFENG_ALL (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table Z_BOFENG_MOBILE
prompt ==============================
prompt
create table mc.Z_BOFENG_MOBILE
(
  mobile VARCHAR2(20)
)
tablespace MC
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
create index mc.Z_BF_M_M on mc.Z_BOFENG_MOBILE (MOBILE)
  tablespace MC
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence HIBERNATE_SEQUENCE
prompt ====================================
prompt
create sequence mc.HIBERNATE_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 36022
increment by 1
cache 20;

prompt
prompt Creating sequence MMS_SEND_SEQ
prompt ==============================
prompt
create sequence mc.MMS_SEND_SEQ
minvalue 10000
maxvalue 9999999999999999999
start with 100000
increment by 1
cache 20;

prompt
prompt Creating sequence MMS_STOCK_PAPER_ID_SEQUENCE
prompt =============================================
prompt
create sequence mc.MMS_STOCK_PAPER_ID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence PERMIT_WORD_SEQ
prompt =================================
prompt
create sequence mc.PERMIT_WORD_SEQ
minvalue 1
maxvalue 9999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence PRODUCT_SEQ
prompt =============================
prompt
create sequence mc.PRODUCT_SEQ
minvalue 100000
maxvalue 999999999999999999999999999
start with 100000
increment by 1
cache 2;

prompt
prompt Creating sequence PROHIBIT_WORD_SEQ
prompt ===================================
prompt
create sequence mc.PROHIBIT_WORD_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 10
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_CHANNEL_USER
prompt ==================================
prompt
create sequence mc.SEQ_CHANNEL_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 4012
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MMSSCHEDULE
prompt =================================
prompt
create sequence mc.SEQ_MMSSCHEDULE
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MMS_SEND
prompt ==============================
prompt
create sequence mc.SEQ_MMS_SEND
minvalue 1
maxvalue 9999999999999999999999999999
start with 181
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NITICE_USER
prompt =================================
prompt
create sequence mc.SEQ_NITICE_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 1311
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_NOTICE
prompt ============================
prompt
create sequence mc.SEQ_NOTICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 282
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORDER_INFO
prompt ================================
prompt
create sequence mc.SEQ_ORDER_INFO
minvalue 0
maxvalue 999999999999999
start with 604
increment by 1
nocache;

prompt
prompt Creating sequence SEQ_ORGANIZATION
prompt ==================================
prompt
create sequence mc.SEQ_ORGANIZATION
minvalue 1
maxvalue 9999999999999999999999999999
start with 562
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ORG_CONFIG
prompt ================================
prompt
create sequence mc.SEQ_ORG_CONFIG
minvalue 1
maxvalue 9999999999999999999999999999
start with 481
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PAYMENT_RECORD
prompt ====================================
prompt
create sequence mc.SEQ_PAYMENT_RECORD
minvalue 1
maxvalue 9999999999999999999999999999
start with 3026
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE
prompt ==========================
prompt
create sequence mc.SEQ_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 901
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ROLE_PERMISSION
prompt =====================================
prompt
create sequence mc.SEQ_ROLE_PERMISSION
minvalue 1
maxvalue 9999999999999999999999999999
start with 681
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_RULE_ITEM
prompt ===============================
prompt
create sequence mc.SEQ_RULE_ITEM
minvalue 1
maxvalue 999999999999999999999999999
start with 1869
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_TASKINFO
prompt ==============================
prompt
create sequence mc.SEQ_TASKINFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 18847
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_USERINFO
prompt ==============================
prompt
create sequence mc.SEQ_USERINFO
minvalue 1
maxvalue 9999999999999999999999999999
start with 841
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_ACCOUNT_CHANNEL_SEQ
prompt =========================================
prompt
create sequence mc.SGW_ACCOUNT_CHANNEL_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 161
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_ACCOUNT_INFO_SEQ
prompt ======================================
prompt
create sequence mc.SGW_ACCOUNT_INFO_SEQ
minvalue 1
maxvalue 99999999999999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_CUSTOMER_SEQ
prompt ==================================
prompt
create sequence mc.SGW_CUSTOMER_SEQ
minvalue 1
maxvalue 9999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_MO_TASK_SEQ
prompt =================================
prompt
create sequence mc.SGW_MO_TASK_SEQ
minvalue 1
maxvalue 99999999999999999999999
start with 561
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_REPORT_TASK_SEQ
prompt =====================================
prompt
create sequence mc.SGW_REPORT_TASK_SEQ
minvalue 1
maxvalue 99999999999999999999
start with 6838961
increment by 1
cache 20;

prompt
prompt Creating sequence SGW_SIGNATURE_POOL_SEQ
prompt ========================================
prompt
create sequence mc.SGW_SIGNATURE_POOL_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 141
increment by 1
cache 20;

prompt
prompt Creating sequence SMS_RECEIVE_SEQ
prompt =================================
prompt
create sequence mc.SMS_RECEIVE_SEQ
minvalue 10000
maxvalue 9999999999999999999
start with 100060
increment by 1
cache 20;

prompt
prompt Creating sequence SMS_SEND_SEQ
prompt ==============================
prompt
create sequence mc.SMS_SEND_SEQ
minvalue 5000000
maxvalue 9999999999999999999
start with 5000000
increment by 1
cache 20;

prompt
prompt Creating sequence USER_COMMON_CONFIG_SEQ
prompt ========================================
prompt
create sequence mc.USER_COMMON_CONFIG_SEQ
minvalue 1
maxvalue 999999999999999999999
start with 221
increment by 1
cache 20;

prompt
prompt Creating sequence VIP_SPECIAL_INFO_ID_SEQUENCE
prompt ==============================================
prompt
create sequence mc.VIP_SPECIAL_INFO_ID_SEQUENCE
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating view BLACK_USER_ORG
prompt ============================
prompt
create or replace view mc.black_user_org as
select b.black_id,b.black_mobile,b.black_desc,b.black_type,b.oper_userid,b.oper_orgid,b.group_id,u.user_name as oper_userName, o.user_name as org_name,oper_org.user_name as oper_org_name
                     from black b left join user_info u on b.oper_userid = u.user_id left join  organization o on b.group_id = o.user_id left join organization oper_org on b.oper_orgid = oper_org.user_id;

prompt
prompt Creating view CUSTOMER_GROUP_USER_VIEW
prompt ======================================
prompt
create or replace view mc.customer_group_user_view as
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
  left join user_info u on g.user_id = u.user_id;

prompt
prompt Creating view CUSTOMER_USER_VIEW
prompt ================================
prompt
create or replace view mc.customer_user_view as
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
  left join user_info u on g.user_id = u.user_id;

prompt
prompt Creating view GROUP_INFO_VIEW
prompt =============================
prompt
create or replace view mc.group_info_view as
select "GROUP_ID","USER_ID","GROUP_NAME","GROUP_REMARK","CREATE_TIME","MODIFY_TIME","ORGANIZATION_ID","CREATE_USER_ID","IS_SHARE" from group_info a where a.group_id in(select c.group_id from group_info c group by c.group_id having count(c.group_id)=1);

prompt
prompt Creating view PAYMENT_RECORD_USER_ORG
prompt =====================================
prompt
create or replace view mc.payment_record_user_org as
select
pr.payment_id,pr.user_id,pr.user_type,(case
when  pr.user_type='1' then o.user_name
when pr.user_type='0' then ui.user_name
end) user_name,pr.payment_time,pr.payment_money,pr.payment_type,pr.payment_quota,pr.quota_type,(select u.user_name from user_info u where u.user_id=pr.operator_id) operator_id ,
pr.is_online,pr.recharge_explain,pr.is_success
 from payment_record pr left join user_info ui on pr.user_id=ui.user_id left join organization o on pr.user_id=o.user_id;

prompt
prompt Creating view USER_ORG_DATA
prompt ===========================
prompt
create or replace view mc.user_org_data as
select o.user_name as user_name,u.nick_name as nick_name,o.pay_mode as pay_mode,
u.mobile as mobile,o.user_balance as user_balance,o.user_name as org_name,o.user_id as user_id,o.parentid as parentid,
o.user_quota as sms_quota,o.mms_quota as mms_quota,o.pay_type as pay_type,
u.user_type as user_type,u.user_stat as user_stat from organization o inner join  user_info u on o.user_id=u.organization_id;

prompt
prompt Creating view VIEW_CHANNEL_RULE_SET_ITEM
prompt ========================================
prompt
create or replace view mc.view_channel_rule_set_item as
select  u.user_name username,o.user_name orgName,s.RULE_SET_ITEM_NAME ruleSetItemName,s.SALIENCE,s.is_wappush,s.default_mobile_channel_id,s.default_union_channel_id,
        s.default_dx_channel_id,s.rule_set_item_id,s.org_id,s.USER_ID
 from SMS_CHANNEL_RULE_SET_ITEM s
    left join organization o on o.user_id = s.org_id
    left join user_info u on u.user_id = s.user_id;

prompt
prompt Creating view VIEW_CMPP_ACCOUNT
prompt ===============================
prompt
create or replace view mc.view_cmpp_account as
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
      sc.sys_time                   sys_time,
      sc.trustedaccount             trustedAccount
FROM user_info u
left join sgw_account_info sc on sc.user_id = u.user_id
left join user_common_config ucc on ucc.user_id = u.user_id
LEFT JOIN ORGANIZATION org ON org.user_id = u.organization_id
--where u.USER_STAT = 1 --有效
with read only;

prompt
prompt Creating view VIEW_CMPP_ACCOUNT_INFO
prompt ====================================
prompt
create or replace view mc.view_cmpp_account_info as
select acc."SGW_ID",acc."TRUSTEDACCOUNT",acc."USER_ID",acc."ACCOUNT_PASS",acc."REGISTED_IP",acc."PRIOR_ID",acc."FLUX_LIMIT",acc."MT_WORKER_NUM",acc."MT_CACHE_NUM",acc."SERVER_ACTIVE_TEST",acc."IS_CHANNEL_ACCOUNT",acc."SIGNATURE_TYPE",acc."CHECK_PROHIBITEDWORD",acc."COMMENTS",acc."SYS_TIME",
       us.user_name


from sgw_account_info acc left join user_info us on acc.user_id=us.user_id;

prompt
prompt Creating view VIEW_ORANIZATION
prompt ==============================
prompt
CREATE OR REPLACE VIEW mc.VIEW_ORANIZATION AS
SELECT org.user_id              org_id,     --机构编号
       org.user_name            org_name,    --机构名称
       org.parentid             org_parentid --机构父节点
 FROM ORGANIZATION org
 where org.user_stat = 1    --有效（渠道：1有效；其他：0：有效）
with read only;

prompt
prompt Creating view VIEW_RT_RECEIVE_REPORT_URL
prompt ========================================
prompt
create or replace view mc.view_rt_receive_report_url as
select
       r.url_id,r.user_id,u.user_name as user_name,r.push_channel,r.format_str,r.push_url,r.push_url_type,r.create_time,r.status,r.is_certification,r.user_name as client_user_name,r.pass_word as client_pass_word,r.uanswer_times,r.next_push_time
    from RT_RECEIVE_REPORT_URL r inner join  USER_INFO u on r.user_id =u.user_id;

prompt
prompt Creating view VIEW_USER_CUSTOMER_ORG
prompt ====================================
prompt
CREATE OR REPLACE VIEW mc.VIEW_USER_CUSTOMER_ORG AS
SELECT customer."CUSTOMER_ID",customer."CUSTOMER_NAME",customer."P_CUSTOMER_ID",customer."USER_ID",customer."ORG_ID",customer."SUB_EXTEND_NUMBER",customer."COMMENTS",customer."CUSTOMER_STATUS",customer."SYS_TIME",
       userinfo.user_name           user_name,      --用户账号
       org.user_name                org_name,       --机构名称
       org.eng_signature            eng_signature,  --英文签名
       org.chn_signature            chn_signature   --中文签名
FROM sgw_customer customer
LEFT JOIN ORGANIZATION org ON org.user_id = customer.org_id   --机构表
LEFT JOIN User_Info userinfo ON userinfo.user_id = customer.user_id --用户表
with read only;

prompt
prompt Creating view VIEW_USER_SGW_SIGNATURE_POOL
prompt ==========================================
prompt
CREATE OR REPLACE VIEW mc.VIEW_USER_SGW_SIGNATURE_POOL AS
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
with read only;

prompt
prompt Creating view VIP_USER_ORG
prompt ==========================
prompt
create or replace view mc.vip_user_org as
select s."SMS_VIP_ID",s."SMS_VIP_NAME",s."SMS_VIP_GROUP_ID", s.sms_vip_mark,s.sms_vip_share,s."SMS_VIP_USER_ID",s."PHONE_NUMBER",u.user_name as user_name, o.user_name as org_name
                     from sms_vip s left join user_info u on s.sms_vip_user_id = u.user_id left join  organization o on s.sms_vip_group_id = o.user_id;

prompt
prompt Creating view V_SMS_ANALYZE
prompt ===========================
prompt
create or replace view mc.v_sms_analyze as
select o.user_name as org_name,u.user_name,sa.quantity,sa.stat_time,sa.org_id,sa.user_id,sa.status from sms_send_analyze sa
inner join organization o on o.user_id=sa.org_id
inner join user_info u on u.user_id=sa.user_id;

prompt
prompt Creating view V_CUSTOMER_MANAGER_ORG_DATA
prompt =========================================
prompt
create or replace view mc.v_customer_manager_org_data as
select o.user_name,o.user_id,us.nick_name,o.customer_manager_id,v.stat_time,sum(v.quantity) quantity,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel
 from organization o left join v_sms_analyze v on v.org_id=o.user_id
 left join org_config orgconfig on orgconfig.organization_id=o.user_id left join user_info us on o.customer_manager_id=us.user_id
 group by o.user_name,o.user_id,us.nick_name,o.customer_manager_id,v.stat_time,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel;

prompt
prompt Creating view V_NOTICE_USER
prompt ===========================
prompt
create or replace view mc.v_notice_user as
select  n."ID",n."CONTENT",n."UPLOAD_DATE",n."OPERATOR_ID",n."TITLE",n."VIABLE_DATE",
n."SEND_USER_TYPE",n."IS_PASTDUE",u.user_name,u.nick_name from
notice n inner join user_info u on n.operator_id=u.user_id;

prompt
prompt Creating view V_SEND_USER
prompt =========================
prompt
create or replace view mc.v_send_user as
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
 order by send.send_time desc nulls last;

prompt
prompt Creating view V_SEND_USER_ORG
prompt =============================
prompt
create or replace view mc.v_send_user_org as
select s."SEND_ID",s."MOBILE_TO",s."SEND_MSG",s."SP_SERV_NO",s."SYS_TIME",s."PRIOR_ID",s."PRE_SEND_TIME",s."SEND_STATUS",s."SEND_TIME",s."COM_RTN_TIME",s."ERR_MSG",s."REPORT",s."REPORT_TIME",s."CHANNEL_ID",s."MOBILE_COM",s."REMARK",s."USER_ID",s."SEQUENCE",s."MOBILE_QUANTITIES",s."RESEND_TIMES",s."SIGNATURE",s."USER_ORGANIZATION",s."BATCH_ID",s."MSG_TYPE",s."CONSUME_SEND_ID",s."IS_LONGSMS",s."IS_ORIGINAL_SMS",s."ORIGINALSMS_SENDID",s."CURRENT_PAGENO",s."ORIGINALSMS_TOTALPAGES",s."LONGSMS_TAG",s."LONGSMS_SPLITED",s."GW_SUBMIT_TIME",s."GW_DONE_TIME",s."UNIT_PRICE",s."RETURN_FEE",s."RECEIVE_ID",s."EXTRA_KEYWORD_NUM",u.user_name user_name,o.user_name org_name from send s left join user_info u on s.user_id=u.user_id left join organization o on s.user_organization=o.user_id;

prompt
prompt Creating view V_SMS_HOMEPAGE_USERSEND
prompt =====================================
prompt
create or replace view mc.v_sms_homepage_usersend as
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
          u.mobile;

prompt
prompt Creating view V_SMS_USER_BY_TIME
prompt ================================
prompt
create or replace view mc.v_sms_user_by_time as
select rownum id,u.user_id,u.nick_name,u.user_balance,u.user_quota,u.mms_quota,u.pay_mode,vs.org_id,u.email,
u.mobile,vs.quantity,vs.stat_time from user_info u
left join v_sms_analyze vs on u.user_id=vs.user_id;

prompt
prompt Creating view V_TASKINFO_USER
prompt =============================
prompt
create or replace view mc.v_taskinfo_user as
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
  LEFT join  user_info u on t.user_id= u.user_id;

prompt
prompt Creating package REPORT_RECKONING_PACKAGE
prompt =========================================
prompt
create or replace package mc.REPORT_RECKONING_PACKAGE is
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
*  业务说明：
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
CREATE OR REPLACE TYPE mc."TYP_TABELTYPE"                                          is object(channel_id varchar2(200),gw_type varchar2(200),send_quantity number(10))
/

prompt
prompt Creating type TYP_TABEL
prompt =======================
prompt
CREATE OR REPLACE TYPE mc."TYP_TABEL"                                          is table of TYP_TABELTYPE
/

prompt
prompt Creating function FNC_CON_STR_TO_TAB
prompt ====================================
prompt
CREATE OR REPLACE FUNCTION mc.FNC_CON_STR_TO_TAB(P_STR IN VARCHAR2) RETURN TYP_TABEL AS

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
create or replace function mc.FUN_JXDATE(p_date varchar2)
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
create or replace function mc.FUN_JXMDATE(p_date varchar2)
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
create or replace function mc.isnumeric    ( p_string in varchar2)
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
prompt Creating function TEST_CREATE_ROWID
prompt ===================================
prompt
create or replace function mc.test_create_rowId
return varchar2
is
row_id varchar2(100);
begin
  select to_char(sysdate,'yyyymmddhh24miss')||lpad(round(dbms_random.value(1,999999999)),9,0) into row_id from dual;
return row_id;
end;
/

prompt
prompt Creating procedure FEE_CALCULATE_ABLE
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE mc.FEE_CALCULATE_ABLE(P_USER_ID                 IN VARCHAR2,
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
create or replace procedure mc.insert_all_org_quota
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
create or replace procedure mc.insert_daily_reckoning_report is
    cursor c_consume is
     --分组查询send表的数据,按人分组,统计一人一天发送多少短信
        select
             t.user_id,
             trunc(t.send_time) send_time,
             t.mobile_com,
             t.send_status,
             t.channel_id,
             t.unit_price,
             sum(t.mobile_quantities) mobile_quantities,
              sum(nvl(t.unit_price,0)*t.mobile_quantities) totalFee,
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
create or replace procedure mc.INSERT_EXTRA_PAYMENTRECORD
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
CREATE OR REPLACE PROCEDURE mc.INSERT_HANDLE_DAILY_REPORT
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
prompt Creating procedure INSERT_MONTH_RECKONING_REPORT
prompt ================================================
prompt
CREATE OR REPLACE PROCEDURE mc.INSERT_MONTH_RECKONING_REPORT IS
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
CREATE OR REPLACE PROCEDURE mc.INSERT_MONTH_REMAIN_FEE IS
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
create or replace procedure mc.insert_org_quota
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
              and up.biz_type =0
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
              and up.biz_type =0
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
                                       --查询子机构余额大于零且协议价最早的子机构余额
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
prompt Creating procedure P_CHECK_LONGSMS_SIGANATURE
prompt =============================================
prompt
create or replace procedure mc.p_check_longsms_siganature is
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
                                execute immediate ('update send set send_status = 10 where send_id in (' || v_send_id || ')');
                                commit;
                             else
                               execute immediate ('update send set send_status = 10 where send_id in (' || v_send_id || ')');
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
  update send t set t.send_status = 6, t.err_msg = '检验签名超时' where t.send_status = -1 and t.sys_time < (sysdate - 60/60/24);
  commit;
end p_check_longsms_siganature;
/

prompt
prompt Creating procedure P_MMS_CHANNEL_ANALYZE
prompt ========================================
prompt
create or replace procedure mc.P_MMS_CHANNEL_ANALYZE(p_date varchar2)
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
            v_del_SQL :=  'delete from mms_channel_analyze mca where mca.stat_time >= to_number ( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

        --  execute immediate v_del_SQL;
           --删除三天前发送短信的统计的数据 结束
          -- commit;
           --预统计三天前发送短信数量

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
             --删除当天发送短信的统计的数据 开始
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1-1/24/60/60;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXMDATE(p_date); -- p_date 格式 ：2012-11-08 14:00:00
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
create or replace procedure mc.P_MMS_SEND_ANALYZE(p_date varchar2)
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
            v_del_SQL :=  'delete from mms_send_analyze msa where msa.stat_time = to_number( to_char(to_date(''' || v_sendTime ||'''),''YYYYMMDD''))';

           if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_del_SQL > ' || v_del_SQL );
           end if;

          execute immediate v_del_SQL;
           --删除三天前发送短信的统计的数据 结束
          -- commit;
           --预统计三天前发送短信数量
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
             --删除当天发送短信的统计的数据 开始
            v_sendTime := trunc(to_date(p_date,'yyyy-MM-dd hh24:mi:ss'));
            v_sendEndTime := v_sendTime+1-1/24/60/60;
            v_tempTime := v_sendTime;
            v_curTableName := FUN_JXMDATE(p_date); -- p_date 格式 ：2012-11-08 14:00:00
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
create or replace procedure mc.P_SEND_SMS_SUM
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
create or replace procedure mc.P_SMS_CHANNEL_ANALYZE(p_date varchar2)
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
create or replace procedure mc.P_SMS_RETURN_CONSUME_FEE
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
create or replace procedure mc.P_SMS_RETURN_FEE is
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
               and (s1.msg_type =any('common','batch','template','vercode') and  ti.time_task=0 or s1.msg_type =any('http','webservice'))     --是否定时任务：0不是 1是
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
create or replace procedure mc.P_SMS_SEND_ANALYZE(p_date varchar2)
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

           v_child_SQL := ' select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id  where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                  union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities from send ss left join organization o on ss.user_organization = o.user_id  where  ss.MOBILE_QUANTITIES = 1 and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')';

           while v_tempTime < trunc(sysdate)  loop
              v_curTableName := FUN_JXDATE(to_char(v_tempTime,'yyyy-MM-dd hh24:mi:ss'));
            if v_debug = 1 then
              DBMS_OUTPUT.PUT_LINE('v_curTableName > ' || v_curTableName );
            end if;

             begin
               select table_name into v_isHasTable from user_tables t where t.TABLE_NAME = v_curTableName;
               v_SQL_TMP := ' union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,o.parentid as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid not in (''0'',''1'')
                              union all select to_number(to_char(ss.sys_time,''YYYYMMDD''))  as sysdat,ss.user_organization as parent_org_id,ss.user_organization as org_id,ss.user_id,ss.send_status,ss.mobile_quantities  from ' || v_curTableName || ' ss left join organization o on ss.user_organization = o.user_id where  ss.MOBILE_QUANTITIES = 1  and ss.send_status in (0,1,5,6,7) and ss.sys_time >= to_date(''' || to_char(v_sendTime, 'YYYYMMDD') || ''', ''YYYYMMDD'') and o.parentid in (''0'',''1'')' ;
               Exception
                 when others then
                   v_SQL_TMP := ' ';
             end;
             v_child_SQL := v_child_SQL || v_SQL_TMP;
             v_tempTime := v_tempTime + 1;
           end loop;


             v_SQL := 'insert into sms_send_analyze(parent_org_id,org_id,user_id,status,stat_time,quantity) ';
             v_SQL := v_SQL || ' select t.parent_org_id,t.org_id, t.user_id,t.send_status, t.sysdat, sum(mobile_quantities) from
                   (' || v_child_SQL
                      || ' ) t  group by t.parent_org_id,t.org_id,t.user_id, t.sysdat, t.send_status ';

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

         execute immediate v_SQL;
         commit;
      end if;

end P_SMS_SEND_ANALYZE;
/

prompt
prompt Creating procedure P_SMS_UPDATE_TASKINFO
prompt ========================================
prompt
create or replace procedure mc.P_SMS_UPDATE_TASKINFO is
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
create or replace procedure mc.p_statics_smsquantity
 is
begin
  --删除原有数据
  delete from send_statics_quantity_temp;
  commit;
  --统计各个通道短信发送数量
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

  --统计短信接收数量
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

  --插入没有发送量的通道的数据
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
  --计算发送总和
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
  --计算接收总和
  update send_statics_quantity_temp set receive_quantity =
  (
         select sum(receive_quantity) from send_statics_quantity_temp where channel_id != -1
  )
  where channel_id = -1;

  --插入今天的最新记录
  insert into send_statics_quantity select * from send_statics_quantity_temp;
  commit;
end p_statics_smsquantity;
/

prompt
prompt Creating procedure QUERY_MMS_CHANNEL
prompt ====================================
prompt
create or replace procedure mc.QUERY_MMS_CHANNEL(
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
       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000); -- 拼接的基础SQL
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --处理查询开始日期
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
     if p_statType = 0 then --超级管理通道统计
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

     --拼执行SQL开始

      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);

     open mycursor for v_SQL ;

end QUERY_MMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_MMS_SEND
prompt =================================
prompt
create or replace procedure mc.QUERY_MMS_SEND(
               p_startTime in varchar2,--开始时间（年月日)
                  p_endTime in varchar2,--结束时间 （年月日)
                  p_statType in number, -- 统计类型 0 一般机构统计，1 渠道机构发送统计 2 超级管理员发送统计
                  p_userID in varchar2,--机构ID Admin 查所有
                  p_parentOrgID in varchar2,--机构ID 父机构
                  p_orgID in varchar2,--机构ID 具体机构
                  p_status in varchar2, --状态
                  mycursor out sys_refcursor--返回结果集游标
                 )
is
       v_startTime number(8);--存开始日期
       v_endTime number(8);--存结束日期
       v_debug number(1); --是否打调试信息, 0:不打 ；1：打
       v_SQL varchar2(8000); -- 拼接的基础SQL
begin
   v_SQL := '';
   v_debug := 0;
   v_startTime := 0;
   v_endTime := 0;

     --处理查询开始日期
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
     --拼执行SQL开始
     if p_statType = 0  then --一般机构统计
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

      if p_statType = 1  then --渠道机构统计
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

      if p_statType = 2  then --超级管理员机构统计
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
create or replace procedure mc.QUERY_MONTH_INFO_REPORT
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

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_MONTH_INFO_REPORT;
/

prompt
prompt Creating procedure QUERY_ORGSMS_MANAGER_AND_TIME
prompt ================================================
prompt
create or replace procedure mc.QUERY_ORGSMS_MANAGER_AND_TIME(p_date in varchar2,p_cm in varchar2,mycursor out sys_refcursor,p_pageSize number,p_page number,p_count out number,user_type in varchar2)
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
v_sql:='select t2.* from (select rownum r,o.user_name,o.user_id,us.nick_name,o.customer_manager_id,o.pay_mode,o.user_quota,o.mms_quota,o.user_balance,orgconfig.company_tel,(select vd.quantity from  v_sms_analyze vd where o.user_id = vd.org_id and vd.stat_time ='''||v_time||''' ) as quantity
 from organization o
 left join org_config orgconfig on orgconfig.organization_id = o.user_id left join user_info us on o.customer_manager_id = us.user_id
 where '||v_id||p_customer_manager||' and  rownum<='||p_page||'*'||p_pageSize||' and o.user_stat=1) t2 where t2.r>('||p_page||'-1)*'||p_pageSize||'';
dbms_output.put_line('v_sql:'||v_sql);
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
create or replace procedure mc.QUERY_PRICIPAL_SMS_SEND(
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

     dbms_output.put_line('v_SQL = ' || v_SQL);
     open mycursor for v_SQL ;

end QUERY_PRICIPAL_SMS_SEND;
/

prompt
prompt Creating procedure QUERY_RECKONING_INFO_REPORT
prompt ==============================================
prompt
create or replace procedure mc.QUERY_RECKONING_INFO_REPORT
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
create or replace procedure mc.QUERY_SMS_CHANNEL(
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
                  LEFT JOIN ORGANIZATION O ON SS.USER_ORGANIZATION = O.USER_ID
                  LEFT JOIN CHANNEL_INFO C ON SS.CHANNEL_ID = C.CHANNEL_ID
                 WHERE 1 = 1
                   AND SS.SYS_TIME >= TO_DATE(''' || v_char_startTime || ''', ''yyyy-MM-dd hh24:mi:ss'')
                   AND SS.SYS_TIME <  TO_DATE(''' || v_char_endTime   || ''', ''yyyy-MM-dd hh24:mi:ss'')
                   --第三方通道(不拆分)
                   AND ((SS.IS_ORIGINAL_SMS = 0 and C.LINK_MODE != all(''CMPP2'',''SGIP'',''SMGP3''))
                   --直连通道(需要拆分)
                    OR (SS.MOBILE_QUANTITIES=1 AND C.LINK_MODE = any(''CMPP2'',''SGIP'',''SMGP3'') and SS.SEND_STATUS =any(1,5,6)))
         ) T
         WHERE 1=1
         AND  T.SEND_STATUS =ANY(1,5,6)
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
                   left join organization o on sca.ORG_ID = o.user_id
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

/*      insert into temp_table_test (CREATE_SQL, CREATE_TIME)
      values (v_SQL,sysdate);*/
     --拼执行SQL开始

/*      DBMS_OUTPUT.PUT_LINE('v_SQL = ' || v_SQL);
*/
     open mycursor for v_SQL ;

end QUERY_SMS_CHANNEL;
/

prompt
prompt Creating procedure QUERY_SMS_RECEIVE
prompt ====================================
prompt
create or replace procedure mc.QUERY_SMS_RECEIVE(p_startTime    in varchar2, --开始时间（年月日)
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
create or replace procedure mc.QUERY_SMS_SEND(
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
    --  insert into temp_table_test (CREATE_SQL, CREATE_TIME)values (v_SQL,sysdate);
    /* dbms_output.put_line('v_SQL = ' || v_SQL);*/
     open mycursor for v_SQL ;

     exception
       when others then
     rollback;
end QUERY_SMS_SEND;
/

prompt
prompt Creating procedure UPDATE_SPLITED_LONGSMS
prompt =========================================
prompt
create or replace procedure mc.UPDATE_SPLITED_LONGSMS is
 ----联通、电信长短信
  CURSOR send_longcur IS
  SELECT *
         from send t
         where
              t.send_status = -2
              and rownum <= 5000
              and t.is_original_sms = 1
              and t.current_pageno = t.originalsms_totalpages;
  ----联通、电信的普通短信
  /* CURSOR send_shortcur IS
    SELECT *
         from send t
         where
              t.send_status = -2
              and rownum <= 5000
              and t.is_original_sms = 0
              and t.originalsms_totalpages=1;*/

  r_send            send%rowtype;
 -- s_send            send%rowtype;
  v_msg_total             varchar2(2000);--拼接的信息
  v_msg_count       number :=0;
  v_signature_ok    number :=0;
  v_has_total       number :=1; --是否完整的短信
  v_send_id         varchar2(2000);
  errormessage      exception;
  begin
     open send_longcur;
      --检查短信
      loop
          fetch send_longcur into r_send;
          exit when send_longcur%notfound;
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
                                where     t.send_status = -2
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
            --截取最后5个字节看是否包含“回复TD退订关键字”
            if instr(substr(v_msg_total,length(v_msg_total)-5),'回复TD退订')>0
              then
               --更新长短信的状态为-1
               execute immediate ('update send set send_status = -1 where send_id in (' || v_send_id || ')');
               dbms_output.put_line('更新的短信记录为---：'||'update send set send_status = -1 where send_id in (' || v_send_id || ')');
              commit;
            else
              --长短信不包含‘回复TD退订’更新状态为6
              dbms_output .put_line('不含回复TD退订的长短信---:'||'update send set send_status = 6, report = ''UD:0001'',err_msg = ''不含回复TD退订'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               execute immediate ('update send set send_status = 6, report = ''UD:0001'',err_msg = ''不含回复TD退订'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               dbms_output .put_line('不含回复TD退订的长短信---:'||'update send set send_status = 6, report = ''UD:0001'',err_msg = ''不含回复TD退订'' , report_time = sysdate where send_id in (' || v_send_id || ')');
               commit;
            end if;
           end if;
           -- exit when send_longcur%notfound;
        end loop;
      close send_longcur;
     /* open send_shortcur;
        loop 
          fetch send_shortcur into s_send;
           exit when send_shortcur%notfound;
            if  instr(substr(s_send.send_msg,length(s_send.send_msg)-5),'回复TD退订')>0
              then
              --更新短信状态为-1
              update send set send_status = -1 where send_id = s_send.send_id;
              dbms_output.put_line('更新的短信记录为---：'||'update send set send_status = -1 where send_id ='||s_send.send_id);
              commit;
             else
               update send set send_status = 6 ,report = 'UD:0001',err_msg='不含回复TD退订',report_time=sysdate where send_id = s_send.send_id;
               dbms_output .put_line('不含回复TD退订的长短信---:'||'update send set send_status = 6, report = ''UD:0001'',err_msg = ''不含回复TD退订'' , report_time = sysdate where send_id ='||s_send.send_id);
               commit;
             end if;
           
        end loop;
      close send_shortcur;*/
          
  --更新超时的短信,60分钟之前的
  update send t set t.send_status = 6, t.err_msg = '检验联通电信短信超时' where t.send_status = -2 and t.sys_time < (sysdate - 60/60/24);
  commit;
  
end UPDATE_SPLITED_LONGSMS;
/

prompt
prompt Creating procedure UPDATE_USER_STATE
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE mc.UPDATE_USER_STATE IS
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
CREATE OR REPLACE TRIGGER mc.trigger_afterdelete_reporttask

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
CREATE OR REPLACE TRIGGER mc.trigger_afterdelete_rt_receive
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
CREATE OR REPLACE TRIGGER mc.trigger_afterdelete_rt_report
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
CREATE OR REPLACE TRIGGER mc.trigger_afterinsert_receive --插入短信上行, 填写相应的数据
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
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_AFTER_UPDATE_SEND" 
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
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_BEFOREINSERT_SEND" 
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
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_INSERT_RECEIVE"  --插入短信上行, 填写相应的数据
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
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_INSERT_SMS_REPORT"  --插入短信状态报告, 自动修改短信的状态和补全状态报告的其他信息
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
create or replace trigger "MC"."TRIGGER_ORGANIZATION"  

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
CREATE OR REPLACE TRIGGER mc."TRIGGER_RECEIVE_BEFORINSERT" --插入短信上行, 填写相应的数据
BEFORE INSERT ON SMS_RECEIVE
For each row

DECLARE
  --查询特服号
  CURSOR SPNUMBER_CUR IS
    --SELECT * FROM SMS_SPNUMBER ORDER BY SPNUMBER ASC;
    SELECT * FROM SMS_SPNUMBER ORDER BY length(SPNUMBER) desc;
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
/*  54,55,56都不支持扩展码
  54:广州聚乐 ;   55,56:安徽智明通信*/
  if :new.channel_id in (54,55,56,59) then
      select a.user_id, a.user_organization into :new.USER_ID,:new.ORG_ID
        from (select s.user_id,
                     s.user_organization,
                     row_number() over(order by s.sys_time desc) rn
                from send s
               where s.mobile_to = :new.MOBILE_FROM
                 and s.sys_time > sysdate - 14
                 and s.channel_id in (54, 55, 56,59)) a
       where rn = 1;
  end if;

  EXT := '';
  --查询对应的短信信息, 填写系统编号SYS_ID, MSG_ID

  --查询特服号, 设置扩展号,如果有特服号，那么sp就是出去特服号的上行号码
  FOR S IN SPNUMBER_CUR LOOP
    IF SUBSTR(:NEW.SP_NUM ,0, LENGTH(S.SPNUMBER)) = S.SPNUMBER THEN
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
        for i IN Reverse 1..5 LOOP
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
    IF INSTR(TRIM(:NEW.RECEIVE_MSG), TRIM(S.KEY_WORD), 1, 1) > 0 THEN
      --以退订关键字起始的短信
      INSERT INTO BLACK
        (BLACK_ID, BLACK_MOBILE, BLACK_DESC, BLACK_TIME)
      VALUES
        (SYS_GUID(),
         :NEW.MOBILE_FROM,
         '该客户上行退订关键字，系统于' || TO_CHAR(SYSDATE, 'yyyy-MM-dd hh24:mi:ss') ||
         '自动将该客户加入黑名单',
         SYSDATE);
          exit;
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
CREATE OR REPLACE TRIGGER "MC"."TRIGGER_REPORT_SEND" --插入短信状态报告, 填写相应的数据
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
                inner JOIN sgw_account_info cmpp ON ac.sgw_id = cmpp.sgw_id
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
create or replace trigger "MC"."TRIGGER_WHITE_ORG_CONFIG"  

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


spool off
