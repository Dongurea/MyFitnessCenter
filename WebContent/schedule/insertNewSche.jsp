<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_input} </h2>
<!-- 스케줄리스트생성실패 -->
<c:if test="${result < 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );		
		//-->
	</script>
</c:if>
<!-- 상세스케줄생성실패 -->
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );		
		//-->
	</script>
</c:if>
<!-- 상세스케줄생성성공 -->
<c:if test="${result > 0}">
	<c:redirect url="managerSche.do?user_id=${user_id }"></c:redirect>
</c:if>