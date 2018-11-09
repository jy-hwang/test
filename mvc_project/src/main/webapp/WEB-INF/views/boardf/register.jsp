<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/register.js?ver=1"></script>
</head>
<body>
  <section class="content">
    <div class="contatiner">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-success">
            <div class="box-header">
              <h3 class="box-title">글 쓰 기</h3>
            </div>
            <form id="writeForm" method="post">
              <input type="hidden" name="mcate" class="form-control" value="${userInfo.mCate}" />
              <input type="hidden" name="mno" value="${userInfo.mNo}" />
              
              <div class="box-body">
                <div class="form-group">
                  <label for="writer">작성자</label>
                  <input type="text" name="fWriter" class="form-control" readonly value="${userInfo.mName}" />
                </div>
                <div class="form-group">
                  <label for="title">제목</label>
                  <input type="text" name="fTitle" class="form-control" placeholder="제목을 입력하세요" />
                </div>
                <div class="form-group">
                  <label for="content">내용</label>
                  <textarea name="fContent" class="form-control" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">글쓰기</button>
              </div>
           
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <%@include file="../include/footer.jsp"%>
  </footer>
</body>
</html>