<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취업 정보</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
		comment_add();
	});
	$("#btnList").click(function(){
		location.href="${path}/bob_servlet/list.do";
	});
	$("#btnReply").click(function(){
		document.form1.action="${path}/bob_servlet/reply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/bob_servlet/pass_check.do";
		document.form1.submit();
	});
	
});
function comment_add(){
	var param="bob_num=${dto.num}&writer="+$("#writer").val()
	+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/bob_servlet/comment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	$.ajax({
		type: "post",
		url: "${path}/bob_servlet/commentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
}
</script>
</head>
<body>
<%@ include file="../include/memu.jsp" %>

<form name="form1" id="form1" method="post">
<div class="col-sm-15" align="center">
      <h3>상세 화면</h3>
      <hr>
      <br>



<div class="container">
<br>
<br>

<table class="table table-striped" border="1" width="700px">
	<tr>
		<td>날짜</td>
		<td>${dto.reg_date}</td>
		<td>조회수</td>
		<td>${dto.readcount}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td colspan="3">${dto.writer}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr>
		<td>본문</td>
		<td colspan="3">${dto.content}</td>
	</tr>
	<c:if test="${userid == 'admin' }">
	<tr>
		<td>비밀번호</td>
		<td colspan="3">
			<input type="password" name="passwd" id="passwd">
			<c:if test="${param.message == 'error' }">
				<span style="color:red;">
					비밀번호가 일치하지 않습니다.
				</span>
			</c:if>
		</td>
	</tr>
	</c:if>
	<tr>
		<td>첨부파일</td>
		<td colspan="3">
			<c:if test="${dto.filesize > 0}">
				${dto.filename}( ${dto.filesize} bytes )
	<a href="${path}/bob_servlet/download.do?num=${dto.num}">
	[다운로드]</a>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="hidden" name="num" value="${dto.num}">
			<c:if test="${userid == 'admin' }">
			<input type="button" value="수정/삭제" id="btnEdit">
			<input type="button" value="답변" id="btnReply">
			</c:if>
			<input type="button" value="목록" id="btnList">
		</td>
	</tr>
</table>
</div>
</div>
</form>
<!-- 댓글 쓰기 폼 -->


<form method="post" name="form2">
<div class="col-sm-15" align="center">
      <br>



<div class="container">
<br>
<br>
<table class="table table-striped" border="1" width="200px">
 <tr>
  <td><input id="writer" value="${sessionScope.message}" readonly="readonly"></td>
  <td rowspan="2">
  <c:if test="${userid != null }">
    <button id="btnSave" type="button" class="btn btn-default">확인</button>
    </c:if>
  </td>
 </tr>
 <tr>
   <td><textarea rows="5" cols="120" 
   placeholder="내용을 입력하세요" id="content"></textarea></td>
 </tr>
</table>
</div>
</div>
<div id="commentList"  class="col-sm-15" align="center"></div>
</form>
<!-- 댓글 목록을 출력할 영역 -->


<hr>

<%@ include file="../include/footer.jsp" %>
</body>
</html>

	