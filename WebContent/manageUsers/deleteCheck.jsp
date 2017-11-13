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

<c:if test="${result == 1}">
	<body onload="confirmfocus()">
			<table>
				<tr>
					<td>
					아이디가 삭제되었습니다.
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit"
							value="확인" onclick="closeConfirm()"> 
					</th>
				</tr>
			</table>
	</body>
</c:if>
<c:if test="${result != 1}">			
	<body onload="confirmfocus()">
		<form method="post" action="deletePro.do?del_id=${del_id}"name="confirmform"
			onsubmit="return confirmcheck()">
			<input type="hidden" value="${del_id}">
			<table>
		<tr>
			<td align="center">
				<span>${del_id}</span><br>
				아이디를 삭제 하시겠습니까?
			</td>
		</tr>
		<tr>
			<td>
				<hr>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit"
					value="확인" >
				<input class="inputbutton" type="button"
					value="취소" onclick="window.close()">		
			</th>
		</tr>
	</table>
	</form>
	</body>
</c:if>