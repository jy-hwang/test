<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- enctype 을 정해주지 않으면 파일 자체가 날라가지 않고 파일의 경로만 전송된다.  -->
<!-- multipart -> 대용량 데이터 전송을 알려줌 -->
<form action="uploadForm" method="post" enctype="multipart/form-data">

<!-- 브라우저에서 제공하는 파일 타입 선택 -->
<input type="file" name="file"/><input type="submit">

</form>



</body>
</html>