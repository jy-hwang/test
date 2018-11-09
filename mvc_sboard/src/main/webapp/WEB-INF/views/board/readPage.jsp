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
</style>

<div class="popup back" style="display: none"></div>
<div class="popup front" style="display: none">
  <a id="img" href=""><img id="popup_img" /></a>
</div>



<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">READ BOARD</h3>
        </div>
        <div class="box-body">
          <form id="readForm" method="post">
            <input type="hidden" name="bno" value="${boardVo.bno}" />
            <input type="hidden" name="page" value="${cri.page}" />
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
            <input type="hidden" name="searchType" value="${cri.searchType}" />
            <input type="hidden" name="keyword" value="${cri.keyword}" />
          </form>

          <div class="form-group">
            <label>WRITER</label>
            <input type="text" class="form-control" readonly value="${boardVo.writer}" />
          </div>


          <div class="form-group">
            <label>TITLE</label>
            <input type="text" class="form-control" readonly value="${boardVo.title}" />
          </div>
          <div class="form-group">
            <label>CONTENT</label>
            <textarea class="form-control" rows="3" readonly>${boardVo.content}</textarea>
          </div>

        </div>
        <div class="box-footer">
          <div>
            <hr />
          </div>
          <ul class="mailbox-attachments clearfix uploadedList"></ul>

          <c:if test="${!empty userInfo}">
          <c:if test="${userInfo.uno == boardVo.uno}">
          <input type="button" class="btn btn-warning" id="modifyBtn" value="MODIFY" />
          <input type="button" class="btn btn-danger" id="deleteBtn" value="DELETE" />
          </c:if>
          <input type="button" class="btn btn-primary" id="listBtn" value="LIST" />
          </c:if>

          <input type="button" class="btn btn-default" id="replyBtn" value="REPLY" />


        </div>
      </div>
      <!-- <div class="box-footer">
					<input type="button" class="btn btn-warning" value="MODIFY" />
					 <input	type="button" class="btn btn-danger" value="DELETE" />
					 <input type="button" class="btn btn-primary" value="LIST" />
					 <input type="button" class="btn btn-default" value="REPLY" />
					</div> -->

      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">ADD NEW COMMENT</h3>
            </div>


            <DIV class="box-body">
              <label>WRITER</label>
              <input type="text" class="form-control" name="commentAuth"
              id="newCommentAuth" placeholder="작성자" value="${userInfo.uname}" />
              <label>COMMENT</label>
              <input type="text" class="form-control" name="commentText" id="newCommentText" placeholder="댓글내용" />
    </div>
            <div class="box-footer">
              <input type="button" class="btn btn-primary" name="commentAddBtn" id="commentAddBtn" value="ADD Comment" />
            </div>
          </div>

          <ul class="timeline">
            <li class="time-label" id="commentDiv"><span class="bg-green">
            comment List<small id="commentCntSmall">[${boardVo.commentCnt} }]</small>
            </span></li>
          </ul>
          <div class="text-center">
            <ul id="pagination" class="pagination pagination-sm no-margin">
            </ul>
          </div>

        </div>

      </div>
      <%-- <%@include file="..\test.jsp"%> --%>

      <div id="modifyModal" class="modal modal-primary fade" role="dialog">
        <div class="modal-dialog">
          <!-- modal-content -->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
              <p>
                <input type="text" id="commentText" class="form-control" />
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" id="commentModBtn" class="btn btn-info">modify</button>
              <button type="button" id="commentDelBtn" class="btn btn-primary">delete</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">close</button>

            </div>
          </div>
        </div>
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
          {{#isCheckAuth uno}}
				  	<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
          {{else}}
              *댓글 작성자가 아닙니다*
           {{/isCheckAuth}}
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

</div>
</li>


</script>



<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dataObj = new Date(timeValue);
		var year = dataObj.getFullYear();
		var month = dataObj.getMonth() + 1;
		var date = dataObj.getDate();
		return year + "/" + month + "/" + date;

	});

	Handlebars.registerHelper("isCheckAuth",function(uno,options){
	  var userUno = "${userInfo.uno}";
	  if(userUno == uno){
	    return options.fn(this);
	  }else{
	    return options.inverse(this);
	  }
	});

	var bno = ${boardVo.bno};
	var commentPage = 1;

	function getPage(pageInfo) {
		//pageInfo : /comments/bno/page
		$.getJSON(pageInfo, function(data) {
			//data 안에 commentController 에서 넘어온 map 객체를 받음
			console.log(data.list.length);
			printPage(data.list, $("#commentDiv"), $("#template"));

			//printPaging(data.pageMaker,$("#pagination"));

			$("#modifyModal").modal("hide");
		});
	}

	$("#pagination").on("click", "li a", function(event) {
		event.preventDefault();
		commentPage = $(this).attr("href");
		getPage("/comments/" + bno + "/")
	});

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	}

	var printPage = function(commentData, target, templateObj) {
		var template = Handlebars.compile(templateObj.html());
		var html = template(commentData);

		//$(".commentLi").remove();
		// target.after(html);
		target.parent().append(html);
		// target = commentDiv  의 parent 는 ul timeline

	}

	$("#commentDiv").on("click", function() {
		if ($(".timeline li").size() > 1) {
			return;
		}
		var pageInfo = "/comments/" + bno + "/1";
		getPage(pageInfo);
	});

	$("#commentAddBtn").on("click", function() {
		var auth = $("#newCommentAuth").val();
		var text = $("#newCommentText").val();
		var uno = "${userInfo.uno}";

		$.ajax({
			type : 'post',
			url : '/comments',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"

			},
			dataType : "text",
			data : JSON.stringify({
				bno : bno,
				commentText : text,
				commentAuth : auth,
				uno : uno
			}),
			success : function(result) {
				if (result == "SUCCESS") {
					alert("등록완료");
					commentPage = 1;
					var pageInfo = "/comments/" + bno + "/" + commentPage;
					getPage(pageInfo);
					$("#newCommentAuth").val("");
					$("#newCommentText").val("");
				}
			}
		});
	});

	$(".timeline").on("click", ".commentLi", function() {
		var comment = $(this);
		$(".modal-title").html(comment.attr("data-cno"));
		$("#commentText").val(comment.find(".timeline-body").text());
	});

	$("#commentModBtn").on("click", function() {
		$.ajax({
			type : 'put',
			url : '/comments/' + cno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			dataType : "text",
			data : JSON.stringify({
				commentText : commentText
			}),
			success : function(result) {
				if (result == "SUCCESS") {
					alert("수정 완료");
					var pageInfo = "/comments/" + bno + "/" + commentPage;
					getPage(pageInfo);
				}
			}
		});
	});

	$("#commentDelBtn").on("click", function() {
		var cno = $(".modal-title").html();

		$.ajax({
			type : 'delete',
			url : '/comments/' + cno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "delete"
			},
			dataType : "text",
			data : JSON.stringify({
				commentText : commentText
			}),
			success : function(result) {
				if (result == "SUCCESS") {
					alert("삭제 완료");
					var pageInfo = "/comments/" + bno + "/" + commentPage;
					getPage(pageInfo);
				}
			}
		});
	});

	$(window).scroll(function() {
		var wt = $(window).scrollTop();
		var dh = $(document).height();
		var wh = $(window).height();

		if ((wt + wh) > (dh - 10)) {
			console.log("wt : " + wt + " dh : " + dh + " wh : " + wh);
			if ($(".timeline li").size <= 1) {
				return;
			}
			commentPage++;
			var pageInfo = "/comments/" + bno + "/" + commentPage;
			getPage(pageInfo);
		}
	});

	var temp = Handlebars.compile($("#templateAttach").html());

	$.getJSON("/board/getAttach/" + bno, function(list) {
		$(list).each(function() {
			var fileInfo = getFileInfo(this);
			var html = temp(fileInfo);
			$(".uploadedList").append(html);

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

	$(document).ready(function() {
		var formObj = $("#readForm");
		console.log(formObj);

		$("#modifyBtn").on("click", function() {
			formObj.attr("action", "/board/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#deleteBtn").on("click", function() {

		  var commentCnt = ${boardVo.commentCnt};
		  if(commentCnt >0){
		    alert("댓글이 달린 게시물을 삭제할 수 없습니다.");
		    return;
		  }


		  var arr=[];
		  $(".uploadedList li").each(function(index){
		    arr.push($(this).attr("data-src"));
		  });

		  if(arr.length > 0){
		    $.post("/deleteAllFiles",{files:arr},function(result){
		      alert(result);
		    });


		  }

		  formObj.attr("action", "/board/removePage");
			formObj.submit();
		});

		$("#listBtn").on("click", function() {
			formObj.attr("action", "/board/listReply");
			formObj.attr("method", "get");
			formObj.submit();
		});

		$("#replyBtn").on("click", function() {
			formObj.attr("action", "/board/replyRegister")
			formObj.attr("method", "get");
			formObj.submit();
		})

	});
</script>
</div>
<%@include file="../include/footer.jsp"%>
