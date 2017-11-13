<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<h2> ${page_modify} </h2>

<c:if test="${result == 1}">
		<body onload="modifyfocus()">
			<form method="post" action="memberModifyPro.do" name="modifyform"
				onsubmit="return modifycheck()">					
				<table>
					<tr>
						<th colspan="2"> ${msg_modify} </th>						
					</tr>
					<tr>
						<th> ${str_id} </th>
						<td> &nbsp;&nbsp;${memberDto.user_id} </td>
					</tr>
					<tr>
						<th rowspan="2"> ${str_passwd} </th>
						<td>
							<input class="input" type="password" name="passwd"
								maxlength="15" value="${memberDto.passwd}">							
						</td>
					</tr>
					<tr>
						<td>
							<input class="input" type="password" name="repasswd"
								maxlength="15" value="${memberDto.passwd}">
						</td>		
					</tr>
					<tr>
						<th> ${str_name} </th>
						<td> &nbsp;&nbsp;${memberDto.name} </td>
					</tr>
					<tr>
						<th> ${str_tel} </th>
						<td>
							<c:if test="${memberDto.tel == null}">
								<input style="width: 25px" class="input" type="text" name="tel1" 
									maxlength="3">
								- <input style="width: 30px" class="input" type="text" name="tel2" 
									maxlength="4">
								- <input style="width: 30px" class="input" type="text" name="tel3" 
									maxlength="4">
							</c:if>
							<c:if test="${memberDto.tel != null}">
								<c:set var="t" value="${fn:split( memberDto.tel, '-' )}"/>
								<input style="width: 25px" class="input" type="text" name="tel1" 
									maxlength="3" value="${t[0]}">
								- <input style="width: 30px" class="input" type="text" name="tel2" 
									maxlength="4" value="${t[1]}">
								- <input style="width: 30px" class="input" type="text" name="tel3" 
									maxlength="4" value="${t[2]}">
							</c:if>	
						</td>	
					</tr>	
					<tr>
						<th> ${str_email} </th>
						<td>
							<c:if test="${memberDto.email == null}">
								<input style="width: 100px" class="input" type="text" 
									name="email1" maxlength="15">
								@	
								<input style="width: 100px" class="input" type="text" 
									name="email2" maxlength="15"> 	
							</c:if>
							<c:if test="${memberDto.email != null}">
								<c:set var="e" value="${fn:split( memberDto.email, '@' )}"/>							
								<input style="width: 100px" class="input" type="text" 
									name="email1" maxlength="15" value="${e[0]}">
								@	
								<input style="width: 100px" class="input" type="text" 
									name="email2" maxlength="15" value="${e[1]}"> 	
							</c:if>	
						</td>
					</tr>
					<tr>
						<th> ${str_reg_date} </th>
						<td>
							<fmt:formatDate type="both" value="${memberDto.reg_date}"
								pattern="yyyy-MM-dd HH:mm"/>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input class="inputbutton" type="submit" value="${btn_mod}">
							<input class="inputbutton" type="reset" value="${btn_cancel}">
							<input class="inputbutton" type="button" value="${btn_mod_cancel}"
								onclick="location='memberMain.do'">
						</th>
					</tr>				
				</table>
			</form>		
		</body>		
</c:if>		
<c:if test="${result != 1}">
	<script type="text/javascript">
		<!--
		erroralert( passwdnoerror );
		//-->
	</script>
</c:if>










