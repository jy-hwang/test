/**
 * for modifyFree 2018-11-12
 */

$(document).ready(function() {

  $("#modifyBtn").on("click", function() {
    console.log("수정하기 버튼 클릭");
    if (confirm("수정하시겠습니까?")) {
      /* var mcate =$('#mcate').val(); */
      /*
       * var fNo = $('#fno').val(); var fWriter = $('#fWriter').val(); var
       * fTitle = $('#fTitle').val(); var fContent = $('#fContent').val();
       */

      $.ajax({
      type : 'patch',
      url : '/boardf/modifyFree',
      headers : {
      "Content-Type" : "application/json",
      "X-HTTP-Method-Override" : "PATCH"
      },
      dataType : "text",
      data : JSON.stringify({
      /*
       * fNo : fNo, fWriter : fWriter, fTitle : fTitle, fContent : fContent }),
       */
      fNo : $('#fNo').val(),
      fWriter : $('#fWriter').val(),
      fTitle : $('#fTitle').val(),
      fContent : $('#fContent').val()
      }),
      success : function(result) {
        if (result == "SUCCESS") {
          console.log("게시물수정처리완료");
          alert("게시물처리완료");
          /* location.href='/boardf/modifyFree'; */
          location.href = '/';
        }
      },
      error : function(request, status, error) {
        alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
      }
      });
    }
  });

  $("#deleteBtn").on("click", function() {
    var formObj = $("#modifyForm");
    /*var commentCnt = ${fCommentcnt};*/
    console.log("삭제하기 버튼 클릭");
    var delConfirm = confirm("삭제하시겠습니까?")
    if (delConfirm) {
      console.log("삭제메소드실행전");
      formObj.attr("action", "/boardf/remove");
      console.log("삭제메소드실행후");
      formObj.submit();
/*      alert("삭제 처리되었습니다.");
      window.location.href = '/boardf/listFree';*/
    } else {
      alert("삭제처리 취소되었습니다.");
      window.location.href = '/boardf/listFree';
    }
  });

});
