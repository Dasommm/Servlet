<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<col width="30">
		<col width="30">
		<col width="30">
		<col width="30">
		<col width="300">
		<col width="100">
		<col width="100">
		<tr>
			<th>BNo</th>
			<th>GNo</th>
			<th>GSeq</th>
			<th>Tab</th>
			<th>Title</th>
			<th>Writer</th>
			<th>Date</th>
		</tr>
		<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="7">-----No Comment-----</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.bdno }</td>
					<td>${dto.gno }</td>
					<td>${dto.gseq }</td>
					<td>${dto.ttab }</td>					
					<td>
						<c:choose>
							<c:when test="${dto.enbdelete eq 'Y' }">
								<c:out value="--The comment was deleted--"></c:out>
							</c:when>
							<c:otherwise>
							<c:forEach begin="1" end="${dto.ttab }">
								&nbsp;&nbsp;							
							</c:forEach>
							<a href ="ans.do?command=detail&bdno=${dto.bdno }">${dto.title }</a></td>
							</c:otherwise>
						</c:choose>
					<td>${dto.writer }</td>
					<td>${dto.regdate }</td>
				</tr>
			</c:forEach>		
		</c:otherwise>
		</c:choose>
			<tr>
				<td colspan="7">
					<input type="button" value="New" onclick="location.href ='ans.do?command=insertform'">
				</td>
			</tr>
	</table>

</body>
</html>