<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}main_style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<script src="${project}weather.js"></script>
<script src="${project}random.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
	 
	<c:if test="${sessionScope.memId == null}">
		<!-- managerId 관리자로 로그인 했을경우 -->
		<c:if test="${sessionScope.managerId !=null}">
			<jsp:include page="${part_top_manager}">
				<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
			</jsp:include>
		</c:if>
		<!-- 로그인을 아무것도 안했을 경우 -->
		<c:if test="${sessionScope.memId ==null}">
			<jsp:include page="maintop.jsp"></jsp:include>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			    </ol>
			 
			    <!-- 메인페이지 최상단 슬라이드  -->
			    <div class="carousel-inner" role="listbox">
			      <div class="item active">
			        <img src="${imgUrl_basic1}" alt="Image">
			        <div class="carousel-caption">
			          <h3>${string_info}</h3>
			          <p>${string_info_context}</p>
			        </div>      
			      </div>
			
			      <div class="item">
			        <img src="${imgUrl_basic2}" alt="Image">
			        <div class="carousel-caption">
			          <h3>${string_info}</h3>
			          <p>${string_info_context}</p>
			        </div>      
			      </div>
			    </div> 
			
			    <!-- Left and right controls -->
			    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      <span class="sr-only">Previous</span>
			    </a>
			    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      <span class="sr-only">Next</span>
			    </a>
			</div><br>
			  
		<div class="jumbotron text-center" >    
		  
		  <div class="row">
		    <div class="col-sm-3">
		    	<!-- 오늘의 날씨 영역 -->
		      <!--<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">-->
		   		<div class="thumbnail weather" style="margin:0px;padding:0px;height:auto;min-height:350px;">
		   			<!-- 날씨 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 로그인하기전-->
		   			<jsp:include page="weatherex.jsp"></jsp:include>
					<div class="row" >
						<div class="col-sm-12 text-center">
						</div>
					</div>
				</div>
				<!-- 날씨 끝나는부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		    </div>
		    <div class="col-sm-5" id="bestprogram"> 
		    	<!-- 피트니스 홍보 배너 (가입을 하고 자신을 위한 운동스케줄을 받아보세요~)-->
		  	</div>
		  	<div class="col-sm-4"> 
		    	<!-- 스케줄홍보!! -->
			  	<div class="thumbnail thumbnail-sche">
			  		<img src="//www.active.com/Assets/fitness/trainer-questions-620.jpg" alt="Trainer">
			  		<div class="panel-heading">
					   <p><strong>ONLY for You</strong><br>당신만을 위한 운동스케줄</p>
			  		</div>
		        </div>
			</div><br><br><br><br>
			  <div class="row">
			    <div class="col-sm-6">
			      <div class="well panel">
			         <div id="reply" class="reply">
					      <!-- 댓글 -->
					  </div>
			      </div>
			    </div>
			    <div class="col-sm-6">
			      <div id="chartDiv" style="background:#404040;" class="neon">
			      	<Strong>85%</Strong>
			      	<p style="color:white;" >많은 회원분들이 MFC에 만족하고 있습니다!</p>
			      	<canvas id="myChart" width="200" height="45"></canvas>
			       <br>
			       <script>
						var ctx = document.getElementById("myChart").getContext('2d');
						var data = {
							    datasets: [{
							    	backgroundColor: ["#FFFFFF","#CCFF00","#232323"],
							    	borderWidth: 0,
							        data: [10, 20, 30]
							    }],

							    // These labels appear in the legend and in the tooltips when hovering different arcs
							    labels: [
							        'Bad',
							        'Good',
							        'Exellent'
							    ]
							};
						var options = { 
							    responsive: true,
							    maintainAspectRatio: true
							};
						var myDoughnutChart = new Chart(ctx, {
						    type: 'doughnut',
						    data: data,
						    options: options
						});
						</script>
			      </div>
			    </div>
			  </div>
			</div><br><br><br><br>
			
		</c:if>
		
		
		</c:if>
		<!-- After logon page 로그인 했으면 나타나는 페이지 -->
		<c:if test="${sessionScope.memId != null}">
			<jsp:include page="maintop.jsp">
				<jsp:param value="${sessionScope.memId}" name="user_id"/>
			</jsp:include>
		
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		    </ol>
		
		    <!-- 메인페이지 최상단 슬라이드  -->
		    <div class="carousel-inner" role="listbox">
		      <div class="item active">
		        <img src="${imgUrl_basic1}" alt="Image">
		        <div class="carousel-caption">
		          <h3>${string_info}</h3>
		          <p>${string_info_context}</p>
		        </div>      
		      </div>
		
		      <div class="item">
		        <img src="${imgUrl_basic2}" alt="Image">
		        <div class="carousel-caption">
		          <h3>${string_info}</h3>
		          <p>${string_info_context}</p>
		        </div>      
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
		  
		<div class="jumbotron text-center" >    
		  
		  <div class="row">
		    <div class="col-sm-3">
		    <!-- 로그인후 날씨 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		    	<!-- 오늘의 날씨 영역 -->
		      <!--<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">-->
		   		<div class="thumbnail weather">
					<jsp:include page="weatherex.jsp"></jsp:include>
					<div class="row">
						<div class="col-sm-12 text-center">
							
						</div>
					</div>

				</div>
				<!-- 로그인후 날씨부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		    </div>
		    <div class="col-sm-5" id="bestprogram"> 
		    	<!-- 피트니스 홍보 배너 (가입을 하고 자신을 위한 운동스케줄을 받아보세요~)-->

		  	</div>
		  	
		  	<div class="col-sm-4"> 
		    	<!-- 운동오늘의 스케줄 -->
				  	<div class="panel panel-default">
				  		<div class="panel-heading">
				  			<div class="row panel-row">
			      				<div class="col-sm-8">
							  		<p><strong>Today Workout Schedule</strong><br>
							  		훌륭한 스케쥴들이 당신을 기다리고 있습니다.</p>
							  	</div>
							  	<div class="col-sm-4">
							  		<button type="button" class="btn btn-default btn-sm" onclick="location.href='${projectPage}scheduleMain.do'">
							          Start Now<span class="glyphicon glyphicon-chevron-right"></span>
							        </button>
				        		</div>
				        	</div>
				  		</div>
				  		<div class="panel-body">
					  		<ul class="list-group" id="todayScheList">
							  <script>mainTodayScheLoad();</script>
							</ul>
						</div>
			        </div>
		  	</div>
		</div>
	</div>
</c:if>
</body>
<footer class="container-fluid text-center">
 <img src="/MFC/img/main/mark_footer.png">
</footer>