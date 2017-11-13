<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}styleMypage.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<c:if test="${memberDto!=null }">
	<br>
	<p align="center">${sessionScope.memId}님의 회원정보입니다.</p>	
<style>
.col-sm-1{
	width:10px;
};
</style>
<div class="container-fluid">
<br><br>
  <div class="context">
  <form method="post" action="memberModifyPro.do" name="modifymyform"
		onsubmit="return modifycheck()" class="form-horizontal">
    <div class="form-group">
      <label class="control-label col-sm-4" >${str_id}</label>
      <div class="col-sm-4">
        <label class="control-label col-sm-4" >${memberDto.user_id}</label>
      </div>
    </div>
	<div class="form-group">
		<label class="control-label col-sm-4" >${str_passwd}</label>
		<div class="col-sm-3">          
        <input type="password" name="passwd" value="${memberDto.passwd}" class="form-control" placeholder="비밀번호" ><br>
		<input type="password" name="repasswd" value="${memberDto.passwd}" class="form-control" placeholder="비밀번호 확인" >
      </div>
	</div>
    <div class="form-group">
      <label class="control-label col-sm-4">${str_name}</label>
      <div class="col-sm-4">          
       <label class="control-label col-sm-4" > ${memberDto.name}</label>
      </div>
    </div>
	<div class="form-group">
		<label class="control-label col-sm-4"> ${str_spec}</label>
		<div class="col-sm-5">
			<c:if test="${memberDto.expert!=null && memberDto.expert=='1'}">
			 <input type="radio" name="expert" value="1" checked> 	${str_expert} &nbsp;
			 </c:if>
			 <c:if test="${memberDto.expert==null || memberDto.expert!='1'}">
			 <input type="radio" name="expert" value="1" > 	${str_expert} &nbsp;
			 </c:if>
			  ${str_career} &nbsp;
			  <select name="career" style="width:105px;">
					<option value="1">${str_career_1}</option>
					<option value="2">${str_career_2}</option>
					<option value="3">${str_career_3}</option>
			  </select>
		</div>
	</div>

	<div class="form-group">
	 <label class="control-label col-sm-4">${str_tel}</label>
	  <div class="col-sm-3">
	  	 <c:set var="t" value="${fn:split( memberDto.tel, '-' )}"/>
		 <input type="text" name="tel" value="${t[0]}${t[1]}${t[2]}" class="form-control" placeholder="전화번호" >
		</div>
	</div>

	<div class="form-group">
	 <label class="control-label col-sm-4">${str_email}</label>
      <div class="col-sm-3">
        <input type="text" name="email" value="${memberDto.email}" class="form-control" placeholder="이메일" >
      	<input type="hidden" name="emailcheck" value="${memberDto.email}">
      </div>
      <div class="col-sm-5">
      	<button class="btn btn-default" type="button" onclick="confirmEmail()">이메일인증</button>
      </div>  
	 </div>
	<div class="form-group">
	 <label class="control-label col-sm-4">${str_reg_date}</label>       
     <label class="text-center col-sm-3" >
    		<fmt:formatDate type="both" value="${memberDto.reg_date}"
		pattern="yyyy-MM-dd HH:mm"/>
	 </label>
	</div>
	<br>
    <div class="form-group">
   	  <div class="row">
   	  		<label class="control-label col-sm-4"></label>
	      <div class="col-sm-4">
	        <button type="submit" class="btn btn-default">수정</button>
	        <button type="reset" class="btn btn-default">취소</button>
			<button type="button" class="btn btn-default" onclick="location='memberMypage.do'">수정취소</button>
	      </div>
      </div> 
    </div>
  </form>
  </div>
</div>
<script>
modifyfocus();
</script>

</c:if>

<c:if test="${memberDto==null }">
회원정보를 불러 올 수 없습니다. 조금 있다가 다시 시도해주세요.
</c:if>