<%@ include file="/pages/includes/tags.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中国电信集团客户服务系统-申诉单批量转发</title>
<link href="<c:url value="/styles/common.css" />" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value="/js/table.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/common.js" />"></script>
<script type="text/javascript" src="<c:url value="/js/jquery/jquery-1.2.1.pack.js" />"></script>

<script type="text/javascript">
<!--
var row = document.getElementById("row0");
if(row!=null){
	row.checked = "checked" ;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_reloadPage(init) { //reloads the window if Nav4 resized 
if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) { 
document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }} 
else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload(); 
} 
MM_reloadPage(true); 


var minSize="25";
var maxSize="250";
/********************************************************
/* 函数名: shrink_onClick
/* 功  能: 收缩上侧工具栏
/* 参  数: 无
/* 返回值: 无
/********************************************************/
function shrink_onClick() { //v3.0
	//alert(parent.document.getElementsByTagName("FRAMESET")[1].rows);
	document.getElementById("sidebarShrink").style.display="none";
	document.getElementById("sidebarExpand").style.display="block";
	parent.document.getElementById("rowFrames").rows=minSize+",*";
	parent.frames('downFrame').Doc.resize();
}
/********************************************************
/* 函数名: expand_onClick
/* 功  能: 扩展上侧工具栏
/* 参  数: 无
/* 返回值: 无
/********************************************************/
function expand_onClick() { //v3.0
	document.getElementById("sidebarShrink").style.display="block";
	document.getElementById("sidebarExpand").style.display="none";
	parent.document.getElementById("rowFrames").rows=maxSize+",*";
	parent.frames('downFrame').Doc.resize();
}



function rowClick(params){
	var url='<c:url value="/compman/AppealHandleAction.crm?method=tabs"/>';
	url=url + params;
	/**
	parent.downFrame.location = url; 
	 */
	
}

$(function() {
	//调整数据区高度
	var list = $("#datas")[0];
	var dh = document.documentElement.clientHeight;
	var h = (dh - list.offsetTop);
	if (h>0) {
		list.style.height = h + "px";
	}
	//显示第一条记录的详细信息
	var params = "&rowId=${fn:length(page.data)>0 ? page.data[0].rowId : ''}";
	rowClick(params);
});	

function refresh() {
    showLoading();
    var f = document.getElementById("searchForm");
    f.submit();
}

//-->
</script>
<script type="text/javascript">
/*****************
/*查看一个申诉单所有处理日志
/******************/
function coopOpLogList(coopId) {
	var url = '<c:url value="/compman/cooperationQuery.crm?method=logListByCoopId"/>&coopId=' + coopId;	
	showDialog(url, 0, 1024, 500);
}



/**********************
/* 点击"查询",响应的方法
/**********************/
function search() {
	
     var url = "<c:url value="/compman/AppealRecvAction.crm?method=searchPage"/>";
	 var rtn = showDialog(url, 0, 700,500);
	 if (rtn) {
	 	document.searchForm.rowId.value = rtn.rowId;
	 	document.searchForm.appeStatus.value = rtn.appeStatus;
	 	document.searchForm.recvDateStart.value = rtn.recvDateStart;
	 	document.searchForm.recvDateEnd.value = rtn.recvDateEnd;
	 	document.searchForm.custName.value = rtn.custName;
	 	document.searchForm.email.value = rtn.email;
	 	document.searchForm.linkTel.value = rtn.linkTel;
	 	document.searchForm.appeSource.value = rtn.appeSource;
	 	document.searchForm.appeSort.value = rtn.appeSort;
	 	document.searchForm.busiSort.value = rtn.busiSort;
	 	document.searchForm.handleUnit.value = rtn.handleUnit;
	 	document.searchForm.handleUser.value = rtn.handleUser;
	 	document.searchForm.handleDateStart.value = rtn.handleDateStart;
	 	document.searchForm.handleDateEnd.value = rtn.handleDateEnd;
        //++ append by guxidong on $2010-08-30 >>>
        // 增加投诉现象分类和申诉单属性
	 	document.searchForm.compSort.value = rtn.compSort;
	 	//add by 宁桂鑫 $2011-3-22
	 	document.searchForm.compFinishReason.value = rtn.compFinishReason;
	 	//add end
		//add by liyh $2011-4-15
	 	document.searchForm.compCode.value = rtn.compCode;
	 	//add end
	 	document.searchForm.appeProps.value = rtn.appeProp;
        //++ append by guxidong on $2010-08-30 <<<
	// 	document.searchForm.action = "<c:url value='/compman/AppealHandleAction.crm?method=quantityTransmit'/>";
	 	document.searchForm.submit();
	 }
	
}


