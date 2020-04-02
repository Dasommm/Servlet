<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>List</h1>
	
		<table border="1">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="300">
			<col width="100">
			<col width="100">
			<tr>
				<th>BoardNo</th>
				<th>GroupNo</th>
				<th>GroupSeq</th>
				<th>Title</th>
				<th>Writer</th>
				<th>Date</th>
			</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr >
					<td colspan="4">-----no comment-----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
				 <tr>
				 	<td>${dto.boardno }</td>
				 	<td>${dto.groupno }</td>
				 	<td>${dto.groupseq }</td>
				 	<td>
				 		<c:forEach begin="1" end="${dto.titletab }">
				 			&nbsp;&nbsp;
				 		</c:forEach>
				 		<a href="answer.do?command=detail&boardno=${dto.boardno }">${dto.title }</a>
				 	</td>
				 	<td>${dto.writer }</td>
				 	<td>${dto.regdate }</td>
				 </tr>					
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		<tr>
			<td colspan="4">
				<input type = "button" value = "New" onclick="location.href='answer.do?command=insert'">
			</td>
		</tr>			
		</table>
</body>
</html>