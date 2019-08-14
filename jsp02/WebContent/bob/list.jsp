
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업 정보</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/bob/write.jsp"
	})
});
</script>

</head>
<body>
<%@ include file="../include/memu.jsp" %>
<c:if test="${userid == 'admin' }">
<button id="btnWrite" class="btn btn-default pull-right">글쓰기</button>
</c:if>
<br>

<form method="post" name="form" id="form">
<div class="col-sm-15" align="center">
      <h3>취업 정보</h3>
      <hr>
      <br>



<div class="container">

<br>
<br>
<table class="table table-striped" border="1" width="500px">
<tr>
  <th>번호</th>
  <th>이름</th>
  <th>제목</th>
  <th>날짜</th>
  <th>조회수</th>
  <th>첨부파일</th>
  <th>다운로드</th>
</tr>
<c:forEach var="dto" items="${list}">
<c:choose> 
  <c:when test="${dto.show == 'y'}">

<tr>
<td>${dto.num}</td>
<td>${dto.writer}</td>
<td>
<!-- 답글 들여쓰기 -->
<c:forEach var="i" begin="1" end="${dto.re_level}">
   &nbsp;&nbsp;
</c:forEach>
<a href="${path}/bob_servlet/view.do?num=${dto.num}">
${dto.subject}</a>
<!-- 댓글갯수 표시  -->
<c:if test="${dto.comment_count > 0}">
<span style="color:red;">(${dto.comment_count})</span>
</c:if>
</td>
<td>${dto.reg_date}</td>
<td>${dto.readcount}</td>

  <td align="center">
    <c:if test="${dto.filesize > 0}">
      <a href="${path}/bob_servlet/download.do?num=${dto.num}">
       <img src="../images/file.gif">
      </a> 
  </c:if>
  </td>
  <td>${dto.down}</td>
</tr>
</c:when>
<c:otherwise>
 <tr>
   <td>${dto.num}</td>
   <td colspan="6" align="center">
     삭제된 게시물입니다.
   </td>
 </tr>
</c:otherwise>
</c:choose>
</c:forEach>
</table>
</div>
</div>
</form>

 
<br><br>
<hr>
<%@ include file="../include/footer.jsp" %>

</body>
</html>



