package com.hjhz.sms.taskExecutor;

import com.hjhz.sms.bizz.SendBizz;
import com.hjhz.sms.bizz.TaskExecutorSendSMS;
import com.hjhz.sms.data.dto.MessageInfoEncapsulationDto;
import com.hjhz.sms.data.dto.SendDto;
import com.hjhz.sms.data.dto.UserDto;
import com.hjhz.sms.struts.form.SendForm;

/**
 * spring��taskEecutor�̳߳ص�����
 * */
public class DisposeSmsServiceThread implements Runnable {
	 
	 private SendForm sendForm;
	 private MessageInfoEncapsulationDto sendMessagesInfo;
	 private UserDto user;
     public DisposeSmsServiceThread(SendForm sendForm,MessageInfoEncapsulationDto sendMessagesInfo,UserDto user){
    	  this.sendForm = sendForm;
    	  this.sendMessagesInfo = sendMessagesInfo;
    	  this.user = user;
     }
      
    /**
     * ִ�ж��߳�
     * */
	public void run() {
		TaskExecutorSendSMS sendTask = new TaskExecutorSendSMS();
		try {
			//���Ͷ���
			sendTask.sendSMS(sendForm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
