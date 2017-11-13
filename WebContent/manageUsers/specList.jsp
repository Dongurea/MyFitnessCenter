<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<style>
.pagein > a{
 margin:5px;
 border-radius:0px;
 color: white;
}
.pagein > b{
 margin:5px;
 color: #CCFF00;
 border-radius:0px;
}
.pagein > a:hover{
 margin:5px;
 color:#CCFF00;
 text-decoration:none;
 border-radius:0px;
}
</style>
  <script type="text/javascript">

	$(document).ready(function() {
		var panels = new Array();
		<c:forEach items="${userNewMem}" var="userNewMem">
		panels.push("#${userNewMem.user_id}info");
		</c:forEach>
		<c:forEach items="${userSeven}" var="userSevenMem">
		panels.push("#${userSevenMem.user_id}info");
		</c:forEach>
		
		<c:forEach items="${userExpire}" var="userExpireMem">
		panels.push("#${userExpireMem.user_id}info");
		
		</c:forEach>
		
		
		
		var panel;
		
		for(var i=0;i<panels.length;i++){
			panel=$(panels[i]);
			panel.hide();
		}

	    var panelsButton = $('.dropdown-user');

	    //Click dropdown
	    panelsButton.click(function() {
	        //get data-for attribute
	        var dataFor = $(this).attr('data-for');
	        var idFor = $(dataFor);
	
	        //current button
	        var currentButton = $(this);
	        idFor.slideToggle(400, function() {
	            //Completed slidetoggle
	            if(idFor.is(':visible'))
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
	            }
	            else
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
	            }
	        });
	    });
	    $('[data-toggle="tooltip"]').tooltip();
	});

  
  function deleteCheck() {
	  var checkboxValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var id_values="";
		var checked =0;
		for(i=0; i <chk_obj.length; i++){
			if(chk_obj[i].checked==true){
				checked +=1;
				id_values  +=chk_obj[i].value+",";
			}
		}
		id_values = id_values.slice(0,-1);
		id_values +="\n아이디를 삭제 하시겠습니까?";
				
		if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "삭제하려는 아이디를 선택해주세요." );
		} else {
		 	  var check = confirm(id_values);
	    	  if(check) {
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "http://localhost:8080/MFC/specList.do?checkboxValues="+checkboxValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	    		  alert("아이디가 삭제되었습니다.");
	    	  }
	    	  else{alert("삭제를 취소 하였습니다.");}
	}
}


  function addMonth() {

	  var addMonIdValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	    	addMonIdValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var chk_month=document.getElementById("month");
		if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "회원권 추가하려는 아이디를 선택해주세요." );
			return false;
		} else {
  		  $.ajax({
		      type: 'POST',
		      url: "http://localhost:8080/MFC/specList.do?addMonIdValues="+addMonIdValues+"&month="+chk_month.value,
		      //data:  { "checkboxValues": checkboxValues},
		      success: function(response){
		    	  location.href = location.href;
		      }  
		   });
		  alert("정상적으로 등록되었습니다.");
		}
  }
  function signMem() {
	  var signMemValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	    	signMemValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var id_values="";
	  if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "회원권 등록하려는 아이디를 선택해주세요." );
		} else {
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?signMemValues="+signMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	    		  alert("회원권 등록이 정상적으로 성공 하였습니다.");
	}
}
	  
	  
  function cancelMem() {
	  var cancelMemValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	    	cancelMemValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var id_values="";
	  if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "회원권 등록하려는 아이디를 선택해주세요." );
		} else {
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?cancelMemValues="+cancelMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	    		  alert("회원권이 취소 되었습니다.");
	}
		}
  
  

  function delNewMem(user_id) {
	  var delNewMemValues = new Array();
  	delNewMemValues.push(user_id);
  		  $.ajax({
  		      type: 'POST',
  		      url: "/MFC/specList.do?delNewMemValues="+delNewMemValues,
  		      //data:  { "checkboxValues": checkboxValues},
  		      success: function(response){
  		    	  location.href = location.href;
    		    	document.getElementById('contact1').style.display;
  		      }  
  		   });
}
  
		
  
  function delSevenMem(user_id) {
	  var delSevenMemValues = new Array();
	    	delSevenMemValues.push(user_id);
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?delSevenMemValues="+delSevenMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	
		}
  function delExpireMem(user_id) {
	  var delExpireMemValues = new Array();
	  delExpireMemValues.push(user_id);
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?delExpireMemValues="+delExpireMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
		}  
  
    
	function myFunction(){
		var input, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		for(i=0; i<input.length; i++){
			if (input[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
				input[i].style.display = "";
	        } else {
	        	input[i].style.display = "none";
	        }
		} 
		   if(input.value != '' ){
	           $.ajaxSettings.traditional = true;
	           $.ajax({
	              type: 'POST',
	              url: "/MFC/specListFilter.do",
	              data:  {"name" : input.value},
	              success: function(response){
	                 $("#specTable").html(response);
	              }
	           });
		   }else{
	           $.ajaxSettings.traditional = true;
	           $.ajax({
	              type: 'POST',
	              url: "/MFC/specListFilter.do",
	              data:  {"name" : input.value},
	              success: function(response){
	                 $("#specTable").html(response);
	              }
	           });
			   
		   }
	}
	
  </script>
  
	<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script> 
	<script type="text/javascript"> 

	
	$(function(){ 
		 $("#allCheck").click(function(){ 
			  if($("#allCheck").prop("checked")) {
				 $("input[type=checkbox]").prop("checked",true); 
				 } else {
					 $("input[type=checkbox]").prop("checked",false); } }) }) 
					 
	</script>
	<script type="text/javascript"> $(function(){ 
		 $("#allNewMem").click(function(){ 
			  if($("#allNewMem").prop("checked")) {
				 $("input[name='newMem']").prop("checked",true); 
				 } else {
					 $("input[name='newMem']").prop("checked",false); } }) }) 
	</script>
	<script type="text/javascript"> $(function(){ 
		 $("#allSevenMem").click(function(){ 
			  if($("#allSevenMem").prop("checked")) {
				 $("input[name='sevenMem']").prop("checked",true); 
				 } else {
					 $("input[name='sevenMem']").prop("checked",false); } }) }) 
	</script>
	<script type="text/javascript"> $(function(){ 
		 $("#allExpireMem").click(function(){ 
			  if($("#allExpireMem").prop("checked")) {
				 $("input[name='expireMem']").prop("checked",true); 
				 } else {
					 $("input[name='expireMem']").prop("checked",false); } }) }) 
	</script>	  
		 
	


  
  <script src = "/MFC/manageUsers/module.js"></script>

     <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
	#cssmenu {
  padding: 0;
  margin: 0;
  border: 0;
  line-height: 1;
}
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
#cssmenu ul {
  position: relative;
  z-index: 597;
  float: left;
}
#cssmenu ul li {
  float: left;
  min-height: 1px;
  line-height: 1em;
  vertical-align: middle;
  position: relative;
}
#cssmenu ul li.hover,
#cssmenu ul li:hover {
  position: relative;
  z-index: 599;
  cursor: default;
}
#cssmenu ul ul {
  visibility: hidden;
  position: absolute;
  top: 100%;
  left: 0px;
  z-index: 598;
  width: 100%;
}
#cssmenu ul ul li {
  float: none;
}
#cssmenu ul ul ul {
  top: -2px;
  right: 0;
}
#cssmenu ul li:hover > ul {
  visibility: visible;
}
#cssmenu ul ul {
  top: 1px;
  left: 99%;
}
#cssmenu ul li {
  float: none;
}
#cssmenu ul ul {
  margin-top: 1px;
}
#cssmenu ul ul li {
  font-weight: normal;
}
/* Custom CSS Styles */
#cssmenu {
  width: 200px;
  background: #333333;
  font-family: 'Oxygen Mono', Tahoma, Arial, sans-serif;
  zoom: 1;
  font-size: 12px;
}
#cssmenu:before {
  content: '';
  display: block;
}
#cssmenu:after {
  content: '';
  display: table;
  clear: both;
}
#cssmenu a {
  display: block;
  padding: 15px 20px;
  color: #ffffff;
  text-decoration: none;
  text-transform: uppercase;
}
#cssmenu > ul {
  width: 200px;
}
#cssmenu ul ul {
  width: 200px;
}
#cssmenu > ul > li > a {
  border-right: 4px solid #1b9bff;
  color: #ffffff;
}
#cssmenu > ul > li > a:hover {
  color: #ffffff;
}
#cssmenu > ul > li.active a {
  background: #1b9bff;
}
#cssmenu > ul > li a:hover,
#cssmenu > ul > li:hover a {
  background: #1b9bff;
}
#cssmenu li {
  position: relative;
}
#cssmenu ul li.has-sub > a:after {
  content: '+';
  position: absolute;
  top: 50%;
  right: 15px;
  margin-top: -6px;
}
#cssmenu ul ul li.first {
  -webkit-border-radius: 0 3px 0 0;
  -moz-border-radius: 0 3px 0 0;
  border-radius: 0 3px 0 0;
}
#cssmenu ul ul li.last {
  -webkit-border-radius: 0 0 3px 0;
  -moz-border-radius: 0 0 3px 0;
  border-radius: 0 0 3px 0;
  border-bottom: 0;
}
#cssmenu ul ul {
  -webkit-border-radius: 0 3px 3px 0;
  -moz-border-radius: 0 3px 3px 0;
  border-radius: 0 3px 3px 0;
}
#cssmenu ul ul {
  border: 1px solid #0082e7;
}
#cssmenu ul ul a {
  font-size: 12px;
  color: #ffffff;
}
#cssmenu ul ul a:hover {
  color: #ffffff;
}
#cssmenu ul ul li {
  border-bottom: 1px solid #0082e7;
}
#cssmenu ul ul li:hover > a {
  background: #4eb1ff;
  color: #ffffff;
}
#cssmenu.align-right > ul > li > a {
  border-left: 4px solid #1b9bff;
  border-right: none;
}
#cssmenu.align-right {
  float: right;
}
#cssmenu.align-right li {
  text-align: right;
}
#cssmenu.align-right ul li.has-sub > a:before {
  content: '+';
  position: absolute;
  top: 50%;
  left: 15px;
  margin-top: -6px;
}
#cssmenu.align-right ul li.has-sub > a:after {
  content: none;
}
#cssmenu.align-right ul ul {
  visibility: hidden;
  position: absolute;
  top: 0;
  left: -100%;
  z-index: 598;
  width: 100%;
}
#cssmenu.align-right ul ul li.first {
  -webkit-border-radius: 3px 0 0 0;
  -moz-border-radius: 3px 0 0 0;
  border-radius: 3px 0 0 0;
}
#cssmenu.align-right ul ul li.last {
  -webkit-border-radius: 0 0 0 3px;
  -moz-border-radius: 0 0 0 3px;
  border-radius: 0 0 0 3px;
}
#cssmenu.align-right ul ul {
  -webkit-border-radius: 3px 0 0 3px;
  -moz-border-radius: 3px 0 0 3px;
  border-radius: 3px 0 0 3px;
}
	.textcenter{
		margin: auto;
		margin-right: auto;
		margin-left: auto;
	}

    /* scrolling */
    .scrolling_list {
    height: 250px;
    width: 150px;
    overflow: hidden;
}


