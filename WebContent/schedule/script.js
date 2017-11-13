/*
 * 스케줄 페이지
 */
var msgHeight="키의 값이 올바르지 않습니다.";
var msgHeightNull="키를 입력해야합니다.";
var msgWeight="몸무게의 값이 올바르지 않습니다.";
var msgWeightNull="몸무게를 입력해야합니다.";
var msgFatMuscle="지방량과 근육량은 100과 0사이의 값이어야합니다.";
var msgFatMuscleNull="지방량과 근육량을 모두 입력해야합니다.";
var scheHead=[["동영상", "운동이름" , "횟수"],
	["날짜", "운동이름" , "성취도"],
	["날짜" , "성취도"]
];
//workoutTodayDataFromServer
var workoutsURL=[{'테스트운동':'https://www.youtube.com/embed/RoGNFsrmtvM'},
				{'테스트운동2':'https://www.youtube.com/embed/bBnWklKfYN0'},
				{'버피테스트':'https://www.youtube.com/embed/OSm1eRvS_k0'},
				{'레그시저크로스':'https://www.youtube.com/embed/Y9XXGztRM4Y'},
				{'사이드레그레이즈':'https://www.youtube.com/embed/rKNL7eME7JY'}];
var spec={'spec_date':'',
			'gender':'',
			'age':'',
			'user_id':'',
			'height':'',
			'weight':'',
			'goal':'',
			'weekly_ex_num':'',
			'date_lately':'',
			'fat':'',
			'muscle':''
		};
var playOrNot;
var workoutTodayList=[];
var workoutTodayDataFromServer=[];
var gradeTexts=[
	"너무나 쉬워 하나도 힘이 들지 않은 상태",
	"땀이 나지 않고 운동이 쉬운 상태",
	"수월하게 무리없이 진행하는 상태",
	"대화를 할 수 있고 땀이나는 상태",
	"땀이 나며 몸의 온도가 올라감을 느끼는 상태",
	"대화를 하기 힘들고 땀이 많이 나는 상태",
	"약간의 어지러움과 대화를 할 수 없는 상태",
	"어지럽고 숨을 쉬기 어려운 상태",
	"수행이 아예 불가능한 상태"
];
var currentSche=[];//현재페이지 스케줄데이터

var proBar;//프로세스바
var proBarFunc;//interval for proBar
var currentProTime=0;
var currentProcess=0;

var mibandConnection=false;
var btnPalse='<img src="/MFC/img/schedule/palseicon.png" width="50" />';
var btnPlay;

