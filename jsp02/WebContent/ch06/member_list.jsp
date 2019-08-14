<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %> 
<%@ page import="java.util.List" %>  
<%@ page import="member.MemberDTO" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
List<MemberDTO> list=(List<MemberDTO>)map.get("list");
int count=(int)map.get("count");
%>
등록된 회원수 : <%=count %>명
<table border="1" width="1000px">
 <tr>
   <th>이름</th>
   <th>아이디</th>
   <th>가입일자</th>
   <th>이메일</th>
   <th>핸드폰</th>
   <th>우편번호</th>
   <th>주소1</th>
   <th>주소2</th>
 </tr>
 <% for(MemberDTO dto : list) { %>
   <td><a href="#" onclick="view('<%=dto.getUserid() %>')">
   <%=dto.getName() %></a></td>
   <td><%=dto.getUserid() %></td>
   <td><%=dto.getJoin_date() %></td>
   <td><%=dto.getEmail() %></td>
   <td><%=dto.getHp() %></td>
   <td><%=dto.getZipcode() %></td>
   <td><%=dto.getAddress1() %></td>
   <td><%=dto.getAddress2() %></td>
 <tr>
 <% } %>
</table>
<form name="form1" method="post" 
action="/jsp02/member_servlet/view.do">
  <input type="hidden" name="userid">
</form>


</body>
</html>