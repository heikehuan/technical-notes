<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="header.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath+"jsp/manager.jsp"%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>简易管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="爬虫管理">
	<script type="text/javascript" src="js/jquery1.5.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.form.js"></script>
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


/**
 * 验证是否是数字
 */
function checkNumber(val,content){
	var boo = true;
	var reg0 = /^([\d])*$/;
	   if(!reg0.test(val)){
		   alert(content);
		   boo = false;
	   }
	   return boo;
}

/**
 * 不准许输入数字
 */
function checkNumber_action(){
	var boo = true;
	var reg0 = /^([\d])*$/;
	   if(!reg0.test($("#startPage").val())){
		   $("#endPage").val("");
		   boo = false;
	   }
	   if(!reg0.test($("#endPage").val())){
		   $("#endPage").val("");
		   boo = false;
	   }
	   return boo;
}
function yanzheng(jqTRObj){
	var startPage = $(":input[name=startPage_tmp]",jqTRObj).val();
	var endPage = $(":input[name=endPage_tmp]",jqTRObj).val();
	if(isBlank(startPage)){
		alert("请输入起始页数！");
		$(":input[name=startPage_tmp]",jqTRObj).focus();
		return false;
	}else 
	if(isBlank(endPage)){
		alert("请输入结束页数！");
		$(":input[name=endPage_tmp]",jqTRObj).focus();
		return false;
	}else{
		var boo1 = checkNumber(startPage,"起始页应该为数字！");
		var boo2 = checkNumber(endPage,"结束页应该为数字！");
		if(boo1&&boo2){
			return true;
		}else{
			return false;
		}
	}
}
/** 执行爬虫 */
function pachong(thobj){
	var jqTRObj = $(thobj).parents("tr");
	var boo = yanzheng(jqTRObj);
	if(boo){
		var options = {
				target: "",//必须的参数。
				url: "Article!executePaChong.action",
				dataType: "json",
				timeout:   180000 ,
				success: function(data){
					 var status = data.status;
					 var prompt = data.prompt;
						 alert("爬虫执行完毕！");
						//对TR里的ID选取，并赋值
						$(jqTRObj).children("#status").html(status);
						$("#pachongTR_callback").children("#prompt").html(prompt);
						$(thobj).attr("disabled",false);
					 }
				};
		if(confirm("您确定要这样做吗？")){
			$(jqTRObj).children("#status").html("执行中..");
			//获取用户操作数据
			var startPage = $(":input[name=startPage_tmp]",jqTRObj).val();
			var endPage = $(":input[name=endPage_tmp]",jqTRObj).val();
			var sort = $(":input[name=sort_tmp]",jqTRObj).val();
			//将数据存入Form里
			var pachongFromObj = $("#pachongFrom");
			$(":input[name=startPage]",pachongFromObj).val(startPage);
			$(":input[name=endPage]",pachongFromObj).val(endPage);
			$(":input[name=sort]",pachongFromObj).val(sort);
			//将按钮变为不可用
			$(thobj).attr("disabled",true);
			//异步提交
			$(pachongFromObj).ajaxSubmit(options);
		}
	}
	return false;
}