function specfocus(){
	specInputform.gender.focus();
}
function specAlert(num,msg){
	var alertDiv=document.getElementById("inputCheck"+num);
	alertDiv.innerHTML=msg;
	setTimeout(specAlertDelete(num), 3000);
}
function specAlertDelete(num){
	var alertDiv=document.getElementById("inputCheck"+num);
	alertDiv.innerHTML="";
}
function specInputCheck(){
	if(!specInputform.height.value){
		specAlert(1,msgHeightNull);
		return false;
	}
	if(!specInputform.weight.value){
		specAlert(2,msgWeightNull);
		return false;
	}
	if(specInputform.fat.value||specInputform.muscle.value){
		if(!(specInputform.fat.value&&specInputform.muscle.value)){
			specAlert(3,msgFatMuscleNull);
			return false;
		}
	}
}
function checkHeight(){
	//키에 소수점이 있으면, 소수점밑제거, 3자리아니거나 3자리중 앞자리가 3이상이면 에러
	var value=specInputform.height.value;
		
		if(value.indexOf('.')>=0){
			value=value.split('.');
			specInputform.height.value=value[0];
			value=value[0];
		}
		if(value == "" || value ==null){
			specAlert(1,msgHeight);	
			specInputform.height.focus();
			document.getElementById("heigthalert").innerHTML=msgHeightNull;
			return;
		}else{
			document.getElementById("heigthalert").innerHTML=" ";
		}
		if(value.length>2 && value.length<4 && value <=300){
			document.getElementById("heigthalert").innerHTML=" ";
		}else{
			specAlert(1,msgHeight);		
			specInputform.height.focus();
			document.getElementById("heigthalert").innerHTML=msgHeight;
			return;
		}
		specInputform.weight.focus();
}
function checkWeight(){
	var value=specInputform.weight.value;

	if(value.indexOf('.')>=0){
		value=value.split('.');
		specInputform.weight.value=value[0];
		value=value[0];
	}
	
	if(value.length<1){
		specAlert(2,msgWeight);	
		specInputform.weight.focus();
		document.getElementById("weightalert").innerHTML=msgWeightNull;
		return;
	}
	if(value.length>1&&value.length<4 && value <=300){
		document.getElementById("weightalert").innerHTML=" ";
	}else{
		specAlert(2,msgWeight);		
		specInputform.weight.focus();
		document.getElementById("weightalert").innerHTML=msgWeight;
		return;
	}
	specInputform.goal.focus();
}
function checkFat(){
	var value=  document.specInputform.fat.value; //var value=  parseFloat( document.specInputform.fat.value);
	var cnt=0;
	//점이 1개 이상일때 msg
	for(var i=0; i<value.length;i++){
		if(value[i]== "." ){
			cnt++;
		}
	}
	if(cnt >1){
		specAlert(3,msgFatMuscleDat);		
		specInputform.fat.focus();
		document.getElementById("fatalert").innerHTML=msgFatMuscleDat;
		return false;
	}else{
		document.getElementById("fatalert").innerHTML=" ";
	}
	
	var point=value.indexOf('.');
	//값이 2,2에 안맞으면 자름, 값이 0과 100사이에 들어야함.
	if(point>=0){//점이있으면
		value=value.split('.');
		if(value[1].length>2){//소수점이2이상이면
			value[1]=value[1].substring(0,2);
			specInputform.fat.value=value[0]+"."+value[1];
		}
		if(value[1] == "" || value[1] == null){
			specInputform.fat.value= value[0] + ".00";			
		}
	}

	if(value == "" || value ==null){
		specAlert(3,msgFatMuscle);
		specInputform.fat.focus();
		document.getElementById("fatalert").innerHTML=msgFatMuscleNull;
		return false;
	}else{
		document.getElementById("fatalert").innerHTML=" ";
	}
	if(value>=100 || value <=0 ){
		specAlert(3,msgFatMuscle);
		specInputform.fat.focus();
		document.getElementById("fatalert").innerHTML=msgFatMuscle;
		return false;
	}else{
		document.getElementById("fatalert").innerHTML=" ";
	}
	specInputform.muscle.focus();
}
function checkMuscle(){
	var value= specInputform.muscle.value;
	var cnt=0;
	//점이 1개 이상일때 msg
	for(var i=0; i<value.length;i++){
		if(value[i]== "." ){
			cnt++;
		}
	}
	if(cnt >1){
		specAlert(3,msgFatMuscleDat);		
		specInputform.muscle.focus();
		document.getElementById("musclealert").innerHTML=msgFatMuscleDat;
		return false;
	}else{
		document.getElementById("musclealert").innerHTML=" ";
	}
	
	
	var point=value.indexOf('.');
	//값이 2,2에 안맞으면 자름, 값이 0과 100사이에 들어야함.
	if(point>=0){//점이있으면
		value=value.split('.');
		if(value[1].length>2){//소수점이2이상이면
			value[1]=value[1].substring(0,2);
			specInputform.muscle.value=value[0]+"."+value[1];
		}
		if(value[1] == "" || value[1] == null){
			specInputform.muscle.value= value[0] + ".00";			
		}
	}
	if(value == "" || value ==null){
		specAlert(3,msgFatMuscle);
		specInputform.muscle.focus();
		document.getElementById("musclealert").innerHTML=msgFatMuscleNull;
		return;
	}else{
		document.getElementById("musclealert").innerHTML=" ";
	}
	if(value>=100 || value <=0 ){
		specAlert(3,msgFatMuscle);
		specInputform.muscle.focus();
		document.getElementById("musclealert").innerHTML=msgFatMuscle;
		return;
	}else{
		document.getElementById("musclealert").innerHTML=" ";
	}
	specInputform.startday.focus();
}
//내플랜 - 스케줄( 오늘, 주마다, 전체)
function setScheHead(num,user_id,all){
	removeVideo();
	$("#scheduleHead > tr").remove();
	$("#scheduleHead").append("<tr></tr>");
	for(var i=0;i<scheHead[num].length;i++){
		$("#scheduleHead > tr").append("<th>"+scheHead[num][i]+"</th>");
	}
	if(num==2){
		setScheBody(num,user_id,all);
	}
	else{
		setScheBody(num,user_id);
	}
}

