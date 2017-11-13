/**
 * 
 */

var loginerror="로그인을 해야 이용할 수 있습니다";
var mloginerror="관리자로 로그인을 해야 이용할 수 있습니다.";

var classnameerror="프로그램명을 입력해주세요";
var classintroerror="프로그램 소개를 입력해주세요";
var classtimeerror="프로그램 시간을 입력해주세요";
var classdayerror="프로그램 요일을 입력해주세요";
var tuitionerror = "프로그램 가격을 입력해주세요";
var maxstuerror ="프로그램 최대 인원을 입력해주세요";
var insnameerror = "프로그램 강사를 선택해주세요";
var curstuerror = "프로그램 최대인원이 현재인원보다 적습니다.";
var msg_classstu ="수강한 학생만 댓글을 남길 수 있습니다";
var cannotDelete="수강 예약한 학생이 있는 프로그램은 삭제할 수 없습니다.";
var classnamecheckerror="프로그램명 중복확인을 하세요";

$(document.classInsertForm).ready(function(){
   $("#classTime").change(function(){
        if($("#classTime").is(":checked")){
           $("#class_time").attr("checked", false);
        }
    });
});

function logincheck(){
   if($(sessionScope.memId==null)){
      alert(loginerror);
      return false;
   }
}

function mlogincheck(){
   if($(sessionScope.managerId==null)){
      alert(mloginerror);
      return false;
   }
}

function noCancel(){
   alert(cannotDelete);
}

//프로그램이름 중복
function confirmClassname(){
   var classname=document.classInsertForm.classname.value;
   if(!classInsertForm.classname.value){
      alert( classnameerror );
      classInsertForm.classname.focus();
   }else{
      var url = "clsBoardConfirmClassname.do?classname="+classInsertForm.classname.value;
      open( url, "confirm", "menubar=no, scrollbar=no, statusbar=no, width=500, height=150" );
   }
   
}
function classnameCheck(){
   if(!confirmClassnameForm.classname.value){
      alert( classnameerror );
      confirmClassnameForm.classname.focus();
      return false;
   }
}

function setClassname( classname ){
   opener.document.classInsertForm.classname.value=classname;
   opener.document.classInsertForm.check.value = "1";
   self.close();
}
//예약
function programBook(){
   
   var classname=document.replyUpdateForm.classname.value;
   var classdate =document.replyUpdateForm.classdate.value;
   //var programBookMonth=document.getElementById("programBookMonth").value;
   
   if(confirm(classname+" 프로그램을 예약하시겠습니까?")){
      location.href="programBookPro.do?classname="+classname+"&classdate="+classdate;
   }
}

function programBookCancel(){
   var classname=document.replyUpdateForm.classname.value;
   var classdate =document.replyUpdateForm.classdate.value;
   //var programBookMonth=document.getElementById("programBookMonth").value;
   if(confirm(classname+"프로그램을 취소하시겠습니까?")){
      location.href="programBookCancelPro.do?classname="+classname+"&classdate="+classdate;
   }
}


//댓글
//function replyUpdate(){
//   $("p[name='class_day']")
//}

//강사찾기


function findinsInsert(){
   var url = "findInsPro.do?formname=classInsertForm";
   open( url, "confirm", "menubar=no, scrollbar=no, statusbar=no, width=300, height=500" );
}

function findinsModify(){
   var url = "findInsPro.do?formname=classModifyForm";
   open( url, "confirm", "menubar=no, scrollbar=no, statusbar=no, width=300, height=500" );
}

function setInsInsert(){
   
   var myUL = document.getElementById("myUL");
   if(myUL.value==''){
      alert("강사를 선택해주세요.");
   }else{
      opener.document.classInsertForm.ins_name.value=myUL.value;
      self.close();   
   }
   
}

function setInsModify(){
   var myUL = document.getElementById("myUL");
   if(myUL.value==''){
      alert("강사를 선택해주세요.");
   }else{
   
   opener.document.classModifyForm.ins_name.value=myUL.value;
   self.close();   
   }
}


//insertClass

function insertclasscheck(){
   
   if(!classInsertForm.check.value){
      alert(classnamecheckerror);
      classInsertForm.classname.focus();
      return false;
   }else if(!classInsertForm.classname.value){
      alert(classnameerror);
      classInsertForm.classname.focus();
      return false;
   }else if(!classInsertForm.class_intro.value){
      alert(classintroerror);
      classInsertForm.class_intro.focus();
      return false;
   }else if(!$("input:radio[name='class_time']").is(":checked")){
      alert(classtimeerror);
      return false;
   }else if(!$("input:checkbox[name='class_day']").is(":checked")){
      alert(classdayerror);
      return false;
   }else if(!classInsertForm.tuition.value){
      alert(tuitionerror);
      classInsertForm.tuition.focus();
      return false;
   }else if(!classInsertForm.max_stu.value){
      alert(maxstuerror);
      classInsertForm.max_stu.focus();
      return false;
   }else if(!classInsertForm.ins_name.value){
      alert(insnameerror);
      classInsertForm.ins_name.focus();
      return false;
   }
   
   
}

//update class
function updateclasscheck(){
   alert(classModifyForm.cur_stu.value+">"+classModifyForm.max_stu.value);
   if(classModifyForm.cur_stu.value-0>classModifyForm.max_stu.value-0){
	   alert(curstuerror);
      classModifyForm.max_stu.focus();
      return false;
   }
   
   if(!classModifyForm.classname.value){
      alert(classnameerror);
      classModifyForm.classname.focus();
      return false;
   }else if(!classModifyForm.class_intro.value){
      alert(classintroerror);
      v.class_intro.focus();
      return false;
   }else if(!$("input:radio[name='class_time']").is(":checked")){
      alert(classtimeerror);
      return false;
   }else if(!$("input:checkbox[name='class_day']").is(":checked")){
      alert(classdayerror);
      return false;
   }else if(!classModifyForm.tuition.value){
      alert(tuitionerror);
      classModifyForm.tuition.focus();
      return false;
   }else if(!classModifyForm.max_stu.value){
      alert(maxstuerror);
      classModifyForm.max_stu.focus();
      return false;
   }else if(!classModifyForm.ins_name.value){
      alert(insnameerror);
      classModifyForm.ins_name.focus();
      return false;
   }
   
}