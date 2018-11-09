<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/listReply.js?ver=1"></script>
</head>
<body>
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header with-border">
            <h3>자유게시판</h3>
          </div>
          <div class="box-body">
            <table class="table">
              <thead class="thead-drak">
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일시</th>
                  <th>조회수</th>
                  <th>추천수</th>
                </tr>
              </thead>
              <c:forEach var="fbvo" items="${list}">
                <tr>
                  <td>${fbvo.fNo}</td>
                  <td>
                  <a href="/boardf/readFree?fno=${fbvo.fNo}">${fbvo.fTitle}</a>
                  </td>
                  <td>${fbvo.fWriter}</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${fbvo.fRegdate}" /></td>
                  <td>${fbvo.fViewcnt}</td>
                  <td>${fbvo.fRecomcnt}</td>
                </tr>
              </c:forEach>
            </table>
          </div>
          <hr />
          <nav aria-label="Page Navigation example">
            <ul class="pagination justify-content-center">
              <c:if test="${pageMaker.prev}">
                <li class="page-item">
                  <a class="page-link" href="listFree${pageMaker.makeSearch(pageMaker.startPage -1)}">Previous</a>
                </li>
              </c:if>
              <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item" <c:out value="${pageMaker.cri.page == i ? 'class=active' : ''}"/>>
                  <a class="page-link" href="listFree${pageMaker.makeSearch(i)}">${i}</a>
                  <%-- <a class="page-link" href="listFree${pageMaker.makeQuery(i)}">${i}</a> --%>
                </li>
              </c:forEach>
              <c:if test="${pageMaker.next}">
                <li class="page-item">
                  <%-- <a class="page-link" href="listFree${pageMaker.makeQuery(pageMaker.endPage+1)}">Next</a> --%>
               <a class="page-link" href="listFree${pageMaker.makeSearch(pageMaker.endPage+1)}">Next</a>
                </li>
              </c:if>
            </ul>
          </nav>
          <form name="searchForm">
            <div class="input-group">
              <select class="selectpicker" name="searchType">
                <option value="n" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>---</option>
                <option value="t" <c:out value="${cri.searchType == 't' ? 'selected' : '' }"/>>제목</option>
                <option value="c" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>내용</option>
                <option value="w" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>작성자</option>
                <option value="tc" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>제목&amp;내용</option>
                <option value="tcw" <c:out value="${cri.searchType == null ? 'selected' : '' }"/>>전체</option>
              </select>
              <span class="input-group">
                <input type="text" id="keywordInput" name="keyword" class="form-control" value="${cri.keyword}" placeholder="검색어입력">
                <button id="searchBtn" type="button" class="btn btn-warning">SEARCH</button>
              </span>
              <c:if test="${!empty userInfo}">
                <button type="button" class="btn btn-primary" id="btnRegister">글쓰기</button>
                <button type="button" class="btn btn-info">아무거나</button>
              </c:if>
            </div>
          </form>
        </div>
      </div>
      <hr />
    </div>
  </section>
  <footer>
    <%@include file="../include/footer.jsp"%>
  </footer>
</body>
</html>