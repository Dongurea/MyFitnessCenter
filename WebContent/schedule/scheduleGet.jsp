<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>

<c:if test="${page==null ||page>2 }">
<tr><td colspan="3">데이터가 이상해</td></tr>
</c:if>
<c:if test="${page==0 }">
	<c:if test="${schedules==null }">
		<tr><td id="nosche" colspan="3">오늘의 스케줄이 없습니다.</td></tr>
	</c:if>
	<c:if test="${schedules!=null }">
	   	<c:forEach var="sche" items="${schedules}" varStatus="stat">	
    		<tr id="today-schedule-${stat.index }">
    			<td>
	                <button type="button" class="btn-success show-video"
   					onclick="showVideo('${sche.workout_name }')"
   					>Video <span class="glyphicon glyphicon-chevron-right"></span> </button>
   				</td>
   				<td id="today-wn-${stat.index }">${sche.workout_name}</td>
   				<td id="today-set-${stat.index }">${sche.sche_set}번씩 ${sche.set_num}번</td>
    		</tr>	
	   	</c:forEach>
	</c:if>
</c:if>
<c:if test="${page==1 }">
	<c:if test="${schedules==null }">
		이번주 스케줄이 없습니다.
	</c:if>
	<c:if test="${schedules!=null }">
		<c:forEach var="sche" items="${schedules}" varStatus="stat">	
    		<tr>
    			<td>
    			<fmt:parseDate value = "${sche.sche_date}" 
    			var = "parse" pattern = "yyyy-MM-dd" />
    			<fmt:formatDate value="${parse }" type="both"
				pattern="yyyy-MM-dd"/>
				</td>
				<td>이번 주 ${stat.count } 번째 운동</td>
    			<td>
    			<c:if test="${sche.achieve==null || sche.achieve==''}">
    				미 수행
    			</c:if>
    			<c:if test="${sche.achieve!=null && sche.achieve!=''}">
    				${sche.achieve}
    			</c:if>
    			</td>
    		</tr>		
	   	</c:forEach>
	</c:if>
</c:if>
<c:if test="${page==2 }">
	<c:if test="${schedules==null }">
		모든 스케줄이 없습니다.
	</c:if>
	<c:if test="${schedules!=null }">
		<c:forEach var="sche" items="${schedules}" varStatus="stat">	
    		<tr>
  				<td>
	    			<fmt:parseDate value = "${sche.sche_date}" 
	    			var = "parse" pattern = "yyyy-MM-dd" />
	    			<fmt:formatDate value="${parse }" type="both"
					pattern="yyyy-MM-dd"/>
				</td>
    			<td>
	    			<c:if test="${sche.achieve==null || sche.achieve==''}">
	    				미 수행
	    			</c:if>
	    			<c:if test="${sche.achieve!=null && sche.achieve!=''}">
	    				${sche.achieve}
	    			</c:if>
    			</td>
    		</tr>
    	</c:forEach>
    	<tr>
    		<td>
	    	<c:forEach var="i" begin="1" end="${totalPage }">
	    		<c:if test="${i==allThisPage }">
	    			<b>${i }</b>&nbsp;
	    		</c:if>
	    		<c:if test="${i!=allThisPage }">
	    			<a onclick="setScheBody(${page},'${user_id }',${i })">${i }</a>&nbsp;
	    		</c:if>
	    	</c:forEach>
	    	</td>
    	</tr>
	</c:if>
</c:if>