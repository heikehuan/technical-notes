function init_fileName(){
	var form_tableObj = $("#form_table");  //table��id��Ϊform_table��ȡtable����
	//������Χ��������
	var coopScopeDescFileId = $(":input[name=coopScopeDescFileId]",form_tableObj).val();      //input���ͣ�name����ΪcoopScopeDescFileId
	var coopScopeDescFileName = $(":input[name=coopScopeDescFileName]",form_tableObj).val();
	
	$("#a_coopScopeDescFileId").attr("href","javascript:downLoadFile('"+coopScopeDescFileId+"');");
	$("#a_coopScopeDescFileName").html(coopScopeDescFileName);
}	