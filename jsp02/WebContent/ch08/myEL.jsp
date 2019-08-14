<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<c:set var="no1" value="001" scope="session" />
<c:set var="name" value="김철수" scope="session" />
<c:set var="no2" value="대리" scope="session" />
<c:set var="no3" value="전산" scope="session" />
<c:set var="no4" value="2019년1월1일" scope="session" />
<c:set var="no5" value="3000만" scope="session" />

세션변수가 생성되었습니다.<br>
<a href="myEL_result.jsp">확인</a>
</body>
</html>