// 导出申诉单
function expWaitHandleAppealExcel() {
	var url = '<c:url value="/compman/AppealHandleAction.crm?method=expWaitHandleAppealExcel"/>';
	document.searchForm.action = url;
	document.searchForm.submit();
	document.searchForm.action = '<c:url value="/compman/AppealHandleAction.crm?method=list"/>';
	
}
//转发
function transmit(){

    var r = checkRadio();
    if (r == null){
        alert("请选择一条申诉单!");
        return;
    }
    var a= r.value;
	var dlgUrl = "<c:url value='/compman/accept/deliverAuditAction.crm?method=handleUserDlg&tmlNbrNotJT='/>" ;
	var arr = window.showModalDialog(dlgUrl,"","dialogWidth=480px;dialogHeight=300px");
	if (arr!=null) {
		//处理单位名称
		//document.searchForm.handleUnitName.value=arr[0];
		//处理单位ID
		document.searchForm.handleUnit.value=arr[1];
		//处理人
		//document.searchForm.handleUserName.value=arr[2];
		//处理人ID
		document.searchForm.handleUser.value=arr[3];
		$.ajax({
		   type: "POST",
		   url: '<c:url value="/compman/AppealHandleAction.crm?method=transmit"/>',
		   data: "rowId="+r.value+"&handleUnit="+arr[1]+"&handleUser="+arr[3],
		   success: function(msg){
		   	if(msg=="success"){
		      alert( "转发成功!");
		   	}else{
		      alert( "转发失败!");
		   	}
		   }
		}); 
	}
	parent.upFrame.location = '<c:url value="/compman/AppealHandleAction.crm?method=quantityTransmit"/>';	
/**
	parent.location.reload();    //刷新页面
	return;
*/	
}


function checkRadio(){
    var r = null;
    var radios = document.getElementsByName("radio");
    for (var i = 0; i < radios.length; i++){
    	if (radios[i].checked){
    		r = radios[i];
    		break;
    	}    
    }
    return r;
}

// 处理
function handle(){
    var r = checkRadio();
    if (r == null){
        alert("请选择一条申诉单!");
        return;
    }
/**update by 詹欢欢 on $2011-9-6 在点击“回复”按钮时判断申诉单状态，若不为“待回复”，给出提示 begin*/    
	if(r.appeStatus!='A001001'){
		alert("该申诉单回复工作已经完成!");
		parent.location.reload();    //刷新页面
		return;
	}
/**update by 詹欢欢 on $2011-9-6 在点击“回复”按钮时判断申诉单状态，若不为“待回复”，给出提示 end*/	
	var url = '<c:url value="/compman/AppealHandleAction.crm?method=handle&rowId="/>' + r.value;
	var rtn = showDialog(url,0,900,768);
	if (rtn){
		var listUrl = '<c:url value="/compman/AppealHandleAction.crm?method=list"/>';
		window.location.href = listUrl;
	}
	
}


//申诉单导入
function appealImport(){
	 var url = '<c:url value="/compman/AppealRecvAction.crm?method=appealImportForHandle"/>';
	 var rtn = showDialog(url,0,700,350);
	 if (rtn){
	 	refresh();
	 	var url = '<c:url value="/compman/AppealRecvAction.crm?method=makeupOnReasonList"/>';
		openwindow(url, "makeupOnReason" , 1000, 768);
		//location.href = '<c:url value="/compman/AppealHandleAction.crm?method=list"/>';
	 }
}
//查看详细信息
function showView(rowId){
	var url = '<c:url value="/compman/AppealRecvAction.crm?method=view&rowId="/>'+rowId;
	showDialog(url, 0, 1000, 700);
}

function makeupOnReason(){
	var url = '<c:url value="/compman/AppealRecvAction.crm?method=makeupOnReasonList"/>';
	openwindow(url, "makeupOnReason" , 1000, 768);
}

//弹出窗口居中
function openwindow(url,name,iWidth,iHeight)
{
    var url;                             //转向网页的地址;
    var name;                            //网页名称，可为空;
    var iWidth;                          //弹出窗口的宽度;
    var iHeight;                         //弹出窗口的高度;
    //获得窗口的垂直位置
    var iTop = (window.screen.availHeight-30-iHeight)/2;        
    //获得窗口的水平位置
    var iLeft = (window.screen.availWidth-10-iWidth)/2;           
    window.open(url,name,'height='+iHeight+',innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no,resizable=yes');
    		
}

//弹出提醒页面
function isAlert(){
	var sly = '<%=request.getParameter("isAlert") %>';
	var sly1 = '<%=session.getAttribute("isAll") %>';
	//alert('sly = '+sly);
	//alert('sly1 = '+sly1);
	if((sly=="Y") && (sly1=="Y")){
		var url = '<c:url value="/compman/AppealHandleAction.crm?method=isAlert"/>';
		str = window.showModalDialog(url,"","dialogWidth:1000px;dialogHeight:1000px");
		if(!str){	
			var listUrl = '<c:url value="/compman/AppealHandleAction.crm?method=list"/>';
			window.location.href = listUrl;
		}
	}
	<%session.removeAttribute("isAll");%>
}

