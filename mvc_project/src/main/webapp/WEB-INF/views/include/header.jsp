<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css?ver=10">


</head>
<body>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <header>
    <nav class="nav nav-pills flex-column flex-sm-row">
      <a class="flex-sm-fill text-sm-center nav-link" href="/">HOME</a>
      <c:choose>
        <c:when test="${!empty userInfo}">
          <a class="flex-sm-fill text-sm-center nav-link">${userInfo.mName}님</a>
          <a class="flex-sm-fill text-sm-center nav-link" href="../member/signOut">로그아웃하기</a>
        </c:when>
        <c:otherwise>
          <a class="flex-sm-fill text-sm-center nav-link" href="../member/signIn">로그인</a>
          <a class="flex-sm-fill text-sm-center nav-link" href="../member/signUp">회원가입</a>
        </c:otherwise>
      </c:choose>
      <c:if test="${!empty userInfo && userInfo.mCate != 'admin' }">
        <a class="flex-sm-fill text-sm-center nav-link" href="../member/Detail?mNo=${userInfo.mNo}">회원정보관리</a>
        
        
      </c:if>
      <c:if test="${!empty userInfo && userInfo.mCate == 'admin' }">
        <a class="flex-sm-fill text-sm-center nav-link" href="../member/List">회원정보목록보기</a>
      </c:if>
      <a class="flex-sm-fill text-sm-center nav-link" href="">도서관 이용안내</a>
      <a class="flex-sm-fill text-sm-center nav-link" href="">열린마당</a>
    </nav>
  </header>
  <div class="clear"></div>
  <hr>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>