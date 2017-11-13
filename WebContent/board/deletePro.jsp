<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="${project}script.js"></script>

<h2> ${page_delete} </h2>

<c:if test="${resultcheck == 0}">
	<script type="text/javascript">
		<!--
		erroralert( repasswderror );
		//-->
	</script>
</c:if>		
<c:if test="${resultcheck != 0}">
	<c:if test="${result == 0}">	
		<script type="text/javascript">
			<!--
			alert( deleteerror );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=boardList.do?pageNum=${pageNum}">
	</c:if>
	<c:if test="${result == -1}">
		<script type="text/javascript">
			<!--
			alert( replyerror );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=boardList.do?pageNum=${pageNum}">
	</c:if>
	<c:if test="${result == 1}">
		<c:redirect url="boardList.do?pageNum=${pageNum}"/>		
	</c:if>	
</c:if>













