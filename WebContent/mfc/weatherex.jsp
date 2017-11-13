<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>


<div class="thumbnail weather" style="margin:0px;padding:0px;height:auto;">
  <!-- 날씨 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 로그인하기전-->                           
	<div class="weather-app" style="margin:0px;padding:0px;height:auto;">
	  <img id="icon" style="padding:0px;width:100%; height:auto;"  src="${project}img/codes/200.jpg"/>                       
	    <div style="margin:0px;padding:0px;height:auto;" class="temperature">
	       <strong style="margin:0px;padding:0px;"><h3 class="w3-jumbo w3-animate-top" id="temperature" style="display: inline;">0</h3>&deg;c</strong>
	   	   <p class="w3-large w3-center" id="location" style="margin:0px;padding:0px;">위치 미설정</p>
	    </div> 
	  <div class="wear"><span id="wear">위치설정을 허용해야합니다!</span></div>
      <img src="${project}img/humidity.png" height="16px" />
      <p class="w3-large w3-center" style="display: inline;" id="humidity">0</p>%
	</div>
<!-- 날씨 끝나는부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
</div>