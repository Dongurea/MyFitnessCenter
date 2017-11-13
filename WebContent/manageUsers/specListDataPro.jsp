<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.pagein > a{
 margin:5px;
 border-radius:0px;
 color: white;
}
.pagein > b{
 margin:5px;
 color: #CCFF00;
 border-radius:0px;
}
.pagein > a:hover{
 margin:5px;
 color:#CCFF00;
 text-decoration:none;
 border-radius:0px;
}
</style>
  <script type="text/javascript">

	$(document).ready(function() {
		var panels = new Array();
		<c:forEach items="${userNewMem}" var="userNewMem">
		panels.push("#${userNewMem.user_id}info");
		</c:forEach>
		<c:forEach items="${userSeven}" var="userSevenMem">
		panels.push("#${userSevenMem.user_id}info");
		</c:forEach>
		
		<c:forEach items="${userExpire}" var="userExpireMem">
		panels.push("#${userExpireMem.user_id}info");
		
		</c:forEach>
		
		
		
		var panel;
		
		for(var i=0;i<panels.length;i++){
			panel=$(panels[i]);
			panel.hide();
		}

	    var panelsButton = $('.dropdown-user');

	    //Click dropdown
	    panelsButton.click(function() {
	        //get data-for attribute
	        var dataFor = $(this).attr('data-for');
	        var idFor = $(dataFor);
	
	        //current button
	        var currentButton = $(this);
	        idFor.slideToggle(400, function() {
	            //Completed slidetoggle
	            if(idFor.is(':visible'))
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
	            }
	            else
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
	            }
	        });
	    });
	    $('[data-toggle="tooltip"]').tooltip();
	});

  
  function deleteCheck() {
	  var checkboxValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var id_values="";
		var checked =0;
		for(i=0; i <chk_obj.length; i++){
			if(chk_obj[i].checked==true){
				checked +=1;
				id_values  +=chk_obj[i].value+",";
			}
		}
		id_values = id_values.slice(0,-1);
		id_values +="\n아이디를 삭제 하시겠습니까?";
				
		if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "삭제하려는 아이디를 선택해주세요." );
		} else {
		 	  var check = confirm(id_values);
	    	  if(check) {
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "http://localhost:8080/MFC/specList.do?checkboxValues="+checkboxValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	    		  alert("아이디가 삭제되었습니다.");
	    	  }
	    	  else{alert("삭제를 취소 하였습니다.");}
	}
}


  function addMonth() {

	  var addMonIdValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	    	addMonIdValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var chk_month=document.getElementById("month");
		if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "회원권 추가하려는 아이디를 선택해주세요." );
			return false;
		} else {
  		  $.ajax({
		      type: 'POST',
		      url: "http://localhost:8080/MFC/specList.do?addMonIdValues="+addMonIdValues+"&month="+chk_month.value,
		      //data:  { "checkboxValues": checkboxValues},
		      success: function(response){
		    	  location.href = location.href;
		      }  
		   });
		  alert("정상적으로 등록되었습니다.");
		}
  }
  function signMem() {
	  var signMemValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	    	signMemValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var id_values="";
	  if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "회원권 등록하려는 아이디를 선택해주세요." );
		} else {
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?signMemValues="+signMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	    		  alert("회원권 등록이 정상적으로 성공 하였습니다.");
	}
}
	  
	  
  function cancelMem() {
	  var cancelMemValues = new Array();
	    $("input[name='userCheck']:checked").each(function(i) {
	    	cancelMemValues.push($(this).val());
	    });  

		var chk_obj=document.getElementsByName("userCheck");
		var id_values="";
	  if($('input:checkbox[name="userCheck"]:checked').length==0) {
			alert( "회원권 등록하려는 아이디를 선택해주세요." );
		} else {
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?cancelMemValues="+cancelMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	    		  alert("회원권이 취소 되었습니다.");
	}
		}
  
  

  function delNewMem(user_id) {
	  var delNewMemValues = new Array();
  	delNewMemValues.push(user_id);
  		  $.ajax({
  		      type: 'POST',
  		      url: "/MFC/specList.do?delNewMemValues="+delNewMemValues,
  		      //data:  { "checkboxValues": checkboxValues},
  		      success: function(response){
  		    	  location.href = location.href;
    		    	document.getElementById('contact1').style.display;
  		      }  
  		   });
}
  
		
  
  function delSevenMem(user_id) {
	  var delSevenMemValues = new Array();
	    	delSevenMemValues.push(user_id);
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?delSevenMemValues="+delSevenMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
	
		}
  function delExpireMem(user_id) {
	  var delExpireMemValues = new Array();
	  delExpireMemValues.push(user_id);
	    		  $.ajax({
	    		      type: 'POST',
	    		      url: "/MFC/specList.do?delExpireMemValues="+delExpireMemValues,
	    		      //data:  { "checkboxValues": checkboxValues},
	    		      success: function(response){
	    		    	  location.href = location.href;
	    		      }  
	    		   });
		}  
  
    
	function myFunction(){
		var input, ul, li, a, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		for(i=0; i<input.length; i++){
			if (input[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
				input[i].style.display = "";
	        } else {
	        	input[i].style.display = "none";
	        }
		} 
		   if(input.value != '' ){
	           $.ajaxSettings.traditional = true;
	           $.ajax({
	              type: 'POST',
	              url: "/MFC/specListFilter.do",
	              data:  {"name" : input.value},
	              success: function(response){
	                 $("#specTable").html(response);
	              }
	           });
		   }else{
	           $.ajaxSettings.traditional = true;
	           $.ajax({
	              type: 'POST',
	              url: "/MFC/specListFilter.do",
	              data:  {"name" : input.value},
	              success: function(response){
	                 $("#specTable").html(response);
	              }
	           });
			   
		   }
	}
	
  </script>
</head>
<body>

<!-- 회원관리 Data table -->

 
<table class="table table-bordered" style="color:white;">
      <tr>
		<th><input type="checkbox" id="allCheck" /></th>  
        <th>아이디</th>
        <th>이름</th>
        <th>성별</th>
		<th>나이</th>
		<th>E-mail</th>
		<th>몸무게</th>
		<th>키</th>
		<th>등록일</th>
		<th>만기일</th>
		<th>스케쥴관리</th>
      </tr>
    <tbody style="background:white;color:black;">
    	<c:if test="${count == 0}">
		<tr>
			<td colspan="6" align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
    	<c:if test="${count != 0}">
    		<c:forEach var="spec" items="${specs}"> 
      <tr>
	    <td> <input type="checkbox"  id="userCheck" name="userCheck" value="${spec.user_id}"></td>
        <td data-column="아이디">${spec.user_id}</td>
        <td data-column="이름">${spec.name}</td>
    	<td data-column="성별"><c:if test="${spec.gender == 1}">남자</c:if><c:if test="${spec.gender == 2}">여자</c:if> <c:if test="${spec.gender == 0}">미입력</c:if></td>
		<td data-column="나이"><c:if test="${spec.age != 0}">${spec.age}</c:if> <c:if test="${spec.age == 0}">미입력</c:if></td>
        <td data-column="E-mail"><c:if test="${spec.email != '0'}">${spec.email}</c:if> <c:if test="${spec.email == '0'}">미입력</c:if></td>
		<td data-column="몸무게"><c:if test="${spec.weight != 0}">${spec.weight}</c:if> <c:if test="${spec.weight == 0}">미입력</c:if></td>
		<td data-column="키"><c:if test="${spec.height != 0}">${spec.height}</c:if> <c:if test="${spec.height == 0}">미입력</c:if></td>
		<td data-column="등록일"  id="reg_date" ><c:if test="${spec.reg_date !=null}">${spec.reg_date}</c:if> <c:if test="${spec.reg_date==null}">미입력</c:if>	
		<td data-column="만기일" id="expire_date" ><c:if test="${spec.expire_date !=null}">${spec.expire_date}</c:if> <c:if test="${spec.expire_date==null}">미입력</c:if>
		</td>
		<td data-column="스케쥴관리" align="center">
			<button type="button" class="btn btn-primary" 
			onclick="location='managerSche.do?user_id=${spec.user_id }&num=${boardDto.num}&pageNum=${pageNum}&number=${number+1}'">스케쥴관리</button>
		</td>
      </tr>
      		</c:forEach>
      			</c:if>
    </tbody>
  </table>
	  <div align="center" class="pagein">
		  <c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
					<a href="specList.do" class="pagination">◀◀</a>
					<a href="specList.do?pageNum=${startPage-pageBlock}" class="pagination">◀</a>
				</c:if>
		  	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		  		<c:if test="${i == currentPage}">	
		  			<b class="pagination">${i}</b>	
		  		</c:if>
				<c:if test="${i != currentPage}">
					<a href="specList.do?pageNum=${i}" class="pagination">${i}</a>
				</c:if>
			</c:forEach>
			<c:if test="${pageCount > endPage}">		
				<a href="specList.do?pageNum=${startPage+pageBlock}" class="pagination">▶</a>
				<a href="specList.do?pageNum=${pageCount}" class="pagination">▶▶</a>
			</c:if>	
		</c:if>
		</div>


</body>
</html>

<!-- 수정창 -->
<div id="contact" class="w3-modal">
</div>
</body>
</html>
