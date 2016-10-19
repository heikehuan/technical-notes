<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>插入新值</title>
</head>
<body>
<center><font color=red size=72>学生管理页面</font>
<hr>
<form action="Insert" method="post">
<table border="1">
	<tr>
		<td>姓名：</td>
		<td><input  type="text" name="name"></td>
	</tr>

	<tr>
		<td>密码：</td>
		<td><input type="password" name="password"></td>
	</tr>

	<tr>
		<td>性别：</td>
		<td><input type="radio" name="sex" value="男">男 <input type="radio"
			name="sex" value="女">女</td>
	</tr>

	<tr>
		<td>年龄：</td>
		<td><input type="text" name="age"></td>
	</tr>

	<tr>
		<td colspan="2">
		<center><input type="submit" value="提交"> <input type="reset"
			value="重置"></center>
		</td>
	</tr>

</table>
</form>
<a href="../studentinfo/WebContent/SearchList.jsp">查询</a></center>
</body>
</html>
