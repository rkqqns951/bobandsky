<!-- http://192.168.0.52/jsp02/pro/index.jsp -->
<!-- http://localhost/jsp02/pro/index.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B.O.B 취업 정보 사이트</title>
<%@ include file="../include/header.jsp" %>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  


  
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
  .modal-header1, .h41, .close {
    background-color: #ffdb4d;
    color: #000 !important;
    text-align: center;
    font-size: 35px;
  }
  .modal-header1, .modal-body {
    padding: 40px 50px;
  }
  
  
    .modal-header2, .h42, .close {
    background-color: #0000cc;
    color: #fff;
    text-align: center;
    font-size: 35px;
  }
  .modal-header2, .modal-body {
    padding: 40px 50px;
  }
  
    .modal-header3, .h43, .close {
    background-color: #ff3300;
    color: #ccc;
    text-align: center;
    font-size: 35px;
  }
  .modal-header3, .modal-body {
    padding: 40px 50px;
  }


  </style>

</head>
<body>
<%@ include file="../include/memu.jsp" %>

    <hr>
    
    <div id="myCarousel" class="carousel slide" data-ride="carousel">    
   <!--페이지-->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
   </ol>
   <!--페이지-->

   <div class="carousel-inner">
      <!--슬라이드1-->
      <div class="item active"> 
        <a href="#"><img src="../images/blue.png" style="width:50%" alt="First slide"></a>
         <div class="container">
            <div class="carousel-caption">
               <h1>취업후기 남기고 하와이 가자!</h1>
              
            </div>
         </div>
      </div>
      <!--슬라이드1-->

      <!--슬라이드2-->
      <div class="item"> 
         <a href="#"><img src="../images/blue.png" style="width:50%" data-src="" alt="Second slide"></a>
         <div class="container">
            <div class="carousel-caption">
               <h1>예시1...</h1>
               
            </div>
         </div>
      </div>
      <!--슬라이드2-->
      
      <!--슬라이드3-->
      <div class="item"> 
         <a href="#"><img src="../images/blue.png" style="width:50%" data-src="" alt="Third slide"></a>
         <div class="container">
            <div class="carousel-caption">
               <h1>예시2...</h1>
               
            </div>
         </div>
      </div>
      <!--슬라이드3-->
   </div>   
   <!--이전, 다음 버튼-->
   <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
   <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>


      <hr>
<!-- Container (TOUR Section) -->

<div id="tour" class="bg-1">
  <div class="container">
    <h2 class="text-center">그들의 이야기</h2>
    <p class="text-center">기업의 특성이 보이는 그들의 이야기</p>
    
    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="../images/kakao.JPG" width="400" height="300">
          <p><strong>kakao</strong></p>
          <p>공개하고 공유합니다.</p>
          <button class="btn" data-toggle="modal" data-target="#myModal1">Open</button>
        </div>
      </div>
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="../images/samsung.JPG" width="400" height="300">
          <p><strong>삼성</strong></p>
          <p>삼성의 경영철학과 목표</p>
          <button class="btn" data-toggle="modal" data-target="#myModal2">Open</button>
        </div>
      </div>
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="../images/Lg.JPG" width="400" height="300">
          <p><strong>LG</strong></p>
          <p>고객을 위한 가치창조</p>
          <button class="btn" data-toggle="modal" data-target="#myModal3">Open</button>
        </div>
      </div>
    </div>
  </div>
 </div>
  
  
    <!-- Modal kakao -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header1">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="h41"> kakao</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group">
             
             <h4 class="text-center"><b>가능한 모든 정보를 공유합니다.</b></h4><br>
결론 뿐만 아니라 의견 개진과 토론의 내용까지도 되도록 모두 공유합니다.<br><br>

논의 과정을 보면 동료들이 일의 맥락을 이해할 수 있고, 그 속에서 더 나은 길을 찾고 결정할 수 있기 때문입니다.<br><br>

특별한 이유로 어떤 시점에 공유하기 어려운 내용이 있다면 보안을 유지하되, 이후 공유할 때는 공개할 수 없었던 사정을 설명합니다.<br><br>

<b style="color: red;">단, 정보 공개를 할때는 100 : 0 법칙을 기억해야 합니다.<br> “내부에서는 모든 것을 공개하고(100),
 카카오를 벗어나서는 아무것도 공개하지 않는다(0).” </b>
             </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> 닫기
          </button>
          <p><a href="#">도움말</a></p>
        </div>
      </div>
    </div>
  </div>
  
  
<!-- Modal samsung -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header2">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="h42"> Samsung</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group">
             
            <h4 class="text-center"><b>인재</b>와 <b>기술</b>을 바탕으로 최고의 제품과 서비스를 <b>창출</b>하여 인류사회에 공헌하는 것, 삼성전자가 추구하는 궁극적인 목표입니다.</h4><br><br>
            <b style="font-size: 16px;">1</b> 인재와 기술을 바탕으로  <br>
· 인재육성과 기술우위 확보를 경영의 원칙으로 삼는다.<br>
· 인재와 기술의 조화를 통하여 경영전반의 시너지 효과를 증대한다.<br>
<br>
<b style="font-size: 16px;">2</b> 최고의 제품과 서비스를 창출하여  <br>
· 고객에게 최고의 만족을 줄 수 있는 제품과 서비스를 창출한다.<br>
· 동종업계에서 세계 1군의 위치를 확보한다.<br>
<br>
<b style="font-size: 16px;">3</b> 인류사회에 공헌한다  <br>
· 인류의 공동이익과 풍요로운 삶을 위해 기여한다.<br>
· 인류공동체 일원으로서의 사명을 다한다.<br>
             
             
             
             
             
             
             </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> 닫기
          </button>
          <p><a href="#">도움말</a></p>
        </div>
      </div>
    </div>
  </div>



<!-- Modal LG -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header3">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="h43"> LG</h4>
        </div>
        <div class="modal-body">
          <form role="form">
            <div class="form-group text-center" >
             
             <h4>LG의 경영이념은 기업활동의 목적인 <b style="color: red;">‘고객을 위한 가치창조’</b>와 <br>
회사 운영 원칙인 <b style="color: red;">‘인간존중의 경영’</b> 입니다.</h4><br><br>
<h4 style="color: red;"><b>고객을 위한 가치창조</b></h4><br>
<b style="font-size: 16px;">고객중시</b> <br><br>
경영의 출발점이 되는 고객을 최우선으로 생각한다. <br>
항상 최종소비자 관점을 중시하여 판단하고 평가한다. <br><br>
<b style="font-size: 16px;">실질적 가치제공</b> <br><br>
고객의 잠재적 요구까지도 한 발 앞서 찾아낸다. <br>
고객의 기대를 뛰어넘는 최고의 제품과 서비스를 제공한다. <br><br>
<b style="font-size: 16px;">혁신을 통한 창조</b> <br><br>
기존의 틀을 깨는 차별화된 아이디어를 창출한다. <br>
끊임없이 더 나은 방식을 찾아 실행한다.

             
             </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> 닫기
          </button>
          <p><a href="#">도움말</a></p>
        </div>
      </div>
    </div>
  </div>

  

<hr>
<%@ include file="../include/footer.jsp" %>

</body>
</html>