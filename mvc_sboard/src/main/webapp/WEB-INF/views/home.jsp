<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>

<style>
.bt1 {
  margin : 50px;;
  padding : 30px;
  
  
}


.bt2 {
  margin : 100px;
  padding : 60px;
  
  
}
</style>



<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">HOME PAGE</h3>
        </div>
        <div class="bt1">
          <a href="/board/listReply" class="btn btn-primary">검색게시판</a>
          <a href="/board/register" class="btn btn-danger">글쓰기</a>
          <a href="/test" class="btn btn-default">Rest Test</a>
        </div>
        <div class="bt2">
          <a href="/ex" class="btn btn-danger">Ex</a>
          <a href="/uploadForm" class="btn btn-primary">Upload</a>
          <a href="/uploadAjax" class="btn btn-primary">Ajax</a>
          <a href="/user/signIn" class="btn btn-danger">로그인하긔</a>
        </div>
      </div>
    </div>
  </div>
</section>
</div>
<!-- close wrapper  -->
<%@include file="include/footer.jsp"%>

