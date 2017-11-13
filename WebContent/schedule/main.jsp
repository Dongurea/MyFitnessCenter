<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

    <!-- google fonts  -->
    <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto|Raleway:600,400,200' rel='stylesheet' type='text/css'>

    <!-- Vizuly specific style sheets -->
    <link rel="stylesheet" href="${project}styles/vizuly.css">
    <link rel="stylesheet" href="${project}styles/vizuly_radial_progress.css">

    <!-- Supporting test container files:  Vizuly does NOT rely on these -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="${project}styles/cssmenu.css">
    <script src="${project}lib/cssmenu.js"></script>

    <script src="${project}lib/d3.min.js"></script>

    <script src="${project}lib/vizuly_core.min.js"></script>
	<script src="${project}lib/vizuly_radialprogress.min.js"></script>
	<!-- d3.js context -->
    <!--<script src="${project}app.js"></script>-->

<body>
	<!-- d3.js showing -->
	<!--<script>
	    $(document).ready(function () {
	        initialize();
	    });
	</script>-->

	<jsp:include page="${part_top}">
		<jsp:param value="${sessionScope.memId}" name="user_id"/>
		<jsp:param value="1" name="schedule_page"/>
	</jsp:include>
	
	<div class="container-fluid">
	  <div class="row content">
	    <div class="col-sm-8">
			<!-- 내플랜영역 -->
			<c:if test="${page==null||page=='1'}">
				<!-- 스케줄없는경우 -->
		   		<c:if test="${result=='0'}">
					<iframe style="width:90%;height:90%;"
							src="https://www.youtube.com/embed/dm8IdS52pXI?autoplay=1">
					</iframe>
				</c:if>
				<!-- 스케줄있는경우 -->
				<c:if test="${result=='1'}">
					<jsp:include page="${part_myplan}">
						<jsp:param value="${spec}" name="spec"/>
						<jsp:param value="${specString}" name="specString"/>
						<jsp:param value="${schedule}" name="schedule"/>
						<jsp:param value="${scheduleList}" name="scheduleList"/>
						<jsp:param value="${todayDidSche}" name="todayDidSche"/>
					</jsp:include>
				</c:if>
			</c:if>
			<!-- 모든운동보기 -->
			<c:if test="${page=='2'}">
				<jsp:include page="${part_all}">
					<jsp:param value="${workouts }" name="workouts"/>
				</jsp:include>
			</c:if>
			<!-- 초급 -->
			<c:if test="${page=='3'}">
				<jsp:include page="${part_low}">
					<jsp:param value="${workouts }" name="workouts"/>
				</jsp:include>
			</c:if>
			<!-- 중급 -->
			<c:if test="${page=='4'}">
				<jsp:include page="${part_mid}">
					<jsp:param value="${workouts }" name="workouts"/>
				</jsp:include>
			</c:if>
			<!-- 고급 -->
			<c:if test="${page=='5'}">
				<jsp:include page="${part_high}">
					<jsp:param value="${workouts }" name="workouts"/>
				</jsp:include>
			</c:if>
			
			<!-- (1)지금 바로 스케줄 만들어서 넘어온 회원일경우 -->
			<c:if test="${made=='1'}">
				<script type="text/javascript">
					swal({
						  title: "Success!",
						  text: "스케줄을 만들었습니다.\n지금 바로 운동을 살펴볼까요?",
						  type: "success",
						  confirmButtonText: "OK"
					});
				</script>
			</c:if>
			<c:if test="${remake=='1'}">
				<script type="text/javascript">
					swal({
						  title: "Success!",
						  text: "성취도를 반영해 오늘 이후 스케줄을 최적화 했습니다!",
						  type: "success",
						  confirmButtonText: "OK"
					});
				</script>
			</c:if>			
	    </div>
	    <jsp:include page="scheduleside.jsp">
	    	<jsp:param value="${result}" name="result"/>
	    	<jsp:param value="${page}" name="page"/>
	    </jsp:include>
	  </div>
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