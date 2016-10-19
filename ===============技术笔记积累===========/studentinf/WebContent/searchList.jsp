<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示记录</title>
</head>
<body>
<center >
<font color=red size=72>学生信息如下：</font>
<hr>
<table border=1 bgColor="#ffffff" width="500px" height="100px">
<tr>
<td>ID</td>
<td>姓名</td>
<td>学号</td>
<td>性别</td>
<td>专业</td>
<td>生日</td>
<td><center>操作</center></td>
</tr>

<jsp:useBean id="sBean"class="studentinf.Bean.Studentinf"/>
<jsp:useBean id="jBean" class="muta.bean.JavaBean"/>
<%
     String sql ="select * from student order by id";
     java.util.List list =sBean.getSearch(sql);
     
     for(java.util.Iterator it =list.iterator();it.hasNext();)
     {
    	 //获取一个JavaBean对象
    	 jBean =(muta.bean.JavaBean)it.next();
  %> 
  <tr>
       <td><%=jBean.getId() %></td>
       <td><%=jBean.getName() %></td>
       <td><%=jBean.getPassword() %></td>
       <td><%=jBean.getSex() %></td>
       <td><%=jBean.getAge() %></td>
       
       <td>
          <a href="add.jsp">增加</a>
          <a href="delete?id=<%=Studentinf.getSid()%>">删除</a>&nbsp;
          <a href="SearchById?id=<%=Studentinf.getSid()%>">更新</a>
       </td>
  </tr>
  
  <% }%>
  
</table>
</center>
</body>
</html>
