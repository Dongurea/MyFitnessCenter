<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result == 0}">	
		<script type="text/javascript" charset="utf-8">
			<!--
			alert( "수정에러" );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=clsBoardList.do">
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript" charset="utf-8">
			<!--
			alert( replyerror );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=clsBoardList.do">
	</c:if>
	<c:if test="${result == 1}">
		<c:redirect url="workoutContent.do">
			<c:param name="workout_name" value="${workout_name}"/>
		</c:redirect>
	</c:if>	
</body>
</html>