<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Ajax</title>
</head>
<body>
	<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px solid darkblue;
}
</style>

	<h3>Upload Ajax</h3>
	<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<div class="fileDrop"></div>
	<div class="uploadedList"></div>

<script>
$(".fileDrop").on("dragenter dragover",function(event){
	event.preventDefault();
	
});



$(".fileDrop").on("drop",function(event){
	//alert("drop")
	event.preventDefault();
	var files = event.originalEvent.dataTransfer.files;
	var file = files[0];
	console.log(file);


	var formData = new FormData();
	formData.append("file",file);

	$.ajax({
		type : "post",
		url : "/uploadAjax",
		data : formData,
		dataType : "text",
		processData : false,
		contentType : false,
		success : function(result){
			//alert(result);
			var str="";
			
			if(checkImageType(result)){
				str = "<div>"
					+ "<a href='displayFile?fileName="+getImageLink(result)+"'target='_blank'>"
					+ "<img src='displayFile?fileName="+result+"'/>"
					+ "</a>"
					+ "<small data-src='"+result+"'>X</small>"
					+ "</div>";
			}else{
				str = "<div>"
					+ "<a href='displayFile?fileName="+result+"'>"
					+ getOriginalName(result)		
					+ "</a>"
					+ "<small data-src='"+result+"'>X</small>"
					+ "</div>";
			}
			
			$(".uploadedList").append(str);
	}
	});
	
});


$(".uploadedList").on("click","small",function(event){
	var target = $(this);
	$.ajax({
		url : "deleteFile",
		type : "POST",
		data : {fileName : $(this).attr("data-src")},
	success : function(result){
		if(result =="deleted"){
			alert("삭제완료");
			target.parent("div").remove();
		}
	}	
	
	});
	
});



function getOriginalName(fileName){
	if(checkImageType(fileName)){
		return;//이미지인경우 바로 보여줌
	}
	var idx = fileName.indexOf("_")+1;
	return fileName.substr(idx);
	
}

function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i
	
	return fileName.match(pattern);
	
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}
	console.log(fileName);
	var front = fileName.substr(0,12);
	var end = fileName.substr(14);
	console.log(front+end);
	
	
	return front+end;
	
}

</script>

</body>
</html>