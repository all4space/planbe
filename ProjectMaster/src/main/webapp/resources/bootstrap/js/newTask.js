$(function(){
	

	
	$("input[type=submit]").on("click",function(){
		
		var projectNo=$('input[name=projectNo]').val();
			
		var taskName=$('input[name=taskName]').val();
		console.log(taskName);
		var taskContent=$('textarea[name=taskContent]').val();
		console.log(taskContent);
		var startDate=$('input[name=startDate]').val();
		console.log(startDate);
		var dueDate=$('input[name=dueDate]').val();
		console.log(dueDate);
		
		
		if (projecNo.length <=0) {			
			alert("프로젝트를 선택하세요");
		}else if (taskName.length <=0) {
			alert("업무이름을 입력하세요");
			return false;
		}else if(taskContent.length <=0){
			alert("업무 내용을 입력하세요");
			return false;
		}else if(startDate.length <=0){
			alert("업무 시작 시간을 입력하세요");
			return false;
		}else if (dueDate <=0) {
			alert("업무 종료 시간을 입력하세요");
			return false;
		}
		
	});
	
		

	
});