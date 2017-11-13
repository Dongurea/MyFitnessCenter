<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>MFC: Try again</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:if test="${sessionScope.memId!=null }">
  	<meta http-equiv="refresh" content="3;url=/MFC/" />
  </c:if test="${sessionScope.memId==null }">
  <c:if>
  	<meta http-equiv="refresh" content="3;url=/MFC/" />
  </c:if>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .bg-1 { 
      background-color: #ffcccc; 
      color: #ffffff;
  }
  .bg-2 { 
      background-color: #ffffff; /* Dark Blue */
      color: black;
  }
  </style>
</head>
<body>

<div class="container-fluid bg-1 text-center">
  <h3>로그인 세션이 만료되거나 유효하지 않은 정보입니다.</h3>
  <img src="https://scontent.cdninstagram.com/t51.2885-15/s640x640/sh0.08/e35/c0.83.662.662/19625058_443987515987439_3950328674808496128_n.jpg" class="img-circle" alt="Bird" width="350" height="350">
</div>

<div class="container-fluid bg-2 text-center">
  <p>로그인 세션이 만료되거나 현재 정보가 정확히 입력되지 않았습니다.</p>
  <p>다시 로그인하거나, 정보를 올바르게 입력해주세요.</p>
  <p>5초후 메인페이지로 돌아갑니다.</p>
</div>

</body>
</html>
