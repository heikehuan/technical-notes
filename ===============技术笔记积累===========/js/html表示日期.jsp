<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/pages/account/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自动延期</title>
<link href="<c:url value="/styles/default.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/common.css"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/js/table.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/function.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-1.2.1.pack.js" />"></script>
<!--日期选择 start -->
<link rel="stylesheet" type="text/css" href="<c:url value='/js/jscalendar/calendar-system.css'/>" />
<script type="text/javascript" src="<c:url value='/js/jscalendar/calendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jscalendar/lang/calendar-zh.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/DatePicker.js'/>"></script>
<!-- 日期选择 end -->

<style type="text/css">
<!--
	body {
		margin: 0px; padding: 0px; overflow:hidden;
	}
	fieldset {
		margin: 5px;
	}
	
	.border {
		margin-left: 3px; border: 1px solid #98C0F4;
	}
.disable {
	color: #999999;
}
-->
</style>
<!-- 提示保存失败与否 -->
<c:if test="${msg=='true'}">
<script type="text/javascript">
	alert("自动延期成功!");
	window.close();
</script>
</c:if>

<c:if test="${msg=='false'}">
<script type="text/javascript">
	alert("自动延期失败, 请联系系统管理员!");
	window.close();
</script>
</c:if>

<script type="text/javascript">

function getDelayMonth(){
	if(!isEmpty(IntegrationForm.delayTerminateDate.value)&&compareDate(document.IntegrationForm.terminateDate.value,document.IntegrationForm.delayTerminateDate.value)){
		//延期前时间数组
		var startTime = document.IntegrationForm.terminateDate.value.split("-");
		//延期后时间数组
		var endTime = document.IntegrationForm.delayTerminateDate.value.split("-");
		
		if(compareDate(document.IntegrationForm.terminateDate.value,document.IntegrationForm.delayTerminateDate.value)){
			if(endTime[0]!=startTime[0]){//延期后的年份大于延期前得年份
				document.IntegrationForm.delayMonth.value = (endTime[0]-startTime[0]-1)*12+(endTime[1]-startTime[1]+12);
			}else{//年份相等
				document.IntegrationForm.delayMonth.value = endTime[1]-startTime[1];
			}
			
		}
		
	}
}

//确定
function saveAutoDelay(){
	getDelayMonth();
	if(isEmpty(document.IntegrationForm.delayTerminateDate.value)){
		alert("延期后集团终止时间不能为空!");
		return;
	}
	if(!compareDate(document.IntegrationForm.terminateDate.value,document.IntegrationForm.delayTerminateDate.value)){
			alert("延期前集团终止时间不能晚于延期后集团终止时间!");
			return;
	}
	var url = '<c:url value="/account/partner/integration/integration.crm?method=saveIntegrationAutoDelay"/>';
	document.IntegrationForm.action = url;
	document.IntegrationForm.submit();
}

//字数限制
function checkLen(check){
	if(!isEmpty(document.IntegrationForm.feedBack.value)&&check=="feedBack"){
		
		var feedBack = document.IntegrationForm.feedBack.value;
		document.IntegrationForm.feedBack.value = feedBack.substring(0,200);
	}
	if(!isEmpty(document.IntegrationForm.comments.value)&&check=="comments"){
		
		var comments = document.IntegrationForm.comments.value;
		document.IntegrationForm.comments.value = comments.substring(0,200);
	}
}

</script>
</head>

<body>
<form id="IntegrationForm" name="IntegrationForm" action="<c:url value="/account/partner/integration/integration.crm?method=saveIntegrationAutoDelay"/>" method="post">
	<html:hidden name="IntegrationForm"  property="rowId"/>
	<fieldset class="form-fieldset" >
	<legend>自动延期</legend>
	<table class="form-table" width="100%" border="0" cellspacing="3" cellpadding="0">
		<tr>
			<td valign="top">
			<table id="demo1" cellpadding="1" cellspacing="1" border="0"width="100%" align="center" class="data-tbl">
				 <tr>
					<td class="label-nowrap">延期前集团终止日期</td>
					<td><html:text  name="IntegrationForm" property="terminateDate" styleClass="textfieldread"/>&nbsp;
					<td class="label-nowrap">延期后集团终止日期</td>
					<td><html:text  name="IntegrationForm" property="delayTerminateDate" styleClass="textfield" readonly="true"/>
					<img src="<c:url value='/images/calendar1.gif'/>" align="absmiddle" border="0"
					 style="margin-left: 3px; cursor: pointer" onclick="showCal('delayTerminateDate', null)" />
					</td>
		  		</tr>
		  		
		  		<tr>
		  			<td class="label-nowrap">延期月数</td>
					<td><html:text  name="IntegrationForm" property="delayMonth" styleClass="textfieldread"/>
		  		</tr>
		  		
		  		<tr>
		  			<!-- 200字限制 -->
		  			<td class="label-nowrap">反馈</td>
					<td colspan="3" class="text-nowrap">
					<html:textarea  name="IntegrationForm" property="feedBack" styleClass="textarea"  rows="3" cols="60" onblur="checkLen('feedBack');" onmouseover="getDelayMonth();"/>
					</td>
		  		</tr>
		  		
		  		<tr>
		  			<td class="label-nowrap">备注</td>
					<td colspan="3" class="text-nowrap">
					<html:textarea  name="IntegrationForm" property="comments" styleClass="textarea"  rows="3" cols="60" onblur="checkLen('comments');"/>
					</td>
		  		</tr>
		  		
		  		<tr>
					<td colspan=3>
						<center>
						<input type="button" name="numbType" value="确定" class="button2" onclick="saveAutoDelay();"/>
						<input type="button" name="numbType" class="button2" value="关闭" onclick="window.close();"/>
						</center>
					</td>
				</tr>
			</table>
		</td>
		</tr>
	</table>
</fieldset>
</form>
</body>	
</html>
