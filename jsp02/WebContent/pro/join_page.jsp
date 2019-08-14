<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  

  
  
  function loginCheck() {
		if($("#userid").val()=="" || $("#idcheck").html()=="이미 존재하는 아이디입니다."
				|| $("#idcheck").html()=="아이디를 입력해주세요."){
			$("#loginchk").html("아이디 중복체크를 완료해주세요.");
			return;
		}
		if($("#passwd").val()==""){
			$("#loginchk").html("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		if($("#name").val()==""){
			$("#loginchk").html("이름를 입력하세요.");
			$("#name").focus();
			return;
		}if($("#email").val()==""){
			$("#loginchk").html("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}if($("#hp").val()==""){
			$("#loginchk").html("전화번호를 입력하세요.");
			$("#hp").focus();
			return;
						 
		}   $(function(){
			  $("#btnJoin").click(function(){
				  
				 var param="userid="+$("#userid").val()
				 +"&passwd="+$("#passwd").val()
				 +"&name="+$("#name").val()
				 +"&hp="+$("#hp").val()
				 +"&email="+$("#email").val();
				  $.ajax({
					 type: "post",
					 url: "${path}/login_servlet/join.do",
					 data: param,
					 success: function(){
						 document.form1.submit();
							alert("회원가입이 완료되었습니다.");
					 }

				  });
			  });	
			});  
		
		
		/* document.form1.action="${path}/login_servlet/join.do";
		document.form1.submit();
		alert("회원가입이 완료되었습니다."); */

	}



  function id_check(){
		$.ajax({
			type:"post",
			url:"${path}/login_servlet/id_check.do",
			data: {"userid":$("#userid").val()},
			success:function(result){
				if(result==1){
					$("#idcheck").html("이미 존재하는 아이디입니다.");
					$("#userid").focus();
					return false;
					
				}else if($("#userid").val()==""){
					$("#idcheck").html("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
					
				}else {
					$("#idcheck").html("사용 가능한 아이디입니다.");
					return false;
				}
			}
		});
	}
</script>
 
 
 
 <style type="text/css">
 
 
/* BASIC */

html {
  background-color: #56baed;
}

body {
  font-family: "Poppins", sans-serif;
  height: 100vh;
}

a {
  color: #92badd;
  display:inline-block;
  text-decoration: none;
  font-weight: 400;
}

h2 {
  text-align: center;
  font-size: 16px;
  font-weight: 600;
  text-transform: uppercase;
  display:inline-block;
  margin: 40px 8px 10px 8px; 
  color: #cccccc;
}



/* STRUCTURE */

.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}

#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}

#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}



/* TABS */

h2.inactive {
  color: #cccccc;
}

h2.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}



/* FORM TYPOGRAPHY*/

input[type=button], input[type=submit], input[type=reset]  {
  background-color: #56baed;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  background-color: #39ace7;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}

input[type=text] , input[type=password]{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;

}

input[type=text]:focus , input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #5fbae9;
}

input[type=text]:placeholder , input[type=password]:placeholder {
  color: #cccccc;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #56baed;
  content: "";
  transition: width 0.2s;
}

.underlineHover:hover {
  color: #0d0d0d;
}

.underlineHover:hover:after{
  width: 100%;
}



/* OTHERS */

*:focus {
    outline: none;
} 

#icon {
  width:60%;
}
 
 #hh3{
 color: blue;
 }
 
 
 </style>
 
 
 </head>
<body>
<c:if test="${param.message == 'error' }">
    <script>
      alert("아이디 또는 비밀번호가 일치하지 않습니다.")
    </script>
</c:if>

 <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <h3 id="hh3">회원가입</h3>

    <!-- Login Form -->
    
    <form method="post" name="form1" id="form1">
     <input type="text"id="userid" class="fadeIn second" name="userid" placeholder="아이디" required="required" >
     <input type="button" onclick="id_check()" value="중복체크">
					<span id="idcheck" style="color:green;"></span>
     
     
     
     <input type="password" id="passwd" required="required" placeholder="비밀번호">
     <input id="name" type="text" required="required" placeholder="이름">
     <input id="email" type="text" required="required" placeholder="이메일">
     <input id="hp" type="text" required="required" placeholder="HP( - 넣지 마세요)">
      <div>
      <input type="button" class="fadeIn fourth" onclick="loginCheck()" id="btnJoin" value="회원가입">
      <div id="loginchk" style="color:red;"></div>
    </div>
    </form>
    </div>
     
      
      
      

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a href="../pro/login_page.jsp">Login</a>&nbsp;|&nbsp;
      <a href="../pro/index.jsp">나가기</a>
    </div>

  </div>
</div>
</body>
</html>