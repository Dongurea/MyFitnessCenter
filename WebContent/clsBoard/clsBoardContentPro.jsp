<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${project}script.js"></script>
</head>

<body>
<c:set var="classname" value="${classname}"/>
	<c:if test="${result == 0}">	
		<script type="text/javascript" charset="utf-8">
			//<!--
			alert( "수강한 학생만 댓글을 남길 수 있습니다" );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=proBoardContent.do?classname=${classname}&classdate=${classdate}">
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			<!--
			alert( replyerror );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=proBoardContent.do?classname=${classname}&classdate=${classdate}">
	</c:if>
	<c:if test="${result == 1}">
		<c:redirect url="proBoardContent.do">
			<c:param name="classname" value="${classname}"/>
			<c:param name="classdate" value="${classdate}"/>
		</c:redirect>
	</c:if>	
</body>
</html>