<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modifyFree.js?ver=2"></script>
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
            <form id="modifyForm">
            
              <div class="box-body">
                <div class="form-group">
                  <label for="writer">작성자</label>
                  <input type="text" name="fWriter" id="fWriter" class="form-control" readonly value="${fbvo.fWriter}" />
                </div>
                <div class="form-group">
                  <label for="title">제목</label>
                  <input type="text" name="fTitle" id="fTitle" class="form-control" value="${fbvo.fTitle}" />
                </div>
                <div class="form-group">
                  <label for="content">내용</label>
                  <textarea name="fContent" class="form-control" id="fContent" cols="30" rows="10">${fbvo.fContent}</textarea>
                  <input type="hidden" name="mcate" id="mcate" class="form-control" value="${fbvo.mcate}" />
              <input type="hidden" name="mno" id="mno" value="${fbvo.mno}" />
              <%-- <input type="hidden" name="fno" id="fno" value="${fbvo.fNo}" /> --%>
              <input type="hidden" name="fNo" id="fNo" value="${fbvo.fNo}" />
              <input type="hidden" name="page" value="${cri.page}"/>
              <input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
              <input type="hidden" name="searchType" value="${cri.searchType}"/>
              <input type="hidden" name="keyword" value="${cri.keyword}"/>
              
                </div>
                <div class="form-group">
                  
                    <button type="button" id="modifyBtn" class="btn btn-info pull-center">수정완료</button>
                    <button type="button" id="deleteBtn" class="btn btn-info pull-center">삭제하기</button>
                  
                </div>
              </div>
            </form>
            <form id="hidden" method="post">
              
            
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