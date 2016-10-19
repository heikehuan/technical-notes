<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath+"jsp/index.jsp"%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>亮剑-资料库</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="资料库">
	<script type="text/javascript" src="js/jquery1.5.1.min.js"></script>
	<script type="text/javascript" src="js/CheckFunction.js"></script>
	<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
<!--
body {
	background-color: #000000;
}
body,td,th {
	color: #00B700;
}
-->
</style>
<script type="text/javascript">
$(document).ready(function() {

});

function door(thobj,path,index){
	var jqDIVObj = $(thobj).parents("div");
	$("#show_"+index).attr("src",path);
	$(jqDIVObj).children("#content").toggle();
}


//取值
function getFieldValue(jqForm,type,name){
	if(jqForm!=null && !isBlank(type) && !isBlank(name)){
		if(type=='text'||type=='password'||type=='hidden' || type=='file'||type=='textarea' || type=='select'){
			var expr = ":input[name="+name+"]";
			return $(expr,jqForm).val();
		}
		if(type=='radio'){
			var expr = ":input[type="+type+"][name="+name+"][checked]";
			return $(expr,jqForm).val();
		}
	}
	return '';
} 
//验证
function check(obj){
	var jqFormObj = $(obj).parents("form");
	var keyword = getFieldValue(jqFormObj,'text','keyword');//关键词
	var sort = getFieldValue(jqFormObj,'text','sort');//类别

	if(isBlank(keyword))
	{
		alert("请输入要查询的关键词！");
		return false;
	}else{
		$(jqFormObj).submit();
	}
	return false;
}
</script>
  </head>
  <body>
    <h1>亮剑——Java资料库</h1>
    <hr class="blue_text"/>
  <p>技术文章搜索：</p>
<form action="Article!searchByTypeName.action" method="post" name="searchForm01">
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10%" class="blue_text">分类:</td>
    <td width="20%">
    <select name="sort" class="textPX200">
      <option value="" >全部</option>
      <option value="Hibernate" >Hibernate</option>
      <option value="Spring">Spring</option>
      <option value="Struts">Struts</option>
      <option value="iBATIS">iBATIS</option>
      <option value="J2EE">企业应用</option>
      <option value="Design-Pattern">设计模式</option>
      <option value="DAO">DAO</option>
      <option value="Object-Domain">领域模型</option>
      <option value="OO">OO</option>
      <option value="Tomcat">Tomcat</option>
      <option value="SOA">SOA</option>
      <option value="JBoss">JBoss</option>
      <option value="Swing">Swing</option>
      <option value="Java">Java综合</option>
    </select></td>
    <td width="70%"><input name="keyword" type="text" class="textBF100" id="keyword" style="width: 100%" value="<s:property value="keyword" />"></td>
    <td width="5%"><input type="button" class="Bn" value="搜索" onclick="check(this)"></td>
  </tr>
</table>
</form>

<p>搜索结果： </p>
<hr class="blue_text"/>
<s:iterator value="#request.articleList" status="index" >
<div style="background-color: #333333;color: yellow;">
类别：<s:property value="typeName" /><br/>
标题：<s:property value="name" /><br/>
作者：<s:property value="author" /><br/>
时间：<s:property value="date" /><br/>
内容：</div>
<div>
<span class="blue_text" onclick="door(this,'/iteye/<s:property value="typeName" />/<s:property value="fileName" />','${index.index }');">【展开】/【收起】</span>
<div id="content" style="display:none;background-color: #eeeeee">
<iframe id="show_${index.index }" name="show_${index.index }" width="1250" height="550" src=""></iframe>
</div>
</div>
<hr/>
</s:iterator>
<hr class="blue_text"/>
作者：梁健 QQ：15141739
  </body>
</html>
