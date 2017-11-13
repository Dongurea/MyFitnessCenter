<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<link href="${project}workoutstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${project}script.js"></script>
<br>
<div class="container-fluid text-center">    
  <c:if test="${workouts!=null }">
	  <c:forEach var="workout" items="${workouts }" varStatus="stat">

			    <div class="col-sm-4">
				       <div class="panel panel-${workout.grade}">
				       
				        <div class="panel-heading">
					        <span class="label label-${workout.grade}">${workout.grade}</span>
					        ${workout.workout_name }
					    </div>
				        <div class="panel-body"><iframe frameBorder="0" style='width:100%;height:50%;' id='video1' src='${workout.link }'></iframe></div>
				        <div class="panel-footer">${workout.workout_type } / ${workout.workout_part }</div>
				      </div>
			    </div>

	  </c:forEach>
  </c:if>
</div>
