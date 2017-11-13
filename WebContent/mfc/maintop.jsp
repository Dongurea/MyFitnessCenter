<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<head>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- datepicker -->
	<script src="${project }bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script src="${project }bootstrap-datepicker/bootstrap-datepicker.kr.js"></script>
	<link rel="stylesheet" href="${project }bootstrap-datepicker/datepicker3.css">	
	<!-- sweetalert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<!-- d3js -->
	<script src="//d3js.org/d3.v3.min.js"></script>
	<title>${page_title}</title>
	<!-- chart.js -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
	<!-- awesome.css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<c:if test="${param.schedule_page==null }">
	<link href="${project}main_style.css" rel="stylesheet" type="text/css">
</c:if>
<style>
	fieldset { 
    margin-left: 2px;
    margin-right: 2px;
    padding-top: 0.35em;
    padding-bottom: 0.625em;
    padding-left: 0.75em;
    padding-right: 0.75em;
    border: 2px groove;
    border-color: #368AFF;
	}
</style>
<style type="text/css">
	.w3-modal{
      z-index:3;
      display:none;
      padding-top:10%;
      position:fixed;
      left:0;
      top:0;
      width:100%;
      height:100%;
      overflow:auto;
      background-color:rgb(0,0,0);
      background-color:rgba(0,0,0,0.4);
   }
   
.w3-modal-content{
      margin:auto;
      background-color:#fff;
      position:relative;
      padding:0;
      outline:0;
      width:400px
   }
</style>	
<script>
function alertSignin(){
	swal({
		  title: "Sign In!",
		  text: "회원가입을 하시면 이용하실 수 있는 서비스입니다.\n회원가입을 하시겠습니까?",
		  showCancelButton: true,
		  confirmButtonText: "Yes, sure why not!",
		  cancelButtonText: "No, I don't want!",
		  imageUrl: './img/main/mark_alert.png'
		},function(isConfirm) {
			  if (isConfirm) {
				  location.href='./memberInputForm.do';
				  }
		});
}
</script>
<script src="${project}userchat.js"></script>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/MFC/"><img src="/MFC/img/main/mark.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
  	  <c:if test="${param.user_id == null}">
	      <ul class="nav navbar-nav">
	      	<!-- class="active" 는 현재 활성화 된 페이지를 말함 -->
	      	<li><a href="${projectPage}mfcIntro.do">${page_about}</a></li>
	        <li><a href="${projectPage}boardNews.do">공지사항</a></li>
	        <li><a onclick="alertSignin()">${page_program}</a></li>
	        <li><a onclick="alertSignin()">${page_diary}</a></li>
	        <li><a href="${projectPage}boardGuide.do">${page_guide}</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li><a onclick="alertSignin()"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;${page_chat}</a></li>
	   		<li><a href="${projectPage}mfcInfodesk.do"><span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;${page_support}</a></li>
	     	<li><a href="${projectPage}memberInputForm.do"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${page_signin}</a></li>
	        <li><a href="${projectPage}memberMain.do"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;${page_login}</a></li>
	      </ul>
      </c:if>
      
      <!-- 회원 로그인했을때~-->
      <c:if test="${param.user_id != null}">
      	<ul class="nav navbar-nav">
	      	<!-- class="active" 는 현재 활성화 된 페이지를 말함 -->
	      	<li><a href="${projectPage}mfcIntro.do">${page_about}</a></li>
	        <li><a href="${projectPage}boardNews.do">공지사항</a></li>
	        <li><a href="${projectPage}clsBoardList.do">${page_program}</a></li>
	        <li><a href="${projectPage}scheduleMain.do">${page_diary}</a></li>
	        <li><a href="${projectPage}boardGuide.do">${page_guide}</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li><a onclick="chatFind()" href="#"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;${page_chat}</a></li>
	   		<li><a href="${projectPage}mfcInfodesk.do"><span class="glyphicon glyphicon-earphone"></span>&nbsp;&nbsp;${page_support}</a></li>
	     	<li><a href="${projectPage}memberMypage.do"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${page_mypage}</a></li>
	        <li><a href="${projectPage}memberLogout.do"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;${page_logout}</a></li>
	      </ul>
      </c:if>
    </div>
  </div>
</nav>

<div id="contact" class="w3-modal">
	<div class="w3-modal-content w3-animate-zoom">  
    	<span onclick="closeChatwindow()" class="w3-button w3-display-topright w3-large">x</span>
      	<br><br>
    	<div class="w3-container">
      	<form id="chat" class="form-horizontal" action="/action_page.php" target="_blank">
      	</form>

    	</div>
	</div>
</div>