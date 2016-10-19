CREATE OR REPLACE TRIGGER TRIGGER_BEFORE_INSERT_SEND
  BEFORE INSERT ON SEND
  FOR EACH ROW
DECLARE
    M_COM VARCHAR2(10);       --用于截取前3为,帮助判断号段类型
    MOBILECOM VARCHAR2(10);   --标记位:标记本条号码是哪个号段(1,2,3)
BEGIN
    ---先判断号码是哪个号段
    --从开头第一个数字开始算起,有三种可能:1,8,0
    M_COM := SUBSTR(:NEW.MOBILE_TO,0,1);
    IF M_COM='1' THEN
          --截取前三个数字
          M_COM := SUBSTR(:NEW.MOBILE_TO,0,3);
          --移动号段
          IF M_COM in ('134','135','136','137','138','139','147','150','151','152','157','158','159','182','183','187','188','130') THEN
             MOBILECOM :='1';
             --联通号段
             elsif M_COM in ('131','132','155','156','185','186','133','153') then
                  MOBILECOM :='2';
             --电信号段
             elsif M_COM in ('180','189','184','145','181','154','169') then
                  MOBILECOM :='3';
          END IF;
      --如果号码以86开头,从第2个数字开始截取,截取3位数字
      ELSIF M_COM='8' THEN
          M_COM := SUBSTR(:NEW.MOBILE_TO,2,3);
          IF M_COM in ('134','135','136','137','138','139','147','150','151','152','157','158','159','182','183','187','188','130') THEN
             MOBILECOM :='1';
             elsif M_COM in ('131','132','155','156','185','186','133','153') then
                  MOBILECOM :='2';
             elsif M_COM in ('180','189','184','145','181','154','169') then
                  MOBILECOM :='3';
          END IF;
      /*--小灵通:电信
      ELSIF M_COM='0' THEN
         MOBILECOM :='3';*/
    END IF;

    --修改号段和通道
    IF MOBILECOM='1' THEN
       :new.MOBILE_COM :=1;
       :new.CHANNEL_ID :=6;
       ELSIF MOBILECOM='2' THEN
          :new.MOBILE_COM :=2;
          :new.CHANNEL_ID :=3;
       ELSIF MOBILECOM='3' THEN
          :new.MOBILE_COM :=3;
          :new.CHANNEL_ID :=4;
       ELSE
          :new.MOBILE_COM :=1;
          :new.CHANNEL_ID :=6;
    END IF;

  EXCEPTION
      WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE(SQLCODE||'---'||SQLERRM);
END;
/
