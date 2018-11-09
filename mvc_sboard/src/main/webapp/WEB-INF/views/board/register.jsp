<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.fileDrop {
		width: 80%;
		height: 100px;
		border: 1px solid gray;
		background-color: lightslategray;
		margin: auto;
}
</style>
<!-- Main Content -->
<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title">REGISTER BOARD</h3>
        </div>
        <form id="registerForm" method="post">
          <input type="hidden" name="uno" value="${userInfo.uno}" />
          <div class="box-body">
            <div class="form-group">
              <label for="writer">Writer</label>
              <input type="text" name="writer" class="form-control" readonly value="${userInfo.uname}" />
            </div>
            <div class="form-group">
              <label for="title">Title</label>
              <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" />
            </div>
            <div class="form-group">
              <label for="content">Content</label>
              <textarea name="content" class="form-control" rows="3" placeholder="내용을 입력하세요"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label>FILE DROP HERE</label>
            <div class="fileDrop"></div>
          </div>
          <div class="box-footer">
            <div>
              <hr />
            </div>
            <ul class="mailbox-attachments clearfix uploadedList"></ul>
            <input type="submit" class="btn btn-primary" value="Submit" />
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="attachment"/>
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">
				{{fileName}}
			</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
			
			<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
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

  $("#registerForm").submit(function(event) {
    event.preventDefault();
    var target = $(this);
    var str = "";

    //li 객체 안에 a 태그
    $(".uploadedList .delBtn").each(function(index) {
      str += "<input type = 'hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "' />"
    });
    target.append(str);
    target.get(0).submit();
  });

  $(".uploadedList").on("click", ".delBtn", function() {

    event.preventDefault();

    var target = $(this);
    $.ajax({
    url : "/deleteFile",
    type : "post",
    data : {
      fileName : target.attr("href")
    },
    dataType : "text",
    success : function(result) {
      if (result == "deleted") {
        target.closet("li").remove();
      }
    }
    });
  });
</script>
</div>
<!-- end wrapper -->
<%@include file="../include/footer.jsp"%>