function setScheBody(num,user_id,all){
	$("#scheduleBody > tr").remove();
	var urlSche="/MFC/scheduleGet.do?page="
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		document.getElementById("scheduleBody").innerHTML =
			this.responseText;
			
			if(num==null||num==0){
				$("#scheduleBody > tr").each(function(index,sche){
					var checktext=$("#nosche").text();
					//alert(checktext);
					if(checktext=="오늘의 스케줄이 없습니다."){
						$("#proToggleBtn").hide();
					}
					var scheSaveName= $("#today-wn-"+index).text();
					var scheSaveSet= $("#today-set-"+index).text().split("번씩");
					var saveSet= scheSaveSet[0];
					var saveCnt= scheSaveSet[1].substr(0,scheSaveSet[1].indexOf("번"));
					var scheSaveTmp= {"workout_name":scheSaveName,"sche_set":saveSet,"set_num":saveCnt};
					currentSche.push(scheSaveTmp);
				});	
				makeWorkoutList();
			}
			
		}
	};
	if(all==null){
		xhttp.open("GET", urlSche+num+"&user_id="+user_id, true);
	}else{
		xhttp.open("GET", urlSche+num+"&user_id="+user_id+"&all="+all, true);
	}
	xhttp.send();
}
//내플랜 오늘의 운동
function showVideo(name){
	removeVideo();
	var urlTmp;
	//{"workout_name":workout_name, "link":link, "sec":sec,
    //"grade": grade, "workout_part":workout_part, "workout_type":workout_type}
	for(var i=0;i<workoutTodayDataFromServer.length;i++){
		if(workoutTodayDataFromServer[i].workout_name==name){
			urlTmp=workoutTodayDataFromServer[i].link;
			break;
		}
	}
	$("#videoPlay").append(
	"<button id='videoButton' type='button' class='btn-clear trans'"+
    					" style='float: left;' onclick='removeVideo()'>"+
    				"동영상 접기 <span class='glyphicon glyphicon-chevron-down'></span></button><br>" +
	"<iframe style='width:100%;height:50%;' id='video1' src='"+urlTmp+"'></iframe>"
	);
}
function removeVideo(){
	$("#videoPlay").text("");
}
//오늘의 스케줄 수행: toggle
function processing(){
	/*
	 재생하면 운동리스트에서 횟수와 셋트, 셋트횟수를 가져와 for문
	 :) 
	 */
	var proText;
	var proBarContainer=document.getElementById("proBarContainer");
	if(proBarContainer==null){
		$("#videoPlay").after('<div id="proBarContainer" class="progress"><div id="proBar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100" style="width:0%">0%</div></div>');
		playOrNot=true;
		btnPlay=$("#proToggleBtn").html();
		$("#proToggleBtn").html(btnPalse);
		percentage();
	}else{
		$("#proBarContainer").toggle(function(){
			proText=$("#proToggleBtn").html();
			if(playOrNot==true){
				$("#proStop").remove();
				$("#proToggleBtn").html(btnPlay);
				palse();
				playOrNot=false;
			}else{
				$("#proToggleBtn").html(btnPalse);
				percentage();
				playOrNot=true;
			}
		});
	}
}
function todayWorkoutRoutine(){
	var max=workoutTodayList.length;
	var workoutNames=new Array();
	for(var i=0;i<max;i++){
		//운동이름별 +추가해야할거: 등급(초중고)/ 평균예상시간(1번당)
		//운동이름별 - 시간
		//추천운동시간별 진행- 셋트별진행 단추()
		workoutNames.push(workoutTodayList[i].workoutName);
	}

	$.ajax({
	   type: "POST",
	   data: {'workoutNames':workoutNames},//{'workoutNames':workoutNames},
	   url: "/MFC/workoutSecGet.do",
	   success: function(workouts){
		   $(workouts).find('workout').each(function(index){
			   var workout_name=$(this).find('workout_name').text();
			   var link=$(this).find('link').text();
			   var sec=$(this).find('sec').text();
			   var grade=$(this).find('grade').text();
			   var workout_part=$(this).find('workout_part').text();
			   var workout_type=$(this).find('workout_type').text();
			   
			   workoutTodayDataFromServer.push(
				    {"workout_name":workout_name, "link":link, "sec":sec,
				    "grade": grade, "workout_part":workout_part, "workout_type":workout_type}
			   );
			  //alert(workoutTodayDataFromServer[index].sec);
		   });
		  
	   },
	   error: function(msg) {
		  alert("ERROR: "+msg);
	   }
	});
}
//오늘의 스케줄 멈춤
function palse(){
	clearInterval(proBarFunc);
}
//다음운동으로 넘어갈때
function resetPercentage(){
	proBar.style.width = '1%';
	proBar.innerText= '1%';
}
//오늘의스케줄 실행, 재실행
//aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:100%"
function percentage(){
	//$("#proBar")
	$("#proToggleBtn").after('<button id="proStop" type="button" class="btn-link" onclick="stopTodaySche()"><img src="/MFC/img/schedule/stopicon.png" width="50" /></button>');
	proBar = document.getElementById("proBar"); 
    proBarFunc = setInterval(progressBarAni, 100);
}
function progressBarAni() {//l80
	var sec=workoutTodayDataFromServer[currentProcess].sec;
	var set=currentSche[currentProcess].sche_set;
	var num=currentSche[currentProcess].set_num;
	var progressMaxTime=sec*set*num*10/100;
	//180/1000=0.18
	//0.18*currentProTime
	
	var width = proBar.innerText.split('%')[0];
	if( (currentProcess==0 && width==0 )|| width==0){
		$("#proBar").after("<p>"+workoutTodayDataFromServer[currentProcess].workout_name+"</p>");
		//alert(currentSche.length+" : "+currentProcess);
	}
    if (width >= 100) {//한번다 수행했을경우
    	//currentProcess+=1;
    		currentProcess+=1;
        	if(currentProcess==workoutTodayDataFromServer.length){
        		clearInterval(proBarFunc);
        		$("#proBarContainer").hide();
    		    $("#proToggleBtn").hide();
    		    $("#proStop").hide();
    		    $("#workoutTime").hide();
    		    achieveSettingSche();
        		//alert(currentProcess+" end");
        	}else{
        		$("#workoutTime").text('');
        		width=0;
        		proBar.style.width = width + '%';
                proBar.innerText= width + '%';
                clearInterval(proBarFunc);
                if($("#blueConnect").prop("checked")){
                	mibandAlarm();
                }
                $("#proBar").after("<p>"+"5초후 시작합니다"+"</p>");
                currentProTime=0;
                setTimeout(nextOrRestart,5000);
        	}
        
    } else {
        //width++;
    	currentProTime++;
    	var timeMax= progressMaxTime*10;
    	var timeCur= currentProTime/10;
    	
    	var maxmin=Math.floor(timeMax/60);
    	var maxsec=timeMax%60;
    	if(maxmin==0){maxmin="00";}
    	if(maxsec<10){maxsec="0"+maxsec;}
    	
    	var curmin=Math.floor(timeCur/60);
    	var cursec=Math.floor(timeCur%60);
    	if(curmin==0){curmin="00";}
    	if(cursec<10){cursec="0"+cursec;}
    	

    	width=Math.floor(currentProTime/progressMaxTime);
    	$("#workoutTime").text(maxmin+":"+maxsec+" / "+curmin+":"+cursec);
        proBar.style.width = width + '%';
        proBar.innerText= width + '%';
    }
}

