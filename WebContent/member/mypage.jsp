<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}styleMypage.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${project}script.js"></script>

	<c:if test="${sessionScope.memId == null}">
		<script type="text/javascript">
			erroralert( "로그인된 회원이 아닙니다." );
		</script>
		<c:redirect url="mfcMain.do"/>
	</c:if>
	<c:if test="${sessionScope.memId != null}">
		<body>
		 	<jsp:include page="${part_top}">
				<jsp:param value="${sessionScope.memId}" name="user_id"/>
			</jsp:include>
			
			<div class="container-fluid text-center mypage-part">    
			  <div class="row content">
			    <div class="col-sm-2 sidenav side-menu">
			   	  <p><a href="${projectPage}memberMypage.do?page=0">${page_mypage_main}</a></p>
			      <p><a href="${projectPage}memberMypage.do?page=1">${page_modify}</a></p>
			      <p><a href="${projectPage}memberMypage.do?page=2">${page_classlist}</a></p>
			      <p><a href="${projectPage}memberMypage.do?page=3">${page_healthdata}</a></p>
			    </div>
			    <div class="col-sm-8 text-left mypage-partmain"> 
			    	<c:if test="${page==null||page==0 }">
			    		<style>
			    		.mypage-part{background-color:black;}
			    		</style>
			    		<c:if test="${expire_date==null }">
			    			<jsp:include page="${part_mypage_main}"></jsp:include>
			    		</c:if>
			    		<c:if test="${expire_date!=null }">
			    			<jsp:include page="${part_mypage_main}">
			    				<jsp:param value="${expire_date }" name="expire_date"/>
			    			</jsp:include>
			    		</c:if>
			    	</c:if>
			    	<c:if test="${page!=null&&page==1 }">
			    		<jsp:include page="${part_mypage_modify}"></jsp:include>
			    	</c:if>
			    	<c:if test="${page!=null&&page==2 }">
			    		<style>
			    		.mypage-part{background-color:#2d2d30;}
			    		.mypage-partmain{background-color:white;}
			    		</style>
			    		<jsp:include page="${part_mypage_list}"></jsp:include>
			    	</c:if>
			    	<c:if test="${page!=null&&page==3 }">
			    		<style>
			    		.mypage-part{background-color:#2d2d30;}
			    		.mypage-partmain{background-color:white;}
			    		</style>
			    		<jsp:include page="${part_mypage_sche}">
			    			<jsp:param value="${ specList }" name="specList"/>
			    			<jsp:param value="${ scheList }" name="scheList"/>
			    			<jsp:param value="${ scheListList }" name="scheListList"/>
			    		</jsp:include>
			    	</c:if>
				</div>
				<div class="col-sm-2 sidenav">
					
			    </div>
			  </div>
			</div>
		</body>	
	</c:if>
<c:if test="${sessionScope.managerId==null}">
<footer class="container-fluid text-center">
 <img src="/MFC/img/main/mark_footer.png">
</footer>
</c:if>
<c:if test="${sessionScope.managerId!=null}">
<footer class="container-fluid text-center" style="background: #2d2d30;">
  <img src="/MFC/img/main/mark_footer.png">
</footer>
</c:if>