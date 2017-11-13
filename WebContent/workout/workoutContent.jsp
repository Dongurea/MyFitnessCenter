<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>${workoutDto.workout_name}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="script.js"></script>
  
</head>
<body>

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

<div class="container-fluid">
  <div class="row content">
  	<div class="col-sm-1"></div>
    <div class="col-sm-10">
    <br>

      <h4 id="classname" style="color:white;">${workoutDto.workout_name}</h4>
      <c:if test="${sessionScope.managerId!=null}" >
      <div align="right">
	 <button type="button" class="btn btn-default" onclick="location.href='workoutModifyForm.do?workout_name=${workoutDto.workout_name}'">수정</button>
	 </div>
	 </c:if>
	 
      <hr>
      
      <div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" src="${workoutDto.link}" frameborder="0"></iframe>
	  </div>

      <hr>
      
      <h2 style="color:white;">운동 1회당 시간</h2>
      	<br>
      <!-- 프로그램 소개 -->
      <p style="color:white;">${workoutDto.sec}초</p>
      <br>
      
      <hr>
      
      <h2 style="color:white;">운동 난이도</h2>
    	<br>
      <p style="color:white;">${workoutDto.grade}</p>
      
      <hr>
      
	  <h2 style="color:white;">운동 부위</h2>
    	<br>	
      <p style="color:white;">${workoutDto.workout_part}</p>
      
      <hr>
      
      <h2 style="color:white;">운동 타입</h2>
    	<br>	
    	<c:if test="${workoutDto.workout_type=='Burn'}">
    		<c:set var="workout_type" value="유산소운동"/>
    	</c:if>
    	<c:if test="${workoutDto.workout_type=='Multi'}">
    		<c:set var="workout_type" value="복합운동"/>
    	</c:if>
    	<c:if test="${workoutDto.workout_type=='Pump'}">
    		<c:set var="workout_type" value="무산소운동"/>
    	</c:if>
      <p style="color:white;">${workout_type}</p>
      
      <hr>
      
      <h2 style="color:white;">Routine step</h2>
    	<br>	
    	<c:if test="${workoutDto.routine_step=='1'}">
    		<c:set var="routine_step" value="적응운동"/>
    	</c:if>
    	<c:if test="${workoutDto.routine_step=='2'}">
    		<c:set var="routine_step" value="향상운동"/>
    	</c:if>
    	<c:if test="${workoutDto.routine_step=='3'}">
    		<c:set var="routine_step" value="유지운동"/>
    	</c:if>
      <p style="color:white;">${routine_step}</p>
      
      <hr>
      
      <h2 style="color:white;">Fat grade</h2>
    	<br>	
    	<c:if test="${workoutDto.fat_grade=='0'}">
    		<c:set var="fat_grade" value="고도지방"/>
    	</c:if>
    	<c:if test="${workoutDto.fat_grade=='1'}">
    		<c:set var="fat_grade" value="과지방"/>
    	</c:if>
    	<c:if test="${workoutDto.fat_grade=='2'}">
    		<c:set var="fat_grade" value="일반인"/>
    	</c:if>
    	<c:if test="${workoutDto.fat_grade=='3'}">
    		<c:set var="fat_grade" value="우수"/>
    	</c:if>
    	<c:if test="${workoutDto.fat_grade=='4'}">
    		<c:set var="fat_grade" value="선수급"/>
    	</c:if>

      <p style="color:white;">${fat_grade}</p>
      
      <hr>
      
      <h2 style="color:white;">BMI grade</h2>
    	<br>	
    	<c:if test="${workoutDto.bmi_grade=='0'}">
    		<c:set var="bmi_grade" value="저체중"/>
    	</c:if>
    	<c:if test="${workoutDto.bmi_grade=='1'}">
    		<c:set var="bmi_grade" value="정상"/>
    	</c:if>
    	<c:if test="${workoutDto.bmi_grade=='2'}">
    		<c:set var="bmi_grade" value="과체중"/>
    	</c:if>
    	<c:if test="${workoutDto.bmi_grade=='3'}">
    		<c:set var="bmi_grade" value="비만"/>
    	</c:if>
    	<c:if test="${workoutDto.bmi_grade=='4'}">
    		<c:set var="bmi_grade" value="고도비만"/>
    	</c:if>
      <p style="color:white;">${bmi_grade}</p>
      
      <hr>
      
     
    
    </div>    
    <br><br><br>
   	<div class="col-sm-1"></div>
  </div>
</div>

<div style="position:fixed; bottom: 5px; right:5px;">
   <a href="#"><img src="top.png" title="위로가기"></a>
</div>

</body>
</html>


