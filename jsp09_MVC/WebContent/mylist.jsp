<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %><!-- jstl사용하려면 이 태그를 적어줘야한다 -->
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

	<h1>글목록</h1>
	
	<table border="1">
		<col width ="50">		
		<col width ="100">
		<col width ="300">
		<col width ="100">
	
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>작성일</th>		
		</tr>
	
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<td colspan="4">-----no comment-----</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.seq }</td>
						<td>${dto.writer }</td>
						<td><a href ="con.do?command=detail&seq=${dto.seq }">${dto.title }</a></td>
						<td>${dto.regdate }</td>
					
					</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td>
				<input type ="button" value = "new" onclick="location.href = 'con.do?command=new'">
			</td>
		</tr>
	
	</table>

</body>
</html>












