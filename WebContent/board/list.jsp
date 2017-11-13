<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}style.css" rel="stylesheet" type="text/css">

<h2> ${page_list} ( ${str_count} : ${count} ) </h2>

<table>
	<tr>
		<th colspan="6" align="right">
			<a href="boardWriteForm.do">${str_write}</a>&nbsp;&nbsp;&nbsp;
		</th>
	</tr>
	<tr>
		<th style="width: 5%"> ${str_num} </th>
		<th style="width: 40%"> ${str_subject} </th>
		<th style="width: 10%"> ${str_writer} </th>
		<th style="width: 13%"> ${str_reg_date} </th>
		<th style="width: 7%"> ${str_readcount} </th>
		<th style="width: 10%"> ${str_ip} </th>
	</tr>
	<c:if test="${count == 0}">
		<tr>
			<td colspan="6" align="center">
				${msg_list_x}
			</td>
		</tr>
	</c:if>
	<c:if test="${count != 0}">
		<c:forEach var="boardDto" items="${articles}"> 
			<tr>
				<td align="center">
					${number}
					<c:set var="number" value="${number-1}"/> 
				</td>
				<td>
					&nbsp;&nbsp;
					<c:if test="${boardDto.re_level > 1}">
						<c:set var="wid" value="${(boardDto.re_level - 1) *10}"/>
						<img src="${project}/images/level.gif" border="0" width="${wid}" height="15">
					</c:if>
					<c:if test="${boardDto.re_level > 0}">
						<img src="${project}/images/re.gif" border="0" width="20" height="15">
					</c:if>						
					<a href="boardContent.do?num=${boardDto.num}&pageNum=${pageNum}&number=${number+1}">
						${boardDto.subject}
					</a>	
					<c:if test="${boardDto.readcount >=20}">
						<img src="${project}/images/hot.gif" border="0" width="20" height="15">
					</c:if>						
				</td>
				<td align="center">
					${boardDto.writer}						
				</td>
				<td align="center">
					<fmt:formatDate value="${boardDto.reg_date}" type="both"
						pattern="yyyy-MM-dd HH:mm"/>					
				</td>
				<td align="center">
					${boardDto.readcount}
				</td>
				<td align="center">
					${boardDto.ip}
				</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<br>

<c:if test="${count > 0}">
	<c:if test="${startPage > pageBlock}">
		<a href="boardList.do">[◀◀]</a>
		<a href="boardList.do?pageNum=${startPage-pageBlock}">[◀]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test="${i == currentPage}">
			<b>[${i}]</b>	
		</c:if>
		<c:if test="${i != currentPage}">
			<a href="boardList.do?pageNum=${i}">[${i}]</a>
		</c:if>
	</c:forEach>
	<c:if test="${pageCount > endPage}">		
		<a href="boardList.do?pageNum=${startPage+pageBlock}">[▶]</a>
		<a href="boardList.do?pageNum=${pageCount}">[▶▶]</a>
	</c:if>	
</c:if>



















