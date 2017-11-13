<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="script.js"></script>
<head>
  <style>
  	h2{
  		color:white;
  	}
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
	  border-color: #CEF279;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #fff;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

	.navbar-inverse{
		background-color: #CEF279;
	}

	.active-in{
		background-color: #F6FFCC;
	}

	.navbar-inverse .navbar-nav > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand{
		color:black;
	}

  </style>
</head>
<body>
</body>


<jsp:include page="${part_top_manager}">
	<jsp:param value="${sessionScope.managerId}" name="manager_id"/>
</jsp:include>

<body style="color:#fff;">

 <form action="workoutInsertPro.do" name="workoutInsertForm" method="post" >

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav" style="background-color:#2d2d30;">
    </div>
    <div class="col-sm-8 text-left"> 
	 <div align="right">
	 <br><br>
	 <button type="submit" class="btn btn-default" >추가</button>
	 <button type="button" class="btn btn-default" onclick="location.href='workoutList.do'">취소</button>
	 </div>
	 <br>
	 <h2 style="color:white;">운동이름</h2><br>
		<input type="text"  style="width:200px; display: inline;"class="form-control" name="workout_name">
		&nbsp;
		<button type="button" class="btn btn-default" style="width:100px; display: inline;" onclick="confirmWorkoutname()">중복확인</button>
		<input type="hidden" name="check" />
	  <br>
      <hr>
      <div class="container">
    <div class="row">
      <div class="col-sm-9">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->

        </div>

      </div>
    </div>
    </div>
 
      <h2 style="color:white;">운동링크</h2><br>

      <textarea name="link" class="form-control" rows="1" cols="3" id="comment"></textarea>


      <hr>
      
      <h2 style="color:white;">운동 1회당 시간</h2><br>

	  <input type="text"  style="width:150px; display: inline;"class="form-control" name="sec">&nbsp;&nbsp;초

		<br>
	  <hr>
      
	  <h2 style="color:white;">운동 난이도</h2><br>
	
	  <select name="grade"  style="width:150px; "class="form-control" >
		  <option id="grade" value="low"> low </option>
		   <option id="grade" value="mid"> mid </option>
		   <option id="grade" value="high"> high </option>
	   </select>

	  <hr>

	<h2 style="color:white;">운동부위</h2><br>
	<div style="color:white;">
	  <input name="workout_part" type="checkbox" value="ALL"> 전체
	   &nbsp;<input name="workout_part" type="checkbox" value="HIP"> 엉덩이
	   &nbsp;<input name="workout_part" type="checkbox" value="LEG"> 다리
	   &nbsp;<input name="workout_part" type="checkbox" value="CORE"> 중심
	   &nbsp;<input name="workout_part" type="checkbox" value="ARM"> 팔
	   &nbsp;<input name="workout_part" type="checkbox" value="BACK"> 등
	   &nbsp;<input name="workout_part" type="checkbox" value="CHEST"> 가슴
		<br>
	</div>
	  <hr>
	  
	    <h2 style="color:white;">운동 종류</h2><br>
	
	  <select name="workout_type" style="width:150px; "class="form-control" >
		  <option id="workout_type" value="Burn"> 유산소운동 </option>
		   <option id="workout_type" value="Multi"> 복합운동 </option>
		   <option id="workout_type" value="Pump"> 무산소운동 </option>
	   </select>

	  <hr>
	  
	  <h2 style="color:white;">Routine step</h2><br>
	
	  <select name="routine_step" style="width:150px; "class="form-control" >
		  <option id="routine_step" value="1"> 적응운동 </option>
		   <option id="routine_step" value="2"> 향상운동 </option>
		   <option id="routine_step" value="3"> 유지운동 </option>
	   </select>

	  <hr>
	  
	  <h2 style="color:white;">Fat grade</h2><br>
	
	  <select name="fat_grade" style="width:150px; "class="form-control" >
	  	<option id="fat_grade" value="0"> 고도지방 </option>
		<option id="fat_grade" value="1"> 과지방 </option>
		<option id="fat_grade" value="2"> 일반인 </option>
		<option id="fat_grade" value="3"> 우수 </option>
		<option id="fat_grade" value="4"> 선수급 </option>
	   </select>

		<hr>
	  
	  <h2 style="color:white;">BMI grade</h2><br>
	
	  <select name="bmi_grade" style="width:150px; "class="form-control" >
	  	<option id="bmi_grade" value="0"> 저체중 </option>
		<option id="bmi_grade" value="1"> 정상 </option>
		<option id="bmi_grade" value="2"> 과체중 </option>
		<option id="bmi_grade" value="3"> 비만 </option>
		<option id="bmi_grade" value="4"> 고도비만 </option>
	   </select>
     <br><br>
    </div>

    </div>
  </div>

</form>
<div style="position:fixed; bottom: 5px; right:5px;">
   <a href="#"><img src="/MFC/clsBoard/top.png" title="위로가기" style="width:40px;height:auto;"></a>
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
</body>
</html>
