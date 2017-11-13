<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size: 16px;}
img {margin-bottom: -8px;}
.mySlides {display: none;}
</style>



<c:if test="${sessionScope.managerId !=null}">
			<jsp:include page="${part_top_manager}">
				<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
			</jsp:include>
</c:if>
<c:if test="${sessionScope.memId !=null}">
			<jsp:include page="maintop.jsp">
				<jsp:param value="${sessionScope.memId }" name="user_id"/>
			</jsp:include>
</c:if>
<c:if test="${sessionScope.memId==null}">
			<jsp:include page="maintop.jsp"></jsp:include>
</c:if>

<div class="w3-content w3-black" style="max-width:4500px;">

<!-- Header with Slideshow -->
<header class="w3-display-container w3-center" style="width:100%;">
  
  <div class="mySlides w3-animate-opacity" style="width:100%;" height="auto">
    <img class="w3-image" src="/MFC/mfc/img/intro/피트니스소개헤더.jpg" alt="Image 1" style="min-width:500px" width="100%" height="auto">
	 <div class="w3-display-middle w3-padding-large w3-border w3-wide w3-light-grey  w3-text-black w3-center" style="opacity:0.7;">
	  <h1 class="w3-margin w3-jumbo">MyFitnessCenter</h1>
	  <p class="w3-xlarge">health and fitness</p>
	  <h6 class="w3-text-grey">Get personal coaching to help you <br> reach your goals.</h6>
  </div>
    
  </div>

 
</header>

<!-- The App Section -->
<div class="w3-padding-64 w3-white">
  <div class="w3-row-padding">
    <div class="w3-col l8 m6">
      <h1 class="w3-jumbo"><b>WHAT IS MFC</b></h1>
      <h1 class="w3-xxxlarge" style="color:grey;"><b>Why take it?</b></h1>
      <p><span class="w3-xlarge">활기찬 에너지를 공급하는 MFC</span><br><br>
	  <p class="w3-text-grey">MFC는 2000년대 초반 우후죽순생겨났다 기억속으로 사라져 간 수 많은 휘트니스 센터들과
       차별화된 문화를 향유할 수 있는 감각적인 종합 엔터테인먼트 공간입니다. 
       단순히 무미건조하게 운동만을 위해 기계적으로 찾았던 피트니스의 개념을
       탈피하고자 MFC는 시작부터 끊임없이 
       혁신적인 사고를 기반으로 적극적인 투자를아끼지 않고 있습니다. 
       무엇보다 이제는 가족이 된 수많은 셀럽과 수준 높은 고객들이 저희의 가장 큰 자산이라 할 수 있습니다.
	   </p></p>
    </div>
    <div class="w3-col l4 m6">
      <img src="/MFC/mfc/img/intro/fitness02.jpeg" class="w3-image w3-right w3-hide-small" width="335" height="471">
      <div class="w3-center w3-hide-large w3-hide-medium">
        <img src="/w3images/img_app.jpg" class="w3-image w3-margin-top" width="335" height="471">
      </div>
    </div>
  </div>
</div>


<!-- Clarity Section -->
<div class="w3-padding-64 w3-light-grey">
  <div class="w3-row-padding">
    <div class="w3-col l4 m6">
      <img class="w3-image w3-margin-top  w3-hide-small w3-grayscale" src="/MFC/mfc/img/intro/fitness03.jpg" alt="App" width="335" height="471">
    </div>
    <div class="w3-col l8 m6">
      <h1 class="w3-jumbo"><b>MFC만의 자동 스케쥴</b></h1>
      <h1 class="w3-xxxlarge" style="color:grey;"><b>A special reason</b></h1>
      <p><span class="w3-xlarge">자동 스케쥴은 러닝 목표을 위해 전문적인 준비를 할 수 있게 도와줍니다. 전문가들이 운동 계획을 개발하고 지속적으로 실력향상을 할 수 있도록 설계되었습니다.</span><br><br>
	  <p class="w3-text-grey"> 고객 여러분의 고단한 삶을 ’Refresh’ 할 수 있도록 개개인에 맞는 과학적인 시스템과 전문적이고체계적인 프로그램을 제공하기위해 끊임 없이 연구 하고있습니다.
      아울러 대한민국을 넘어 전 세계의사람들이 건강하고행복한삶을 여위할 수 있도록  세계 각국에 맞는 토탈,헬스 케어 솔루션을 구축하고있습니다.
       MFC는 항상 고객의만족을 최우선으로 하며, 새로운 변화와 즐거움이가득한 혁신적인 대한민국 국가대표 휘트니스로 여러분과 함께 하겠습니다.
	   </p></p>
    </div>
  </div>
</div>



<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
</div>
<c:if test="${sessionScope.managerId==null}">
<footer class="container-fluid text-center">
 <img src="/MFC/img/main/mark_footer.png">
</footer>
</c:if>
<c:if test="${sessionScope.managerId!=null}">
<footer class="container-fluid text-center" style="background: #2d2d30;">
  <img src="/MFC/img/main/mark_footer.png">
</footer>
</c:if>

