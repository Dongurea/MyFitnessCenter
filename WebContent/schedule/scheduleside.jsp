<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<head>
	<link href="${project}sidestyle.css" rel="stylesheet" type="text/css">
	<link href="${project}workoutstyle.css" rel="stylesheet" type="text/css">
</head>

<div class="col-sm-4 sidenav">
    <!-- 운동스케줄이 없는 회원의경우 -->
  	<c:if test="${param.result=='0'}">
    	<h2>${msg_noSchedule}</h2>
			<button type="button" class="btn btn-primary"
				onclick="location='scheduleInsertSpec.do?result=0'">
				${msg_Schedule_spec}</button>
	</c:if>
	<!-- 운동스케줄이 있는 회원의경우 -->
	<c:if test="${param.result=='1'}">
		<br>
		<ul class="nav nav-pills nav-stacked">
			<c:if test="${ page==null || page=='1'}">
				<li class="active act-color"><a href="scheduleMain.do?page=1">내 플랜</a></li>
			</c:if>
			<c:if test="${ page!=null && page!='1'}">
				<li class="act-color"><a href="scheduleMain.do?page=1">내 플랜</a></li>
			</c:if>
		</ul>
	</c:if>
	<hr>
	
	<h3>다른 운동 살펴보기</h3>
	<ul class="nav nav-pills nav-stacked">
		<c:if test="${ page==null || page!='2'}">
				<li class="act-color"><a href="scheduleMain.do?page=2">모든운동보기</a></li>
		</c:if>
		<c:if test="${ page!=null && page=='2'}">
				<li class="active act-color"><a href="scheduleMain.do?page=2">모든운동보기</a></li>
		</c:if>
		<c:if test="${ page==null || page!='3'}">
				<li class="act-color"><a href="scheduleMain.do?page=3">초급</a></li>
		</c:if>
		<c:if test="${ page!=null && page=='3'}">
				<li class="active act-color"><a href="scheduleMain.do?page=3">초급</a></li>
		</c:if>
		<c:if test="${ page==null || page!='4'}">
				<li class="act-color"><a href="scheduleMain.do?page=4">중급</a></li>
		</c:if>
		<c:if test="${ page!=null && page=='4'}">
				<li class="active act-color"><a href="scheduleMain.do?page=4">중급</a></li>
		</c:if>
		<c:if test="${ page==null || page!='5'}">
				<li class="act-color"><a href="scheduleMain.do?page=5">고급</a></li>
		</c:if>
		<c:if test="${ page!=null && page=='5'}">
				<li class="active act-color"><a href="scheduleMain.do?page=5">고급</a></li>
		</c:if>
	</ul><br>
</div>