function nextOrRestart(){
	proBarFunc = setInterval(progressBarAni, 100);
}

//오늘의 스케줄 멈춤
function stopTodaySche(){
	palse();
	swal({
		  title: "Are you sure?",
		  text: "정말 오늘의 스케줄을 멈추시겠습니까?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Yes, stop it!",
		  cancelButtonText: "No, keep doing it!",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){
		  if (isConfirm) {
		    swal("Stoped!", "오늘의 스케줄을 마칩니다.", "success");
		    var half=workoutTodayDataFromServer.length/2;
		    if(currentProcess > half){
		    	$("#proBarContainer").hide();
			    $("#proStop").hide();
		    	$("#proToggleBtn").hide();
		    	$("#workoutTime").hide();
		    	achieveSettingSche();
		    }else{
		    	$("#workoutTime").text("");
        		proBar.style.width = '0%';
                proBar.innerText= '0%';
                currentProTime=0;
		    	processing();
		    }
		  } else {
		    swal("Cancelled", "오늘의 스케줄을 계속합니다!", "error");
		    proBarFunc = setInterval(progressBarAni, 100);
		  }
		});
}
//오늘의 스케줄 운동동영상 못보게하기
function unclickable(){
	//$("").attr("disabled",true);
	//$("").removeAttr("disabled");
}
//오늘스케줄 수행도를 저장하고, 서버로 보냄
function endTodaySche(){
	
}
var achieveNum=0;
//성취도 단계에 따라서 정보제공
function achieveG(num){
	var bgcolor;
	achieveNum=num+1;
	$("#gradesA > .btn-achieve").each(function(index,btn){
		if(index<=num){
			$(btn).css("background-color","#CCFF00");
			$(btn).css("color","#2d2d30");
			bgcolor=$(btn).css("background-color");
		}else{
			if($(btn).css("background-color")==bgcolor){
				$(btn).css("background-color","#2d2d30");
				$(btn).css("color","white");
			}
		}
	});
	$("#gradeText > h6").remove();
	$("#gradeText").append("<h6>"+gradeTexts[num]+"</h6>");
}
//오늘스케줄이 끝났습니다. 성취도를 선택해주세요
function achieveSettingSche(){
	$("#workoutEnd").append("<div id='gradeCheck' class='well' >" +
		"<h2>오늘의 성취도</h2>" +
		"<h4>오늘의 운동은 어느정도 단계였나요?</h4>" +
			"<div id='gradesA' class='btn-group btn-achieve-g'>"+
				"<button id='grade0' onclick='achieveG(0)' type='button' class='btn-achieve'> 1 </button>"+
				"<button id='grade1' onclick='achieveG(1)' type='button' class='btn-achieve'> 2 </button>"+
				"<button id='grade2' onclick='achieveG(2)' type='button' class='btn-achieve'> 3 </button>"+
				"<button id='grade3' onclick='achieveG(3)' type='button' class='btn-achieve'> 4 </button>"+
				"<button id='grade4' onclick='achieveG(4)' type='button' class='btn-achieve'> 5 </button>"+
				"<button id='grade5' onclick='achieveG(5)' type='button' class='btn-achieve'> 6 </button>"+
				"<button id='grade6' onclick='achieveG(6)' type='button' class='btn-achieve'> 7 </button>"+
				"<button id='grade7' onclick='achieveG(7)' type='button' class='btn-achieve'> 8 </button>"+
				"<button id='grade8' onclick='achieveG(8)' type='button' class='btn-achieve'> 9 </button>" +
  			"</div><br><br>" +
		"<button type='button' onClick='sendAchieve()' class='btn'>확인</button><br><br>"+
		"<div id='gradeText'></div>"+
	"</div>");
}
function sendAchieve(){
	location.href='/MFC/updateAchieveAndComplete.do?complete='+currentProcess+'&achieve='+achieveNum;
}
//오늘의 스케줄 운동이름, 셋트-횟수저장
function makeWorkoutList(){
	$("#scheduleBody > tr").each(function(index){
		var workoutName=$("#today-wn-"+index).text();
		var setTmp=$("#today-set-"+index).text();
		var set=setTmp.split(" ");
		set[0]=set[0].substring(0,set[0].indexOf("번씩"));
		set[1]=set[1].substring(0,set[1].indexOf("번"));
		
		workoutTodayList.push({"workoutName":workoutName,
			"set":set[0], "setNum":set[1]});
		//alert(workoutTodayList[index].workoutName+"\n"+
				//workoutTodayList[index].set+"\n"+
				//workoutTodayList[index].setNum);
	});
	todayWorkoutRoutine();
}

