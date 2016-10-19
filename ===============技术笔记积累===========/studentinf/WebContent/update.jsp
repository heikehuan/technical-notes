<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ page import="studentinf.Bean.Studentinf"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML>
<HEAD>

<META http-equiv="Content-Type" content="text/html; charset=GB18030">
<META name="GENERATOR" content="IBM Software Development Platform">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">
<TITLE>修改学生信息</TITLE>
<script type="text/javascript">
	function clickname(){
		var name=document.infoform.name.value;
		alert("姓名"+name+"提交成功！");
	}
</script>
</HEAD>
<BODY>
	<p align="center">修改学生信息</p>
	 <%
      Studentinf user1=(Studentinf)request.getAttribute("stu"); 
   %>
	<form action="StuinfoUpdate" method="post">
		<table border="1" align="center">
			<input type="hidden" name="sid" value="${stu.sid}"><%=user1.getSid() %>
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="sname" value="${stu.sname}"></td><%=user1.getSname()%>
			</tr>
			<tr>
				<td>学号：</td>
				<td><input type="text" name="snumber" value="${stu.snumber}"></td><%=user1.getSnumber()%>
			</tr>
			<tr>
				<td>性别：</td>
				<td>
				<input type="radio" name="sex" id="sexm"  value="${stu.sex}">男
				<input type="radio" name="sex" id="sexw"  value="${stu.sex}">女
				</td><%=user1.getSex() %>
			</tr>
			<tr>
				<td>专业：</td>
				<td>
					<select name="speciality">
					<option value="${stu.speciality}" selected>计算机系</option>
					<option value="${stu.speciality}" selected>英语系</option>
					<option value="${stu.speciality}" selected>管理系</option>
					<option value="${stu.speciality}" selected>建筑系</option>
					</select>
				</td><%=user1.getSpeciality() %>
			</tr>
			<tr>
				<td>生日：</td>
				<td><input type="text" name="birthday" value="${stu.birthday}"></td><%=user1.getBirthday() %>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" name="button" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" name="button" value="重置">
				</td>
			</tr>
		</table>
	</form>
</BODY>
</HTML>
