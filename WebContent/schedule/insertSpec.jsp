<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
 <link href="${project}styleMember.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${project}script.js"></script>
<head>
	<!--  <link href="${project}specstyle.css" rel="stylesheet" type="text/css">
	<link href="${project}style.css" rel="stylesheet" type="text/css">-->
</head>
<script type="text/javascript">

$(document).ready(function() {
    var today = new Date().toISOString().split("T")[0];
    var max = today.split("-")[0]+"-12-31";
    $("#startday").attr("min", today);
    $("#startday").attr("max", max);
});

</script>

<body onload="specfocus()">
	  <div class="row row-form container-fluid">
	  	<div class="col-sm-4"></div>
	    <div class="col-sm-4 form" style="padding-top:2%;">
		<!-- 스펙이 하나도 없을경우 -->
			<form class="form-horizontal" name="specInputform" method="post" action="scheduleInsertSpecPro.do" onsubmit="return specInputCheck()">
				<div class="form-group">
			      <label class="control-label col-sm-4" >${str_gender }</label>
			      <div class="col-sm-6">
			        	<select name="gender" class="form-control" >
								<option value="1" selected>남</option>
								<option value="2">여</option>
						</select>
			      </div>
			      <div class="col-sm-2"></div>
			    </div>
				<div class="form-group">
					<label class="control-label col-sm-4" >${str_age}</label>
					<div class="col-sm-6">          
				        <select name="age" class="form-control" >
								<option value="1">10대</option>
								<option value="2" selected>20-30대</option>
								<option value="3">40-50대</option>
								<option value="4">50대이상</option>
						</select>
			      </div>
			      <div class="col-sm-2"></div>
				</div>
			    <div class="form-group">
			      <label class="control-label col-sm-4">${str_height}</label>
			      <div class="col-sm-6">          
			       		<input onfocusout="checkHeight()"  class="form-control"   type="text" name="height">
			       		<div id="heigthalert"></div>
			      </div>
			      <div class="form-control" style="border:0; box-shadow:none;">cm</div>
			      <div class="col-sm-2"></div>
			    </div>
			    
			    <div id="inputCheck1"></div>
			    
				<div class="form-group">
					<label class="control-label col-sm-4">${str_weight}</label>
					<div class="col-sm-6">          
			       		<input onfocusout="checkWeight()"  class="form-control"   type="text" name="weight">
			       		<div id="weightalert"></div>
			      </div>
			      <div class="form-control" style="border:0; box-shadow:none;">kg</div>
				  <div class="col-sm-2"></div>
				</div>
				
				<div id="inputCheck2"></div>
				
				<div class="form-group">
					 <label class="control-label col-sm-4">${str_goal}</label>
					  <div class="col-sm-6">   
						 <select class="2 form-control" name="goal" >
								<option value="1">체중감량</option>
								<option value="2" selected>밸런스웨이트</option>
								<option value="3">근육량증가</option>
						 </select>
						</div>
						<div class="col-sm-2"></div>
				</div>
			
				<div class="form-group">
				 <label class="control-label col-sm-4">${str_weekly_ex_num}</label>
			      <div class="col-sm-6">
			        <select class="2 form-control" name="weekly_ex_num">
						<option value="1">2-3회</option>
						<option value="2" selected>3-4회</option>
						<option value="3">4-5회</option>
						<option value="4">5-6회</option>
					</select>
			      </div>	 
			      <div class="col-sm-2"></div> 
				 </div>
				<div class="form-group">
				 <label class="control-label col-sm-4">${str_date_lately}</label>
			      <div class="col-sm-6">        
			      	<select class="2 form-control" name="date_lately">
						<option value="1" selected>1주일안</option>
						<option value="2">1개월이상</option>
						<option value="3">3개월이상</option>
						<option value="4">6개월이상</option>
					</select>
			      </div>
			      <div class="col-sm-2"></div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-4">${str_fat}</label>
					<div class="col-sm-6">          
			       		<input onfocusout="checkFat()"  class="form-control"   type="text" name="fat">
			       		<div id="fatalert"></div>
			      </div>
			      <div class="form-control" style="border:0; box-shadow:none;">kg</div>
			      <div class="col-sm-2"></div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-4">${str_muscle}</label>
					<div class="col-sm-6">          
			       		<input onfocusout="checkMuscle()"  class="form-control"   type="text" name="muscle">
			       		<div id="musclealert"></div>
			      	</div>
			      <div class="form-control" style="border:0; box-shadow:none;">kg</div>
			      <div class="col-sm-2"></div>
				</div>
				
				<div id="inputCheck3"></div>
				
				<c:if test="${onlyspec==null ||onlyspec!=1 }">	
					<div class="form-group">	
						<label class="control-label col-sm-4" >${str_startday}</label>
						<div class="col-sm-6">  
							<div class="input-group date" id="datepicker">
								<input name="startday"  class="form-control" id="startday" type="date"/>
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
							    </div>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</c:if>
				
				<br>
			    <div class="form-group" align="center">        
			      <div class="col-sm-12">
			        <button type="submit" class="btn btn-neon">확인</button>
			        <button type="button" class="btn btn-black">취소</button>
			      </div>
			    </div>
			</form>
			<c:if test="${result == '1'}">
				<script>
					function settingSpec(){
						var fat='${latelyspec.fat}';
						specInputform.gender.value='${latelyspec.gender}';
						specInputform.age.value='${latelyspec.age}';
						specInputform.height.value='${latelyspec.height}';
						specInputform.weight.value='${latelyspec.weight}';
						specInputform.goal.value='${latelyspec.goal}';
						specInputform.weekly_ex_num.value='${latelyspec.weekly_ex_num}';
						specInputform.date_lately.value='${latelyspec.date_lately}';
						if(fat!=null && fat!=undefined &&fat!=''){
							specInputform.fat.value='${latelyspec.fat}';
							specInputform.muscle.value='${latelyspec.muscle}';	
						}
					}
					settingSpec();
				</script>
			</c:if>
	    </div>
	  </div>	
</body>