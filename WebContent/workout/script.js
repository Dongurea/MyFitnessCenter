//운동이름중복
var workoutnameerror="운동 이름이 없습니다, 확인해주세요.";

function confirmworkoutname(){
	var workoutname=document.workoutInsertForm.workout_name.value;
	if(!workoutInsertForm.workout_name.value){
		alert( workoutnameerror );
		workoutInsertForm.workout_name.focus();
	}else{
		var url = "workoutConfirmWorkoutname.do?workout_name="+workoutname;
		open( url, "confirm", "menubar=no, scrollbar=no, statusbar=no, width=500, height=300" );
	}
	
}

function workoutnameCheck(){
	if(!workoutInsertForm.workout_name.value){
		alert( workoutnameerror );
		workoutInsertForm.workout_name.focus();
		return false;
	}
}

function setworkoutname( workoutname ){
	opener.document.workoutInsertForm.workout_name.value=workoutname;
	opener.document.workoutInsertForm.check.value = "1";
	self.close();
}