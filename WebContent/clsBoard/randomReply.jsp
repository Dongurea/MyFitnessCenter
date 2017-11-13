<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="reply-text text-right">
        <strong>REVIEWS&nbsp;</strong>
</div>
<c:forEach var="replyDto" items="${replyDto}" varStatus="stat">
	<c:if test="${stat.index  % 2 ==0 }">
		<div class="row reply-text-color">
	</c:if>
	<c:if test="${stat.index  % 2 !=0 }">
		<div class="row reply-text">
	</c:if>
	  <div class="col-sm-4"><span class="glyphicon glyphicon-user"></span>&nbsp;<span class="w3-opacity w3-large">${replyDto.user_id}</span></div>
	  <div class="col-sm-8"><p>${replyDto.text}</p></div>
	</div>
</c:forEach>