<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>
<link href="${project}styleMypage.css" rel="stylesheet" type="text/css">
<c:if test="${sessionScope.memId == null}">
		<script type="text/javascript">
			erroralert( "로그인된 회원이 아닙니다." );
		</script>
		<c:redirect url="mfcMain.do"/>
</c:if>
<c:if test="${expire_date!=null}">

<br>
	     <div style="background-position: center;
					    background-repeat: no-repeat;
					    background-size: cover;
					    border-style: none;
		      			width:100%;height:80%; background-image:url(/MFC/img/mypage/main-mypage.jpg)"
		 class="panel panel-default text-center">
	 	 <br><br><br><br><br><br>
	 	 <div style="color:white;" class="panel-body">
	 	 	 <img src="/MFC/img/main/mark_footer.png">
	    	 <h3>회원권이 <strong>${expire_date }일</strong> 남았습니다.</h3>
	     </div>
     </div>
</c:if>
<c:if test="${expire_date==null}">

<br>
	 <div style="background-position: center;
				    background-repeat: no-repeat;
				    background-size: cover;
				    border-style: none;
	      			width:100%;height:80%; background-image:url(/MFC/img/mypage/main-mypage.jpg)"
	 class="panel panel-default text-center">
	 	 <br><br><br><br><br><br>
	     <div style="color:white;" class="panel-body">
	     	<h3>회원권이 없습니다.<br>지금 <strong>MFC회원</strong>이 되보세요!</h3>
	     	<h5 style="color:#CCCCCC;">MFC is waiting for you</h5>
	     </div>
     </div>
</c:if>