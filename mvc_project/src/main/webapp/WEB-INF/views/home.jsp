<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page session="false"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
	<header>
		<%@include file="include/header.jsp"%>
	</header>
	<section>
		<h1>도서관</h1>
		<div class="container jumbotron">
			<div class="input-group">
				<input type="text" class="form-control"
					aria-label="Text input with segmented dropdown button">
				<div class="input-group-append">
					<button type="button" class="btn btn-outline-secondary">Action</button>
					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle dropdown-toggle-split"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="sr-only">Toggle Dropdown</span>
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
						<div role="separator" class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Separated link</a>
					</div>
				</div>
			</div>

			자료검색 <select class="form-control" name="searchType">
				<option value="n">---</option>
				<option value="t">책제목</option>
				<option value="w">저자명</option>
				<option value="tw">통합검색</option>
				<option value="n">---</option>
			</select> <input type="button" class="btn btn-primary" value="검색">

			<div id="bookresult">

				<table class="table">
					<thead class="thead-drak">
						<tr>
							<th>도서관위치</th>
							<th>책등록번호</th>
							<th>책제목</th>
							<th>저자</th>
							<th>출판사</th>
							<th>출판연도</th>
						</tr>
					</thead>
					<c:forEach var="fbvo" items="${list}">
						<tr>
							<td>${fbvo.fNo}</td>
							<td><a href="/boardf/readFree?fno=${fbvo.fNo}">${fbvo.fTitle}[${fbvo.fCommentcnt}]</a>
							</td>
							<td>${fbvo.fWriter}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${fbvo.fRegdate}" /></td>
							<td>${fbvo.fViewcnt}</td>
							<td>${fbvo.fRecomcnt}</td>
						</tr>
					</c:forEach>
				</table>
				</table>



			</div>

			<h3>게시판가기</h3>
			<ul>
				<li><a href="/search/searchGet">테스트페이지</a></li>
				<li><a href="">도서목록</a></li>
				<li><a href="">공지사항</a></li>
				<li><a href="/boardf/listFree">자유게시판</a></li>
				<li><a href="">독자후기</a></li>
			</ul>
		</div>
	</section>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<footer>
		<%@include file="include/footer.jsp"%>
	</footer>
</body>
</html>
