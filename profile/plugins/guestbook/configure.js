/* Js Document */
$(".action-aduit").click(function(){
	var data_id=$(this).attr("data-id");
	if (data_id)
	{
		$.getJSON(foler+"/system.asp",{"j":"aduit","id":data_id},function(result){
			if (result.success==true)
			{
				window.location.reload()();
			}
			else{
				alert("���ó���");
			}
		});
	}
});
$(".action-del").click(function(){
	var data_id=$(this).attr("data-id");
	if(data_id&&window.confirm("ȷʵҪɾ����")){
		$.getJSON(foler+"/system.asp",{"j":"del","id":data_id},function(result){
			if (result.success==true)
			{
				window.location.reload()();
			}
			else{
				alert("ɾ��ʧ��");
			}
		});
    }
});
