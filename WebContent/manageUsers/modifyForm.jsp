<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

  
   <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
	  border-color: #CEF279;
    }
    
    body,h1,h5 {font-family: "Raleway", sans-serif}
	body, html {height: 100%}
	.bgimg {
	    background-image: url('/w3images/onepage_restaurant.jpg');
	    min-height: 100%;
	    background-position: center;
	    background-size: cover;
	}

	.textcenter{
		margin: auto;
		margin-right: auto;
		margin-left: auto;
	}

	.navbar-inverse{
		background-color: #CEF279;
	}

	.active-in{
		background-color: #F6FFCC;
	}

	.navbar-inverse .navbar-nav > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand{
		color:black;
	}

	.col-sm-go{
		height: 30px;
		width:  120px;
		background-color:lightgray;
		margin: 0 auto;
	}

	.sidenav {
      padding-top: 100px;
      background-color: white;
      height: 100%;
    }

   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }


	@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {
    table { 
          width: 100%; 
    }
    /* Force table to not be like tables anymore */
    table, thead, tbody, th, td, tr { 
        display: block; 
    }
    
    /* Hide table headers (but not display: none;, for accessibility) */
    thead tr { 
        position: absolute;
        top: -9999px;
        left: -9999px;
    }
    
    tr { border: 1px solid #ccc; }
    
    td { 
        /* Behave  like a "row" */
        border: none;
        border-bottom: 1px solid #eee; 
        position: relative;
        padding-left: 50%; 
    }
    
    td:before { 
        /* Now like a table header */
        position: absolute;
        /* Top/left values mimic padding */
        top: 6px;
        left: 6px;
        width: 45%; 
        padding-right: 10px; 
        white-space: nowrap;
        /* Label the data */
        content: attr(data-column);
        color: #3498db;
    }
}

.table{
	text-align:right;
}

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
</head>
<c:if test="${result == 1}">	
<div class="w3-modal-content w3-animate-zoom">  
      <span onclick="document.getElementById('contact').style.display='none'" class="w3-button w3-display-topright w3-large">x</span>
      <br>
    <div class="w3-container">
      <form class="form-horizontal" target="_blank" action="modifyPro.do">
     <input type="hidden" class="form-control" id="user_id"  name="user_id" value="${spec.user_id}">
   <div class="form-group">
      <label class="control-label col-sm-3" for="name">이름</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="name" placeholder="이름" name="name" value="${spec.name}">
      </div>
    </div>
    <br>
	<div class="form-group">
		<label class="control-label col-sm-3" for="gender">성별</label>
		<div class="col-sm-6">
		<c:if test="${spec.gender== 1}">
			 <input type="radio"  name="gender" value="1" checked  disabled> 남자 &nbsp;
			  <input type="radio" name="gender" value="2"  disabled>여자
		</c:if>
		<c:if test="${spec.gender== 2}">
			 <input type="radio"  name="gender" value="1"  disabled> 남자 &nbsp;
			  <input type="radio" name="gender" value="2" checked  disabled>여자
		</c:if>
		</div>
	</div>
	<br>
    <div class="form-group">
      <label class="control-label col-sm-3" for="age">나이</label>
      <div class="col-sm-6">          
        <input type="text" class="form-control" id="age" placeholder="나이" name="age" value="${spec.age}">
      </div>
    </div>
    <br>
	<div class="form-group">
	 <label class="control-label col-sm-3" for="email">이메일</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="email" placeholder="이메일" name="email" value="${spec.email}">
      </div>
	</div>
	<br>
	<div class="form-group">
	 <label class="control-label col-sm-3" for="kg">몸무게</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="kg" placeholder="몸무게" name="weight" value="${spec.weight}">
      </div>
	</div>
	<br>
	<div class="form-group">
	 <label class="control-label col-sm-3" for="cm">키</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="cm" placeholder="키" name="height"value="${spec.height}">
      </div>
	</div>
	<br>
    <div class="form-group">         
      <div class="col-sm-offset-2 col-sm-10" align="center">
        <button type="submit" class="btn btn-default" >수정</button>
        <button type="button" class="btn btn-default"  onclick="document.getElementById('contact').style.display='none'">취소</button>
      </div>
    </div>
      </form>
    </div>
  </div>
  </c:if>
    <script type="text/javascript">
  
  function closeConfirm() {
	  alert( "회원님이 스펙을 미입력 하셨습니다." );
	  window.close();
	}
  
  </script>
<c:if test="${result == 0}">
	<body onload="closeConfirm()">
	
	</body>
</c:if>
</html>