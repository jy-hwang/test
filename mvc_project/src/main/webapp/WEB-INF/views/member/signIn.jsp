<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="card-header text-center">로그인</div>
    <div class="card-body">
      <script src="https://code.jquery.com/jquery-latest.js"></script>
      <form method="post" action="/member/signInPost" class="form-horizontal" role="form">
        <div class="from-group">
          <label for="mId" class="col-sm-2 control-label">아이디</label>
          <input type="text" name="mId" id="mId" class="form-control" placeholder="아이디를 입력하세요">
        </div>
        <div class="from-group">
          <label for="mPassword" class="col-sm-2 control-label">비밀번호</label>
          <input type="password" class="form-control" id="mPassword" name="mPassword" placeholder="비밀번호를 입력하세요">
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
              <label><input type="checkbox" name="useCookie" id="useCookie">로그인 유지하기</label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-info">로그인</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</body>
<footer>
  <%@include file="../include/footer.jsp"%>
</footer>
</html>