<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="project" value="/MFC/mfc/"/>
<c:set var="projectPage" value="/MFC/"/>

<c:set var="page_title" value="MFC : MyFitnessCenter 나만의 맞춤형 피트니스 트레이닝"/>
<c:set var="page_main" value="MyFitnessCenter"/>
<c:set var="page_about" value="피트니스 소개"/>
<c:set var="page_program" value="운동 프로그램"/>
<c:set var="page_diary" value="나의 다이어리"/>
<c:set var="page_guide" value="가이드북"/>

<c:set var="page_chat" value="상담신청"/>
<c:set var="page_support" value="고객지원"/>
<c:set var="page_login" value="로그인"/>
<c:set var="page_logout" value="로그아웃"/>
<c:set var="page_signin" value="회원가입"/>
<c:set var="page_mypage" value="마이페이지"/>
<!--
http://thelightningman.com/wp-content/uploads/2011/05/may-showers-lightning-bw-800s.jpg
https://cdn.pixabay.com/photo/2016/05/05/19/47/dark-sky-1374660_960_720.jpg
https://www.thesun.co.uk/wp-content/uploads/2017/02/nintchdbpict000304289637.jpg?strip=all&w=960
https://ak3.picdn.net/shutterstock/videos/5020175/thumb/1.jpg?i10c=img.resize(height:160)
-->
<c:set var="string_info" value="My Fitness Center"/>
<c:set var="string_info_context" value="나를 위한 피트니스 서비스"/>
<c:set var="string_mid_info" value="\" MyFitnessCenter의 맞춤형 서비스 지금 체험해 보세요! \""/>
<c:set var="title_weather" value="오늘의 날씨"/>

<c:set var="imgUrl_basic1" value="/MFC/img/main/main_2_resize.jpg"/>
<c:set var="imgUrl_basic2" value="/MFC/img/main/main_3_resize.jpg"/>

<c:set var="location" value="MFC MyFitnessCenter 고객지원 1599-1599</br>
		  	서울특별시 강남구 테헤란로 126 육삼빌딩 12F"/>