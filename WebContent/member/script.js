/**
 * 회원 관리
 */

var iderror = "아이디를 입력하세요.";
var passwderror = "비밀번호를 입력하세요.";
var repasswderror = "비밀번호가 같지 않습니다.";
var nameerror = "이름을 입력하세요."; 
var telerror = "전화번호를 모두 입력하세요."; 
var emailerror = "이메일 형식에 맞이 않습니다.";	
	
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var idnoerror = "입력하신 아이디가 없습니다.\n확인 후 다시 시도하세요.";
var passwdnoerror = "입력하신 비밀번호가 다릅니다.\n확인 후 다시 시도하세요.";
var checkerror = "아이디 중복확인을 하세요.";
var deleteerror = "회원탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요.";
var updateerror = "회원정보수정에 실패했습니다.\n잠시 후 다시 시도하세요.";

function erroralert( msg ) {
	alert( msg );
	history.back();
}


// 메인 페이지
function mainfocus() {
	mainform.user_id.focus();
}
function maincheck() {
	if( ! mainform.user_id.value ) {
		alert( iderror );
		mainform.user_id.focus();
		return false;		
	} else if( ! mainform.passwd.value ) {
		alert( passwderror );
		mainform.passwd.focus();
		return false;
	}
};

// 가입 페이지
function inputfocus() {
	inputform.user_id.focus();
}
function inputcheck() {
	if( ! inputform.user_id.value ) {
		alert( iderror );
		inputform.user_id.focus();
		return false;
	} else if(inputform.user_id.value){
		if(inputform.user_id.value!=inputform.check.value){
			alert("아이디 중복확인을 해주세요!");
			inputform.user_id.focus();
			return false;
		}
	}
	if( ! inputform.passwd.value ) {
		alert( passwderror );
		inputform.passwd.focus();
		return false;
	} else if( inputform.passwd.value != inputform.repasswd.value ) {
		alert( repasswderror );
		inputform.repasswd.focus();
		return false;
	} else if( ! inputform.name.value ) {
		alert( nameerror );
		inputform.name.focus();
		return false;
	} else if( !inputform.tel.value ) {
		alert( "전화번호를 입력해주세요" );
		inputform.tel.focus();
		return false;
	} else if( inputform.tel.value ){	
		if( inputform.tel.value.length < 10 ||  inputform.tel.value.length > 11) {
				alert( telerror );
				inputform.tel.focus();
				return false;	
		}
	}
	
	if( inputform.email.value ) {
		if( inputform.email.value.indexOf( '@' ) == -1
			|| inputform.email.value.indexOf( '.' ) == -1	) {
			alert( emailerror );
			inputform.email.focus();
			return false;
		}
		if(inputform.emailcheck.value!=inputform.email.value){
			alert( "이메일 인증을 해주세요!" );
			inputform.email.focus();
			return false;
		}
	}else if( !inputform.email.value ){
		alert( "이메일을 입력해주세요" );
		inputform.email.focus();
		return false;
	}
	// 이메일 
	// 1. null일 경우			이동
	// 2. 직접입력일 경우		입력창에 @가 없으면 경고
	// 3. 선택이력일 경우		입력창에 @가 있으면 경고	
	
	// 전화번호가 있을때나 없을때 모두 동일하게 동작해야 한다.
}

function nextjumin2() {
	if( inputform.jumin1.value.length == 6 ) {
		inputform.jumin2.focus();
	}
}
function nexttel1() {
	if( inputform.jumin2.value.length == 7 ) {
		inputform.tel1.focus();
	}
}
function nexttel2() {
	if( inputform.tel1.value.length == 3 ) {
		inputform.tel2.focus();
	}
}
function nexttel3() {
	if( inputform.tel2.value.length == 4 ) {
		inputform.tel3.focus();
	}
}
function nextemail1() {
	if( inputform.tel3.value.length == 4 ) {
		inputform.email1.focus();
	}
}

