function login(){
   alert("로그인 후 이용 가능합니다");
}

function chatFind(){
   $.ajax({
      type: "POST",
      url: "chatroomFindPro.do",
      dataType:"text",
      success: function(response){
            var result=$(response).filter("#result").text();
            var chatroomnum=$(response).filter("#num").text();
            if(result!=0){
               openChat(chatroomnum);
            }else{
               alert("현재 채팅이 불가능합니다.");
            }         
      }
   });
}
function openChat(chatroomnum){
   $.ajax({
      type : "POST",
      url : "chatroomMakeUserPro.do",
      data : {
         "chatroomnum" : chatroomnum
      },
      success : function(response){
         $("#chat").html(response);
      }
   });
   document.getElementById('contact').style.display='block';
}
function closeChatwindow(){
   document.getElementById('contact').style.display='none';
   $("#inputMessage").val('회원님이 상담을 종료하셨습니다.');
   submitfunction();
}