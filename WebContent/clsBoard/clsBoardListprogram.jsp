<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${project}main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
 

<div class="container-fluid bg-3 text-center">    

  	
  <br>
  <div class="row" id="pro">
  <c:forEach var="oneclass" items="${classes}"> 
  	<!-- 프로그램 반복구간 -->
  	
    <div class="col-sm-3 boardItem" onclick="location.href='clsBoardContent.do?classname=${oneclass.classname}&classdate=${oneclass.classdate}'">
    	<!-- 프로그램 제목 -->
      <p>${oneclass.classname}</p>
      <img src="/MFC/clsBoard/images/${oneclass.link}" class="img-responsive" style="width:100%; height:30%" alt="Image"/>
      <p>
      <c:set var="classday" value="${oneclass.class_day}"/>
      <c:if test="${classday=='월,화,수,목,금'}">
      	<c:set var="classday" value="평일"/>
      </c:if>
      <c:if test="${classday=='토,일'}">
      	<c:set var="classday" value="주말"/>
      </c:if>
      <c:if test="${classday=='월,화,수,목,금,토,일' }">
      	<c:set var="classday" value="매일"/>
      </c:if>
      	<p><strong>시간</strong> | ${classday}/${oneclass.class_time}시</p>
      	<p><strong>강사</strong> | ${oneclass.ins_name}</p>
      </p>
    </div>
    <!-- 프로그램 반복구간 끝-->
  </c:forEach> 
  </div>
</div><br>

<br><br>
</body>
</html>