</script>
<style type="text/css">
<!--
body {
	margin: 0px; padding: 0px; overflow:hidden;
}
fieldset {
	margin: 5px;
}

.border {
	margin-left: 0px; border: 1px solid #98C0F4;
}

-->
</style>
</head>
<body onload = "isAlert()"></body>
<body onload="MM_preloadImages('<c:url value="/images/ns-collapse-down.gif" />')">

<div id="sidebarShrink" style="display:block;">
<div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">  
	<tr>
		<td class="menu_bg"><div style="margin-top:3px; margin-right:3px;float:right;cursor:pointer" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('up','','<c:url value="/images/ns-collapse-down.gif" />',1)"><img
        src="<c:url value="/images/ns-collapse.gif" />" alt="向上收缩" name="up"
        border="0" id="up" onclick="shrink_onClick();" /></div>
        <span style="margin-left:10px;">申诉单批量转发列表</span>
        </td>
	</tr>
	<tr>
		<td class="menu_tree">
		<%-- 产生分页脚本和HTML代码 --%>
		<crm:paging name="page" form="searchForm" />
		
		<table border="0" cellspacing="0">
          <tr>
            <td width="10">&nbsp;</td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
            <td class="menu_center"><a href="javascript:search();">查询</a></td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
            <!-- update by 詹欢欢 on $2011-08-31 将“处理”按钮修改为“回复” -->
            <td class="menu_center"><a href="javascript:handle();">回复</a></td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
            <td class="menu_center"><a href="javascript:transmit();">转发</a></td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
            <td class="menu_center"><a href="javascript:expWaitHandleAppealExcel();">导出</a></td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
            <td class="menu_center"><a href="javascript:appealImport();">导入</a></td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
             <td class="menu_center" style="width: 130px"><a href="javascript:makeupOnReason();">投诉原因分类补录</a></td>
            <td width="2"><img src="<c:url value="/images/grid-split.gif" />" width="2" height="13" /></td>
             
          </tr>
        </table>
        
      </td>
    </tr>
</table>
</div>

<div id="datas" style="overflow:auto; height: 170px; width:100%">
<table id="list" width="100%" cellpadding="1" cellspacing="1"
	border="0" class="data-tbl">
	<tr>
		<th>&nbsp;</th>
		<th>编号</th>
		<th>受理日期</th>
		<th>用户姓名</th>
		<th>联系电话</th>		
		<th>电子邮件</th>
		<th>用户地址</th>	
		<th>工作单位</th>
		<th>邮编</th>
		<th>企业地区</th>
		<%-- append by guxidong on $2010-08-27 start --%>
		<th>投诉现象分类</th>
		<%-- append by liyh on $2010-12-15 start --%>
		<th>投诉原因分类</th>
		<%-- append by liyh on $2010-12-15 end --%>		
		<th>申诉单属性</th>
		<%-- append by guxidong on $2010-08-27 end --%>
		<th>问题分类一级</th>
		<th>问题分类二级</th>
		<th>业务分类一级</th>
		<th>业务分类二级</th>
		<th>业务分类三级</th>
		<th>业务分类四级</th>
		<th>申诉来源</th>
		<th>认定员</th>
		<th>状态</th>
		<th>是否有附件</th>
		<th>申诉内容</th>
		<th>回复内容</th>
		<th>工信部案件编号</th>
	</tr>
	
	<c:if test="${fn:length(page.data)<1}">
		<tr>
			<td style="text-align:center" colspan="22">没有符合查询条件的记录</td>
		</tr>
	</c:if>

	<c:if test="${fn:length(page.data)>0}">
		<c:forEach items="${page.data}" var="item" varStatus="status">
			<tr onclick="rowClick('&rowId=${item.rowId}');">
			<%-- update by zhanhh on $2011-9-6 自定义属性值appeStatus以便于在handle()中取值判断 --%>
				<td><input type="checkbox" name="radio" value="${item.rowId}" appeStatus="${item.appeStatus}" /></td>
				<td><a href="javascript:showView(${item.rowId})" >${item.rowId}</a></td>  
				<td>${item.recvDate}</td>
				<td>${item.custName}</td>
				<td>${item.linkTel}</td>
				<td>${item.email}</td>
				<td>${item.custAddr}</td>
				<td>${item.workUnit}</td>
				<td>${item.postCode}</td>
				<td>${item.enterArea}</td>
				<%-- append by guxidong on $2010-08-27 start --%>
				<td>${item.compSortName}</td>
				<%-- append by liyh on $2010-12-15 start --%>
				<td>${item.compFinishReasonName}</td>
				<%-- append by liyh on $2010-12-15 end --%>
				<td>${item.appePropName}</td>
				<%-- append by guxidong on $2010-08-27 end --%>
				<c:set var="appeSortNameArr" value="${fn:split(item.appeSortName,'-')}"/>
				<td>${appeSortNameArr[0]}</td>
				<td>${appeSortNameArr[1]}</td>
				<c:set var="busiSortNameArr" value="${fn:split(item.busiSortName,'-')}"/>
				<td>${busiSortNameArr[0]}</td>	
				<td>${busiSortNameArr[1]}</td>	
				<td>${busiSortNameArr[2]}</td>	
				<td>${busiSortNameArr[3]}</td>	
				<td>${item.appeSourceName}</td>		
				<td>${item.affirmUser}</td>			
				<td>${item.appeStatusName}</td>			
				<td>
					<c:choose>
						<c:when test="${!empty item.attachCount &&  item.attachCount > 0}">
						是
						</c:when>
						<c:otherwise>
						否
						</c:otherwise>
					</c:choose>
				</td>	
				<td title="<c:out value="${item.appeContent}"/>">
					<c:out value="${fn:substring(item.appeContent, 0, 15)}"/>
					<c:if test="${fn:length(item.appeContent) > 15}">...</c:if>
				</td>
				<td title="<c:out value="${item.handleContent}"/>">
					<c:out value="${fn:substring(item.handleContent, 0, 15)}"/>
					<c:if test="${fn:length(item.handleContent) > 15}">...</c:if>
				</td>
				<td>${item.compCode}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>

