<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<h2> ${page_login} </h2>
<body onload="mainfocus()">
	<form method="post" action="aaaaaaa.do" name="mainform"
		onsubmit="return maincheck()">

		
		<table>
			<tr>
				<th colspan="2">
					${msg_loginform}
				</th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td>
					<input class="input" type="text" name="user_id"
						maxlength="15">
				</td>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength="15">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_login}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">					
				</th>
			</tr>
		</table>
	</form>
</body>






