//블루투스 커넥션

function connectBLE(){
	var isChecked=$("#blueConnect").prop("checked");
	var deviceAgent = navigator.userAgent.toLowerCase();
	var isAndroid = deviceAgent.indexOf("android") > -1; //&& ua.indexOf("mobile");
	var androidversion = parseFloat(deviceAgent.slice(deviceAgent.indexOf("Android")+8));
	if(isChecked){//is checked
		if(isAndroid){
			text=document.getElementById("service");
			$("#service").html('미밴드와 연결중입니다! <i class="fa fa-circle-o-notch fa-spin" style="font-size:24px"></i><br>');
			return miband.connect().then(result => {
				if(result){
					return miband.getSteps(miband.device)
				}
				return true
			})
			.then(result =>{
				if(result){
					if(miband.steps<5000){
						$("#recommandProgram").html("<p>활동이 적으시군요!</p><h6>추천운동: 걷기&조깅</h6>");
					}else if(miband.steps<10000){
						$("#recommandProgram").html("<p>충분히 활동하셨네요!</p><h6>추천운동: 필라테스</h6>");
					}else{
						$("#recommandProgram").html("<p>활동이 많으시군요!</p><h6>추천운동: 요가</h6>");
					}
					$("#steps").text(miband.getStep()+" steps");
					return miband.getBatteryData()
				}
				return true
			})
			.then(result =>{
				if(result){
					$("#battery-percent").width(miband.batterydata[0]+"%");
					$("#battery-text").text(miband.batterydata[0]+"% ("+miband.batterydata[1]+")");
					$("#service").html('');
					$("#miband").show();
				}
				return true
			})
			.catch(error =>{
				text.textContent="블루투스 연결상태가 좋지 않습니다.\n다시한번 연결을 시도해 주세요!";
		    	  $("#blueConnect").prop("checked",false);
			});
		}else{
			text.textContent="해당 기능을 지원하지 않는 기기입니다!";
			$("#blueConnect").prop("checked",false);
		}
	}
}
function mibandAlarm(){
	if(!miband.isConnected){
    	return miband.connect()
    	.then(result =>{
    		if(result){
    			return miband.immidiateAlert(miband.device);
    		}else{
    			//alert("CAN NOT Connect... try again!");
    			return mibandAlarm()
    		}
    	})
    	.catch(error =>{
    		//alert("[ERROR]CAN NOT Connect... try again!");
    		return mibandAlarm()
    	});
    }else{
    	return miband.immidiateAlert(miband.device);
    }
}


