--����
CREATE TABLE DN_ARTICLES (
ARTICLEID   VARCHAR2(100)     NOT NULL  , 
TITLE   VARCHAR2(100)  NOT NULL ,
PRIMARY KEY (ARTICLEID)
);
--ɾ����
drop table DN_ARTICLES
--��������SEQUENCE
CREATE SEQUENCE D_ARTICLE_ID                                 
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE;
--ɾ������SEQUENCE
drop SEQUENCE D_ARTICLE_ID

--������(��������Զ����������Ĵ�����)
--���������ʱ���������Ϊ�գ��Զ���������
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
--ɾ��������
drop trigger TRIG_ARTICLE_ID

insert into DN_ARTICLES values(test_ret_emp_sal,'123456') 
select * from DN_ARTICLES


--����Ψһ�������sql
select to_char(sysdate,'yyyymmdd')||lpad(round(dbms_random.value(1,999999999)),9,0) row_id from dual;
--Ҳ�����������(��ǰʱ��������ʱ��������ǰ��λ����3λ�����),round������ȡ���������Χ(1,999999999)��lpad�����ǽ�ȡǰ��λ��,||��������
select 'hjhz'||lpad(to_char(systimestamp,'yyyymmddhh24missff'),16,0)||lpad(round(dbms_random.value(1,999999999)),3,0) row_id from dual;
--��ѯʱ��
select to_char(sysdate,'yyyymmddhh24miss') time from dual;
--ȡ��ǰ��������
select to_char(systimestamp,'yyyymmddhh24missff') time from dual;


--�������������ĺ���
create or replace function test_create_rowId
return varchar2
is
row_id varchar2(100);
begin
  select to_char(sysdate,'yyyymmddhh24miss')||lpad(round(dbms_random.value(1,999999999)),9,0) into row_id from dual;
return row_id;
end;
--��ѯ����
select test_create_rowId row_id from dual; 
--ɾ������ 
drop function test_create_rowId
