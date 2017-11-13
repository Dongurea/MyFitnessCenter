<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link href="${project}main_style.css" rel="stylesheet" type="text/css">
<style>
   fieldset { 
    margin-left: 2px;
    margin-right: 2px;
    padding-top: 0.35em;
    padding-bottom: 0.625em;
    padding-left: 0.75em;
    padding-right: 0.75em;
    border: 2px groove;
    border-color: #368AFF;
   }
</style>
<style type="text/css">
   .w3-modal{
      z-index:3;
      display:none;
      padding-top:10%;
      position:fixed;
      left:0;
      top:0;
      width:100%;
      height:100%;
      overflow:auto;
      background-color:rgb(0,0,0);
      background-color:rgba(0,0,0,0.4);
   }
   
.w3-modal-content{
      margin:auto;
      background-color:#fff;
      position:relative;
      padding:0;
      outline:0;
      width:400px
   }
</style>   

<body>
<script>

$(document).ready(function(){
   chatListFunction();
   getInfiniteChat();
});   

$("#inputMessage").keypress(function(e) { 
    if(e.which == 13) { 
        $(this).blur(); 
        $("#send").focus().click();
        $("#inputMessage").val("");
        $("#inputMessage").focus();
    } 
});
function submitfunction(){
   var user_id=$("#user_id").val();
   var manager_id=$("#manager_id").val();
   var text=$("#inputMessage").val();
   var fromtext = "manager";
   $.ajax({
      type: "POST",
      url: "chatInsertPro.do",
      dataType:"text",
      data : {
         "user_id" : user_id,
         "manager_id" : manager_id,
         "text" : text,
         "fromtext" : fromtext
      }
   });
   $("#inputMessage").val("");
}
   

function chatListFunction(){
   
      var user_id=$("#user_id").val();
      var manager_id=$("#manager_id").val();
      var starttime=$("#starttime").val(); 
   
      $.ajax({
         type: "POST",
         url: "chatSelectPro.do",
         dataType:"text",
         data : {
            "user_id" : user_id,
            "manager_id" : manager_id,
            "starttime" : starttime
         },
         success: function(response){
             $("#messageWindow").html(response);
         }
      });
   }

   function getInfiniteChat(){
   
      setInterval(function(){
         chatListFunction();
      },1000);
   }

   
</script>
    <fieldset style="width:375px; height:520px">
       <input type="hidden" name="manager_id" id="manager_id" value="${chatDto.manager_id}"/>
        <input type="hidden" name="user_id" id="user_id" value="${chatDto.user_id}"/>
        <input type="hidden" name="starttime" id="starttime" value="${chatDto.texttime}"/>
        <div style="align:center; width:350px; height:500px" id="all">
           
           <div style="overflow:auto; align:center; width:340px; height:450px" id="messageWindow" >
           </div>
           
           <div class="input-group">
              <textarea class="form-control custom-control" id="inputMessage" rows="2"style="resize:none"></textarea>
              <span class="input-group-addon btn btn-primary" onclick="submitfunction()" id="send">send</span>
           </div>   
        
        </div>
        <br/>
    </fieldset>
</body>