<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_login} </h2>

<c:if test="${result == 1}">
	${sessionScope.memId = user_id};	
	<c:redirect url="mfcMain.do">
	</c:redirect>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		<!--
		erroralert( passwdnoerror )
		//-->
	</script>
</c:if>
<c:if test="${result == 0}">
	<c:if test="${manage_result == 1}">
		${sessionScope.managerId = user_id};	
		<c:redirect url="specList.do">
		</c:redirect>
	</c:if>
	<c:if test="${manage_result == 0}">
		<!--
		erroralert( idnoerror )
		//-->
	</c:if>
	<c:if test="${manage_result == -1}">
		<!--
		erroralert( passwdnoerror )
		//-->
	</c:if>
	<script type="text/javascript">
		<!--
		erroralert( idnoerror )
		//-->
	</script>
</c:if>












