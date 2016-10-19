function init_fileName(){
	var form_tableObj = $("#form_table");  //table的id名为form_table，取table对象
	//合作范围描述附件
	var coopScopeDescFileId = $(":input[name=coopScopeDescFileId]",form_tableObj).val();      //input类型，name定义为coopScopeDescFileId
	var coopScopeDescFileName = $(":input[name=coopScopeDescFileName]",form_tableObj).val();
	
	$("#a_coopScopeDescFileId").attr("href","javascript:downLoadFile('"+coopScopeDescFileId+"');");
	$("#a_coopScopeDescFileName").html(coopScopeDescFileName);
}	