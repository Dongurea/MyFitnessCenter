<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<c:set var="project" value="/MFC/schedule/"/>
<c:set var="part_top" value="../mfc/maintop.jsp"/>
<c:set var="part_myplan" value="myplan.jsp"/>
<c:set var="part_all" value="workoutAll.jsp"/>
<c:set var="part_high" value="workoutHigh.jsp"/>
<c:set var="part_mid" value="workoutMid.jsp"/>
<c:set var="part_low" value="workoutLow.jsp"/>
<c:set var="projectPage" value="/MFC/"/>

<c:set var="page_title" value="MFC : MyFitnessCenter 나만의 맞춤형 피트니스 트레이닝"/>
<c:set var="page_main" value="MyFitnessCenter"/>
<c:set var="page_about" value="피트니스 소개"/>
<c:set var="page_program" value="운동 프로그램"/>
<c:set var="page_diary" value="나의 다이어리"/>
<c:set var="page_guide" value="가이드북"/>

<c:set var="str_gender" value="성별"/>
<c:set var="str_age" value="나이"/> 
<!-- 1: 10대, 2: 20-30대, 3: 40-50대, 4: 50대이상 -->
<c:set var="str_height" value="키"/>
<c:set var="str_weight" value="몸무게"/>
<c:set var="str_muscle" value="근육량"/>
<c:set var="str_fat" value="체지방"/>
<c:set var="str_goal" value="운동목표"/>
<!-- 1: 체중감량, 2: 밸런스웨이트, 3: 근육량증가 -->
<c:set var="str_weekly_ex_num" value="주별운동횟수"/>
<!-- 1: 2-3회, 2: 3-4회, 3: 4-5회, 4: 5-6회 -->
<c:set var="str_date_lately" value="최근운동날짜"/>
<!-- 1: 1주일안, 2: 1개월이상, 3: 3개월이상, 4: 6개월이상 -->
<c:set var="str_startday" value="희망운동시작날짜"/>

<c:set var="page_support" value="고객지원"/>
<c:set var="page_login" value="로그인"/>
<c:set var="page_logout" value="로그아웃"/>
<c:set var="page_signin" value="회원가입"/>
<c:set var="page_mypage" value="마이페이지"/>

<c:set var="string_info" value="MFC | MyFitnessCenter"/>
<c:set var="string_info_context" value="나를 위한 피트니스 서비스"/>

<c:set var="location" value="MFC MyFitnessCenter 고객지원 1599-1599</br>
		  	서울특별시 강남구 테헤란로 126 육삼빌딩 12F"/>

<c:set var="str_id" value="아이디"/>
<c:set var="str_schedule" value="스케줄"/>
<c:set var="str_now_spec" value="나의 현재상태"/>
<c:set var="str_date" value="날짜"/>
<c:set var="str_workout" value="운동"/>
<c:set var="str_level" value="체감난이도"/>

<c:set var="btn_today_sche" value="오늘의일정"/>
<c:set var="btn_weekly_sche" value="이번주일정"/>
<c:set var="btn_all_sche" value="모든일정"/>

<c:set var="chart_today_percent" value="오늘의 수행도"/>
<c:set var="chart_weekly_cal" value="이번주 소모칼로리"/>
<c:set var="chart_today_part" value="오늘의 운동부위"/>

<c:set var="msg_Schedule_spec" value="운동을 추천 받으시겠습니까?"/>
<c:set var="msg_noSchedule" value="진행중인 스케줄이 없습니다!"/>
<c:set var="msg_nospec" value="스펙 데이터가 없습니다."/>