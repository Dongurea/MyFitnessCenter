<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${project}main_style.css" rel="stylesheet" type="text/css">
  <style>
  	.col-sm-3.boardItem{
  		border:1px solid lightgrey;
  		padding:10px;
  	}
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .navhind {
    	background-color:white;
        align:center;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>

<!-- mainTop부분 -->
<c:if test="${sessionScope.memId==null}">
	<c:if test="${sessionScope.managerId == null}" >
	<jsp:include page="${part_top}"></jsp:include>
	<body style="background:white;">
	</c:if>
	<c:if test="${sessionScope.managerId != null}" >
	<jsp:include page="${part_top_manager}">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
	</jsp:include>
	<body style="color:white;">
	<style>.col-sm-3.boardItem{
  		background:white;color:black}</style>
	</c:if>
</c:if>
<c:if test="${sessionScope.memId!=null}">
	<jsp:include page="${part_top}">
		<jsp:param value="${sessionScope.memId}" name="user_id"/>
	</jsp:include>
	<body style="background:white;">
</c:if>

<!-- mainTop부분 끝-->
	
<script type="text/javascript">
        var subject= new Array();
        var classtime = new Array();
        var classday = new Array();

        function subcheck(num){       
           subject=new Array();
           $("input[name='subject']:checked").each(function(i){
                subject.push( "%" +  $(this).val()  + "%");
             });     
           
              var ischecked= $("#sub"+ num).is(':checked');
               if(!ischecked){                
                  for (var i=0; i<subject.length ; i++){
                     var tmp="%" + $("#sub"+ num).val() + "%";
                     if(subject[i]==tmp){
                        subject.splice(i,1);
                     }
                  }
               }
               
                 
                var subVal = $("#sub"+ num + ":checked" ).val();

                if(subVal != '' ){
                 $.ajaxSettings.traditional = true;
                 $.ajax({
                    type: 'POST',
                    url: "/MFC/clsBoardListFilter.do",
                    data:  {"subject" : subject, "classtime" : classtime, "classday" : classday },
                    success: function(response){
                       $("#pro").html(response);
                    }
                 });
                } 
        }
        
      function daycheck(num){
         classday = new Array();
           $("input[name='classday']:checked").each(function(i){
              classday.push("%" + $(this).val() + "%");
             });
           
            var ischecked= $("#day"+ num).is(':checked');
             if(!ischecked){                
                for (var i=0; i<classday.length ; i++){
                   var tmp="%" + $("#day"+ num).val() + "%";       
                   if(classday[i]==tmp){
                      classday.splice(i,1);
                   }
                }
             }
                
                var dayVal = $("#day" + num + ":checked").val();

                if(dayVal != ''){
                  $.ajaxSettings.traditional = true;
                 $.ajax({
                    type: 'POST',
                    url: "/MFC/clsBoardListFilter.do",
                    data:  { "classday" : classday ,"classtime" : classtime, "subject" : subject},
                    success: function(response){
                       $("#pro").html(response);
                    }
                 });
                }
        }
        
        function timecheck(num){
           classtime = new Array();
           $("input[name='classtime']:checked").each(function(i){
                classtime.push("%" + $(this).val() + "%");
             });
           
            var ischecked= $("#time"+ num).is(':checked');
             if(!ischecked){                
                for (var i=0; i<classtime.length ; i++){
                   var tmp="%" + $("#time"+ num).val() + "%";       
                   if(classtime[i]==tmp){
                    classtime.splice(i,1);
                   }
                }
             }
                
                var timeVal = $("#time" + num + ":checked").val();

                if(timeVal != ''){
                  $.ajaxSettings.traditional = true;
                 $.ajax({
                    type: 'POST',
                    url: "/MFC/clsBoardListFilter.do",
                    data:  {"classtime" : classtime, "subject" : subject, "classday" : classday },
                    success: function(response){
                       $("#pro").html(response);
                    }
                 });
                }
        }

      //선택해제 
        /*   
      $("#uncheckall").click(function() {
               $("input[type=checkbox]").each(function() {
                 $(this).prop("checked", false);
              });
            });
      */
      
  </script>
<c:if test="${sessionScope.managerId != null}" >
<div class="jumbotron" style="color:black;">
</c:if>
<c:if test="${sessionScope.managerId == null}" >
<div class="jumbotron" >
</c:if>
  <div class="container text-center align=center">
   <div class="navhind"><br>
   <h4>프로그램</h4>
   &nbsp;&nbsp;&nbsp;<input type="checkbox" id="sub0" name="subject" value="수영" onclick="subcheck(0)"> 수영
   &nbsp;<input type="checkbox" id="sub1" name="subject" value="PT" onclick="subcheck(1)"> PT 
   &nbsp;<input type="checkbox" id="sub2" name="subject" value="스피닝" onclick="subcheck(2)"> 스피닝
   &nbsp;<input type="checkbox" id="sub3" name="subject" value="필라테스" onclick="subcheck(3)"> 필라테스
   &nbsp;<input type="checkbox" id="sub4" name="subject" value="요가" onclick="subcheck(4)"> 요가
   <br>
   <hr>
   <h4>요일</h4>
   &nbsp;&nbsp;&nbsp;<input type="checkbox" id="time0"  name="classday"  value="월" onclick="daycheck(0)"> 월요일
   &nbsp;<input type="checkbox" id="time1" name="classday" value="화" onclick="daycheck(1)"> 화요일
   &nbsp;<input type="checkbox" id="time2" name="classday" value="수" onclick="daycheck(2)"> 수요일
   &nbsp;<input type="checkbox" id="time3" name="classday" value="목" onclick="daycheck(3)"> 목요일
   &nbsp;<input type="checkbox" id="time4" name="classday" value="금" onclick="daycheck(4)"> 금요일
   &nbsp;<input type="checkbox" id="time5" name="classday" value="토" onclick="daycheck(5)"> 토요일
   &nbsp;<input type="checkbox" id="time6" name="classday" value="일" onclick="daycheck(6)"> 일요일
   <br>
   <hr>
   <h4>시간대</h4>
   &nbsp;&nbsp;&nbsp;<input type="checkbox" id="time7" name="classtime"  value="9" onclick="timecheck(7)"> 9:00
   &nbsp;<input type="checkbox" id="time8"name="classtime" value="10" onclick="timecheck(8)"> 10:00
   &nbsp;<input type="checkbox" id="time9" name="classtime" value="11" onclick="timecheck(9)"> 11:00
   &nbsp;<input type="checkbox" id="time10" name="classtime" value="17" onclick="timecheck(10)"> 17:00
   &nbsp;<input type="checkbox" id="time11" name="classtime" value="19"  onclick="timecheck(11)"> 19:00
   <br><hr><br>
  
   </div>
   <br>
  </div>
</div>
  
 
<div class="container-fluid bg-3 text-center">    
  <h3>프로그램</h3>
  	<c:if test="${sessionScope.managerId != null}" >
	   <div align="right">
		 <button type="button" class="btn btn-default" onclick="location.href='clsInsertForm.do'">추가</button>
	   </div>
	</c:if>
  <br>
  <div class="row" id="pro">
  <c:forEach var="oneclass" items="${classes}"> 
  	<!-- 프로그램 반복구간 -->
  	
    <div class="col-sm-3 boardItem"onclick="location.href='clsBoardContent.do?classname=${oneclass.classname}&classdate=${oneclass.classdate}'">
    	<!-- 프로그램 제목 -->
      <p><strong>${oneclass.classname}</strong></p>
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
