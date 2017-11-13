<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="setting.jsp"%>
<script src="${project}script.js"></script>

<h2> ${page_delete} </h2>


	<c:if test="${result == 0}">	
		<script type="text/javascript" charset="utf-8">
			<!--
			alert( "삭제되지 않았음" );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=clsBoardList.do">
	</c:if>
	<c:if test="${result == 3}">
		<script type="text/javascript" charset="utf-8">
			<!--
			alert( "댓글 삭제되지 않았음" );
			//-->
		</script>			
		<meta http-equiv="refresh" content="0; url=clsBoardList.do">
	</c:if>
	
	<c:if test="${result == 1}">
		<script type="text/javascript" charset="utf-8">
			<!--
			alert( "삭제성공" );
			//-->
		</script>	
		<c:redirect url="clsBoardList.do"/>		
	</c:if>	

