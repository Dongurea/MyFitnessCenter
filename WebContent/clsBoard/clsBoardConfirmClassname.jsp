<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.btn{display:inline-block;
padding:6px 12px;
margin-bottom:0;
font-size:14px;
font-weight:400;
line-height:1.42857143;
text-align:center;
white-space:nowrap;
vertical-align:middle;
-ms-touch-action:manipulation;
touch-action:manipulation;
cursor:pointer;
-webkit-user-select:none;
-moz-user-select:none;
-ms-user-select:none;
user-select:none;
background-image:none;
border:1px solid transparent;
border-radius:0px;
transition: .2s;
}

.btn-spec{
background-color:#333;
color: #fff;
}

/* On hover, the color of .btn will transition to white with black text */
.btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
}
</style>
<body>

	<script src="clsBoard/script.js"></script>
	<div class="w3-container" align="center">
	  <h2>프로그램이름</h2>
	
	<c:if test="${result==1}">	
	<form name="confirmClassnameForm" action="clsBoardConfirmClassname.do" method="POST" onsubmit="return classnameCheck()">
	  <p>${classname}은 이미 있는 프로그램입니다.</p>
	  <input class="w3-input w3-border w3-padding" type="text" name="classname" >
	  <button type="submit" class="btn btn-spec">확인</button>
	  <button type="button" class="btn btn-spec" onclick="window.close()">취소</button>
	</form>
	</c:if> 
	<c:if test="${result!=1}">
		<p>${classname}은 사용할 수 있는 이름입니다.</p>
	  <button type="button" class="btn btn-spec" onclick="setClassname('${classname}')">확인</button>
	  <button type="button" class="btn btn-spec" onclick="window.close()">취소</button>
	</c:if>
	</div>
</body>
</html>