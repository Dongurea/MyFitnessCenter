<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<html>
<head>
  <title>새로운 클래스</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
     border-color: #CEF279;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #fff;
      height: 100%;
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
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

   .navbar-inverse{
      background-color: #CEF279;
   }

   .active-in{
      background-color: #F6FFCC;
   }

   .navbar-inverse .navbar-nav > li > a{
      color:white;
   }

   .navbar-inverse .navbar-brand > li > a{
      color:white;
   }

   .navbar-inverse .navbar-brand{
      color:white;
   }
   body { color:white; }
  </style>
</head>
<body>
</body>

<script src="boards/script.js"></script>
<jsp:include page="${part_top_manager}">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
</jsp:include>
 <form action="boardWritePro.do" onsubmit="return writecheck()" enctype="multipart/form-data" method="post" name="writeform">

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav" style="background:#2d2d30;">
    </div>
    <div class="col-sm-8 text-left"> 
    <div align="right">
    <br><br>
    <button type="submit" class="btn btn-default" >추가</button>
    <button type="button" class="btn btn-default" onclick="location.href='clsBoardList.do'">취소</button>
    </div>
    <br>
      <div class="col-sm-5">
      <input type="text" class="form-control" name="subject"  placeholder="${boardDto.subject}">
      </div>
      <div class="col-sm-3">
     </div>
     <br><br>
      <hr>
      <div class="container">
    <div class="row">
      <div class="col-sm-9">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div id="View_area" class="carousel-inner" role="listbox">
            <div class="item active" >
              <img id="imgPart" src="https://placehold.it/1000x400?text=IMAGE" alt="Image">
            </div>
          </div>

          <!-- Left and right controls -->
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      <br>
      <div align="right">
      <input type="file" id="fileName" name="fileName" size=40 class="btn btn-default">
      </div>
      
      <script type="text/javascript">
        $(function() {
            $("#fileName").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#imgPart').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


       </script>



      </div>
    </div>
    </div>
    
       <hr>
     <h2  style="color:white;">게시판 형식</h2><br>
   <h5 style="color:white;">    <input name="boardCheck" id="boardCheck" type="radio" value="1"> 공지사항
&nbsp;<input name="boardCheck" id="boardCheck" type="radio" value="2"> 가이드북 </h5>
      <br><br>
    
      <hr>
      <h2 style="color:white;">게시글</h2>
     <br>
     
      <textarea name="content" class="form-control" rows="5" cols="5" id="comment" placeholder="게시글 내용"></textarea>


    </div>

    </div>
    <div class="col-sm-2 sidenav" style="background:#2d2d30;">
    </div>
  </div>

<!-- 기존 게시판 값 input-->
	 	<input type="hidden" name="num" value="${num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="writer" value="${ref}">
		<input type="hidden" name="passwd" value="${re_step}">
		<input type="hidden" name="email" value="${re_level}">	
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="re_step" value="${re_step}">
		<input type="hidden" name="re_level" value="${re_level}">		
<!-- 기존 게시판 값 input-->

</form>
<div style="position:fixed; bottom: 5px; right:5px;">
   <a href="#"><img src="/MFC/clsBoard/top.png" title="위로가기" style="width:40px;height:auto;"></a>
</div>

</html>