// 아이디 중복확인
function setid( user_id ) {
	opener.document.inputform.user_id.value = user_id;
	opener.document.inputform.passwd.focus();
	opener.document.inputform.check.value = user_id;
	self.close();	
}
function confirmfocus() {
	confirmform.user_id.focus();
}
function confirmcheck() {
	if( ! confirmform.user_id.value ) {
		alert( iderror );
		confirmform.user_id.focus();
		return false;
	}
}
function confirmid() {
	if( ! inputform.user_id.value ) {
		alert( iderror );
		inputform.user_id.focus();
	} else {
		var id = $("#user_id").val();
				 $.ajax({
					 	url : '/MFC/memberConfirmId.do?user_id='+id,
					 	type : "GET",
					 	success :function(result){
					 		$("#confirmid").html(result);
					 		$("#check").val(id);	
					 	}
				});	 
	}
}
function confirmEmail(){

	if( ! inputform.email.value ) {
		alert( "이메일을 입력하세요" );
		inputform.email.focus();
	} else {
		//var url = "memberConfirmEmail.do?email=" + inputform.email.value;
		//open( url, "confirm", "menubar=no, scrollbar=no, statusbar=no, width=400, height=200" );
		$('#emailSubmit').text("다시 받기");
		
		var email = $("#email").val();
		
		//alert(email);
				 $.ajax({
					 	url : '/MFC/memberConfirmEmail.do',
					 	type : "POST",	
					 	data : {'email': email
					 				},
					 	success :function(data){
					 		//alert("석세스펑션");
					 		var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
					 		
					 		if(!regExp.test(email)){
					 			//alert(emailerror);
					 			
					 		}else if(regExp.test(email)){
					 			//alert("성공넘어감");
					 			$("#confirmEmail").html(data);
					 			$("#emailbutton").click(emailcheck);
					 			//$("#code").val(getcode);
					 		}	
					 		
					 		//alert(data);
					 	}				 	
		});
				 }
	
	}
function emailcheck(){
	var	getcode = $("#getcode").val();
	if(! getcode){
		alert("코드를 입력하세요!");
		$("#getcode").focus();
		return false;
	}else{
		var email=$("#email").val();
		var code=$("#code").val();
		//alert("From server: "+code);
		if(code==null || code==""){
			code="";
		}
		if(getcode==null || getcode==""){
			getcode="";
		}
		//alert(getcode);
				 $.ajax({
					 	url : '/MFC/memberConfirmEmail.do' ,
					 	type : "POST" ,
					 	data : {	'email' : email,
					 					 'code' : code,
					 					 'getcode' : getcode},
					 	success :function(data2){
					 		//alert("코드석세스다음");
					 		if(code==getcode){
					 			inputform.emailcheck.value=inputform.email.value;
					 			$(document).ready(function(){
					 				$("#getcode").remove();
					 				$("#emailbutton").remove();
					 				$("#emailSubmit").remove();
					 				$("#firsttext").remove();
					 			});
					 		}
					 		   $("#confirmEmail").html(data2);
					 		   $("#emailbutton").click(emailcheck);
					 	}
				 });
	}
//	opener.inputform.emailcheck.value=opener.inputform.email.value;
}
// 회원 탈퇴
function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}

// 회원 정보 수정
function modifyfocus() {
	modifymyform.passwd.focus();
}
function modifycheck() {
	if( ! modifymyform.passwd.value ) {
		alert( passwderror );
		modifymyform.passwd.focus();
		return false;
	}
	if( modifymyform.passwd.value != modifymyform.repasswd.value ) {
		alert( repasswderror );
		modifymyform.repasswd.focus();
		return false;
	} else if( !modifymyform.tel.value ) {
		alert( "전화번호를 입력해주세요" );
		modifymyform.tel.focus();
		return false;
	} else if( modifymyform.tel.value ){
		if( modifymyform.tel.value.length < 10 ||  modifymyform.tel.value.length > 11) {
				alert( telerror );
				modifymyform.tel.focus();
				return false;	
		}
	}
	
	if( modifymyform.email.value ) {
		if( modifymyform.email.value.indexOf( '@' ) == -1
			|| modifymyform.email.value.indexOf( '.' ) == -1	) {
			alert( emailerror );
			modifymyform.email.focus();
			return false;
		}
		if(modifymyform.emailcheck.value!=modifymyform.email.value){
			alert( "이메일 인증을 해주세요!" );
			modifymyform.email.focus();
			return false;
		}
	}else if( !modifymyform.email.value ){
		alert( "이메일을 입력해주세요" );
		modifymyform.email.focus();
		return false;
	}
	alert("끝");
	
}

function postponeSchedule(user_id){
	var postponeSel=$("#postponeSelect option:selected").val();
	var postponeSelT=$("#postponeSelect option:selected").text();
	swal({
		  title: "Are you sure?",
		  text: "스케줄을 "+postponeSelT+" 미룹니다. 미룬후 수정 불가합니다.",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "Yes, postpone it!",
		  cancelButtonText: "No, cancel it!",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm) {
		  if (isConfirm) {
		    swal("Postponed!", "운동 스케줄이 미뤄졌습니다.", "success");
		    location.href='/MFC/schedulePostpone.do?val='+postponeSel+'&past=mypage&user_id='+user_id;
		    //location.href='http://localhost:8080/MBEx/memberMypage.do?page=3';
		  } else {
		    swal("Cancelled", "좋은 선택입니다. 미루지 말고 진행합니다.", "error");
		    return false;
		  }
		});
}











