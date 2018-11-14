<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/handlebars-v4.0.12.js"></script>
<section class="content">
  <div class="contatiner">
    <div class="row">
      <div class="col-md-12">
        <div class="box box-success">
          <div class="box-header">
            <h3 class="box-title">글 내용 확인</h3>
          </div>
          <form id="hidden" method="post">
            <input type="hidden" name="fno" id="fno" value="${fbvo.fNo}" />
          </form>
          <form>
            <div class="box-body">
              <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" name="fWriter" class="form-control" readonly value="${fbvo.fWriter}" />
                <input type="hidden" name="mcate" id="mcate" class="form-control" value="${fbvo.mcate}" />
                <input type="hidden" name="mno" id="mno" value="${fbvo.mno}" />
              </div>
              <div class="form-group">
                <label for="title">제목</label>
                <input type="text" name="fTitle" class="form-control" readonly value="${fbvo.fTitle}" />
              </div>
              <div class="form-group">
                <label for="content">내용</label>
                <textarea name="fContent" class="form-control" cols="30" rows="10" readonly>${fbvo.fContent}</textarea>
              </div>
              <div class="form-group">
                <c:if test="${!empty userInfo}">
                  <c:if test="${fbvo.mno == userInfo.mNo}">
                    <button type="button" id="modifyBtn" class="btn btn-info pull-center">수정/삭제</button>
                  </c:if>
                  <button type="button" id="registerBtn" class="btn btn-danger">새글쓰기</button>
                </c:if>
                <button type="button" id="listBtn" class="btn btn-success">목록보기</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <c:if test="${!empty userInfo}">
            <div class="box">
              <div class="box-header with-border">
                <h3 class="box-title">ADD NEW COMMENT</h3>
              </div>
              <div class="box-body">
                <label for="cWriter">작성자</label>
                <input type="text" class="form-control" name="cWriter" id="newCommentAuth" value="${userInfo.mName}" readonly />
                <label for="cComment">댓글내용</label>
                <input type="text" class="form-control" name="cComment" id="newCommentText" placeholder="내용을 입력하세요" />
              </div>
              <div class="box-footer">
                <button class="btn btn-primary" id="commentAddBtn">댓글추가</button>
              </div>
            </div>
          </c:if>
          <ul class="timeline">
            <li class="time-label" id="commentDiv">
              <span class="bg-green">댓글목록</span>
            </li>
          </ul>
          <div class="text-center">
            <ul id="pagination" class="pagination pagination-sm no-margin"></ul>
          </div>
        </div>
      </div>
      <!--Modal Content-->
      <div id="modifyModal" class="modal modal-primary fade" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h6 class="modal-title"></h6>
            </div>
            <div class="modal-body">
              <p>
                <input type="text" id="commentText" class="form-control" />
              </p>
            </div>
            <div class="modal-footer">
              <button type="button" id="commentModBtn" class="btn btn-success">수정</button>
              <button type="button" id="commentDelBtn" class="btn btn-warning">삭제</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
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
          {{#isCheckAuth mno}}
            <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
          {{else}}
            댓글 작성자가 아닙니다.
          {{/isCheckAuth}}
        </div>
      </div>
    </li>
  {{/each}}
</script>
<script>
  Handlebars.registerHelper("prettifyDate", function(timeValue) {
    var dataObj = new Date(timeValue);
    var year = dataObj.getFullYear();
    var month = dataObj.getMonth() + 1;
    var date = dataObj.getDate();
    return year + "/" + month + "/" + date;

  });

  Handlebars.registerHelper("isCheckAuth", function(mno, options) {
    var usermNo = "${userInfo.mNo}";
    if (usermNo == mno) {
      return options.fn(this);
    } else {
      return options.inverse(this);
    }

  });

  var fno = ${fbvo.fNo};
  var commentPage = 1;

  function getPage(pageInfo, view) {
    //pageInfo : /comments/fno/page
    $.getJSON(pageInfo, function(data) {
      console.log(data.list.length);
      printPage(data.list, $("#commentDiv"), $("#template"), view);

      //printPaging(data.pageMaker,$("#pagination"));

      $("#modifyModal").modal("hide");
      $("#commentCntSmall").html("[ " + data.pageMaker.totalCount + " ]");

    });
  }
  var printPage = function(commentData, target, templateObj, view) {
    var template = Handlebars.compile(templateObj.html());
    var html = template(commentData);

    //$(".commentLi").remove();
    //target.after(html);

    if (view == "new") {
      $(".commentLi").remove();
    }
    target.parent().append(html);
  }

  $("#pagination").on("click", "li a", function(event) {
    event.preventDefault();
    commentPage = $(this).attr("href");
    getPage("/comments/" + fno + "/" + commentPage);

  });

  var printPaging = function(pageMaker, target) {
    var str = "";

    if (pageMaker.prev) {
      str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";

    }

    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
      var strClass = pageMaker.cri.page == i ? 'class=active' : '';
      str += "<li " + strClass+"><a href='"+i+"'>" + i + "</a></li>";

    }

    if (pageMaker.next) {
      str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";

    }

    target.html(str);
  }

  $("#commentDiv").on("click", function() {
    if ($(".timeline li").size() > 1) {
      return;
    }
    var pageInfo = "/comments/" + fno + "/1";
    getPage(pageInfo, "new");
  });

  $("#commentAddBtn").on("click", function() {
    var auth = $("#newCommentAuth").val();
    var text = $("#newCommentText").val();
    var mno = "${userInfo.mNo}";

    $.ajax({
    type : 'post',
    url : '/comments',
    headers : {
    "Content-Type" : "application/json",
    "X-HTTP-Method-Override" : "POST"
    },
    dataType : "text",
    data : JSON.stringify({
    fno : fno,
    commentText : text,
    commentAuth : auth,
    mno : mno

    }),
    success : function(result) {
      if (result == "SUCCESS") {
        alert("등록완료");
        commentPage = 1;
        var pageInfo = "/comments/" + fno + "/" + commentPage;
        getPage(pageInfo, "new");
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
    alert("수정");

    var cno = $(".modal-title").html();
    var commentText = $("#commentText").val();

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
        alert("등록완료");
        var pageInfo = "/comments/" + bno + "/" + commentPage;
        getPage(pageInfo, "new");
      }
    }

    });

  });

  $("#commentDelBtn").on("click", function() {
    alert("삭제");
  });

  $(window).scroll(function() {
    var dh = $(document).height();
    var wt = $(window).scrollTop();
    var wh = $(window).height();
    if ((wt + wh) > (dh - 10)) {
      if ($(".timeline li").size() <= 1) {
        return;
      }
      commentPage++;
      var pageInfo = "/comments/" + fno + "/" + commentPage;
      getPage(pageInfo);
    }

  });

  $(document).ready(function() {

    var formObj = $("#hidden");
    $("#listBtn").on("click", function() {
      console.log("목록보기 버튼 클릭");
      formObj.attr("action", "/boardf/listFree");
      formObj.attr("method", "get");
      formObj.submit();
    });

    $("#modifyBtn").on("click", function() {
      console.log("수정하기 버튼 클릭");
      formObj.attr("action", "/boardf/modifyFree");
      formObj.attr("method", "get");
      formObj.submit();

    });

    $("#registerBtn").on("click", function() {
      console.log("글쓰기버튼 클릭");
      formObj.attr("action", "/boardf/register")
      formObj.attr("method", "get");
      formObj.submit();

    });

  });
</script>
<footer>
  <%@include file="../include/footer.jsp"%>
</footer>