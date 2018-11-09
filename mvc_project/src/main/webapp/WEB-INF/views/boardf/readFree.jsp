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
              <h3 class="box-title">글 내용 확인</h3>
            </div>
            <form id="writeForm" method="post">
              <input type="hidden" name="mcate" class="form-control" value="${fbVo.mCate}" />
              <input type="hidden" name="mno" value="${fbVo.mNo}" />
              
              <div class="box-body">
                <div class="form-group">
                  <label for="writer">작성자</label>
                  <input type="text" name="fWriter" class="form-control" readonly value="${fbVo.fWriter}" />
                </div>
                <div class="form-group">
                  <label for="title">제목</label>
                  <input type="text" name="fTitle" class="form-control" readonly value="${fbVo.fTitle}" />
                </div>
                <div class="form-group">
                  <label for="content">내용</label>
                  <textarea name="fContent" class="form-control" cols="30" rows="10"readonly>${fbVo.fContent}</textarea>
                </div>
                <c:if test="${!empty userInfo}">
                <button type="button" id="modifyBtn" class="btn btn-info pull-center">수정/삭제</button>
                </c:if>
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