//-----------------------------------------------------------------------------------------------------------------
function checkHeight(){
	//키에 소수점이 있으면, 소수점밑제거, 3자리아니거나 3자리중 앞자리가 3이상이면 에러
	var value=specInputform.height.value;
		
		if(value.indexOf('.')>=0){
			value=value.split('.');
			specInputform.height.value=value[0];
			value=value[0];
		}
		if(value == "" || value ==null){
			specAlert(1,msgHeight);	
			specInputform.height.focus();
			document.getElementById("heigthalert").innerHTML=msgHeightNull;
			return;
		}else{
			document.getElementById("heigthalert").innerHTML=" ";
		}
		if(value.length>2 && value.length<4 && value <=300){
			document.getElementById("heigthalert").innerHTML=" ";
		}else{
			specAlert(1,msgHeight);		
			specInputform.height.focus();
			document.getElementById("heigthalert").innerHTML=msgHeight;
			return;
		}
		specInputform.weight.focus();
}
function checkWeight(){
	var value=specInputform.weight.value;

	if(value.indexOf('.')>=0){
		value=value.split('.');
		specInputform.weight.value=value[0];
		value=value[0];
	}
	
	if(value.length<1){
		specAlert(2,msgWeight);	
		specInputform.weight.focus();
		document.getElementById("weightalert").innerHTML=msgWeightNull;
		return;
	}
	if(value.length>1&&value.length<4 && value <=300){
		document.getElementById("weightalert").innerHTML=" ";
	}else{
		specAlert(2,msgWeight);		
		specInputform.weight.focus();
		document.getElementById("weightalert").innerHTML=msgWeight;
		return;
	}
	specInputform.goal.focus();
}
function checkFat(){
	var value=  document.specInputform.fat.value; //var value=  parseFloat( document.specInputform.fat.value);
	var cnt=0;
	//점이 1개 이상일때 msg
	for(var i=0; i<value.length;i++){
		if(value[i]== "." ){
			cnt++;
		}
	}
	if(cnt >1){
		specAlert(3,msgFatMuscleDat);		
		specInputform.fat.focus();
		document.getElementById("fatalert").innerHTML=msgFatMuscleDat;
		return false;
	}else{
		document.getElementById("fatalert").innerHTML=" ";
	}
	
	var point=value.indexOf('.');
	//값이 2,2에 안맞으면 자름, 값이 0과 100사이에 들어야함.
	if(point>=0){//점이있으면
		value=value.split('.');
		if(value[1].length>2){//소수점이2이상이면
			value[1]=value[1].substring(0,2);
			specInputform.fat.value=value[0]+"."+value[1];
		}
		if(value[1] == "" || value[1] == null){
			specInputform.fat.value= value[0] + ".00";			
		}
	}

	if(value == "" || value ==null){
		specAlert(3,msgFatMuscle);
		specInputform.fat.focus();
		document.getElementById("fatalert").innerHTML=msgFatMuscleNull;
		return false;
	}else{
		document.getElementById("fatalert").innerHTML=" ";
	}
	if(value>=100 || value <=0 ){
		specAlert(3,msgFatMuscle);
		specInputform.fat.focus();
		document.getElementById("fatalert").innerHTML=msgFatMuscle;
		return false;
	}else{
		document.getElementById("fatalert").innerHTML=" ";
	}
	specInputform.muscle.focus();
}
function checkMuscle(){
	var value= specInputform.muscle.value;
	var cnt=0;
	//점이 1개 이상일때 msg
	for(var i=0; i<value.length;i++){
		if(value[i]== "." ){
			cnt++;
		}
	}
	if(cnt >1){
		specAlert(3,msgFatMuscleDat);		
		specInputform.muscle.focus();
		document.getElementById("musclealert").innerHTML=msgFatMuscleDat;
		return false;
	}else{
		document.getElementById("musclealert").innerHTML=" ";
	}
	
	
	var point=value.indexOf('.');
	//값이 2,2에 안맞으면 자름, 값이 0과 100사이에 들어야함.
	if(point>=0){//점이있으면
		value=value.split('.');
		if(value[1].length>2){//소수점이2이상이면
			value[1]=value[1].substring(0,2);
			specInputform.muscle.value=value[0]+"."+value[1];
		}
		if(value[1] == "" || value[1] == null){
			specInputform.muscle.value= value[0] + ".00";			
		}
	}
	if(value == "" || value ==null){
		specAlert(3,msgFatMuscle);
		specInputform.muscle.focus();
		document.getElementById("musclealert").innerHTML=msgFatMuscleNull;
		return;
	}else{
		document.getElementById("musclealert").innerHTML=" ";
	}
	if(value>=100 || value <=0 ){
		specAlert(3,msgFatMuscle);
		specInputform.muscle.focus();
		document.getElementById("musclealert").innerHTML=msgFatMuscle;
		return;
	}else{
		document.getElementById("musclealert").innerHTML=" ";
	}
	specInputform.startday.focus();
}
//-----------------------------------------------------------------------------------------------------------
