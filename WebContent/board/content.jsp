<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp"%>
<link href="${project}style.css" rel="stylesheet" type="text/css">

<h2> ${page_content} </h2>

<table>
	<tr>
		<th> ${str_num} </th>
		<td style="width: 150px" align="center"> ${number} </td>
		<th> ${str_readcount} </th>
		<td style="width: 150px" align="center"> ${boardDto.readcount} </td>
	</tr>
	<tr>
		<th> ${str_writer} </th>
		<td style="width: 150px" align="center"> ${boardDto.writer} </td>
		<th> ${str_reg_date} </th>
		<td style="width: 150px" align="center">
			<fmt:formatDate value="${boardDto.reg_date}"
				type="both" pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	<tr>
		<th> ${str_subject} </th>
		<td colspan="3">
			${boardDto.subject}
		</td>
	</tr>
	<tr>
		<th> ${str_content} </th>
		<td colspan="3"> 
			<pre>${boardDto.content}</pre> 
		</td>
	</tr>	
	<tr>
		<th colspan="4">
			<input class="inputbutton" type="button" value="${btn_modify}"
				onclick="location='boardModifyForm.do?num=${boardDto.num}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_delete}"
				onclick="location='boardDeleteForm.do?num=${boardDto.getNum()}&pageNum=${pageNum}'">
			<input class="inputbutton" type="button" value="${btn_reply}" 
				onclick="location='boardWriteForm.do?num=${boardDto.num}&ref=${boardDto.ref}&re_step=${boardDto.re_step}&re_level=${boardDto.re_level}'">
			<input class="inputbutton" type="button" value="${btn_list}"
				onclick="location='boardList.do?pageNum=${pageNum}'">
		</th>
	</tr>	
</table>














