<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<c:if test="${sessionScope.managerId !=null}">
	<jsp:include page="../mfc/maintop_manager.jsp">
		<jsp:param value="${sessionScope.managerId }" name="manager_id"/>
		<jsp:param value="1" name="managerSche"/>
	</jsp:include>
<link href="${project}styleSche.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<script>
$(document).ready(function() {
    var today = new Date().toISOString().split("T")[0];
    var max = today.split("-")[0]+"-12-31";
    $("#sche_date").attr("min", today);
    $("#sche_date").attr("max", max);
});
</script>			
<div class="container-fluid">
	<br>
	<h4 align="center">${user_id} 님의 운동 스케줄 </h4>
 	<div class="row">
		<div align="right">
			<button data-toggle="collapse" data-target="#insertNewSche" type="button" class="btn btn-default">운동 추가</button>
		</div>
			<div class="row">
			<div class="col-sm-3"></div>
			<div align="center" class="collapse col-sm-6" id="insertNewSche">
				<form name="insertScheForm" action="insertNewSche.do">
					 <div class="form-group">
					    <label for="workoutname">운동이름</label>
					    <select name="workout_name" id="workoutname" class="form-control">
							<c:forEach var="workout" items="${workoutList }">
								<option value="${workout.workout_name }">${workout.workout_name }</option>
							</c:forEach>
						</select>
					  </div>
					  <div class="form-group">
					    <label for="set">1세트 당 횟수</label>
					    <input onfocusout="checkSet()"  name="sche_set" type="text" class="form-control" id="set">
					  </div>
					  <div class="form-group">
					    <label for="setnum">세트 갯수</label>
					    <input onfocusout="checkSetCount()"  name="set_num" type="text" class="form-control" id="setnum">
					  </div>
					  <div class="form-group">	
							<label class="control-label" for="sche_date">스케줄 날짜</label>
							<div class="input-group date" id="datepicker">
								<input name="sche_date"  class="form-control" id="sche_date" type="date"/>
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
							    </div>
							</div>
						
						</div>
					 <input type="submit" class="btn" value="추가">
					 <input type="hidden" name="user_id" value="${user_id }">
				</form>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	<table class="table table-striped">
		<thead id="scheduleHead container-fluid">
			<tr>
			</tr>
		</thead>
		<tbody id="scheduleBody" class="container-fluid">
		    <c:if test="${scheList!=null && scheListList!=null }">
		    	<jsp:useBean id="today" class="java.util.Date" />
		    	<c:forEach var="scheListTmp" items="${scheListList }" varStatus="stat">	
		    		<fmt:formatDate var="to" value="${today}" pattern="yyyy-MM-dd" />
		    		<fmt:parseDate value = "${scheListTmp.sche_date}" var = "parse" pattern = "yyyy-MM-dd" />
					<fmt:formatDate var="sche_dateT" value="${parse}" pattern="yyyy-MM-dd" />
					<c:if test="${ stat.index mod 4 == 0  }">
						<div class="row content row-sche">
					</c:if>
						<c:if test="${sche_dateT < to}">
						<div class="col-sm-3 panel panel-past">
						</c:if>
						<c:if test="${sche_dateT == to}">
						<div class="col-sm-3 panel panel-today">
						</c:if>
						<c:if test="${sche_dateT > to}">
						<div class="col-sm-3 panel panel-future">
						</c:if>
						 	<div class="panel-heading">
						 		<div class="row">
						 			<div class="col-sm-10" data-toggle="collapse" data-target="#sche${stat.index}">
						 				<strong>
								  			<fmt:formatDate value="${parse }" type="both" pattern="yyyy년 MM월 dd일"/>
											<div>${scheList[scheListTmp.sche_date][0].workout_name }  외&nbsp;&nbsp;&nbsp;</div><div class="p-2"><span class="badge">${fn:length(scheList[scheListTmp.sche_date])} +</span></div>					
										</strong>
						 			</div>
						 			<div class="col-sm-2">
						 				<c:if test="${sche_dateT >= to}">
							  				<button class="btn btn-delete" 
							  				onclick="location.href='deleteSchePro.do?user_id=${user_id}&sche_date=${scheListTmp.sche_date}'"><span class="glyphicon glyphicon-remove"></span></button>
										</c:if>
						 			</div>
								</div>
						 	</div>
						 	<div class="panel-body">
						 		<div class="collapse" id="sche${stat.index}">
						  		<ul class="list-group" id="todayScheList">
						  			<c:forEach var="scheTmp" items="${scheList[scheListTmp.sche_date]}" varStatus="stat2">
											<li class="list-group-item" style="overflow: auto;padding:5px 5px 5px 5px;font-size: 80%;" id="black">${scheTmp.workout_name }<span style="font-size: 80%;" class="badge">${scheTmp.sche_set}/${scheTmp.set_num}</span></li>
									</c:forEach>
								</ul>
								</div>
							</div>
						</div> 
					<c:if test="${stat.index % 4 == 3 }">
						</div>
					</c:if>
				</c:forEach>	
		    </c:if>
		    <c:if test="${scheList==null || scheListList==null}">
		    	<tr>
		        	<td colspan="3">회원의 스케줄이 없습니다.</td>
		    	</tr>
		    </c:if>
		</tbody>
	</table> 
</div>

</c:if>
<c:if test="${sessionScope.managerId ==null}">
관리자가 아닙니다
</c:if>