<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.LoginDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<%@ include file="../include/header.jsp" %>

<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//id가 btnUpdate인 태그를 클릭하면
	$("#btnUpdate").click(function(){
		//폼 데이터를 제출할 주소
		document.form1.action="/jsp02/login_servlet/update.do";
		//폼 데이터를 서버에 제출
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="/jsp02/login_servlet/delete.do";
			document.form1.submit();
		}
	});
});



</script>

</head>
<body>
<%@ include file="../include/memu.jsp" %>
<%

LoginDTO dto=(LoginDTO)request.getAttribute("dto");
%>

<form name="form1" method="post">
<div class="container">
<h2 align="center">정보 수정 (관리자 용)</h2>
<br>
<br>
<table class="table table-striped" border="1" width="100px">

 <tr>
   <td>아이디</td>
   <td><%=dto.getUserid() %></td>
 </tr>
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" 
   value="<%=dto.getPasswd()%>"></td>
 </tr>
 <tr>
   <td>이름</td>
   <td><input name="name" value="<%=dto.getName() %>"></td>
 </tr>
 <tr>
   <td>회원가입일자</td>
   <td><%=dto.getJoin_date() %></td>
 </tr>
 <tr>
   <td>이메일</td>
   <td><input name="email" value="<%=dto.getEmail() %>"></td>
 </tr>
 <tr>
   <td>휴대폰</td>
   <td><input name="hp" value="<%=dto.getHp() %>"></td>
 </tr>
 <tr>
   <td colspan="2" align="center">
   <!-- userid가 반드시 필요함. hidden 처리 -->
   <input type="hidden" name="userid" value="<%=dto.getUserid() %>">
   <button type="button" id="btnUpdate">수정</button>
   <button type="button" id="btnDelete">삭제</button>
   <a href="../pro/admin.jsp"><button type="button">목록</button></a>
 </tr>
</table>
</div>
</form>
</body>
</html>