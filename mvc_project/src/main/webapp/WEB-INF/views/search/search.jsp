<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css?ver=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.theme.css?ver=1">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js?ver=1"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js?ver=1"></script>
<script>
  $(function() {

    $("#autocompleteText").autocomplete({
    source : function(request, response) {
      $.ajax({
      url : "/search/searchValue",
      dataType : "json",
      data : {
        searchValue : request.term
      },
      success : function(result) {
        console.log(result);
        response($.map(result, function(item) {
          return {
          label : item.data,
          value : item.data
          }
        }));
      }

      });
    },

    minLength : 2,
    select : function(event, ui) {
    }

    });
  })
  
  
</script>
</head>
<body>
  <input type="text" id="autocompleteText" autocomplete="on" />
  <div class="result"></div>
</body>

</html>