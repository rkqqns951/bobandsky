<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 반복문의 2가지 스타일
1)회수가 정해진 경우
<c:forEach var="카운터" begin="시작" end="끝">
</c:forEach>
2)회수가 정해지지 않은 경우, ex)게시판 목록
<c:forEach var="개별값" items="집합">
</c:forEach>
-->
<c:forEach var="i" begin="2" end="9">
   <h2>${i}단</h2>
   <c:forEach var="j" begin="1" end="9">
      ${i} x ${j} = ${i*j}<br>
   </c:forEach>
</c:forEach>
</body>
</html>