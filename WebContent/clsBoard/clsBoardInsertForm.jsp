<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <style>
  	h2{
  		color:white;
  	}
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
		color:black;
	}

	.navbar-inverse .navbar-brand > li > a{
		color:black;
	}

	.navbar-inverse .navbar-brand{
		color:black;
	}

  </style>
</head>
<body>
</body>

<script src="clsBoard/script.js"></script>
<jsp:include page="${part_top_manager}">
	<jsp:param value="${sessionScope.managerId}" name="manager_id"/>
</jsp:include>
 <form action="clsInsertPro.do" name="classInsertForm" onsubmit="return insertclasscheck(this)" enctype="multipart/form-data" method="post" >

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav" style="background-color:#2d2d30;">
    </div>
    <div class="col-sm-8 text-left"> 
	 <div align="right">
	 <br><br>
	 <button type="submit" class="btn btn-default" >추가</button>
	 <button type="button" class="btn btn-default" onclick="location.href='clsBoardList.do'">취소</button>
	 </div>
	 <br>
      <div class="col-sm-5">
		<input type="text" class="form-control" name="classname">
		</div>
		<div class="col-sm-3">
		<button type="button" class="btn btn-default" onclick="confirmClassname()">중복확인</button>
		<input type="hidden" name="check" />
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
		<input type="file" id="filename" name="filename" size=40 class="btn btn-default">
		</div>
		
		<script type="text/javascript">
        $(function() {
            $("#filename").on('change', function(){
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
      <h2 style="color:white;">프로그램소개</h2>
	  <br>
	  
      <textarea name="class_intro" class="form-control" rows="5" cols="5" id="comment"></textarea>


      <hr>

	  <h2 style="color:white;">시간 및 요일</h2><br>
	  <div style="color:white;">
	  <input style="color:white;" name="class_time" id="class_time" type="radio" value="9"> 9:00
	   &nbsp;<input name="class_time" id="class_time" type="radio" value="10"> 10:00
	   &nbsp;<input name="class_time" id="class_time" type="radio" value="11"> 11:00
	   &nbsp;<input name="class_time" id="class_time" type="radio" value="17"> 17:00
	   &nbsp;<input name="class_time" id="class_time" type="radio" value="19"> 19:00
	   &nbsp;<input name="class_time" id="classTime"  type="radio" value="협의"> 협의
	   <br><br>
	  <input name="class_day" type="checkbox" value="월"> 월요일
	   &nbsp;<input name="class_day" type="checkbox" value="화"> 화요일
	   &nbsp;<input name="class_day" type="checkbox" value="수"> 수요일
	   &nbsp;<input name="class_day" type="checkbox" value="목"> 목요일
	   &nbsp;<input name="class_day" type="checkbox" value="금"> 금요일
	   &nbsp;<input name="class_day" type="checkbox" value="토"> 토요일
	   &nbsp;<input name="class_day" type="checkbox" value="일"> 일요일
	  <br>
	  </div>
	  <hr>

	<h2 style="color:white;">가격</h2><br>
	 	<input type="text"  style="width:150px;" class="form-control "name="tuition"/>
	<br>
	 <hr>
	  
	  <h2 style="color:white;">최대인원</h2><br>
	  	<input type="text"   style="width:150px;" class="form-control"name="max_stu"/>
	<br>
	  <hr>


       <h2 style="color:white;">강사</h2><br>
     

		<input type="text" style="width:150px; display: inline;"  class="form-control" name="ins_name" readonly="readonly">
			&nbsp;
		<button type="button" style="width:100px; display: inline;" class="btn btn-default" onclick="findinsInsert()">강사검색</button>
<br><br>
     
    </div>

    </div>
  </div>
</div>
</form>
<div style="position:fixed; bottom: 5px; right:5px;">
   <a href="#"><img src="/MFC/clsBoard/top.png" title="위로가기" style="width:40px;height:auto;"></a>
</div>
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
