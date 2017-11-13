<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}styleMember.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:if test="${sessionScope.memId == null}">
	<body onload="mainfocus()">
		<div class="row row-form container-fluid">
			<div class="col-sm-4">
			</div>
			<div style="margin-top:15%;" class="col-sm-4 form">
				<br><br><br><br>
				<div class="context block">
					<div class="row-form">
						<form method="post" action="memberLoginPro.do" name="mainform"
							onsubmit="return maincheck()">
							<div class="row form-group">
								<label class="control-label col-sm-4">${str_id} </label>
								<div class="col-sm-8">
									<input type="text" name="user_id" id="user_id" maxlength="15" class="form-control" placeholder="아이디">
								</div>
							</div>
							<div class="row form-group">
								<label class="control-label col-sm-4"> ${str_passwd} </label>
								<div class="col-sm-8">	
									<input type="password" name="passwd" maxlength="15" class="form-control" placeholder="비밀번호">
								</div>
							</div>
							<br>
							<div class="row form-group text-center">
						   	    <div class="col-sm-12">
									<button type="submit" class="btn btn-neon">${btn_login}</button>
									<button type="button" class="btn btn-black" onclick="location='mfcMain.do'">${btn_cancel}</button>
									<button type="button" class="btn btn-black" onclick="location='memberInputForm.do'">${btn_input_member}</button>
								</div>
							</div>
							<br>	
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>	
</c:if>
<c:if test="${sessionScope.memId != null}">		
<script>
location.href='//mfcMain.do';
</script>	
</c:if>

