.scrolling_list:hover {
    overflow: auto;
}
 input.btn_delete {
        background: url(bin.png) no-repeat;
        border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
      }
  </style>

</head>
<body>

<jsp:include page="${part_top_manager}">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
</jsp:include>
<!--  
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">MyFitnessCenter</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav dropdown">
	        <li data-toggle="dropdown"><a href="specList.do">회원관리 <span class="badge">${msgAll}</span></a></li>
	        <ul class="dropdown-menu">
				   <c:if test="${msgNewMem != 0}"><li><a onclick="document.getElementById('contact1').style.display='block'"><span>새로 가입한 회원&nbsp;&nbsp;<span class="badge">${msgNewMem}</span></span></a></li></c:if>
				   <c:if test="${msgSeven != 0}"><li><a onclick="document.getElementById('contact2').style.display='block'"><span>만기 7일이하 회원&nbsp;&nbsp;<span class="badge">${msgSeven}</span></span></a></li></c:if>
					<c:if test="${msgExpire != 0}"><li><a onclick="document.getElementById('contact3').style.display='block"><span>회원권  만기 회원&nbsp;&nbsp;<span class="badge">${msgExpire}</span></span></a></li></c:if>
		     </ul>
        <li><a href="#">그룹운동관리</a></li>
        <li><a href="#">프로그램관리</a></li>
		<li><a href="boardList.do">게시판관리</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
