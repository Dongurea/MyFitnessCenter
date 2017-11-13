<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="workout/script.js"></script>
	<div class="w3-container" align="center">
	  <h2>운동이름</h2>
	
	<c:if test="${result==1}">	
	<form name="confirmClassnameForm" action="clsBoardConfirmClassname.do" method="POST" onsubmit="return workoutnameCheck()">
	  <p>${workout_name}은 이미 있는 운동입니다.</p>
	  <input class="w3-input w3-border w3-padding" type="text" id="classname" >
	  <button type="submit" class="btn btn-default">확인</button>
	  <button type="button" class="btn btn-default" onclick="window.close()">취소</button>
	</form>
	</c:if> 
	<c:if test="${result!=1}">
		<p>${workout_name}은 사용할 수 있는 운동이름입니다.</p>
	  <button type="button" class="btn btn-default" onclick="setClassname('${workout_name}')">확인</button>
	  <button type="button" class="btn btn-default" onclick="window.close()">취소</button>
	</c:if>
	</div>

</body>
</html>