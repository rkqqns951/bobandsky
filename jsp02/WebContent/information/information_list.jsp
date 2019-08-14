<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업 후기</title>
<%@ include file="../include/header.jsp" %>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
function gb_search(){
	document.form1.action="${path}/information_servlet/list.do";
	document.form1.submit();
}

function check(){
	var passwd = $("#passwd");
	if(passwd.val() == ""){
		alert("비밀번호를 입력하세요");
		passwd.focus();
		
	}

}

</script>
  
</head>
<body>

<%@ include file="../include/memu.jsp" %>


    <div class="col-sm-15" align="center">
      <h3>취업 후기</h3>
      <hr>
      <br>

<!-- 검색폼 -->

<div class="container">
<form name="form1" id="form1" method="post">
<select name="searchkey" id="searchkey">
<c:choose>
  <c:when test="${searchkey == 'name' }">
  <option value="name" selected>이름</option>
  <option value="content">내용</option>
  <option value="name_content">이름+내용</option>
  </c:when>
  <c:when test="${searchkey == 'content' }">
  <option value="name">이름</option>
  <option value="content" selected>내용</option>
  <option value="name_content">이름+내용</option>
  </c:when>
  <c:when test="${searchkey == 'name_content' }">
  <option value="name">이름</option>
  <option value="content">내용</option>
  <option value="name_content" selected>이름+내용</option>
  </c:when>
</c:choose>  
</select>
<input name="search" id="search" value="${search}">
<input type="submit" class="btn btn-default" value="조회" onclick="gb_search()">
<br>
  ${count}개의 글이 있습니다.
</form>
<c:if test="${userid != null }">
<input type="button" class="btn btn-default pull-right" value="글쓰기" 
onclick="location.href='${path}/information/information_write.jsp'"> <!-- 로그인 후 이용가능하게 만들어 보자. -->
</c:if>
<br><br>

<c:forEach var="dto" items="${list}">
<form method="post" name="form2" id="form2"
action="${path}/information_servlet/passwd_check.do">
<!-- 편집을 위해서는 게시물 번호가 필요함 -->
<input type="hidden" name="idx" value="${dto.idx}">
<div class="container">

<table class="table table-striped" border="1" width="500px">
	<tr>
		<td>이름</td>
		<td>${dto.name}</td>
		<td>날짜</td>
		<td>${dto.post_date}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.email}</td>
		<td>HP</td>
		<td>${dto.hp}</td>
	</tr>
	<tr>
		<td colspan="4">${dto.content}</td>
	</tr>
	<tr>
		<td colspan="4">	
			비밀번호 <input type="password" name="passwd" id="passwd">
			<input type="submit" class="btn btn-default" value="수정/삭제" onclick="check()">
			
		</td>
	</tr>
</table>
</div>
</form>
</c:forEach>
<br>
      
      
      

    </div>
    </div>
      <hr>     


<footer class="container-fluid" style="font-size: 5px">
  <p oncontextmenu="return false" ondragstart="return false" onselectstart="return false" align="center">JinWooJobKorea(주) 대표 : 정진우 서울시 강동구 xx xx xx<br>
사업자등록번호 : xxx-xx-xxxx 통신판매업신고 : xxxx-xxxx-xxxx<br>
개인정보보호책임자 : 정진우 (xxxx@gmail.com) 전화 : xxxx-xxxx 팩스 : xx-xxxx-xxxx <br>호스팅 제공 : JinWooJobKorea(주)
ⓒ NHN xxxx: xxxx. xxxx xxxxxx xxxxxxx.</p>
</footer> 

</body>
</html>