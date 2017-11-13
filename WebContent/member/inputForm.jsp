<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="${project}styleMember.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<style>
.col-sm-1{
   width:10px;
};
</style>
<script>
window.load=inputfocus();
</script>
<div class="row-form container-fluid">
   <div class="col-sm-3">
   </div>
   <div class="col-sm-6 form">
      <div class="context block">
      <br><br>
        <form method="post" action="memberInputPro.do" name="inputform"
            onsubmit="return inputcheck()">
          <div class="row form-group">
            <label class="text-right control-label col-sm-4" >${str_id}</label>
            <div class="col-sm-5">
                 <input type="text" id="user_id" class="form-control" name="user_id" maxlength="15" placeholder="아이디">
                 <input type="hidden" name="check" id="check">
                 <div id="confirmid"></div>
            </div>
            <div class="col-sm-2">
               <button class="btn btn-default" type="button" onclick="confirmid()">${btn_confirm}</button>
            </div>
          </div>
          <div class="row form-group">
            <label class="text-right control-label col-sm-4" >${str_passwd}</label>
            <div class="col-sm-5">          
                 <input type="password" name="passwd" class="form-control" placeholder="비밀번호" ><br>
                 <input type="password" name="repasswd" class="form-control" placeholder="비밀번호 확인" >
               </div>
         </div>
         <div class="row form-group">
            <label class="text-right control-label col-sm-4">${str_name}</label>
            <div class="col-sm-5">          
             <input type="text" name="name" class="form-control" placeholder="이름" maxlength="20">
            </div>
          </div>
          <div class="row form-group">
            <label class="text-right control-label col-sm-4"> ${str_spec}</label>
            <div class="col-sm-6">
                <input type="radio" name="expert" value="1" >    ${str_expert} &nbsp;
                 ${str_career} &nbsp;
                 <select name="career" style="width:105px;">
                     <option value="1">${str_career_1}</option>
                     <option value="2">${str_career_2}</option>
                     <option value="3">${str_career_3}</option>
                 </select>
            </div>
         </div>
         <div class="row form-group">
          <label class="text-right control-label col-sm-4">${str_tel}</label>
           <div class="col-sm-5">
             <input type="text" name="tel" class="form-control" placeholder="전화번호" >
            </div>
         </div>
         <div class="row form-group">
          <label class="text-right control-label col-sm-4">${str_email}</label>
            <div class="col-sm-5">
              <input type="text" id="email" name="email" class="form-control" placeholder="이메일" >
              <input type="hidden" name="emailcheck">
               <div id="confirmEmail"></div>
            </div>
            <div class="col-sm-2">
               <button class="btn btn-default" id="emailSubmit" type="button" onclick="confirmEmail()">이메일인증</button>
            </div> 
         </div>
         <br>
          <div class="row form-group">
              <div class="row text-center">
               <div class="col-sm-12">
                 <button type="submit" class="btn btn-neon">${btn_input}</button>
                 <button type="reset" class="btn btn-black">${btn_cancel}</button>
               <button type="button" class="btn btn-black" onclick="location='mfcMain.do'">${btn_input_cancel}</button>
               </div>
            </div> 
         </div>
         </form>
      </div>
   </div>
   <div class="col-sm-3">
   </div>
</div>