-->
<br>
<br>



<div class="container">   
	<div align="right" >
		<!-- <button type="button" onclick="modifyCheck()" class="btn btn-default">수정</button>-->
				<button type="button" class="btn btn-default" onclick="signMem()">회원권 등록</button>
		<button type="button" class="btn btn-default" onclick="cancelMem()">회원권 취소</button>		
		<button type="button" class="btn btn-default" onclick="deleteCheck()">회원 삭제</button>
	</div>
	<br>
	
	<div align="left" style="color:black;">
		<h5 style="color:white;">선택한 회원 연장 : 
		<select style="width:20%; height:5%; color:black;" name="month" id="month" >
		  <option value="1" style="color:black;">1개월</option>
		  <option value="2" style="color:black;">2개월</option>
		  <option value="3" style="color:black;">3개월</option>
		  <option value="4" style="color:black;">4개월</option>
		</select>
		<button type="button" class="btn btn-default" onclick="addMonth()">회원권 연장</button>
		</h5>
	</div>
	<br>
	<div align="right">
		<span class="glyphicon glyphicon-search" style="color:white;"></span>
		<input type="text" placeholder="Search for names.."  id="myInput" onkeyup="myFunction()" >
	</div>
	  </div>
	  
	  <!-- user spec data output -->
	  <div class="container" id="specTable">     
