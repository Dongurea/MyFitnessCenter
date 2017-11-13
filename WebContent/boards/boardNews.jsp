<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<html>
<head>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="masonry.pkgd.min.js"></script>
  <style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
</style>

  <style>
  	.w3-margin-bottom{
  		padding:10px;border:1px solid lightgrey;
  	}
    .w3-margin-bottom:hover{
    	background:white;
    	border:1px solid #444444;
    	opacity:0.5;
    }
  	.guide-board:hover{
	text-decoration:none;
	}
	.guide-board > img:hover{
	 opacity:1;
	}	
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
	* { box-sizing: border-box; }

	body { font-family: sans-serif; }



	/* ---- grid ---- */

	.grid {
	  background: #EEE;
	  /* center */
	  margin: 0 auto;
	}

	/* clearfix */
	.grid:after {
	  content: '';
	  display: block;
	  clear: both;
	}

	/* ---- grid-item ---- */

	.grid-item {
	  width: 180px;
	  height: 120px;
	  float: left;
	  background: #E4F7BA;
	}

	.grid-item--height2 { height: 200px; }
	.grid-item--height3 { height: 260px; }

	.navbar-default{
	  background-color: #ABF200;
	}
	
		body p {
/* 한 줄 자르기 */ display: inline-block; width: 400px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;


/* 여러 줄 자르기 추가 스타일 */ 
white-space: normal; line-height: 1.2; 
text-align: left; word-wrap: break-word; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;

}

body b {
/* 한 줄 자르기 */ display: inline-block; width: 400px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
text-align: center;

}
  </style>
</head>
<body style="background-color:white;">
<!-- mainTop부분 -->
<c:if test="${sessionScope.memId==null}">
	<c:if test="${sessionScope.managerId == null}" >
	<jsp:include page="${part_top}"></jsp:include>
	</c:if>
	<c:if test="${sessionScope.managerId != null}" >
	<jsp:include page="${part_top_manager}">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
	</jsp:include>
	</c:if>
</c:if>
<c:if test="${sessionScope.memId!=null}">
	<jsp:include page="${part_top}">
		<jsp:param value="${sessionScope.memId}" name="user_id"/>
	</jsp:include>
</c:if>

<!-- mainTop부분 끝-->
<!-- 메인페이지 최상단 슬라이드  -->
<div class="carousel-inner" role="listbox">
  <div class="item active">
    <div onclick="location.href='boardNews.do'"
		style="background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		width:100%;height:200px; background-image:url(/MFC/boards/images/news/news_img1.jpg)">
    <div class="carousel-caption">
      <h3></h3>
    </div>  
   </div>    
 </div></div>
<br><h3 style="width:100%;text-align:center;text-size:120%;font-weight: bold;">공지사항</h3><hr>
 <div class="w3-row-padding">
	<c:forEach var="boardDto" items="${articles}"> 
		<c:if test="${boardDto.boardCheck == 1}">	
	    <div class="w3-third w3-container w3-margin-bottom">
		     <a class="guide-board" href="boardContent.do?num=${boardDto.num}&pageNum=${pageNum}&number=${number+1}">
			  <img src="/MFC/boards/images/${boardDto.fileName}" alt="Norway" style="width:100%;height:450px;" class="w3-hover-opacity">
		      <div class="w3-container w3-white">
		        <p style="font-size:120%;width:100%;text-align:center;background:#2d2d30;color:white;margin-top:10px;padding:10px;"><b>${boardDto.subject}</b></p>
		        <p style="width:100%;height:50px;">${boardDto.content}</p>
		      </div>
		     </a>
	    </div>
	   </c:if>
    </c:forEach>
  </div><br><br>
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
