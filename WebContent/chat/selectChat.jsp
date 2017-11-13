<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	fieldset { 
    margin-left: 2px;
    margin-right: 2px;
    padding-top: 0.35em;
    padding-bottom: 0.625em;
    padding-left: 0.75em;
    padding-right: 0.75em;
    border: 2px groove;
    border-color: #368AFF;
	}
</style>	
<c:forEach var="chat" items="${chat}">
	<c:if test="${sessionScope.memId!=null}">
		<c:if test="${chat.fromtext=='user'}">
		<div align="right">${chat.text}</div>
		</c:if>
		<c:if test="${chat.fromtext!='user'}">
		<div align="left">${chat.text}</div>
		</c:if>
	</c:if>
	<c:if test="${sessionScope.memId==null}">
		<c:if test="${chat.fromtext=='manager'}">
		<div align="right">${chat.text}</div>
		</c:if>
		<c:if test="${chat.fromtext!='manager'}">
		<div align="left">${chat.text}</div>
		</c:if>
	</c:if>
</c:forEach>