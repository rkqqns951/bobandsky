<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../include/header.jsp" %>
<c:forEach var="fruit" items="${requestScope.pop}">
   ${fruit}<br>
</c:forEach>

</body>
</html>