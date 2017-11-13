<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="nav.css" rel="stylesheet" type="text/css">
	<!-- datepicker -->
	<script src="${project }bootstrap-datepicker/bootstrap-datepicker.js"></script>
	<script src="${project }bootstrap-datepicker/locales/bootstrap-datepicker.kr.js"></script>
	<link rel="stylesheet" href="${project }bootstrap-datepicker/datepicker3.css">	
	<!-- sweetalert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<!-- d3js -->
	<script src="//d3js.org/d3.v3.min.js"></script>
	<title>${page_title}</title>
</head>

<script src="${project}managerchat.js"></script>

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
   .dropdown-menu{
       background-color:rgb(0,0,0);

   
   }
   
      span{
        
      color: white;
   }
   .badge{
      color: skyblue;
   }


    /**********/

          ul#navWrapper ul {
    	  display: none;
    	 background-color: #555;
    	}
    ul#navWrapper li:hover ul {
    	  display: block;
    	 background-color: #555;
    	}
      
    }
</style>	


<c:if test="${param.managerSche==null }">
	<link href="${project}main_style.css" rel="stylesheet" type="text/css">
</c:if>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="mfcMain.do"><img src="/MBEx/img/main/mark.png"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
  	  <c:if test="${param.manager_id != null}">
	      <ul class="nav navbar-nav"  id="navWrapper" >
	      	<!-- class="active" 는 현재 활성화 된 페이지를 말함 -->
	         <li ><a href="specList.do" class="dropdown-menu">회원관리 <span class="badge">${msgAll}</span></a>
		        <ul >
					   <c:if test="${msgNewMem != 0}"><li><a onclick="document.getElementById('contact1').style.display='block'"><span>새로 가입한 회원&nbsp;&nbsp;<span class="badge">${msgNewMem}</span></span></a></li></c:if>
					   <c:if test="${msgSeven != 0}"><li><a onclick="document.getElementById('contact2').style.display='block'"><span>만기 7일이하 회원&nbsp;&nbsp;<span class="badge">${msgSeven}</span></span></a></li></c:if>
						<c:if test="${msgExpire != 0}"><li><a onclick="document.getElementById('contact3').style.display='block"><span>회원권  만기 회원&nbsp;&nbsp;<span class="badge">${msgExpire}</span></span></a></li></c:if>
			     </ul>
			     </li>
	        <li><a href="${projectPage}clsBoardList.do">프로그램 관리</a></li>
	        <li><a href="boardList.do">게시판관리</a></li>
	        <li><a href="workoutList.do">운동관리</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="${projectPage}memberLogout.do"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;${page_logout}</a></li>
	      </ul>
      </c:if>
    </div>
  </div>
</nav>

<div id="contact" class="w3-modal">
 	<div class="w3-modal-content w3-animate-zoom">  
    	<span onclick="closeChat()" class="w3-button w3-display-topright w3-large">x</span>
    	<br>
   		<div class="w3-container">
      		<form name="chatform" id="chat" class="form-horizontal" action="/action_page.php" target="_blank">
      		<input type="hidden" name="chatCheck" id="chatCheck" value="0"/>
    		<input type="hidden" name="chatroomnum" id="chatroomnum" />
      		</form>
   		</div>
 	</div>
</div>