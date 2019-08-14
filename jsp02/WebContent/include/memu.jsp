<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>

<!-- views/include/menu.jsp -->
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/login_servlet/logout.do";
	});
});
</script>
<style>




.btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }




li{
font-size: 20px;
}

   footer {
      color: silver;
      
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    
      .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
  
  
      .navbar {
      float: none;
      text-align: center;

    }
    

    
    /* Set gray background color and 100% height */
    .sidenav {
      
      background-color: #f1f1f1;
      height: 100%;
    }


</style>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  
  
  
      <c:if test="${userid == null }">
  <div class="container-inverse">
  <nav class="navbar navbar-inverse">
    <div class="collapse navbar-collapse" id="myNavbar">
      
      <A href="../pro/index.jsp"><img style="width: 18%; height: 20%;" src="../images/진우첫 작품.png"></A>
     <br>
     <Br>
     
      <div align="center">
            <ul class="nav navbar-nav navbar-right"> <!-- navbar-nav -->
              <li class="active"><a href="../pro/index.jsp">Home &nbsp;&nbsp;|</a></li>
              <li class="active"><a href="../bob/index.jsp">취업 정보 &nbsp;&nbsp;|</a></li>
              <li class="active"><a href="../information/index.jsp">취업 후기 &nbsp;&nbsp;|</a></li>
        <li class="active"><a href="../pro/login_page.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	        </ul>
          </div>
      </div>  
    </nav>
  </div>
 </c:if> 
 
 <!-- 일반 회원 -->

      <c:if test="${userid != null }">
   <div class="container-inverse">
  <nav class="navbar navbar-inverse">
    <div class="collapse navbar-collapse" id="myNavbar1">
      <A href="../pro/index.jsp"><img style="width: 20%; height: 20%;" src="../images/진우첫 작품.png"></A>
          <br>
          <br>
          
          <div align="center">
	        <ul class="nav navbar-nav navbar-right">
	        <li class="active"><a href="../pro/index.jsp">Home &nbsp;&nbsp;|</a></li>
              <li class="active"><a href="../bob/index.jsp">취업 정보 &nbsp;&nbsp;|</a></li>
              <li class="active"><a href="../information/index.jsp">취업 후기</a></li>
               
               <c:if test="${userid == 'admin' }">
              <li class="active nav"><a href="../pro/admin.jsp">|&nbsp;&nbsp; 회원 관리</a></li>
              </c:if>
              
         
      </ul>  
      <br>
      <bR>
      <br>
      <div align="right">
      <span class="glyphicon glyphicon-user" style="color: white; font-size: 17px;"><A style="color: silver;" href="#">${sessionScope.message}</A>님</span>
      <button type="button" style="background-color: white; font-size: 5px;" class="btn btn-dark" id="btnLogout">로그아웃</button>
     </div>
    </div>
    </div>
   </nav>
  </div>     
 </c:if>
 

          

  <!-- &nbsp;&nbsp;&nbsp; -->
