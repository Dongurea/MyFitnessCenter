<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_delete} </h2>

<c:if test="${resultcheck == 1}">
	<c:if test="${result == 0}">
		<script type="text/javascript">
			<!--
			alert( deleteerror );
			//-->
		</script>	
		<meta http-equiv="refresh" content="0; url=main.do">
	</c:if>			
	<c:if test="${result != 0}">
		${sessionScope.memId = null}
		<c:redirect url="memberMain.do"/>			
	</c:if>		
</c:if>
<c:if test="${resultcheck != 1}">
		<script type="text/javascript">
			<!--
			erroralert( passwdnoerror );
			//-->
		</script>
</c:if>


	











