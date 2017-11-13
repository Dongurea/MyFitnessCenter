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

<c:if test="${result == 3}">
	<script type="text/javascript" charset="utf-8">
		<!--
		alert( "예약에 실패하였습니다." );	
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=clsBoardContent.do?classname=${classname}&classdate=${classdate}"> 
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="clsBoardContent.do">
		<c:param name="classname" value="${classname}"></c:param>
		<c:param name="classdate" value="${classdate}"></c:param>
	</c:redirect>
</c:if>	

</body>
</html>