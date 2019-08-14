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
사원번호 : ${map["사원번호"]}<br>
사원이름 : ${map["사원이름"]}<br>
직책 : ${map["직책"]}<br>
부서 : ${map["부서"]}<br>
입사일자 : ${map["입사일자"]}<br>
연봉 : ${map["연봉"]}<br>
</body>
</html>