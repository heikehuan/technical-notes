<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="studentinf.Dao.ConnectionManager;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<META http-equiv="Content-Type" content="text/html; charset=GB18030">
<META name="GENERATOR" content="IBM Software Development Platform">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">
<TITLE>stuinfolist.jsp</TITLE>
</HEAD>
<BODY>

  <table border="1">
 <%
      ArrayList arr=(ArrayList)request.getAttribute("list");
      Iterator it = arr.iterator();
      while(it.hasNext()){
       ConnectionManager us =(ConnectionManager)it.next();
   %>
     <tr>
       <td><%=us.getSid() %></td>
       <td><%=us.getSname()%></td>
       <td><%=us.getSex() %></td>
       <td><%=us.getSpeciality() %></td>
       <td><%=us.getBirthday() %></td>
    </tr>
    <%} %>
   </table>
</BODY>
</HTML>
