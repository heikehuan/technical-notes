<html>
<head>
<meta http-equiv="content-Type" content="text/html;charset=gb2312">
<meta name="keywords" content="站长,网页特效,js特效,js脚本,脚本,广告代码,zzjs,zzjs.net,sky,www.zzjs.net,站长特效 网" />
<meta name="description" content="www.zzjs.net,站长特效网，站长必备js特效及广告代码。大量高质量js特效，提供高质量广告代码下载,尽在站长特效网" />
<title>网页特效 省级联动菜单 站长特效网</title>
<script language="javascript">
<!--
  var onecount;
  onecount=0;
  subcat = new Array();
  subcat[0] = new Array("徐汇区","01","001");
  subcat[1] = new Array("嘉定区","01","002");
  subcat[2] = new Array("黄浦区","01","003");
  subcat[3] = new Array("南昌市","02","004");
  subcat[4] = new Array("九江市","02","005");
  subcat[5] = new Array("上饶市","02","006");
onecount=6;
function changelocation(locationid)
  { //欢迎来到站长特效 网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
  document.zzjs_net.smalllocation.length = 0;
 var locationid=locationid;
  var i;
  document.zzjs_net.smalllocation.options[0] = new Option('====所有地区====','');
  for (i=0;i < onecount; i++)
  {
  if (subcat[i][1] == locationid)
  {
  document.zzjs_net.smalllocation.options[document.zzjs_net.smalllocation.length] = new Option(subcat[i][0], subcat[i][2]);
  }
  }
  } //欢迎来到站长特效网，我们的网址是www.zzjs.net，很好记，zz站长，js就是js特效，本站收集大量高质量js代码，还有许多广告代码下载。
//-->
</script>
</head>
<body>
<a href="http://www.zzjs.net/">站长特效网</a>,站长必备的高质量网页特效和广告代码。zzjs.net，站长js特效。<hr>
<!--欢迎来到站长特效网，我们网站收集大量高质量js特效，提供许多广告代码下载，网址：www.zzjs.net，zzjs@msn.com,用.net打造靓站-->
<form name="zzjs_net" method="post">
<select name="www_zzjs_net" onChange="changelocation(document.zzjs_net.www_zzjs_net.options[document.zzjs_net.www_zzjs_net.selectedIndex].value)">
<option value="01" selected>上海</option>
<option value="02">江西</option>
</select>
<select name="smalllocation">
<option selected value="">==所有地区==</option>
</select>
</form>
<script LANGUAGE="javascript">
<!--
  changelocation(document.zzjs_net.www_zzjs_net.options[document.zzjs_net.www_zzjs_net.selectedIndex].value);
//-->
</script>
</body>
</html>