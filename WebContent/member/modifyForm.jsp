<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<h2> ${page_modify} </h2>

<body onload="passwdfocus()">
	<form method="post" action="memberModifyView.do" name="passwdform"
		onsubmit="return passwdcheck()">
		<table>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength="15">
				</td>
			</tr>		
			<tr>
				<td colspan="2">
					<input class="inputbutton" type="submit" value="${btn_mod}">
					<input class="inputbutton" type="button" value="${btn_mod_cancel}"
						onclick="location='mfcMain.do'">
				</td>
			</tr>
		</table>	
	</form>
</body>


