//按类别创建索引
function createIndexSort(thobj){
	var jqTRObj = $(thobj).parents("tr");
	var options = {
			target: "",//必须的参数。
			url: "Article!createIndexByTypeName.action",
			dataType: "json",
			timeout:   180000 ,
			success: function(data){
				 var status = data.status;
				 var prompt = data.prompt;
					 alert("执行完毕！");
					//对TR里的ID选取，并赋值
					$(jqTRObj).children("#status").html(status);
					$("#createindexTR01_callblack").children("#prompt").html(prompt);
					$(thobj).attr("disabled",false);
				 }
			};
	if(confirm("您确定要这样做吗？")){
		$(jqTRObj).children("#status").html("执行中..");
		//获取用户操作数据
		var sort = $(":input[name=sort_tmp]",jqTRObj).val();
		//将数据存入Form里
		var createindexSortFormObj = $("#createindexSortForm");
		$(":input[name=sort]",createindexSortFormObj).val(sort);
		//将按钮变为不可用
		$(thobj).attr("disabled",true);
		//异步提交
		$(createindexSortFormObj).ajaxSubmit(options);
	}
}
//给全部数据创建索引
function createIndexFull(thobj){
	var jqTRObj = $(thobj).parents("tr");
	var options = {
			target: "",//必须的参数。
			url: "Article!createIndexByAll.action",
			dataType: "json",
			timeout:   180000 ,
			success: function(data){
				 var status = data.status;
				 var prompt = data.prompt;
					 alert("执行完毕！");
					//对TR里的ID选取，并赋值
					$(jqTRObj).children("#status").html(status);
					$("#createindexTR02_callblack").children("#prompt").html(prompt);
					$(thobj).attr("disabled",false);
				 }
			};
	if(confirm("您确定要这样做吗？")){
		$(jqTRObj).children("#status").html("执行中..");
		//将按钮变为不可用
		$(thobj).attr("disabled",true);//createindexForm02
		var createindexFormObj = $("#createindexForm02");
		//异步提交
		$(createindexFormObj).ajaxSubmit(options);
	}
}


</script>

</head>
  
  <body>
	<h1>我的网络爬虫</h1>
  <hr/>

  <p>验证码入口：http://www.iteye.com/index/human_test ，经测试，平均爬两页输入一次验证码就可以。1页为30篇文章 </p>

<!-- 运行爬虫 -->
  <form id="pachongFrom" name="pachongFrom" action="Article!executePaChong.action" method="post" >
  	<input type="hidden" name="sort" value="" >
  	<input type="hidden" name="startPage" value="" >
  	<input type="hidden" name="endPage" value="" >
  </form>
<!-- 分类索引 -->
  <form id="createindexSortForm" name="createindexSortForm" action="Article!createIndexByTypeName.action" method="post">  
  	<input type="hidden" name="sort" value="" >  	
  </form>
<!-- 全部索引 -->
<form id="createindexForm02" name="createindexForm02" action="Article!createIndexByAll.action" method="post"></form>  
  
  <table width="100%" height="253" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="main">
    <tr id="pachongTR">
      <td>按分类抓取数据：</td>
      <td>
      <label>分类：
        <select name="sort_tmp" class="textBF100" >
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
        </select>
        </label>
      从第
        <input name="startPage_tmp" type="text" class="textBF100" value="" size="20" maxlength="1000">
      页，到第
      <input name="endPage_tmp" type="text" class="textBF100" value="" size="20" maxlength="1000" >
      页。
      </td>
      <td id="status">未执行</td>
      <td><label>
        <input name="Bn01" type="button" class="Bn" id="Bn01" value="运行爬虫" onclick="pachong(this)" >
      </label></td>
    </tr>
    <tr id="pachongTR_callback">
      <td>&nbsp;</td>
      <td id="prompt">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr id="createindexTR01">
      <td>按分类建立索引：</td>
      <td><select name="sort_tmp" class=" textPX200" >
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
      </select>
      </td>
      <td id="status">未执行</td>
      <td><input name="Bn02" type="button" class="Bn" value="分类索引" onclick="createIndexSort(this);" ></td>
    </tr>
    
    <tr id="createindexTR01_callblack">
      <td>&nbsp;</td>
      <td id="prompt">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
	<tr id="createindexTR02">
      <td>将所有数据进行索引：</td>
      <td class="blue_text">将数据库中所有数据进行一次索引（不区分类别，搜索时将会更加方便）</td>
      <td id="status">未执行</td>
      <td>
      <input name="Bn03" type="button"" class="Bn" id="Bn03" value="全部索引" onclick="createIndexFull(this);" >
      </td>
    </tr>
    
    <tr id="createindexTR02_callblack">
      <td>&nbsp;</td>
     <td id="prompt">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>定时任务：</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <p>
    <s:iterator value="#request.articleList"  ></s:iterator>
    【待完善】作者：梁健，QQ：15141739
  </p>
  <s:iterator value="#request.articleList"  ><hr/>
</s:iterator>
  </body>
</html>
