<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업 정보 글쓰기 (관리자 전용)</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});

</script>


</head>
<body>

<%@ include file="../include/memu.jsp" %>

<form method="post" name="form1" id="form1" action="${path}/bob_servlet/insert.do" 
enctype="multipart/form-data">
<div class="col-sm-15" align="center">
      <h3>취업 정보 글쓰기</h3>
      <hr>
      <br>
<div class="container">
<br>
<br>
<table class="table table-striped" border="1" width="500px">
 <tr>
   <td>이름</td>
   <td><input name="writer" id="writer" value="관리자"></td>
 </tr>
 <tr>
   <td>제목</td>
   <td><input name="subject" id="subject" size="60"></td>
 </tr>
 <tr>
   <td>본문</td>
   <td><textarea rows="5" cols="60" name="content" id="content">
   </textarea></td>
 </tr>
 <tr>
   <td>첨부파일</td>
   <td><input type="file" name="file1"></td>
 </tr>
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd"></td>
 </tr>
 <tr>
   <td colspan="2" align="center">
     <input type="button" value="확인" id="btnSave">
   </td>
 </tr>
</table>
</div>
</div>
</form>
<br><br>
<hr>
<%@ include file="../include/footer.jsp" %>
</body>
</html>