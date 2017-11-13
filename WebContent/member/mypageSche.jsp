<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}styleSche.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>
<script src="${project}chart_util.js"></script>
<script src="${project}chart_bundle.js"></script>
<script src="${project}showData.js"></script>
<style>
canvas{
-moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
}
</style>
<link href="${project}styleMypage.css" rel="stylesheet" type="text/css">
<h3>운동의 결과물</h3>
<c:if test="${ scheList!=null && scheListList!=null && specList!=null }">
	<h6>수고하셨습니다! 그동안의 결과물입니다.</h6>
	<c:forEach var="spec" items="${specList }">
		<script>
			dataForLineFat.push('${spec.fat}');
			dataForLineMuscle.push('${spec.muscle}');
		    dataForBar.push('${spec.weight}');
		    labelForDate.push('${spec.spec_date}');
		</script>
	</c:forEach>
	<script>
	dataForDonut.push('${ache}');
	dataForDonut.push('${nonAche}');
    dataForRadarReal[0]='${burn_r}';
	dataForRadarReal[1]='${multi_r}';
	dataForRadarReal[2]='${pump_r}';
    dataForRadarSche[0]='${burn}';
    dataForRadarSche[1]='${multi}';
    dataForRadarSche[2]='${pump}';
	window.onload = makeCharts;</script>
</c:if>
<c:if test="${scheList==null || scheListList==null || specList==null }">
	<h6>운동 데이터 차트를 만들기 위한 데이터가 부족합니다. 더 열심히 합시다!</h6>
	<style>
	.nodata-available{
		height:0px;
	}
	</style>
</c:if>
<div class="row nodata-available">
	<div class="col-sm-4 nodata-available" style="background:white;">
		<canvas id="comp-donut"></canvas>
	</div>
	<div class="col-sm-8 nodata-available" style="background:white;">
		<canvas id="weight-bar"></canvas>
	</div>
</div>
<br>
<div class="row nodata-available">
	<div class="col-sm-4 nodata-available" style="background:#white;">
		<canvas id="workout-part-rader"></canvas>
	</div>
	<div class="col-sm-8 nodata-available" style="background:white;">
		<canvas id="fat-muscle-line"></canvas>
	</div>
</div>
<hr>
<h3>운동스케줄 살피기</h3>
<div class="container-fluid">
	<br>
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
								</div>
						 	</div>
						 	<div class="panel-body">
						 		<div class="collapse" id="sche${stat.index}">
						  		<ul class="list-group" id="todayScheList">
						  			<c:forEach var="scheTmp" items="${scheList[scheListTmp.sche_date]}" varStatus="stat2">
											<li style="overflow: auto;padding:5px 5px 5px 5px;font-size: 80%;" class="list-group-item" id="black">${scheTmp.workout_name }<span style="font-size: 80%;" class="badge">${scheTmp.sche_set}/${scheTmp.set_num}</span></li>
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