<form id="specForm">
  <table class="table table-bordered" style="color:white;">
      <tr>
		<th><input type="checkbox" id="allCheck" /></th>  
        <th>아이디</th>
        <th>이름</th>
        <th>성별</th>
		<th>나이</th>
		<th>E-mail</th>
		<th>몸무게</th>
		<th>키</th>
		<th>등록일</th>
		<th>만기일</th>
		<th>스케쥴관리</th>
      </tr>
    <tbody style="background:white;color:black;">
    	<c:if test="${count == 0}">
		<tr>
			<td colspan="6" align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
    	<c:if test="${count != 0}">
    		<c:forEach var="spec" items="${specs}"> 
      <tr>
	    <td> <input type="checkbox"  id="userCheck" name="userCheck" value="${spec.user_id}"></td>
        <td data-column="아이디">${spec.user_id}</td>
        <td data-column="이름">${spec.name}</td>
    	<td data-column="성별"><c:if test="${spec.gender == 1}">남자</c:if><c:if test="${spec.gender == 2}">여자</c:if> <c:if test="${spec.gender == 0}">미입력</c:if></td>
		<td data-column="나이"><c:if test="${spec.age != 0}">${spec.age}</c:if> <c:if test="${spec.age == 0}">미입력</c:if></td>
        <td data-column="E-mail"><c:if test="${spec.email != '0'}">${spec.email}</c:if> <c:if test="${spec.email == '0'}">미입력</c:if></td>
		<td data-column="몸무게"><c:if test="${spec.weight != 0}">${spec.weight}</c:if> <c:if test="${spec.weight == 0}">미입력</c:if></td>
		<td data-column="키"><c:if test="${spec.height != 0}">${spec.height}</c:if> <c:if test="${spec.height == 0}">미입력</c:if></td>
		<td data-column="등록일"  id="reg_date" ><c:if test="${spec.reg_date !=null}">${spec.reg_date}</c:if> <c:if test="${spec.reg_date==null}">미입력</c:if>	
		<td data-column="만기일" id="expire_date" ><c:if test="${spec.expire_date !=null}">${spec.expire_date}</c:if> <c:if test="${spec.expire_date==null}">미입력</c:if>
		</td>
		<td data-column="스케쥴관리" align="center">
			<button type="button" class="btn btn-primary" 
			onclick="location='managerSche.do?user_id=${spec.user_id }&num=${boardDto.num}&pageNum=${pageNum}&number=${number+1}'">스케쥴관리</button>
		</td>
      </tr>
      		</c:forEach>
      			</c:if>
    </tbody>
  </table>
  </form>
	  <div align="center" class="pagein">
		  <c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
					<a href="specList.do" class="pagination">◀◀</a>
					<a href="specList.do?pageNum=${startPage-pageBlock}" class="pagination">◀</a>
				</c:if>
		  	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		  		<c:if test="${i == currentPage}">	
		  			<b class="pagination">${i}</b>	
		  		</c:if>
				<c:if test="${i != currentPage}">
					<a href="specList.do?pageNum=${i}" class="pagination">${i}</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">		
				<a href="specList.do?pageNum=${startPage+pageBlock}" class="pagination">▶</a>
				<a href="specList.do?pageNum=${pageCount}" class="pagination">▶▶</a>
			</c:if>	
		</c:if>
		</div>
				</div>
