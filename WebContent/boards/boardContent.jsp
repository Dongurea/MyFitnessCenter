<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link href="${project}style.css" rel="stylesheet" type="text/css">

<head>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #2d2d30;
      height: 100%;
    }

	.col-sm-2{
		background-color: #fff;
	}


    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: 100%;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<c:if test="${sessionScope.managerId!=null && sessionScope.memId==null}">
	<jsp:include page="${part_top_manager}">
			<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
	</jsp:include>
	<body style="color:white;">
	<style>.sidenav{background-color: #2d2d30;}</style>
</c:if>
<c:if test="${sessionScope.managerId==null && sessionScope.memId!=null}">
	<jsp:include page="${part_top}">
			<jsp:param value="${sessionScope.memId }" name="user_id"/>
	</jsp:include>
	<body style="background:white;color:black;">
	<style>.sidenav{background-color: white;}</style>
</c:if>
<c:if test="${sessionScope.managerId==null && sessionScope.memId==null}">
	<jsp:include page="${part_top}"></jsp:include>
	<body style="background:white;color:black;">
	<style>.sidenav{background-color: white;}</style>
</c:if>
<!-- 
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
 -->

 <br><br>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    </div>
    	<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
    <div class="col-sm-8 text-left"> 
    <c:if test="${sessionScope.managerId!=null && sessionScope.memId==null}">
		 <div align="right">
			 <button type="button" class="btn btn-default" onclick="location='boardList.do'">목록</button>
			 <button type="button" class="btn btn-default" onclick="location='boardModifyForm.do?num=${boardDto.num}&pageNum=${pageNum}'">글수정</button>
			 <button type="button" class="btn btn-default" onclick="location='boardDeletePro.do?num=${boardDto.num}&pageNum=${pageNum}'">삭제</button>
		 </div>
	</c:if>
      <img width="100%" src="/MFC/boards/images/${boardDto.fileName}">
      <br>
      <h1>${boardDto.subject}</h1>
      <hr>
      <p>
       	${boardDto.content}
      </p>
      <hr>
    </div>
    <div class="col-sm-2 sidenav">
    </div>
  </div>
</div>

</body>
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
</html>
