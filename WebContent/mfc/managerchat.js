$(document).ready(function(){
      getManagerChatroomnum();
      getInfiniteChat();
   });

function stopchat(){
   $("#chatCheck").val('1');
}

function getManagerChatroomnum(){
   $.ajax({
      type: "POST",
      url: "getManagerChatroomnumPro.do",
      datatype: "xml",
      success: function(response){
            var check= $(response).filter("#checkresult").text();
            $("#chatroomnum").val(check);   
          }
   });
}

function chatCheckfunction(){
   var chatroomnum = $("#chatroomnum").val();   
   $.ajax({
      type : "POST",
      url : "chatCheckPro.do",
      data : {
         "chatroomnum" : chatroomnum
      },
      success : function(response){
         var result=$(response).filter("#result").text();
         if(result==1){
            alert("상담신청도착");
            chatStart();
         }
      }
   });
}
function chatStart(){
   $("#chatCheck").val('1');
   var chatroomnum = $("#chatroomnum").val();   
   $.ajax({
      type : "POST",
      url : "chatroomMakeManagerPro.do",
      data : {
         "chatroomnum" : chatroomnum
      },
      success : function(response){
            $("#chat").html(response);
      }
   });
   document.getElementById('contact').style.display='block';
}
function getInfiniteChat(){
   setInterval(function(){
      if($("#chatCheck").val()==0){
         chatCheckfunction();
      }
   }, 2000);
}
function closeChat(){
   document.getElementById('contact').style.display='none';
   window.location.reload();
}