<html>
<head>
<meta http-equiv="content-Type" content="text/html;charset=gb2312">
<meta name="keywords" content="վ��,��ҳ��Ч,js��Ч,js�ű�,�ű�,������,zzjs,zzjs.net,sky,www.zzjs.net,վ����Ч ��" />
<meta name="description" content="www.zzjs.net,վ����Ч����վ���ر�js��Ч�������롣����������js��Ч���ṩ����������������,����վ����Ч��" />
<title>��ҳ��Ч ʡ�������˵� վ����Ч��</title>
<script language="javascript">
<!--
  var onecount;
  onecount=0;
  subcat = new Array();
  subcat[0] = new Array("�����","01","001");
  subcat[1] = new Array("�ζ���","01","002");
  subcat[2] = new Array("������","01","003");
  subcat[3] = new Array("�ϲ���","02","004");
  subcat[4] = new Array("�Ž���","02","005");
  subcat[5] = new Array("������","02","006");
onecount=6;
function changelocation(locationid)
  { //��ӭ����վ����Ч �������ǵ���ַ��www.zzjs.net���ܺüǣ�zzվ����js����js��Ч����վ�ռ�����������js���룬���������������ء�
  document.zzjs_net.smalllocation.length = 0;
 var locationid=locationid;
  var i;
  document.zzjs_net.smalllocation.options[0] = new Option('====���е���====','');
  for (i=0;i < onecount; i++)
  {
  if (subcat[i][1] == locationid)
  {
  document.zzjs_net.smalllocation.options[document.zzjs_net.smalllocation.length] = new Option(subcat[i][0], subcat[i][2]);
  }
  }
  } //��ӭ����վ����Ч�������ǵ���ַ��www.zzjs.net���ܺüǣ�zzվ����js����js��Ч����վ�ռ�����������js���룬���������������ء�
//-->
</script>
</head>
<body>
<a href="http://www.zzjs.net/">վ����Ч��</a>,վ���ر��ĸ�������ҳ��Ч�͹����롣zzjs.net��վ��js��Ч��<hr>
<!--��ӭ����վ����Ч����������վ�ռ�����������js��Ч���ṩ�����������أ���ַ��www.zzjs.net��zzjs@msn.com,��.net������վ-->
<form name="zzjs_net" method="post">
<select name="www_zzjs_net" onChange="changelocation(document.zzjs_net.www_zzjs_net.options[document.zzjs_net.www_zzjs_net.selectedIndex].value)">
<option value="01" selected>�Ϻ�</option>
<option value="02">����</option>
</select>
<select name="smalllocation">
<option selected value="">==���е���==</option>
</select>
</form>
<script LANGUAGE="javascript">
<!--
  changelocation(document.zzjs_net.www_zzjs_net.options[document.zzjs_net.www_zzjs_net.selectedIndex].value);
//-->
</script>
</body>
</html>