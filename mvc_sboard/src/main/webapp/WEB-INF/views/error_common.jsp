<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>

<h3>${exception.getMessage()}</h3>
<ul>
		<c:forEach var ="stack" items="${exception.getStackTrace()}">
			<li>${stack.toString()}</li>
		</c:forEach>
	
	</ul>


</body>
</html>