<script language="JavaScript"> 
  anole('list',1,'#F3F3F3','#F9F9F9','#d9e8fb','#B4D0F8');
</script>
</div>

<form id="searchForm" name="searchForm" action="<c:url value="/compman/AppealHandleAction.crm?method=quantityTransmit"/>" method="post">
	<!-- 查询参数 -->
	<input type="hidden" name="rowId" value="${AppealForm.rowId}"/>
	<input type="hidden" name="appeStatus" value="${AppealForm.appeStatus}"/>
	<input type="hidden" name="recvDateStart" value="${AppealForm.recvDateStart}"/>
	<input type="hidden" name="recvDateEnd" value="${AppealForm.recvDateEnd}"/>
	<input type="hidden" name="custName" value="${AppealForm.custName}"/>
	<input type="hidden" name="email" value="${AppealForm.email}"/>
	<input type="hidden" name="linkTel" value="${AppealForm.linkTel}"/>
	<input type="hidden" name="appeSource" value="${AppealForm.appeSource}"/>
	<input type="hidden" name="appeSort" value="${AppealForm.appeSort}"/>
	<input type="hidden" name="busiSort" value="${AppealForm.busiSort}"/>
	<input type="hidden" name="handleUnit" value="${AppealForm.handleUnit}"/>
	<input type="hidden" name="handleUser" value="${AppealForm.handleUser}"/>
	<input type="hidden" name="handleDateStart" value="${AppealForm.handleDateStart}"/>
	<input type="hidden" name="handleDateEnd" value="${AppealForm.handleDateEnd}"/>
	<%-- 增加投诉现象分类和申诉单属性 start --%>
	<input type="hidden" name="appeProps" value="${AppealForm.appeProps}"/>
	<input type="hidden" name="compSort" value="${AppealForm.compSort}"/>
	<%--add by 宁桂鑫 $2011-3-22 增加投诉原因分类--%>
	<input type="hidden" name="compFinishReason" value="${AppealForm.compFinishReason}"/>
	<%--add end --%>
	<%-- 增加投诉现象分类和申诉单属性 end --%>
	<%--add by liyh $2011-4-15 增加工信部案件编号--%>
	<input type="hidden" name="compCode" value="${AppealForm.compCode}"/>
	<%--add end --%>
	<!-- 与分页标签结合使用的两个参数 -->
	<input name="pageSize" type="hidden" value="${page.pageSize}" />
	<input name="pageNo" type="hidden" value="${page.currPageNo}" />
</form>
<form name="hiddenform" method="post">
</form>
</div>

<div id="sidebarExpand" class="menu_bg" style="display:none">
	<div style="margin-top:3px; margin-right:3px;float:right; cursor: pointer;" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('down','','<c:url value="/images/ns-expand-down.gif"/>',1)"><img src="<c:url value="/images/ns-expand.gif"/>" name="down" id="down" alt="向下扩展" onclick="expand_onClick();"/></div><span style="margin-left:10px;">申诉单列表</span>
</div>

</body>
</html>