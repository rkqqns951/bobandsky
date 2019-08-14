<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업후기 작성</title>
<%@ include file="../include/header.jsp" %>


<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  function check(){
	  var form1 = $("#form1");
		var name = $("#name");
		var email = $("#email");
		var hp = $("#hp");
		var passwd = $("#passwd");
		var content = $("#content");
		if(name.val() == ""){
			alert("이름을 입력하세요");
			name.focus();
			return;
		} if(email.val() == ""){
			alert("이메일을 입력하세요");
			email.focus();
			return;
			
		} if(hp.val() == ""){
			alert("전화번호를 입력하세요");
			email.focus();
			return;
		} if(passwd.val() == ""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return;
		} if(content.val() == ""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}	  
		document.form1.action="${path}/information_servlet/insert.do";
		document.form1.submit();
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


<h2>취업 후기 작성</h2>
<form name="form1" id="form1" method="post">

<table border="1" width="500px" class="table table-striped" >
 <tr>
   <td>이름</td>
   <td><input name="name" id="name" size="80" readonly="readonly" value="${sessionScope.message}"></td>
 </tr>
 <tr>
   <td>이메일</td>
   <td><input name="email" id="email" size="80" ></td>
 </tr>
 <tr>
   <td>HP</td>
   <td><input name="hp" id="hp" size="80"></td>
 </tr>
 
 <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd" size="80"></td>
 </tr>
 <tr align="center">
   <td colspan="2"><textarea rows="10" cols="150" name="content"
    id="content" placeholder="취업 정보를 작성해주세요."></textarea></td>
 </tr>
 <tr align="center">
   <td colspan="2">
     <input type="button" class="btn btn-default" value="확인" onclick="check()">
     <a href="${path}/information_servlet/list.do"><input type="button" class="btn btn-default" value="취소"></a>
     
   </td>
 </tr>

</table>

</form>




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