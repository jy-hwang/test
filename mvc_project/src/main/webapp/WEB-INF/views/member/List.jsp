<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <form>
    <table class="table table-striped">
      <tr>
        <th>번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>이메일</th>
        <th>가입일</th>
      </tr>
      <c:forEach var="memberVo" items="${list}">
        <tr>
          <td>
            <a href="/member/MemberDetail?mNo=${memberVo.mNo}">${memberVo.mNo}</a>
          </td>
          <td>${memberVo.mId}</td>
          <td>${memberVo.mName}</td>
          <td>${memberVo.mEmail}</td>
          <td>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${memberVo.regdate}" />
          </td>
        </tr>
      </c:forEach>
    </table>
    <hr />
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <c:if test="${pageMaker.prev}">
          <li class="page-item">
            <a class="page-link" href="List${pageMaker.makeQuery(pageMaker.startPage -1)}">Previous</a>
          </li>
        </c:if>
        <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
          <li class="page-item" <c:out value="${pageMaker.cri.page == i ? 'class=active' : ''}"/>>
            <a class="page-link" href="List${pageMaker.makeQuery(i)}">${i}</a>
            <%-- <a class="page-link" href="listFree${pageMaker.makeSearch(i)}">${i}</a> --%>
          </li>
        </c:forEach>
        <c:if test="${pageMaker.next}">
          <li class="page-item">
            <%-- <a class="page-link" href="listFree${pageMaker.makeSearch(pageMaker.endPage+1)}">Next</a> --%>
            <a class="page-link" href="List${pageMaker.makeQuery(pageMaker.endPage+1)}">Next</a>
          </li>
        </c:if>
      </ul>
    </nav>
  </form>
  <form id="detailForm">
    <input type="hidden" name="page" value="${cri.page}" />
    <input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
    <input type="hidden" name="searchType" value="${cri.searchType}" />
    <input type="hidden" name="keyword" value="${cri.keyword}" />
  </form>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
  <footer>
    <%@include file="../include/footer.jsp"%>
  </footer>
</body>
</html>