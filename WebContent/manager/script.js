 var msgSet="1세트 당 횟수는 두자리 이하로 입력해주세요.";
  var msgSetNull="1세트 당 횟수를 입력해주세요.";
  var msgSetNum="세트 갯수는 두자리 이하로 입력해주세요.";
  var msgSetNumNull="세트 갯수를 입력해주세요.";

  function SetAlert(num,msg){
  	var alertDiv=document.getElementById("inputCheck"+num);
  	alertDiv.innerHTML=msg;
  	setTimeout(SetAlertDelete(num), 3000);
  }
  function SetAlertDelete(num){
  	var alertDiv=document.getElementById("inputCheck"+num);
  	alertDiv.innerHTML="";
  }

  function checkSet(){
  	var value= document.insertScheForm.sche_set.value;
  	
  	if(value =="" || value ==""){
  		SetAlert(1,msgSet);
  		insertScheForm.sche_set.focus();
  		document.getElementById("setalert").innerHTML=msgSetNull;
  		return;
  	}else{
  		document.getElementById("setalert").innerHTML=" ";
  	}
  	
  	if(value.length <=2 ){
  		document.getElementById("setalert").innerHTML=" ";
  	}else{
  		SetAlert(1,msgSet);
  		insertScheForm.sche_set.focus();
  		document.getElementById("setalert").innerHTML=msgSet;
  		return;
  	}
  	document.insertScheForm.set_num.focus();
  }
  
  function checkSetCount(){
	  	var value= document.insertScheForm.set_num.value;
	  	
	  	if(value =="" || value ==""){
	  		SetAlert(2,msgSet);
	  		insertScheForm.set_num.focus();
	  		document.getElementById("setnumalert").innerHTML=msgSetNumNull;
	  		return;
	  	}else{
	  		document.getElementById("setnumalert").innerHTML=" ";
	  	}
	  	if(value.length <=2 ){
	  		document.getElementById("setnumalert").innerHTML=" ";
	  	}else{
	  		SetAlert(2,msgSet);
	  		insertScheForm.set_num.focus();
	  		document.getElementById("setnumalert").innerHTML=msgSetNum;
	  		return;
	  	}
	  	document.insertScheForm.sche_date.focus();
	  }