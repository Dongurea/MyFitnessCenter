<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<c:if test="${schedules!=null && result==1}">
	<c:forEach var="sche" items="${schedules }" varStatus="stat">
		<c:if test="${stat.index < 4 }">
			<c:if test="${stat.index == 0 }">
				<li class="list-group-item" id="black">${sche.workout_name }<span class="badge">${sche.sche_set * sche.set_num }</span></li>
			</c:if>
			<c:if test="${stat.index != 0 }">
				<li class="list-group-item">${sche.workout_name }<span class="badge">${sche.sche_set * sche.set_num }</span></li>
			</c:if>
		</c:if>
		<c:if test="${stat.index == 4 }">
			<li class="list-group-item">
			 <span class="label label-primary">
			 	${fn:length(schedules)- stat.index -1 } more
			 	<span class="glyphicon glyphicon-plus"></span>
			 </span>
			</li>
			
		</c:if>
		<c:if test="${stat.index > 4 }">
		</c:if>
	</c:forEach>
</c:if>
<!-- 오늘스케줄이 없거나, 이미 수행했으면 -->
<c:if test="${schedules==null || result==0}">
	<li class="list-group-item">수행해야 할 스케줄이 없습니다.</li>
</c:if>