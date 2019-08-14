<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정/삭제 (관리자 전용)</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/bob_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/bob_servlet/delete.do";
			document.form1.submit();			
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/memu.jsp" %>


<form method="post" name="form1" id="form1" enctype="multipart/form-data">
<div class="col-sm-15" align="center">
      <h2>수정/삭제</h2>
      <hr>
      <br>
<div class="container">

<table class="table table-striped" border="1" width="500px">
	<tr>
		<td>이름</td>
		<td><input name="writer" id="writer"
			value="${dto.writer}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input name="subject" id="subject" size="60"
			value="${dto.subject}"></td>
	</tr>
	<tr>
		<td>본문</td>
		<td><textarea rows="5" cols="60"
			name="content" id="content">${dto.content}</textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<c:if test="${dto.filesize > 0 }">
				${dto.filename} ( ${dto.filesize / 1024} KB )
				<input type="checkbox" name="fileDel">첨부파일 삭제
				<br>
			</c:if>
			<input type="file" name="file1">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<!-- 수정,삭제를 위한 글번호 -->
			<input type="hidden" name="num" value="${dto.num}">
			<input type="button" value="수정" id="btnUpdate">
			<input type="button" value="삭제" id="btnDelete">
		</td>
	</tr>
</table>
</div>
</div>
</form>

<hr>
<%@ include file="../include/footer.jsp" %>

</body>
</html>

	