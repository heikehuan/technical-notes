<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/pages/account/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查看附件</title>
<link href="<c:url value="/styles/default.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/styles/common.css"/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/js/table.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/function.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-1.2.1.pack.js" />"></script>


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
<script type="text/javascript">
/**
* 工具函数，将带'px'的字符串尺寸转换为数字
* @author Wu Yanhong
*/
function num(dim) {
	if (!dim || /^[^\d]+\w*$/.test(dim))
		return 0;
	return (dim.indexOf("px") == -1) ? dim : parseInt(dim.substring(0, dim.indexOf("px")), 10);
}

var Doc = function() {
	var content;
	return {
		init: function() {
			content = document.getElementById("content");
			Doc.resize();
			window.onresize = Doc.resize;
			
		},
		resize: function() {
			if (!content)
				return;
			var cs = content.currentStyle;
			var offset = content.offsetTop;
			offset += num(cs.borderTopWidth);
			offset += num(cs.borderBottomWidth);
			offset += num(cs.paddingTop);
			offset += num(cs.paddingBottom);
			var h = document.documentElement.clientHeight - offset -1;
				if (h>0)
				content.style.height = (h-2)+"px";
		}
	};
}();

//下载附件
function downLoad(rowId){
	location.href = '<c:url value="/marketing/mobileResources/preemptive.crm?method=downLoadFile&rowId="/>'+rowId;
}
</script>
</head>

<body>
<div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="menu_tree">
		<%-- 产生分页脚本和HTML代码 --%> 
		<table border="0" cellspacing="0">
			<tr>
				<td width="10">&nbsp;</td>
				<td width="2"><img src="<c:url value="/images/grid-split.gif"/>"
					width="2" height="13" /></td>
				<td class="menu_center"><a href="javascript:window.close();">关闭</a></td>
				<td width="2"><img src="<c:url value="/images/grid-split.gif"/>"
					width="2" height="13" /></td>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<div id="content" style="overflow:auto; margin: 0px">
<!--  
	<fieldset>
		<legend>查看附件</legend>
		<table id="demo1" cellpadding="1" cellspacing="1" border="0"
			width="100%" class="data-tbl">
		<tr>
			<td>项目附件</td>
		</tr>
		<tr>
			<td></td>
			<td>附件名称</td>
		</tr>
		</table>
	</fieldset>
-->	
	<fieldset class="form-fieldset" >
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td valign="top">
			<table id="demo1" cellpadding="1" cellspacing="1" border="0"
				width="100%" align="center" class="data-tbl">
				<tr>
					<th>附件名称</th>
					<th>操作</th>
				</tr>
				<c:if test="${fn:length(page.data)<1}">
					<tr>
						<td colspan="14" style="text-align:center">没有符合查询条件的记录</td>
					</tr>
				</c:if>
			  	
				<c:if test="${fn:length(page.data)>0}">
					<c:forEach items="${page.data}" var="item" varStatus="i">
						<tr>
							<td>${item.fileName}<input type="hidden" name="fileRowId" value="${item.rowId}"/></td>
							<td><a href="#" onclick="downLoad('${item.rowId}');">下载</td>
						</tr> 
					</c:forEach>
				</c:if>
				
			</table>
		</td>
		</tr>
	</table>
</fieldset>
</div>
</body>
</html>
