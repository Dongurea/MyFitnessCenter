<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>
	<body onload="emailfocus()">
		<form method="post" action="memberConfirmEmail.do" name="emailform" onsubmit="return emailcheck()">
			<table class="confirmtable">
				<tr>
					<th class="smallmsg">
						<c:if test="${code==null||getcode==null||code!=getcode}">이메일로 받은 코드를 입력하세요.<br></c:if>
						<c:if test="${code==null||getcode==null||code==''||getcode==''}">
							<span>인증 대기중</span>
						</c:if>
						<c:if test="${code==getcode}">
							<span style="color:blue;">인증 완료</span>
							 <script type="text/javascript">
							//<!--
								setTimeout(function(){window.close()}, 1500);
							//-->
							</script>
						</c:if>
						<c:if test="${getcode!=null && getcode!= '' && code!=getcode}">
							<span style="color:red;">입력하신 코드가 틀렸습니다.</span>
						</c:if>
					</th>
				</tr>
				<tr>
					<td align="center"  style="padding:5px 7px 5px 7px">
						<input type="text" id="getcode" name="getcode" class="form-control" placeholder="인증번호" >
						<c:if test="${code!=null && code!=''}">
							<input type="hidden" id="code" name="code" value="${code}">
						</c:if>
						<c:if test="${code==null || code==''}">
							<input type="hidden" name="code">
						</c:if>
					</td>
				</tr>
				<tr>
					<td align="center"  style="padding:5px 7px 5px 7px">
						<c:if test="${code==null||getcode==null||code!=getcode}"><input class="btn btn-default" style="background:#CCFF00;" type="button" value="${btn_ok }" onclick="emailcheck()"></c:if>
					</td>
				</tr>
			</table>
		</form>
	</body>