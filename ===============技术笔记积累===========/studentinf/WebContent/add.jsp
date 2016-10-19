<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.println(path+"------");
%>


<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META name="GENERATOR" content="IBM Software Development Platform">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">
<TITLE>增加</TITLE>

</HEAD>
<BODY>
	<p align="center">增加学生</p>
	<form action="StuServlet" method="post" > 
		<table border="1" align="center">
			<tr>
				<td>姓名：</td>
				<td><input type="text" name="sname"></td>
			</tr>
			<tr>
				<td>学号：</td>
				<td><input type="text" name="snumber"></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td>
				<input type="radio" name="sex" id="sexm" value="0">男
				<input type="radio" name="sex" id="sexw" value="1">女
				</td>
			</tr>
			<tr>
				<td>专业：</td>
				<td>
					<select name="speciality">
					<option value="1" selected>计算机系</option>
					<option value="1" selected>英语系</option>
					<option value="1" selected>管理系</option>
					<option value="1" selected>建筑系</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>生日：</td>
				<td><input type="text" name="birthday"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" name="button" value="重置">
				</td>
			</tr>
		</table>
	</form>
</BODY>
</HTML>
