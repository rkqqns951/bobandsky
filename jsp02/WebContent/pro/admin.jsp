<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check2.jsp" %>
<script src="../include/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){//페이지 로딩이 끝나면 자동으로 실행되는 코드
	list();//list()호출
	$("#btnSave").click(function(){
		insert();
	});
});

function insert(){
	var param="userid="+$("#userid").val()
	    +"&passwd="+$("#passwd").val()
	    +"&name="+$("#name").val()
	    +"&email="+$("#email").val()
	    +"&hp="+$("#hp").val()

	$.ajax({
		type: "post",
		url: "/jsp02/login_servlet/join.do",
		data: param,
		success:function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
		}
	});
}

function list(){
	$.ajax({
		type: "post",
		url: "/jsp02/login_servlet/list.do",
		success: function(result){
			console.log(result);//F12 consol에서 응답text확인
			$("#userList").html(result);
		}
	});
}
</script>
</head>
<body>
<%@ include file="../include/memu.jsp" %>

<h2 align="center">회원관리(관리자 용)</h2>
<br>
<Br>
<div align="center">
아이디 : <input id="userid">
비번 : <input type="password" id="passwd">
이름 : <input id="name">
이메일 : <input id="email">
핸드폰 : <input id="hp">
<button type="button" id="btnSave">추가</button>
</div>
<br><br>
<br><br>

<div id="userList"></div>
</body>
</html>