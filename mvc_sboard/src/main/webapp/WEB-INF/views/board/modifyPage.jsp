<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>


<style>
.popup {
	position: fixed;
}

.back {
	left: 0;
	top: 0;
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 100%;
	overflow: hidden;
	z-index: 1000;
}

.front {
	left: 0;
	top: 0;
	z-index: 1110;
	opacity: 1;
	margin: auto;
}

#popup_img {
	width: 700px;
	height: 500px
}
#sm1{
font:red;
}
.sm1{
font: red;
}
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px solid gray;
  background-color: lightslategray;
  margin: auto;
}
</style>

<div class="popup back" style="display: none"></div>
<div class="popup fornt" style="display: none">
  <a id="img" href=""><img id="popup_img" /></a>
</div>



<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">MODIFY BOARD</h3>
        </div>
        <div class="box-body">
          <form id="modifyForm" method="post">
            <input type="hidden" name="bno" value="${boardVo.bno}" />
            <input type="hidden" name="page" value="${cri.page}" />
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
            <input type="hidden" name="searchType" value="${cri.searchType}" />
            <input type="hidden" name="keyword" value="${cri.keyword}" />


            <div class="form-group">
              <label>WRITER</label>
              <input type="text" class="form-control" readonly value="${boardVo.writer}" />
            </div>
            <div class="form-group">
              <label>TITLE</label>
              <input type="text" class="form-control" name="title" value="${boardVo.title}" />
            </div>
            <div class="form-group">
              <label>CONTENT</label>
              <textarea class="form-control" name="content" rows="3">${boardVo.content}</textarea>
            </div>
            
            <div class="form-group">
              <label>FILE DROP HERE</label>
              <div class="fileDrop"></div>
            </div>
            <div class="box-footer">
              <div>
                <hr/>
              </div>
              <ul class="mailbox-attachments clearfix uploadedList"></ul>
              </div>
          </form>
        </div>
        <input type="button" id="btnSave" class="btn btn-warning" value="SAVE" />
        <input type="button" id="btnCancel" class="btn" value="CANCEL" />
      </div>
    </div>
  </div>
  
</section>

<!-- close wrapper  -->

<script id="template" type="text/x-handlebars-template">
  {{#each.}}
    <li class="commentLi" data-cno={{cno}}>
      <i class="fa fa-comments bg-blue"></i>
      <div class="timeline-item">
        <span class="time">
          <i class="fa fa-clock-o"></i>
          {{prettifyDate regdate}}
        </span>
        <h3 class="timeline-header"><strong>{{cno}}</strong> - {{commentAuth}}</h3>
        <div class="timeline-body">{{commentText}}</div>
        <div class="timeline-footer">
          <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
        </div>
      </div>
    </li>
  {{/each}}
</script>

<script id="templateAttach" type="text/x-handlebars-template">

<li data-src='{{fullName}}'>
<span class="mailbox-attachment-icon has-img">
  <img src="{{imgsrc}}" alt="attachment"/>
</span>
<div class="mailbox-attachment-info">
  <a href="{{getLink}}" class="mailbox-attachment-name" target="_blank">
    {{fileName}}
  </a>
  <small id="sm1">X</small>
</div>
</li>


</script>
<script>
var bno = ${boardVo.bno};

	var temp = Handlebars.compile($("#templateAttach").html());

	//비동기통신. 받는 값이 JSON 타입
	$.getJSON("/board/getAttach/" + bno, function(list) {
		// (url,event)
		
		$(list).each(function() {
			//값이 존재한다면 each 하나씩 가져옴
			var fileInfo = getFileInfo(this);
			// upload.js -> getFileInfo -> fullName
			
			var html = temp(fileInfo);
			
			
			//uploadedList 뒤에 html 값을 추가
			$(".uploadedList").append(html);

		});

	});

	$(".uploadedList").on("click", ".delBtn", function() {

	    event.preventDefault();

	    var fileLink = $(this).attr("href");
	    $.ajax({
	    	url : "/deleteFile",
	    type : "post",
	    data : {fileName :fileLink},
	    dataType : "text",
	    success : function(result){
	    	if(result== "deleted"){
	    		$(this).closest("li").remove();
	    	}
	    }
    });
});
	    
	    
	
	
	$(".uploadedList").on("click", ".mailbox-attachment-info a",
			function(event) {
				var fileLink = $(this).attr("href");

				if (checkImageType(fileLink)) {
					event.preventDefault();

					var imgTag = $("#popup_img");
					imgTag.attr("src", fileLink);
					imgTag.load(function() {
						$(".front").css({
							"top" : "50%",
							"left" : "50%",
							"margin-left" : -(width / 2),
							"margin-top" : -(height / 2)
						});
						$(".popup").show("slow");
					});
				}
			});
</script>

<script>
	$(document).ready(
			function() {
				var formObj = $("#modifyForm");
				console.log(formObj);

				$("#btnSave").on("click", function() {
					var str="";
					$(".uploadedList .delBtn").each(function(index){
					str +="<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'/>"	
					
					});
					formObj.appent(str);
					formObj.attr("action", "/board/modifyPage");
					formObj.submit();
				});

				$("#btnCancel").on(
						"click",
						function() {
							/* location.href = "/board/listAll";
							location.href = "/board/list?page=${cri.page}&"
									+ "perPageNum=${cri.perPageNum}&"
									+ "searchType=${cri.searchType}&"
									+ "keyword=${cri.keyword}"; */
							formObj.attr("action", "/board/listReply");
							formObj.attr("method", "get");
							formObj.submit();

						});

			});
</script>

<script>
  var template = Handlebars.compile($("#template").html());
  
  
  $(".fileDrop").on("dragover dragenter", function(event) {
    event.preventDefault();
  });

  $(".fileDrop").on("drop", function(event) {
    event.preventDefault();
    
    var files = event.originalEvent.dataTransfer.files;

    var file = files[0];
    var formData = new FormData();
    formData.append("file", file);

    $.ajax({
      url : '/uploadAjax',
      data : formData,
      dataType : "text",
      processData : false,
      contentType : false,
      type : "POST",
      success : function(result) {
        alert(result);
        var fileInfo = getFileInfo(result);
        var html = template(fileInfo);
        console.log(html);
        $(".uploadedList").append(html);
      }
    });
  });

  $("#registerForm").submit(
      function(event) {
        event.preventDefault();
        var target = $(this);
        var str = "";

        //li 객체 안에 a 태그
        $(".uploadedList .delBtn").each(
            function(index) {
              str += "<input type = 'hidden' name='files["
                  + index + "]' value='"
                  + $(this).attr("href") + "' />"
            });
        target.append(str);
        target.get(0).submit();
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
  
  
</script>



</div>
<%@include file="../include/footer.jsp"%>