<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/xml;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${workouts!=null && workoutNames!=null }">
	<workouts>
	<c:forEach var="workoutN" items="${workoutNames }" varStatus="stat">
		<workout>
			<workout_name>${workoutN}</workout_name>
			<link>${workouts[workoutN].link }</link>
			<sec>${workouts[workoutN].sec }</sec>
			<grade>${workouts[workoutN].grade }</grade>
			<workout_part>${workouts[workoutN].workout_part }</workout_part>
			<workout_type>${workouts[workoutN].workout_type }</workout_type>
		</workout>
	</c:forEach>
	</workouts>
</c:if>
<c:if test="${workouts ==null || workoutNames==null}">
	<workouts>
		<workout>
			<workout_name>null</workout_name>
			<link>null</link>
			<sec>null</sec>
			<grade>null</grade>
			<workout_part>null</workout_part>
			<workout_type>null</workout_type>
		</workout>
	</workouts>
</c:if>