<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<META http-equiv="Content-Type" content="text/html; charset=GB18030">
<META name="GENERATOR" content="IBM Software Development Platform">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet"
	type="text/css">
<TITLE>学生信息管理</TITLE>
	<script type="text/javascript">
	function add(){
		window.open("add.jsp","","");	
	}

	function delete(){
		window.open("delete.jsp","","");	
	}
	function update(){
		window.open("update.jsp","","");
	}
	function select(){
		window.open("update.jsp","","");
	}
	</script>

</HEAD>
<BODY>
<p>学生信息管理系统<br>

	<INPUT name="button" style="background-color:#9999FF; font-size:18px; color:#FF0000" name="button1" id="button1" value="增加" onclick=add()>
	<INPUT name="button" style="background-color:#9999FF; font-size:18px; color:#FF0000" name="button2" id="button2" value="删除" onclick=delete()>
	<INPUT name="button" style="background-color:#9999FF; font-size:18px; color:#FF0000" name="button3" id="button3" value="修改" onclick=update()>
	<INPUT name="button" style="background-color:#9999FF; font-size:18px; color:#FF0000" name="button4" id="button4" value="查询" onclick=select()>


</BODY>
</HTML>
