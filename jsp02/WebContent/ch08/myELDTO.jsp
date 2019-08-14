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
<%@ page import="member.MemberDTO" %>
<%
MemberDTO dto = new MemberDTO();
dto.setUserid("jinwoo");
dto.setName("정진우");
dto.setEmail("jinwoo@gmail.com");
dto.setHp("010-9422-6118");
%>
<c:set var="dto" value="<%=dto %>" scope="request" />

<jsp:forward page="myELDTO_result.jsp"></jsp:forward>

</body>
</html>