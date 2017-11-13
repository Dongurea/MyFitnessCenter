<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_input} </h2>
<!-- 스케줄만들기실패 -->
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );		
		//-->
	</script>
</c:if>
<!-- 스케줄 만들었음 성공~ -->
<c:if test="${result != 0}">
	<c:if test="${remake !=null }">
		<c:redirect url="scheduleMain.do">
			<c:param name="remake" value="1"/>
		</c:redirect>
	</c:if>
	<c:if test="${remake ==null }">
		<c:redirect url="scheduleMain.do">
			<c:param name="made" value="1"/>
		</c:redirect>
	</c:if>
</c:if>