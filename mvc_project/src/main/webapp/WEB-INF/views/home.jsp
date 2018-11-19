<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css?ver=2">
</head>
<style>
section {
		width: 70%;
		float: right;
}
</style>
<body>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
  <header>
    <%@include file="include/header.jsp"%>
  </header>
  <section>
    <h1>Subject</h1>
    <div class="container">
      <div class="input-group">
        <input type="text" class="form-control" aria-label="Text input with segmented dropdown button">
        <div class="input-group-append">
          <button type="button" class="btn btn-outline-secondary">Action</button>
          <button type="button" class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="sr-only">Toggle Dropdown</span>
          </button>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div role="separator" class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </div>
      </div>
      <div id="d2">
        
          <input type="text" placeholder="여기에 입력하세요">
          <input type="button" value="검색" >
        
      </div>
      <div id="dataArea"></div>
    </div>
  </section>
  <div class="col-6 col-md-3 sidebar-offcanvas" id="sidebar">
    <div class="list-group">
      <a href="#" class="list-group-item active">Link</a>
      <a href="/boardf/listFree" class="list-group-item">자유게시판</a>
      <a href="/search/searchGet" class="list-group-item">테스트페이지</a>
      <a href="#" class="list-group-item">도서목록</a>
      <a href="#" class="list-group-item">Link</a>
      <a href="#" class="list-group-item">공지사항</a>
      <a href="#" class="list-group-item">Link</a>
      <a href="#" class="list-group-item">독자후기</a>
      <a href="#" class="list-group-item">Link</a>
    </div>
  </div>
  <!--/span-->
  </div>
  <!--/row-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
  <!-- <script>
  $.ajax({
    type :"GET"
    url:
  })
  
  
  </script> -->
  <footer>
    <%@include file="include/footer.jsp"%>
  </footer>
</body>
</html>
