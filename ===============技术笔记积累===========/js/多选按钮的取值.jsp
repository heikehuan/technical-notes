<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="keywords" content="վ��,��ҳ��Ч,js��Ч,������,zzjs,zzjs.net,sky,www.zzjs.net,վ����Ч ��" />
<meta name="description" content="www.zzjs.net,վ����Ч����վ���ر�js��Ч�������롣����������js��Ч���ṩ����������������,����վ����Ч��" />
<title>����ѡ��ť���б��sky�����ռ���</title>
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
<a href="<#ZC_BLOG_HOST#>">վ����Ч��</a>,վ���ر��ĸ�������ҳ��Ч�͹����롣zzjs.net��վ��js��Ч��<hr>
<!--��ӭ����վ����Ч����������վ�ռ�����������js��Ч���ṩ�����������أ���ַ��www.zzjs.net��zzjs@msn.com,��.net������վ-->
<SCRIPT LANGUAGE="JavaScript">
<!--
function HtmlEncode(text){
	return text.replace(/&/g, '&').replace(/\"/g, '"').replace(/</g, '<').replace(/>/g, '>');
}//��ӭ����վ����Ч�������ǵ���ַ��www.zzjs.net���ܺüǣ�zzվ����js����js��Ч����վ�ռ�����������js���룬���������������ء�
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
}//��ӭ����վ����Ч�������ǵ���ַ��www.zzjs.net���ܺüǣ�zzվ����js����js��Ч����վ�ռ�����������js���룬���������������ء�
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
}//��ӭ����վ����Ч�������ǵ���ַ��www.zzjs.net���ܺüǣ�zzվ����js����js��Ч����վ�ռ�����������js���룬���������������ء�
//-->
</SCRIPT>
<form method="post" name="myform" action="?">
  <table border="0" width="200">
    <tr>
      <td><div style="width:180px;height:150px;overflow:auto;border: 2px inset #FFFFFF;">
<SCRIPT LANGUAGE="JavaScript">
<!--
_checkbox("city","����^ɽ��^����^����^����^����^�㶫^����^����^����^�ӱ�^������^����^����^����^���ɹ�^����^����^����^����^����^�ຣ^ɽ��^����^�Ϻ�^�Ĵ�^���^����^�½�^����^�㽭^���^����^̨��","����,ɽ��")
//-->
</SCRIPT></div>
	  </td>
    </tr>
    <tr>
      <td>
<button onclick='_sl(document.myform.city,true);'>ȫѡ</button>
<button onclick='_sl(document.myform.city,false);'>ȫ��ѡ</button>
<button onclick='_setv(document.myform.city,"����,�㶫");'>setֵ</button>
<button onclick='alert(_getv(document.myform.city));'>getֵ</button>
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
<button onclick='_sl(document.myform.WebSite,true);'>ȫѡ</button>
<button onclick='_sl(document.myform.WebSite,false);'>ȫ��ѡ</button>
<button onclick='_setv(document.myform.WebSite,"http://www.google.com");'>setֵ</button>
<button onclick='alert(_getv(document.myform.WebSite));'>getֵ</button>
	  </td>
    </tr>
	<tr>
      <td align="center"><button onclick='document.myform.reset();'>���ñ�</button> </td>
    </tr>
  </table>
</form>
</body>
</html>