<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link href="${project}schedulestyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${project }script.js"></script>
<script type="text/javascript" src="${project }miband.js"></script>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-9 text-right"> 
   	  <div>
      	<img src="/MFC/img/schedule/btn-myplan.png" alt="mi" style="width:100%;height:auto;">
      </div>
      <h3>${str_now_spec }</h3>
      <div class="col-sm text-center">
	      <div class="well table-responsive spec-well">
	      	<c:if test="${spec!=null && spec.age!=null }">
	      		<!-- 현재 가장 최신 스펙을 보여줌 
			      	연령대:, 키:, 몸무게:(평균,저체중,과체중,비만,고도비만,)
			      	근육량:(높음), 체지방:(높음,평균,낮음)
			      	목표:, 주당운동횟수:
			      -->
					<button type="button" class="btn pull-right setting-spec"
						onclick="window.location.href='scheduleInsertSpec.do?onlyspec=1'"
					>
						데이터 수정
						<span class="glyphicon glyphicon-cog"></span> 
					</button>
			      <table  class="table table-black">
			      	<thead>
			      		<tr>
				      		<th>${str_age}</th>
				      		<th>${str_height}</th>
				      		<th>${str_weight}</th>
			      		</tr>
			      	</thead>
			      	<tbody>
			      		<tr>
				      		<td>${specString.age}</td>
				      		<td>${spec.height}</td>
				      		<td>${spec.weight}</td>
			      		</tr>
			      	</tbody>
			      	<thead>
			      		<tr>
				      		<th>${str_muscle}</th>
				      		<th colspan="2">${str_fat}</th>
			      		</tr>
			      	</thead>
			      	<tbody>
			      		<tr>
				      		<td>${spec.muscle}</td>
				      		<td colspan="2">${spec.fat}</td>
			      		</tr>
			      	</tbody>
			      	<thead>
			      		<tr>
				      		<th>${str_goal}</th>
				      		<th colspan="2">${str_weekly_ex_num}</th>
			      		</tr>
			      	</thead>
			      	<tbody>
			      		<tr>
				      		<td>${specString.goal}</td>
				      		<td colspan="2">${specString.weekly_ex_num}</td>
			      		</tr>
			      	</tbody>
			      </table>
	      	</c:if>
	      	<c:if test="${spec==null || spec.age==null}">
	      		${msg_nospec}
	      	</c:if>
	      </div>
      </div>
      <div>
      	<img src="/MFC/img/schedule/mi-myplan.png" alt="mi" style="width:100%;height:auto;">
      </div>
      <hr>
      <h3>${str_schedule }</h3>
      <h6>미밴드를 연결해, 운동알람서비스를 이용해 보세요!</h6>
      <label class="switch">
		  <input id="blueConnect" type="checkbox" onchange="connectBLE()">
		  <div class="slider round"></div>
	  </label><br>
	  <c:if test="${noMoreSche!=null }">
	  	<button style="width:100%" type="button" class="btn btn-primary start-new-sche"
			onclick="location='scheduleInsertSpec.do?result=0&noMoreSche=0'">
			<h6>더 이상 진행할 운동 스케줄이 없습니다.</h6>
			새로운 운동을 시작해보세요.</button><br>
	   </c:if>
	  <div id="service"></div>
	  <script type="text/javascript">$(document).ready(function() {$("#miband").hide()});</script>
	  <div class="table-responsive spec-well" style="border:none;" id="miband">
	  	<table align="center" class="table table-black">
		  	<thead id="battery">
		  		<tr>
		  			<td style="padding-top:13%;" rowspan="4"><img width="20px" src="/MFC/img/schedule/miband.png"></td>
		  			<td colspan="3"><strong>성공적으로 연결했습니다!</strong></td>
		  		</tr>
		  		<tr>
		  			<td><strong>Bettery</strong></td>
		  			<td>
				  		<div class="progress" style="width:30px; height:15px; border:2px solid #00cc66; border-radius:2px;">
				  			<div class="progress-bar" id="battery-percent" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" id="battery-ani" style="width:70%;background-image:none;background-color:#00cc66;"></div>
				  		</div>
			  		</td>
			  		<td>
			  			<p id="battery-text">73% (charging)</p>
			  		</td>
		  		</tr>
		  		<tr>
		  			<td><strong>Steps</strong></td>
		  			<td></td>
		  			<td id="steps">15000 steps</td>
		  		</tr>
		  		<tr>
		  			<td colspan="3" id="recommandProgram"></td>
		  		</tr>
		  	</thead>
	 	</table>
	  </div>
			  
	  
      <div class="col-sm text-center">
      		<div class="btn-group-justified">
			  <a onclick="setScheHead(0,'${sessionScope.memId}')" 
			  class="btn">${btn_today_sche }</a>
			  <a onclick="setScheHead(1,'${sessionScope.memId}')" 
			  class="btn">${btn_weekly_sche }</a>
			  <a onclick="setScheHead(2,'${sessionScope.memId}',1)"
			   class="btn">${btn_all_sche }</a>
			</div>
			<br>
  	   	  	  <div id="videoPlay"></div>
  	   	  	  <div id="workoutTime"></div>
  	   	  	  <div id="workoutPro">
  	   	  	  	  <c:if test="${ todayDidSche == null}">
		  	   	  	  <button type="button" id="proToggleBtn" onclick="processing()"
		  	   	  	  	class="btn-link"
		  	   	  	  ><img src="/MFC/img/schedule/playicon.png" width="50" />
		  	   	  	  </button>
	  	   	  	  </c:if>
  	   	  	  </div>
  	   	  	  <div id="workoutEnd"></div>

  	   	  	 <table class="table">
		    <thead id="scheduleHead">
		      <tr>
		      </tr>
		    </thead>
		    <tbody id="scheduleBody">
		    <c:if test="${schedule!=null && scheduleList!=null &&
		    			scheduleList.get(0)!=null  }">
		    	<!-- 스케줄있을때, 처음은 오늘스케줄 -->
		    	<c:if test="${ todayDidSche == null}">
		    		<script>setScheHead(0,'${sessionScope.memId}');</script>
		    	</c:if>
		    	<c:if test="${ todayDidSche != null}">
		    		<tr><td id="nosche" colspan="3">오늘의 스케줄을 이미 수행했습니다.</td></tr>
		    	</c:if>
		    </c:if>
		    <c:if test="${schedule==null && scheduleList==null &&
		    			scheduleList.get(0)==null}">
		    	<tr>
		        	<td colspan="3">스케줄이 없습니다.</td>
		    	</tr>
		    </c:if>
		    </tbody>
		  </table>
		  <hr>
		  	  <!-- (오늘일정일경우)체감난이도조절 -->
	   	   	  <!--<p id="level">0</p>
	   	   	  <input type="range"> --> 
  	   	  </div>
  	    </div>
		<div class="col-sm-3 sidenav graph">
	      <div onclick="location.href='memberMypage.do?page=3'"
	      style="background-position: center;
				    background-repeat: no-repeat;
				    background-size: cover;
	      			height:100%; background-image:url(/MFC/img/schedule/side-myplan.png)" class="well well-sm">
	        <p style="color:white;font-size:150%"><br><br><br><br>내 운동의<br><strong>결과물</strong>을<br>직접<br>확인해 보세요!</p>
	        <p style="float: right;background:white;opacity: .5;">확인하러가기
	        	<span class="glyphicon glyphicon-chevron-right"></span>
	        </p>
	      </div>
	    </div>
  </div>
</div>