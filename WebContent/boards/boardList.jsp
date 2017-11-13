<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<head>
 <link href="${project}main_style.css" rel="stylesheet" type="text/css">
  <script  src="https://npmcdn.com/masonry-layout@4.0/dist/masonry.pkgd.min.js"></script>
  <script>

	$(document).ready(function($){
		setTimeout(function(){
			// initialize
			$('.grid').masonry({
			  itemSelector: '.grid-item',
			  columnWidth: 20,
			  isFitWidth: true
			});
		}, 200);
	});

  </script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
	* { box-sizing: border-box; }
	body { font-family: sans-serif; }
	/* ---- grid ---- */

	.grid {
	  background: #2d2d30;
	  /* center */
	  margin: 0;
	  text-align:center;
	}
	.grid-item > a{
	color:#2d2d30;
	}

	/* clearfix */
	.grid:after {

	  content: '';
	  display: block;
	  clear: both;
	}

	/* ---- grid-item ---- */

	.grid> .grid-item {
	 border: 1px solid grey;
	 background:white;
	 text-align:center;
	 height:400px;
	}
	.grid> .grid-item>a{
	 width:100%;
	 text-decoration:none;
	}.grid> .grid-item>a>p{
	 margin:10px;
	}
	.grid> .grid-item>a > img{
	 width:100%;
	 height:80%;
	}

	.gridheight2 { height: 200px; }
	.gridheight3 { height: 260px; }

	.navbar-default{
	  background-color: #ABF200;
	}
  </style>
</head>
<body onload="AutoResize()">


		<c:if test="${sessionScope.managerId !=null}">
			<jsp:include page="${part_top_manager}">
				<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
			</jsp:include>
		</c:if>


 <div align="right" style="margin-right:30px;">
   <br>
	<button type="button" class="btn btn-default" onclick="location='boardWriteForm.do'">글 작성</button>
</div>
<br><br>

<h4 style="color:white;">공지사항</h4>
<div class="grid" >
<c:forEach var="boardDto" items="${articles}"> 
		 <c:if test="${boardDto.boardCheck == 1}">
		  <div class="grid-item col-sm-4">
		  <a href="boardContent.do?num=${boardDto.num}&pageNum=${pageNum}&number=${number+1}">
		  <img src="/MFC/boards/images/${boardDto.fileName}">
		  <p align="center">${boardDto.subject}</p></a>
		  </div>
		</c:if>
	</c:forEach>
</div>
<br><br>

<h4 style="color:white;">가이드북</h4>   
	<div class="grid">
	<c:forEach var="boardDto" items="${articles}"> 
		 <c:if test="${boardDto.boardCheck == 2}">
		  <div class="grid-item col-sm-4">
		  <a href="boardContent.do?num=${boardDto.num}&pageNum=${pageNum}&number=${number+1}">
		  <img src="/MFC/boards/images/${boardDto.fileName}">
		  <p align="center">${boardDto.subject}</p></a>
		  </div>
		</c:if>
	</c:forEach>
	</div>
	<br><br>
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

