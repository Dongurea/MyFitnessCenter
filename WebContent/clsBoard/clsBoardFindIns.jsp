<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>강사 검색</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	.no-scroll::-webkit-scrollbar {display:none;}
	.no-scroll::-moz-scrollbar {display:none;}
	.no-scroll::-o-scrollbar {display:none;}
	.no-scroll::-google-ms-scrollbar {display:none;}
	.no-scroll::-khtml-scrollbar {display:none;}
.btn{display:inline-block;
padding:6px 12px;
margin-bottom:0;
font-size:14px;
font-weight:400;
line-height:1.42857143;
text-align:center;
white-space:nowrap;
vertical-align:middle;
-ms-touch-action:manipulation;
touch-action:manipulation;
cursor:pointer;
-webkit-user-select:none;
-moz-user-select:none;
-ms-user-select:none;
user-select:none;
background-image:none;
border:1px solid transparent;
border-radius:0px;
transition: .2s;
}

.btn-spec{
background-color:#333;
color: #fff;
}

/* On hover, the color of .btn will transition to white with black text */
.btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
}
</style>


<body>
<script src="clsBoard/script.js"></script>
<div class="w3-container" style="text-align:center;">
  <h2>강사이름</h2>
  <p>이름을 검색하세요.</p>

  <input class="w3-input w3-border w3-padding" type="text" placeholder="Search for names.." id="myInput" onkeyup="myFunction()">
  <select class="w3-ul w3-margin-top no-scroll" id="myUL" style="width:300" size="10">
    <c:forEach var="insname" items="${insnames}">
    <option style="height:30px" value="${insname}">${insname}</option>
    </c:forEach>
  </select>
</div>

<script>
function myFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("option");
    for (i = 0; i < li.length; i++) {
        if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script>
<br>
<div align="center">
	<c:if test="${formname=='classInsertForm'}">
	 <button type="button" class="btn btn-spec" onclick="setInsInsert()">확인</button>
	</c:if> 
	<c:if test="${formname=='classModifyForm'}">
	  <button type="button" class="btn btn-spec" onclick="setInsModify()">확인</button>
	</c:if>
	 <button type="button" class="btn btn-spec" onclick="self.close()">취소</button>
	 </div>
</body>
</html>
