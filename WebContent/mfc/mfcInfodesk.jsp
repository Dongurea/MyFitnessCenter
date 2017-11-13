<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="setting.jsp" %>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
  
  function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

</script>
  <style>
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      min-height: 200px;
    }

    /* Hide the carousel text when the screen is less than 600 pixels wide */
    @media (max-width: 600px) {
      .carousel-caption {
        display: none; 
      }
    }
  </style>
</head>
<c:if test="${sessionScope.memId == null}">
		<!-- managerId 관리자로 로그인 했을경우 -->
		<c:if test="${sessionScope.managerId !=null}">
			<jsp:include page="${part_top_manager}">
				<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
			</jsp:include>
		</c:if>
		<c:if test="${sessionScope.managerId ==null}">
			<jsp:include page="maintop.jsp"></jsp:include>
		</c:if>
</c:if>
<c:if test="${sessionScope.memId != null}">
	<jsp:include page="maintop.jsp">
		<jsp:param value="${sessionScope.memId}" name="user_id"/>
	</jsp:include>
</c:if>
<body style="background:white;">
<div class="container">
<h2>고객지원</h2><br>
<div class="row">
<div class="col-sm-8">
      <div id="googleMap" style="width:100%;height:400px;"></div>
  </div>
  <script type="text/javascript">
    function myMap() {
	  var mapProp= {
	      center:new google.maps.LatLng(37.506973, 127.058649),
	      zoom:17,
	  };
	  var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	  var marker = new google.maps.Marker({
          position: new google.maps.LatLng(37.506973, 127.058649),
          map: map
        });
	  }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALaEseQwViX7Ms-AfQF3sLxZMPbmp15zw&callback=myMap"></script>
  

  <div class="w3-third  w3-center">
  <div class="w3-card-2 w3-container" style="min-height:30%; width:80%;">
  <h3>MyFitnessCenter</h3>
  <i class="fa fa-phone w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>서울시 강남구 MFC빌딩</p>
  <p>Tel. 02-548-8758</p>
  <p>Phone. 010-1234-56789</p>
  <p>fax. 02-8458-8789</p>
  </div>
</div>
</div>
<hr>
</div>

<div class="container">    
 <h2>Q&A</h2>
 <br>
<button onclick="myFunction('Demo1')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">
	Q. 상담원과 연결이 되지 않을 땐 어떻게 해야 하나요?
</button>
<br>
<div id="Demo1" class="w3-hide">
  <div class="w3-container">
    <p>A. 간혹 상담을 하고있는 상담원이 모두 상담중일 때가 있습니다. 조금만 기다려주세요.</p>
    <br>
  </div>
</div>
<button onclick="myFunction('Demo2')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">
	Q. 미밴드가 연결이 되지 않습니다.
</button>
<br>
<div id="Demo2" class="w3-hide">
  <div class="w3-container">
    <p>A. 미밴드 연결이 되지 않을때에는 블루투스가 켜져있지않거나 이상이있지 않은지 체크해주세요. </p>
    <br>
  </div>
</div>
<button onclick="myFunction('Demo3')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">
	Q. 페이지먹통됏잖아요
</button>
<br>
<div id="Demo3" class="w3-hide">
  <div class="w3-container">
    <p>A. 저도몰라요</p>
    <br>
  </div>
</div>
<button onclick="myFunction('Demo4')" class="w3-padding-16 w3-theme w3-button w3-block w3-left-align">
	Q. 운동너무힘들어서못하겟어요
</button>
<br>
<div id="Demo4" class="w3-hide">
  <div class="w3-container">
    <p>A. 하지마요그럼...</p>
    <br>
  </div>
</div>
  <hr>
</div>
</body>
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
    