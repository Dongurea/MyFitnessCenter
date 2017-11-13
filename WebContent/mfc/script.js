function alertSignin(){
	swal({
		  title: "Sign In!",
		  text: "회원가입을 하시면 이용하실 수 있는 서비스입니다.",
		  imageUrl: '/img/main/mark_alert.png'
		}, function () {
			  location.href='/memberInputForm.do';
		});
}

function mainTodayScheLoad(){
	$.ajax({
		   type: "POST",
		   url: "/MFC/scheduleGetForMain.do",
		   success: function(today){
			   $("#todayScheList").html($(today));
			   $("#black").css("color","white");
			   $("#black").css("background-color","#2d2d30");
		   },
		   error: function(msg) {
			  alert("ERROR: "+msg);
		   }
	});
}

function changeMainChartSize(){
	$("#myChart").height($("body").height()*0.1);
	alert($("body").height());
	alert($("#myChart").height());
}