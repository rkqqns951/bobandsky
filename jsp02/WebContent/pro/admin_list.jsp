<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %> 
<%@ page import="java.util.List" %>  
<%@ page import="pro.LoginDTO" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<script type="text/javascript">
function view(userid){
	document.form1.userid.value=userid;
	document.form1.submit();
}
</script>

</head>
<body>
<%
Map<String,Object> map=
(Map<String,Object>)request.getAttribute("map");
List<LoginDTO> list=(List<LoginDTO>)map.get("list");
int count=(int)map.get("count");
%>
<div class="container">
등록된 회원수 : <%=count %>명
<br>
<br>
<table class="table table-striped" border="1" width="500px">
 <tr>
   <th>이름</th>
   <th>아이디</th>
   <th>비밀번호</th>
   <th>가입일자</th>
   <th>이메일</th>
   <th>핸드폰</th>

 </tr>
 <% for(LoginDTO dto : list) { %>
   <td><a href="#" onclick="view('<%=dto.getUserid() %>')">
   <%=dto.getName() %></a></td>
   <td><%=dto.getUserid() %></td>
   <td><%=dto.getPasswd() %></td>
   <td><%=dto.getJoin_date() %></td>
   <td><%=dto.getEmail() %></td>
   <td><%=dto.getHp() %></td>
 <tr>
 <% } %>
</table>
</div>
<form name="form1" method="post" 
action="/jsp02/login_servlet/view.do">
  <input type="hidden" name="userid">
</form>
<hr>
<bR>

<%@ include file="../include/footer.jsp" %>



</body>
</html>