<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_input} </h2>
<!-- 스펙만들기실패 -->
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );		
		//-->
	</script>
</c:if>
<!-- 스펙만들었음 성공~ -->
<c:if test="${result != 0}">
	<!-- 스펙만 업데이트했을때 -->
	<c:if test="${onlyspec!=null&&onlyspec==1 }">
		<c:redirect url="scheduleMain.do"></c:redirect>
	</c:if>
	<!-- 스케줄도 만들꺼면 -->
	<c:if test="${onlyspec==null||onlyspec!=1 }">
		<c:redirect url="scheduleInsertList.do">
			<c:param name="startday" value="${startday}"/>
		</c:redirect>
	</c:if>
</c:if>