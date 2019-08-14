<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업 후기 수정</title>
<%@ include file="../include/header.jsp" %>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function gb_update(){
		var form1 = $("#form1");
		var name = $("#name");
		var email = $("#email");
		var hp = $("hp");
		var passwd = $("#passwd");
		var content = $("#content");
		if(hp.val() == ""){
			alert("전화번호를 입력하세요");
			hp.focus();
			return;
		
        }if(passwd.val() == ""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return;
		} if(content.val() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}
		document.form1.action="${path}/information_servlet/update.do";
		document.form1.submit();
	}
	function gb_delete(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/information_servlet/delete.do";
			document.form1.submit();
		}
	}
</script>
  
</head>
<body>

<%@ include file="../include/memu.jsp" %>


    <div class="col-sm-15" align="center">
      <h6>※ 취업 후기</h6>
      <hr>  
      <br>



<div class="container">


<h2>수정/삭제</h2>
<form name="form1" id="form1" method="post">
<table border="1" width="500px" class="table table-striped">
 <tr>
   <td>이름</td>
   <td><input name="name" id="name" size="80" readonly="readonly"
         value="${dto.name}"></td>
 </tr>
 <tr>
   <td>이메일</td>
   <td><input name="email" id="email" size="80" readonly="readonly"
         value="${dto.email}"></td>
 </tr>
 <tr>
   <td>HP</td>
   <td><input name="hp" id="hp" size="80"
         value="${dto.hp}"></td>
 </tr>
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd" size="80"></td>
 </tr>
 <tr align="center">
   <td colspan="2"><textarea rows="10" cols="150" name="content"
    id="content">${dto.content}</textarea></td>
 </tr>
 <!-- textarea는 input태그처럼 태그안에 value를 쓰면 안되며
 태그와 태그사이에 값만 코딩한다. 또한 단독태그가 아닌 짝태그로만 써야한다. -->
 <tr align="center">
   <td colspan="2">
   
     <input type="hidden" name="idx" value="${dto.idx}">
     <input type="button" value="수정" onclick="gb_update()">
     <input type="button" value="삭제" onclick="gb_delete()">
     <input type="button" value="목록" 
     onclick="location.href='${path}/information_servlet/list.do'">
   </td>
 </tr>
</table>
</form>







      <hr>     
    </div>
</div>

<footer class="container-fluid" style="font-size: 5px">
  <p oncontextmenu="return false" ondragstart="return false" onselectstart="return false" align="center">JinWooJobKorea(주) 대표 : 정진우 서울시 강동구 xx xx xx<br>
사업자등록번호 : xxx-xx-xxxx 통신판매업신고 : xxxx-xxxx-xxxx<br>
개인정보보호책임자 : 정진우 (xxxx@gmail.com) 전화 : xxxx-xxxx 팩스 : xx-xxxx-xxxx <br>호스팅 제공 : JinWooJobKorea(주)
ⓒ NHN xxxx: xxxx. xxxx xxxxxx xxxxxxx.</p>
</footer> 

</body>
</html>