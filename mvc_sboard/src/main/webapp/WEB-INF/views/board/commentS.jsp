<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box-body">
  <form id="replyForm" method="post">
    <input type="hidden" name="bno" value="${commentVo.bno}" />
    <input type="hidden" name="cno" value="${commentVo.cno}" />
    <input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
    <input type="hidden" name="searchType" value="${cri.searchType}" />
    <input type="hidden" name="keyword" value="${cri.keyword}" />
  </form>
  <table class="table table-bordered">
    <tr>
      <th>ReplyAuth</th>
      <th>ReplyText</th>
      <th>REGDATE</th>
      <th></th>
    </tr>
    <!-- 댓글 확인하기 -->
    <c:forEach var="boardVo" items="${list}">
    <tr>
      <td>TEST</td>
      <td>TEST</td>
      <td>날짜</td>
      <td>
      <span class="input-group-btn">
            <button class="btn btn-default" type ="button" name="commentInsertBtn">등록</button>
            </span>
      </td>
    </tr>
  </c:forEach>
    
    <!-- 댓글 작성하는 란  -->
    <tr>
      <td>
        <input type="text" name="commentAuth" id="newCommentAuth" placeholder="이름을 입력하세요" />
      </td>
      <td>
        <input type="text" name="commentText" id="newCommentText" placeholder="댓글내용을 입력하세요" />
      </td>
      <td>날짜</td>
      <td>
        <span class="input-group-btn">
          <button class="btn btn-default" type="button" name="commentAddBtn">등록</button>
        </span>
      </td>
    </tr>
  </table>
</div>

<!-- jQuery 2.1.4 -->
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- 외부에서 가져온 jQuery 라이브러리. contextPath 는 최상위 루트  /webapp폴더 -->

<script>
  var bno = '${commentVo.bno}';
  // getAllList();
  getPageList(1);

  /* 정적인 페이지에서 동적인 이벤트 발생 */
  function getAllList() {
    $.getJSON("/comments/all/" + bno, function(data) {
      /* data 는 MAP 객체  */
      var str = "";

      $(data).each(function() {
        /* str+="<li data-cno='"this.cno+"' class='commentLi'>" */
        /* str+= "<li data-cno='"+this.cno+"' class='commentLi'>"
        + this.cno + " .작성자 : " + this.commentAuth
        + "&emsp; &emsp;내용 :" +  this.commentText
        + "<button>수정</button>"
        + "</li>"; */

        str += "<li data-cno='"+this.cno+"' class='commentLi'>" + this.cno + ":" + this.commentText + "<button>MODIFY</button>" + "</li>";
      });

      $("#comments").html(str);
    });
  }

  //페이징 처리된 List
  function getPageList(page) {
    $.getJSON("/comments/" + bno + "/" + page, function(data) {

      console.log(data.list.length);

      var str = '';
      $(data.list).each(function() {
        /* map 객체의 value 를 가져오기 위해 data.list  */

        str += "<li data-cno='"+this.cno+"' class='commentLi'>"
        /* li > 가 닫히기 전에 들어가는 속성값 data-cno / class */

        + this.cno + ":" + this.commentText + "<button>MODIFY</button>" + "</li>";
      });
      $("#comments").html(str);
      /* .html 속성이 아닌 내용으로  */
      printPage(data.pageMaker);
    });
  }

  function printPage(pageMaker) {
    var str = "";

    if (pageMaker.prev) {
      str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
    }

    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
      var strClass = pageMaker.cri.page == i ? 'class = active' : '';
      str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
    }

    if (pageMaker.next) {
      str += "<li><a href='" + (pageMaker.endPage + 1) + "'> >> </a></li>";
    }

    $(".pagination").html(str);
  }
  var commentPage = 1;

  $(".pagination").on("click", "li a", function(event) {
    event.preventDefault();
    commentPage = $(this).attr("href");
    getPageList(commentPage);
  });

  $("#commentListBtn").on("click", function() {
    getAllList();
  });

  $("#commentAddBtn").on("click", function() {
    var commentAuth = $("#newCommentAuth").val();
    var commentText = $("#newCommentText").val();
    /* alert("commentAuth : " + commentAuth + " \n commentText : " + commentText); */

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
    commentAuth : commentAuth,
    commentText : commentText

    }),

    success : function(result) {
      if (result == "SUCCESS") {
        alert("등록되었습니다.");
        getAllList();
      } else {
        alert(result);

      }
    }

    });

  });

  $("#comments").on("click", ".commentLi button", function() {
    /* alert("버튼 클릭"); */
    var comment = $(this).parent();
    /* $(this) = button  의 부모객체 li */

    var cno = comment.attr("data-cno");
    var commentText = comment.text();

    /*     alert("cno : " + cno) */
    $(".modal-title").html(cno);
    $("#commentText").val(commentText);
    $("#modDiv").show("slow");
  });

  $("#commentModBtn").on("click", function() {
    var cno = $(".modal-title").html();
    var commentText = $("#commentText").val();

    $.ajax({
    type : 'PUT',
    url : '/comments/' + cno,
    /* 전송방식은 put  url /comments/ 를 처리하며 cno 를 변수로 받는 */
    headers : {
    'Content-Type ' : ' application/json',

    /* 사용자 브라우저가 ajax 를 처리하지 못할때 강제로 put  타입으로 전송 */
    'X-HTTP-Method-Override' : 'PUT'

    },
    data : JSON.stringify({
      commentText : commentText
    }),
    dataType : 'text',
    success : function(result) {
      if (result == "SUCCESS") {
        alert("수정이 완료되었습니다.");
        $("#modDiv").hide("slow");
        getAllList();
      }
    }
    });
  });
  $("#commentDelBtn").on("click", function() {
    var cno = $(".modal-title").html();

    $.ajax({
    type : 'delete',
    url : '/comments/' + cno,
    header : {
    'Content-Type' : 'application/json',
    'X-HTTP-Method-Override' : 'DELETE'
    },
    dataType : 'text',
    success : function(result) {
      if (result == "SUCCESS") {
        alert("삭제성공");
        $("#modDiv").hide("slow");
        getAllList();
      }
    }

    });

  });
</script>