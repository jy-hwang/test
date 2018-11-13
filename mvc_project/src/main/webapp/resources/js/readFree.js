/**
 * for register 2018-11-09
 */



$(document).ready(function() {

  var formObj = $("#adm_form");
  $("#modifyBtn").on("click", function() {
    console.log("수정하기 버튼 클릭");
    formObj.attr("action", "/member/Modify");
    formObj.attr("method", "get");
    formObj.submit();

  });

  $("#withdrawalBtn").on("click", function() {
    console.log("탈퇴하기 버튼 클릭");
    var delConfirm = confirm("탈퇴하시겠습니까?")
    if (delConfirm) {
      formObj.attr("action", "/member/Withdrawal");
      formObj.attr("method", "delete");
      formObj.submit();
      alert("탈퇴 처리되었습니다.")
      window.location.href = '/';
    } else {
      alert("탈퇴처리 취소되었습니다.")
      window.location.href = '/';
    }
  });

});
