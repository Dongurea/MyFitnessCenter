<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 0}">	
		<script type="text/javascript">
			<!--
			alert( deleteerror );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=clsBoardList.do">
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			<!--
			alert( replyerror );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=clsBoardList.do">
	</c:if>
	<c:if test="${result == 1}">
		<c:redirect url="clsBoardContent.do">
			<c:param name="classname" value="${classname}"/>
			<c:param name="classdate" value="${classdate}"/>
		</c:redirect>
	</c:if>	
</body>
</html>