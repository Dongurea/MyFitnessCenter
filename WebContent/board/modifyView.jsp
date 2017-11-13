<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<h2> ${page_modify} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( repasswderror );
		//-->
	</script>
</c:if>		
<c:if test="${result != 0}">
	<body onload="modifyfocus()">
		<form method="post" action="boardModifyPro.do"
			name="modifyform" onsubmit="return modifycheck()">
			
			<input type="hidden" name="num" value="${num}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			
			<table>
				<tr>
					<th colspan="2"> ${msg_modify} </th>
				</tr>
				<tr>
					<th> ${str_writer} </th>
					<td> ${boardDto.writer} </td>
				</tr>
				<tr>
					<th> ${str_email} </th>
					<td>
						<c:if test="${boardDto.email == null}">
							<input class="input" type="text" name="email"
								maxlength="30">
						</c:if>		
						<c:if test="${boardDto.email != null}">
							<input class="input" type="text" name="email"
								maxlength="30" value="${boardDto.email}">
						</c:if>							
					</td>
				</tr>
				<tr>
					<th> ${str_subject} </th>
					<td>
						<input style="width: 287px" class="input" type="text" name="subject"
							maxlength="50" value="${boardDto.subject}">
					</td>
				</tr>
				<tr>
					<th> ${str_content} </th>
					<td>
						<textarea name="content" rows="10" cols="38">${boardDto.content}</textarea>
					</td>	
				</tr>
				<tr>
					<th> ${str_passwd} </th>
					<td>
						<input class="input" type="password" name="passwd" 
							maxlength="12" value="${boardDto.passwd}">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_mod}">
						<input class="inputbutton" type="reset" value="${btn_cancel}">
						<input class="inputbutton" type="button" value="${btn_mod_cancel}"
							onclick="location='boardList.do?pageNum=${pageNum}'">
					</th>
				</tr>				
			</table>			
		</form>		
	</body>		
</c:if>