<!-- 알림창 -->
<div id="contact1" class="w3-modal" >
  <div class="w3-modal-content w3-animate-zoom" style="width:650px;">  
      <span onclick="document.getElementById('contact1').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
    <div class="w3-container">
     <form class="form-horizontal" action="/action_page.php" target="_blank">
        <br><br>
                <!-- 새로 가입한 회원 알림-->
     <c:forEach var="userNewMem" items="${userNewMem}"> 
   			<div class="row user-row" >
            <div class="col-md-1">
                <img class="img-circle"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                     alt="User Pic">
            </div>
            <div class="col-md-10">
                <strong>${userNewMem.user_id}</strong><br>
                <span class="text-muted">${userNewMem.name}</span>
            </div>
            <!-- add .rowname class to attribute data-for (Dropdown!)-->
            <div id="dropdown" class="col-md-1 dropdown-user" data-for=".${userNewMem.user_id}">
                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
            </div>
        </div>
        <!-- Add data-for class to this row -->
        <div id="${userNewMem.user_id}info" class="row user-infos ${userNewMem.user_id}" >
            <div class="col-sm-10 col-md-10 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">${userNewMem.user_id}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
                                     alt="User Pic">
                            </div>
                            <div class="col-md-9">
                                <strong>${userNewMem.user_id}</strong><br>
                                <table class="table table-condensed table-responsive table-user-information">
                                    <tbody style="font-family: 'Oxygen Mono', Tahoma, Arial, sans-serif;">
                                    <tr>
                                        <td>이름</td>
                                        <td>${userNewMem.name}</td>
                                    </tr>
                                    <tr>
                                        <td>등록일</td>
                                        <td><c:if test="${userNewMem.reg_date !=null}">${userNewMem.reg_date}</c:if> <c:if test="${userNewMem.reg_date==null}">미입력</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>만기날짜</td>
                                        <td><c:if test="${userNewMem.expire_date !=null}">${userNewMem.expire_date}</c:if> <c:if test="${userNewMem.expire_date==null}">미입력</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>전화번호</td>
                                        <td><c:if test="${userNewMem.tel !=null}">${userNewMem.tel}</c:if> <c:if test="${userNewMem.tel==null}">미입력</c:if></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                              <div  class="pull-right" >
                            <button class="btn btn-sm btn-danger" type="button"
                            onclick="delNewMem('${userNewMem.user_id}')"
                                    data-toggle="tooltip"
                                    data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
                   			 </div>
                    </div>
                </div>
             </div>
           </div>
           <hr>
           </c:forEach> 
      </form>
    </div>
  </div>
</div>


