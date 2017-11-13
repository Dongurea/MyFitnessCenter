<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>
<link href="${project}styleMypage.css" rel="stylesheet" type="text/css">

<c:if test="${empty classlist}">
<br>
    <div class="panel panel-default text-center">
        <br>
        <div class="table table-striped">
           <h3>수강이력이 없습니다. </h3>
           <h3>지금 MFC의 다양한 프로그램을 만나보세요!</h3>
        </div>
     </div>
</c:if>

<c:if test="${!empty classlist}">
   <div class="container" style="height:100%;">
      <table class="table table-striped" >
         <tr>
            <th>번호</th>
            <th>기간</th>
            <th>프로그램명</th>
            
         </tr>
         <c:forEach var="classlist" items="${classlist}">
         <tr>
            <td>${classlist.cla_list_num}</td>
            <td><fmt:formatDate value="${classlist.classdate}" pattern="yyyy/MM"/> </td>
            <td>${classlist.classname}</td>
            
         </tr>
         </c:forEach>
      </table>
   </div>
</c:if>