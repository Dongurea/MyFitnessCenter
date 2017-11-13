<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${project}main_style.css" rel="stylesheet" type="text/css">
  <title>클래스</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .navhind {
    	background-color:white;
        align:center;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>

<!-- mainTop부분 -->
<c:if test="${sessionScope.memId==null}">
	<c:if test="${sessionScope.managerId == null}" >
	<jsp:include page="${part_top}"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.managerId != null}" >
	<jsp:include page="${part_top_manager}">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
	</jsp:include>
	</c:if>
</c:if>
<c:if test="${sessionScope.memId!=null}">
	<jsp:include page="${part_top}">
		<jsp:param value="${sessionScope.memId}" name="user_id"/>
	</jsp:include>
</c:if>

<!-- mainTop부분 끝-->
	


<div class="container-fluid bg-3 text-center">    
  <h3 style="color:white;">운동</h3>
  	<c:if test="${sessionScope.managerId != null}" >
   <div align="right">
	 <button type="button" class="btn btn-default" onclick="location.href='workoutInsertForm.do'">추가</button>
	</div>
	</c:if>
  <br>
  <div class="row" id="pro">
  <c:forEach var="workout" items="${workouts}"> 
  	<!-- 프로그램 반복구간 -->
  	
    <div class="col-sm-3" onclick="location.href='workoutContent.do?workout_name=${workout.workout_name}'">
    	<!-- 프로그램 제목 -->
      <p><strong style="color:white;">${workout.workout_name}</strong></p>
      <iframe src="${workout.link}" style="width:100%; height:30%"></iframe>
      <p style="color:white;">
      ${workout.sec}/${workout.grade}<br>
      ${workout.workout_part}
      </p>
    </div>
    <!-- 프로그램 반복구간 끝-->
  </c:forEach> 
  </div>
</div><br>

<br><br>
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
</html>
