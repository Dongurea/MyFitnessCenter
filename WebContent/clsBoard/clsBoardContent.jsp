<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      border:1px solid lightgrey;

      height: 35%;
      padding: 5px;
    }
    .sidenavin{
   		background:#2d2d30;
    	background-color:white;
        height:50%;
        
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

  </style>

<body>

<c:if test="${sessionScope.memId==null}">
	<c:if test="${sessionScope.managerId == null}" >
	<jsp:include page="${part_top}"></jsp:include>
	<style>body{background:white;}.sidenavin{background:white;}</style>
	</c:if>
	<c:if test="${sessionScope.managerId != null}" >
	<jsp:include page="${part_top_manager}">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
	</jsp:include>
	<style>body{color:white;}.sidenavin{background:none;color:white;}</style>
	</c:if>
</c:if>
<c:if test="${sessionScope.memId!=null}">
	<jsp:include page="${part_top}">
		<jsp:param value="${sessionScope.memId}" name="user_id"/>
		
	</jsp:include>
	<style>body{background:white;}.sidenavin{background:white;}</style>
</c:if>
<script src="script.js"></script>
<script src="clsBoard/script.js"></script>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-10">
    <br>

      <h2 id="classname">${oneclass.classname}</h2>
      

      <c:if test="${sessionScope.managerId!=null}" >
      <div align="right">
	 <button type="button" class="btn btn-default" onclick="location.href='clsBoardModifyForm.do?classname=${oneclass.classname}&classdate=${oneclass.classdate}'">글수정</button>
	 <c:if test="${oneclass.cur_stu==0}">
	 <button type="button" class="btn btn-default" onclick="location.href='clsBoardDeletePro.do?classname=${oneclass.classname}&classdate=${oneclass.classdate}&replysize=${replies.size()}'">삭제</button>
	 </c:if>
	 <c:if test="${oneclass.cur_stu!=0}">
	 <button type="button" class="btn btn-default" onclick="noCancel()">삭제</button>
	 
	 </c:if>
	 </div>
	 </c:if>
      <hr>
      
      <div class="container">
    <div class="row">
      <div class="col-sm-9">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">

          <div class="carousel-inner" role="listbox">
            <div class="item active">
              <img src="/MFC/clsBoard/images/${oneclass.link}" alt="Image">

            </div>
          </div>

        </div>
      </div>
    </div>
    </div>
      <hr>
      
      <h2>프로그램 소개</h2>
      	<br>
      <!-- 프로그램 소개 -->
      <p>${oneclass.class_intro}</p>
      <br>
      
      <hr>
      <h2>강사 소개</h2>
    	<br>
      <div class="col-sm-2 text-center">
          <img src="/MFC/clsBoard/images/insimage/${instructor.link}" class="img-circle" height="65" width="65" alt="Avatar">
      </div>

      <h4>${oneclass.ins_name}</h4>

      <p>${instructor.intro}
      </p>
      <hr>
      <br><br>
      <c:if test="${sessionScope.memId!=null}">
      <c:forEach var="reply" items="${replies}">
      	<c:if test="${reply.user_id==sessionScope.memId}">
      		<c:set var="userReplyCheck" value="1"/>
      	</c:if>
      </c:forEach>
      <c:if test="${userReplyCheck!=1}">
	      <h4>댓글 작성하기</h4>
	      <form action="clsInsertReplyPro.do" name="commentForm" method="post">
	        <div class="form-group">
	          <textarea name="comment" id="comment" class="form-control" rows="3" required></textarea>
	          <input type="hidden" name="classname" value="${oneclass.classname}"/>
	          <input type="hidden" name="classdate" value="${oneclass.classdate}"/>
	           <input type="hidden" name="count" value="${replies.size()}"/>

	        </div>
	        <button type="submit" class="btn btn-black">작성</button>
	      </form>
      </c:if>
      </c:if>
      <br><br>
      

      <p><span class="badge">${replies.size()}</span> Comments:</p><br>
      
      <div class="row">
 		
 		<c:forEach var="reply" items="${replies}">		
        <div class="col-sm-2 text-center">
          <img src="/MFC/clsBoard/images/user.png" class="img-circle" height="65" width="65" alt="Avatar">
        </div>
        
        
        <script type="text/javascript">
			//<!--
			function replyUpdate(){
				var replyText=$("#replyText");
				var text =replyText.value;
				replyText.hide();
				$("#modifyReplyText").css("display", "");
				$("#modify").hide();
				$("#delete").hide();
				$("#update").css("display", "");
				$("#updateCancel").css("display", "");
			}
			
			function replyCancel(){
				$("#modifyReplyText").css("display", "none");
				var replyText=$("#replyText");
				replyText.show();
				$("#modify").show();
				$("#delete").show();
				$("#update").css("display", "none");
				$("#updateCancel").css("display", "none");
			}
			//-->
        </script>
        
        <div class="col-sm-10" id="replyModify">
    	
          <h4>${reply.user_id} </h4> 
          <p id="replyText">${reply.text}</p>
          
          <c:if test="${reply.user_id==sessionScope.memId}">
          <form action="clsUpdateReplyPro.do" name="replyUpdateForm" method="post">
          	<textarea name="modifyReplyText" id="modifyReplyText" class="form-control" rows="2" style="display:none" >${reply.text}</textarea> 
          	<br>
          	<input type="hidden" name="classname" value="${oneclass.classname}"/>
          	<input type="hidden" name="user_id" value="${reply.user_id}"/>	  
          	 <input type="hidden" name="classdate" value="${oneclass.classdate}"/>
 
			<button class="btn btn-default"  type="button" id="modify"  onclick="replyUpdate()">수정</button>
			<button class="btn btn-default"  type="button" id="delete"  onclick="location.href='clsDeleteReplyPro.do?user_id=${reply.user_id}&classname=${oneclass.classname}&replynum=${reply.reply_num}&classdate=${oneclass.classdate}'">삭제</button>
		 	<button class="btn btn-default"  type="submit" id="update" style="display:none">확인</button>
		 	<button class="btn btn-default"  type="button" id="updateCancel" style="display:none" onclick="replyCancel()">취소</button>
		 </form>
		 </c:if>	
          <br>
	  	
        </div>
       
         
        </c:forEach>
      </div>
    
    

    </div>    
    <br><br><br>
    <div class="col-sm-2 sidenav" >
      <h3>예약하기</h3>
      
      <div class="col-sm-13 sidenavin">
      &nbsp;

      <h4>요일 : 
      <c:set var="classday" value="${oneclass.class_day}"/>
      <c:if test="${classday=='월,화,수,목,금'}">
      	<c:set var="classday" value="평일"/>
      </c:if>
      <c:if test="${classday=='토,일'}">
      	<c:set var="classday" value="주말"/>
      </c:if>
      <c:if test="${classday=='월,화,수,목,금,토,일' }">
      	<c:set var="classday" value="매일"/>
      </c:if>${classday}      
      </h4>
      <hr>
 
  	  <h4>시간 : 
  	  
  	  <c:forEach var="i"  items="${oneclass.class_time}">
  	 	 ${i}시
  	  </c:forEach>
  	
  	  </h4>
      <hr>	
  		
      <h4>강사 : ${oneclass.ins_name}</h4>
      <hr>
  
      <h4>가격 : <fmt:formatNumber value="${oneclass.tuition}" type="number" groupingUsed="true" />원</h4>
      
      &nbsp;
     
      </div>
 
      <br>


	  <br>
      <br>
      <!-- 현재인원/최대인원 -->
      <p align="right">
      	현재인원<br>
        ${oneclass.cur_stu}명/${oneclass.max_stu}명
      </p>
      <hr>
   <script type="text/javascript">
	//<!--
	function programBookCancel(){
		var classname = $("input:hidden[name='classname']").val();
		var classdate = $("input:hidden[name='classdate']").val();
		var user_id=$("input:hidden[name='user_id']").val();
		if(confirm(classname+" 프로그램을 취소하시겠습니까?")){
		location.href="clsBoardBookCancelPro.do?classname="+classname+"&classdate="+classdate+"&user_id="+user_id;
		}
	}
	
	function programBook(){
		var classname = $("input:hidden[name='classname']").val();
		var classdate = $("input:hidden[name='classdate']").val();
		var user_id=$("input:hidden[name='user_id']").val();
		if(confirm(classname+" 프로그램을 예약하시겠습니까?")){
		location.href="clsBoardBookPro.do?classname="+classname+"&classdate="+classdate+"&user_id="+user_id;
		}	
	}
	//-->
	</script> 
	<input type="hidden" name="classname" value="${oneclass.classname}"/>  
    <input type="hidden" name="classdate" value="${oneclass.classdate}"/>
    <input type="hidden" name="user_id" value="${sessionScope.memId}"/>
    
   <c:if test="${sessionScope.memId==null}">
   		<button type="button" class="btn btn-primary" style="width: 100%;">
      			로그인하고 예약하세요
      	</button>
   </c:if>
    
   <c:if test="${sessionScope.memId!=null}">
   <c:if test="${stuCheck!=0}">
   		<button type="button" class="btn btn-primary" style="width: 100%;" onclick="programBookCancel()">
      			<fmt:formatDate value="${oneclass.classdate}" pattern="MM"/>월 예약취소
      	</button>
   </c:if>
   <c:if test="${stuCheck==0}">  
      	<c:if test="${oneclass.cur_stu==oneclass.max_stu}">
      	
        	<button type="button" class="btn" style="width: 100%;">
        		<fmt:formatDate value="${oneclass.classdate}" pattern="MM"/>월 예약마감
        	</button>
        
      	</c:if>
      	<c:if test="${oneclass.cur_stu<oneclass.max_stu}">
      
      		<button type="button" class="btn btn-primary" style="width: 100%;" onclick="programBook()">
      			<fmt:formatDate value="${oneclass.classdate}" pattern="MM"/>월 예약하기
      		</button>
     
      	</c:if>
   </c:if>
   </c:if>
   
    </div>   
  </div>
</div>

<div style="position:fixed; bottom: 5px; right:5px;">
   <a href="#"><img src="/MFC/clsBoard/top.png" title="위로가기" style="width:40px;height:auto;"></a>
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


