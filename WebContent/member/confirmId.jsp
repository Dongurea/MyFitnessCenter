<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}styleMypage.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<c:if test="${result == 1}">
	<body onload="confirmfocus()">
		<form method="post" action="memberConfirmId.do" name="confirmform"
			onsubmit="return confirmcheck()">
			<table>
				<tr>
					<th colspan="2">
						<span>${user_id}</span>${msg_id_x}
					</th>
				</tr>
			</table>
		</form>
	</body>
</c:if>
<c:if test="${result != 1}">			
	<table>
		<tr>
			<td align="center">
				<span>${user_id}</span>${msg_id_o}
			</td>
		</tr>
	</table>
	<script>setid('${user_id}');</script>
</c:if>











