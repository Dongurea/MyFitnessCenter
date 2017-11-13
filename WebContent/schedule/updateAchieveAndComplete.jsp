<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_input} </h2>
<!-- 수행갯수 업데이트 실패 -->
<c:if test="${result == 0}">
	수행갯수 업데이트 실패
</c:if>
<!-- 성취도 적용 실패 -->
<c:if test="${result == -1}">
	성취도 업데이트 실패
</c:if>
<!-- 모두 업데이트 성공 -->
<c:if test="${result > 0}">
	<c:if test="${ remake == null}">
		<c:redirect url="scheduleMain.do"></c:redirect>
	</c:if>
	<c:if test="${ remake != null}">
		<c:redirect url="scheduleInsertList.do?remake=${remake}&today_achieve=${today_achieve}&today_level=${today_level}"></c:redirect>
	</c:if>
</c:if>