<div id="contact2" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="min-width:650px;">  
      <span onclick="document.getElementById('contact2').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
    <div class="w3-container" >
     <form class="form-horizontal" action="/action_page.php" target="_blank">
        <br><br>
     <c:forEach var="userSevenMem" items="${userSeven}"> 
   			<div class="row user-row" >
            <div class="col-md-1">
                <img class="img-circle"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                     alt="User Pic">
            </div>
            <div class="col-md-10">
                <strong>${userSevenMem.user_id}</strong><br>
                <span class="text-muted">${userSevenMem.name}</span>
            </div>
            <!-- add .rowname class to attribute data-for (Dropdown!)-->
            <div id="dropdown" class="col-md-1 dropdown-user" data-for=".${userSevenMem.user_id}">
                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
            </div>
        </div>
        <!-- Add data-for class to this row -->
        <div id="${userSevenMem.user_id}info" class="row user-infos ${userSevenMem.user_id}" >
            <div class="col-sm-10 col-md-10 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">${userSevenMem.user_id}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
                                     alt="User Pic">
                            </div>
                            <div class="col-md-9">
                                <strong>${userSevenMem.user_id}</strong><br>
                                <table class="table table-condensed table-responsive table-user-information">
                                    <tbody style="font-family: 'Oxygen Mono', Tahoma, Arial, sans-serif;">
                                    <tr>
                                        <td>이름</td>
                                        <td>${userSevenMem.name}</td>
                                    </tr>
                                    <tr>
                                        <td>등록일</td>
                                        <td><c:if test="${userSevenMem.reg_date !=null}">${userSevenMem.reg_date}</c:if> <c:if test="${userSevenMem.reg_date==null}">미입력</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>만기날짜</td>
                                        <td><c:if test="${userSevenMem.expire_date !=null}">${userSevenMem.expire_date}</c:if> <c:if test="${userSevenMem.expire_date==null}">미입력</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>전화번호</td>
                                        <td><c:if test="${userSevenMem.tel !=null}">${userSevenMem.tel}</c:if> <c:if test="${userSevenMem.tel==null}">미입력</c:if></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                              <div  class="pull-right" >
                            <button class="btn btn-sm btn-danger" type="button"
                            onclick="delSevenMem('${userSevenMem.user_id}')"
                                    data-toggle="tooltip"
                                    data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
                   			 </div>
                    </div>
                </div>
             </div>
           </div>
           <hr>
           </c:forEach> 
      </form>
    </div>
  </div>
</div>


<div id="contact3" class="w3-modal">
  <div class="w3-modal-content w3-animate-zoom" style="width:650px;">  
      <span onclick="document.getElementById('contact3').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
    <div class="w3-container">
     <form class="form-horizontal" action="/action_page.php" target="_blank">
        <br><br>
     <c:forEach var="userExpireMem" items="${userExpire}"> 
   			<div class="row user-row" >
            <div class="col-md-1">
                <img class="img-circle"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                     alt="User Pic">
            </div>
            <div class="col-md-10">
                <strong>${userExpireMem.user_id}</strong><br>
                <span class="text-muted">${userExpireMem.name}</span>
            </div>
            <!-- add .rowname class to attribute data-for (Dropdown!)-->
            <div id="dropdown" class="col-md-1 dropdown-user" data-for=".${userExpireMem.user_id}">
                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
            </div>
        </div>
        <!-- Add data-for class to this row -->
        <div id="${userExpireMem.user_id}info" class="row user-infos ${userExpireMem.user_id}" >
            <div class="col-sm-10 col-md-10 col-md-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">${userExpireMem.user_id}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
                                     alt="User Pic">
                            </div>
                            <div class="col-md-9">
                                <strong>${userExpireMem.user_id}</strong><br>
                                <table class="table table-condensed table-responsive table-user-information">
                                    <tbody style="font-family: 'Oxygen Mono', Tahoma, Arial, sans-serif;">
                                    <tr>
                                        <td>이름</td>
                                        <td>${userExpireMem.name}</td>
                                    </tr>
                                    <tr>
                                        <td>등록일</td>
                                        <td><c:if test="${userExpireMem.reg_date !=null}">${userExpireMem.reg_date}</c:if> <c:if test="${userExpireMem.reg_date==null}">미입력</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>만기날짜</td>
                                        <td><c:if test="${userExpireMem.expire_date !=null}">${userExpireMem.expire_date}</c:if> <c:if test="${userExpireMem.expire_date==null}">미입력</c:if></td>
                                    </tr>
                                    <tr>
                                        <td>전화번호</td>
                                        <td><c:if test="${userExpireMem.tel !=null}">${userExpireMem.tel}</c:if> <c:if test="${userExpireMem.tel==null}">미입력</c:if></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                              <div  class="pull-right" >
                            <button class="btn btn-sm btn-danger" type="button"
                            onclick="delExpireMem('${userExpireMem.user_id}')"
                                    data-toggle="tooltip"
                                    data-original-title="Remove this user"><i class="glyphicon glyphicon-remove"></i></button>
                   			 </div>
                    </div>
                </div>
             </div>
           </div>
           <hr>
           </c:forEach> 
      </form>
    </div>
  </div>
</div>


</body>
</html>
