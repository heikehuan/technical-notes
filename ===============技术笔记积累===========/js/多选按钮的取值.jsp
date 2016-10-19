<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="站长,网页特效,js特效,广告代码,zzjs,zzjs.net,sky,www.zzjs.net,站长特效 网" />
<meta name="description" content="www.zzjs.net,站长特效网，站长必备js特效及广告代码。大量高质量js特效，提供高质量广告代码下载,尽在站长特效网" />
<title>带多选按钮的列表框，sky整理收集。</title>
</head>
<style>
body,td{font-size:12px;color:#000000;}
.checkbox{width:15px;height:15px;}
.cked{
	margin:1px;padding:2px;width:100%;display:block;background-color:highlight;color:highlighttext;
}
.nock{
	margin:1px;padding:2px;width:100%;display:block;
}
</style>
<body>
<a href="<#ZC_BLOG_HOST#>">站长特效网</a>,站长必备的高质量网页特效和广告代码。zzjs.net，站长js特效。<hr>
<!--欢迎来到站长特效网，我们网站收集大量高质量js特效，提供许多广告代码下载，网址：www.zzjs.net，zzjs@msn.com,用.net打造靓站-->
<SCRIPT LANGUAGE="JavaScript">
<!--
function HtmlEncode(text){
	return text.replace(/&/g, '&').replace(/\"/g, '"').replace(/</g, '<').replace(/>/g, '>');
}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
function _checkbox(name,str,defv){
	//haiwa@2005-8-17
	//http://www.zzjs.net
	var arr=str.split("^");
	var ck="",bc="";
	for(var i=0;i<arr.length;i++){
		var thisarr=arr[i].split("@=");
		if (thisarr[0].length>0){
			var t=(thisarr.length==2)?thisarr[0]:arr[i];
			var v=(thisarr.length==2)?thisarr[1]:arr[i];
			if((","+HtmlEncode(defv).toLowerCase()+",").replace(/ ,/g, ',').indexOf(","+v+",")!=-1){ck=" checked";cls="cked";}
			else{ck="";cls="nock";}
			var thisstr="<label class=\""+cls+"\" for=\"i_"+name+"_"+i+"\" id=\"l_"+name+"_"+i+"\">";
			thisstr+="<input class=\"checkbox\" onpropertychange=\"document.getElementById('l_"+name+"_"+i+"').className=(document.getElementById('i_"+name+"_"+i+"').checked)?'cked':'nock';\" onclick=\"document.getElementById('l_"+name+"_"+i+"').className=(document.getElementById('i_"+name+"_"+i+"').checked)?'cked':'nock';\" type=\"checkbox\""+ck+" name=\""+name+"\" id=\"i_"+name+"_"+i+"\" value=\""+HtmlEncode(v)+"\" \/> ";
			thisstr+=HtmlEncode(t)+"</label>";
			document.write(thisstr);
		}
	}
}
function _getv(o){
	var allvalue="";
	if(typeof(o)=="undefined"){return "";}
	if (typeof(o.length)=="undefined"){
		if(o.checked){return o.value+ ",";}else{return "";}
	}
	for(var i=0;i<o.length;i++){
		if(o[i].checked){
			allvalue +=o[i].value+",";
		}
	}
	return allvalue;
}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
function _setv(o,defv){
	var allvalue=(","+HtmlEncode(defv).toLowerCase()+",").replace(/ ,/g, ',');
	for(var i=0;i<o.length;i++){
		var v = o[i].value;
		o[i].checked=(allvalue.indexOf(","+v+",")!=-1)
	}
	return allvalue;
}
function _sl(o,b){
	for(var i=0;i<o.length;i++){
		o[i].checked = b
		//if(o[i].checked!=b){o[i].click();}
	}
}//欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
//-->
</SCRIPT>
<form method="post" name="myform" action="?">
  <table border="0" width="200">
    <tr>
      <td><div style="width:180px;height:150px;overflow:auto;border: 2px inset #FFFFFF;">
<SCRIPT LANGUAGE="JavaScript">
<!--
_checkbox("city","北京^山东^安徽^重庆^福建^甘肃^广东^广西^贵州^海南^河北^黑龙江^河南^湖北^湖南^内蒙古^江苏^江西^吉林^辽宁^宁夏^青海^山西^陕西^上海^四川^天津^西藏^新疆^云南^浙江^香港^澳门^台湾","北京,山东")
//-->
</SCRIPT></div>
	  </td>
    </tr>
    <tr>
      <td>
<button onclick='_sl(document.myform.city,true);'>全选</button>
<button onclick='_sl(document.myform.city,false);'>全不选</button>
<button onclick='_setv(document.myform.city,"甘肃,广东");'>set值</button>
<button onclick='alert(_getv(document.myform.city));'>get值</button>
	  </td>
    </tr>
    <tr>
      <td><div style="width:180px;height:120px;overflow:auto;border: 2px inset #FFFFFF;">
<SCRIPT LANGUAGE="JavaScript">
<!--
_checkbox("WebSite","Google.com@=http://www.google.com^Blueidea.com@=http://www.zzjs.net^zzjs.net@=http://www.zzjs.net^zzjs.net@=http://www.zzjs.net","http://zzjs.net")
//-->
</SCRIPT></div>
	  </td>
    </tr>
    <tr>
      <td>
<button onclick='_sl(document.myform.WebSite,true);'>全选</button>
<button onclick='_sl(document.myform.WebSite,false);'>全不选</button>
<button onclick='_setv(document.myform.WebSite,"http://www.google.com");'>set值</button>
<button onclick='alert(_getv(document.myform.WebSite));'>get值</button>
	  </td>
    </tr>
	<tr>
      <td align="center"><button onclick='document.myform.reset();'>重置表单</button> </td>
    </tr>
  </table>
</form>
</body>
</html>