--建表
CREATE TABLE DN_ARTICLES (
ARTICLEID   VARCHAR2(100)     NOT NULL  , 
TITLE   VARCHAR2(100)  NOT NULL ,
PRIMARY KEY (ARTICLEID)
);
--删除表
drop table DN_ARTICLES
--创建自增SEQUENCE
CREATE SEQUENCE D_ARTICLE_ID                                 
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;
--删除序列SEQUENCE
drop SEQUENCE D_ARTICLE_ID

--触发器(跟表关联自动插入主键的触发器)
--插入表数据时，如果主键为空，自动生成主键
CREATE OR REPLACE TRIGGER TRIG_ARTICLE_ID
BEFORE INSERT ON DN_ARTICLES
FOR EACH ROW
DECLARE
-- LOCAL VARIABLES HERE
BEGIN
IF (:NEW.ARTICLEID IS NULL) THEN
    SELECT to_char(sysdate,'yyyymmdd')||lpad(round(dbms_random.value(1,999999999)),9,0) INTO :NEW.ARTICLEID FROM DUAL;
END IF;
END;
--删除触发器
drop trigger TRIG_ARTICLE_ID

insert into DN_ARTICLES values(test_ret_emp_sal,'123456') 
select * from DN_ARTICLES


--生成唯一随机数的sql
select to_char(sysdate,'yyyymmdd')||lpad(round(dbms_random.value(1,999999999)),9,0) row_id from dual;
--也能生成随机数(当前时间年月日时分秒毫秒的前几位，加3位随机数),round函数是取随机数，范围(1,999999999)，lpad函数是截取前几位的,||用于连接
select 'hjhz'||lpad(to_char(systimestamp,'yyyymmddhh24missff'),16,0)||lpad(round(dbms_random.value(1,999999999)),3,0) row_id from dual;
--查询时间
select to_char(sysdate,'yyyymmddhh24miss') time from dual;
--取当前毫秒日期
select to_char(systimestamp,'yyyymmddhh24missff') time from dual;


--创建生成主键的函数
create or replace function test_create_rowId
return varchar2
is
row_id varchar2(100);
begin
  select to_char(sysdate,'yyyymmddhh24miss')||lpad(round(dbms_random.value(1,999999999)),9,0) into row_id from dual;
return row_id;
end;
--查询函数
select test_create_rowId row_id from dual; 
--删除函数 
drop function test_create_rowId
