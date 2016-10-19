<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(path+"------");
%>


<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="GB18030"%>
<META http-equiv="Content-Type" content="text/html; charset=GB18030">
<META name="GENERATOR" content="IBM Software Development Platform">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">
<TITLE>查询</TITLE>
<script type="text/javascript">
	function clickname(){
		var name=document.infoform.name.value;
		alert("姓名"+name+"提交成功！");
	}
</script>
</HEAD>
<BODY>
	<p align="center">查询学生</p>
	<form action="StuinfoSelectServlet" method="post" > 
		<table border="1" align="center">
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
</BODY>
</HTML>
