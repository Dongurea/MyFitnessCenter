<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


  <script type="text/javascript">
  
  
  
  function closeConfirm() {
	  opener.location.reload();
		self.close();	
	}
  
  </script>
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( "회원님이 스펙을 미입력 하셨습니다." );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">
	<input type="button" value="수정되었습니다" onclick="closeConfirm()">
</c:if>

