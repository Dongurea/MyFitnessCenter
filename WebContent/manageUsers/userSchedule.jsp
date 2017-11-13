<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}

	.navbar {
      margin-bottom: 0;
      border-radius: 0;
	  border-color: #CEF279;
    }
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #fff;
      height: 35%;
    }
    .sidenavin{
    	background-color:white;
        height:35%;
        
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
      .row.content {height: auto;} 
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

.dropdown{
	width: 100%;
}
  </style>
</head>
<body>

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
      <ul class="nav navbar-nav">
        <li class="active-in"><a href="#">회원관리</a></li>
        <li><a href="#">운동스케줄</a></li>
        <li><a href="#">그룹운동관리</a></li>
        <li><a href="#">프로그램관리</a></li>
		<li><a href="#">게시판관리</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<br><br>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-10">
    <table class="table table-bordered">
			<thead>
			<div align="right">
				<button type="button" class="btn btn-default">등록</button>
				<button type="button" class="btn btn-default">수정</button>
				<button type="button" class="btn btn-default">삭제</button>
			</div>

			<span class="label label-primary">1week</span>
			  <tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td data-column="일">스트레칭5분</td>
				<td data-column="월">스트레칭5분</td>
				<td data-column="화">스트레칭5분</td>
				<td data-column="수">스트레칭5분</td>
				<td data-column="목">스트레칭5분</td>
				<td data-column="금">스트레칭5분</td>
				<td data-column="토">스트레칭5분</td>
			  </tr>
			</tbody>
		  </table>

		 <table class="zindex table table-bordered">
			<thead>
			<span class="label label-primary">2week</span>
			  <tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td data-column="일">스트레칭5분</td>
				<td data-column="월">스트레칭5분</td>
				<td data-column="화">스트레칭5분</td>
				<td data-column="수">스트레칭5분</td>
				<td data-column="목">스트레칭5분</td>
				<td data-column="금">스트레칭5분</td>
				<td data-column="토">스트레칭5분</td>
			  </tr>
			</tbody>
		  </table>

		  <table class="table table-bordered">
			<thead>
			<span class="label label-primary">3week</span>
			  <tr>
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td data-column="일">스트레칭5분</td>
				<td data-column="월">스트레칭5분</td>
				<td data-column="화">스트레칭5분</td>
				<td data-column="수">스트레칭5분</td>
				<td data-column="목">스트레칭5분</td>
				<td data-column="금">스트레칭5분</td>
				<td data-column="토">스트레칭5분</td>
			  </tr>
			</tbody>
		  </table>
    </div>
    <br><br><br>
    <div class="col-sm-2 sidenav">
      <select style="width:100%; height:6%;">
	
		  <option value="1">홍길동님</option>
		  <option value="2">이순신님</option>
		  <option value="3">강감찬님</option>
		  
	  </select>
    </div>   
  </div>
</div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>














