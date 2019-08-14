<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<String> pop=new ArrayList<>();
pop.add("사원번호 : 001");
pop.add("사원이름 : 홍길동");
pop.add("직책 : 대리");
pop.add("부서 : 전산");
pop.add("입사일자 : 2019년1월1일");
pop.add("연봉 : 3000만");
request.setAttribute("pop", pop);
%>
<jsp:forward page="myELArrayList_result.jsp"></jsp:forward>
</body>
</html>