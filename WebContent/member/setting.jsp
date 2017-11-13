<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${page_title}</title>

<c:set var="project" value="/MFC/member/"/>
<c:set var="projectPage" value="/MFC/"/>
<c:set var="part_top" value="../mfc/maintop.jsp"/>
<c:set var="part_mypage_main" value="./mypageMain.jsp"/>
<c:set var="part_mypage_modify" value="./mypageMod.jsp"/>
<c:set var="part_mypage_list" value="./mypageList.jsp"/>
<c:set var="part_mypage_sche" value="./mypageSche.jsp"/>

<c:set var="page_title" value="MFC : MyFitnessCenter 나만의 맞춤형 피트니스 트레이닝"/>
<c:set var="page_main" value="메인 페이지"/>
<c:set var="page_input" value="회 원 가 입"/>
<c:set var="page_confirm" value="아이디 중복확인"/>
<c:set var="page_login" value="로 그 인"/>
<c:set var="page_delete" value="회 원 탈 퇴"/>
<c:set var="page_classlist" value="수강 리스트"/>
<c:set var="page_healthdata" value="나의 운동데이터"/>
<c:set var="page_modify" value="회원 정보 수정"/>
<c:set var="page_mypage_main" value="마이페이지 홈"/>


<c:set var="str_id" value="아이디"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_name" value="이름"/>
<c:set var="str_jumin" value="주민등록번호"/>
<c:set var="str_tel" value="전화번호"/>
<c:set var="str_email" value="이메일"/>

<c:set var="str_spec" value="스펙"/>
<c:set var="str_expert" value="전문가여부"/>
<c:set var="str_career" value="운동경력"/>
<c:set var="str_career_1" value="경력없음"/>
<c:set var="str_career_2" value="1년이상"/>
<c:set var="str_career_3" value="3년이상"/>

<c:set var="str_miband" value="미밴드알람여부"/>
<c:set var="str_reg_date" value="가입일"/>

<c:set var="btn_login" value="로그인"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_input_member" value="회원가입"/>
<c:set var="btn_modify_member" value="정보수정"/>
<c:set var="btn_delete_member" value="회원탈퇴"/>
<c:set var="btn_logout" value="로그아웃"/>
<c:set var="btn_input" value="가입"/>
<c:set var="btn_input_cancel" value="가입취소"/>
<c:set var="btn_confirm" value="중복확인"/>	
<c:set var="btn_ok" value="확인"/>
<c:set var="btn_ok_cancel" value="확인취소"/>
<c:set var="btn_del" value="탈퇴"/>
<c:set var="btn_del_cancel" value="탈퇴취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>

<c:set var="msg_login" value="님 안녕하세요"/>
<c:set var="msg_input" value="회원정보를 입력하세요"/>		
<c:set var="msg_id_x" value="는 사용할 수 없는 아이디입니다."/>
<c:set var="msg_id_o" value="는 사용할 수 있는 아이디입니다."/>
<c:set var="msg_loginform" value="회원가입에 성공했습니다."/>
<c:set var="msg_passwd" value="비밀번호를 다시 확인하세요."/>
<c:set var="msg_modify" value="수정할 정보를 입력하세요."/>			

			
	






