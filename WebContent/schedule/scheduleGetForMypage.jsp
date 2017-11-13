<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<c:if test="${scheListList!=null && scheList!=null && user_id!=null}">
	<c:forEach var="scheListTmp" items="${scheListList }" >	
		<div class="panel panel-default">
		 	<div class="panel-heading">
		 		<div class="row panel-row">
    				<div class="col-sm-12">
	    				<fmt:parseDate value = "${scheListTmp.sche_date}" 
		    			var = "parse" pattern = "yyyy-MM-dd" />
				  		<p><strong>
				  			<fmt:formatDate value="${parse }" type="both" pattern="yyyy년 MM월 dd일"/>
						</strong></p>
				  	</div>
		       	</div>
		 	</div>
		 	<div class="panel-body">
		  		<ul class="list-group" id="todayScheList">
					<c:forEach var="schesTmp" items="${scheList[scheListTmp.sche_date]}">
						<li class="list-group-item" id="black">${schesTmp.WORKOUT_NAME }<span class="badge">${schesTmp.SCHE_SET / schesTmp.SET_NUM }</span></li>
					</c:forEach>
				</ul>
			</div>
		</div> 
	</c:forEach>	
</c:if>

<c:if test="${scheListList==null || scheList==null || user_id==null}">
	<p>회원의 스케줄이 없습니다.</p>
</c:if>