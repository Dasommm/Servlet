<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Schedule list</h1>
	<form action="calendar.do" method="post">
		<input type = "hidden" name = "command" value = "muldel">
		<jsp:useBean id="util" class="com.cal.dao.Util"></jsp:useBean>
		<table border="1">
			<col width ="50">
			<col width ="50">
			<col width ="300">
			<col width ="250">
			<col width ="100">
			
			<tr>
				<th><input type ="checkbox" name = "all" onclick="allChk(this.checked);"></th>
				<th>No</th>
				<th>Title</th>
				<th>Schedule</th>
				<th>Date</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="5">------No Content------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var = "dto">
						<tr>
							<td align="center"><input type ="checkbox" name ="chk" value ="${dto.seq }"></td>
							<td align="center">${dto.seq }</td>
							<td align="center"><a href ="calendar.do?command=detail&seq=${dto.seq }">${dto.title }</a></td>
							<td align="center">
								<jsp:setProperty property="todates" name="util" value = "${dto.mdate }"/>
								<jsp:getProperty property="todates" name="util"/> 
							</td>
							<td align="center"><fmt:formatDate value="${dto.regdate }" pattern="yyyy:MM:dd"/></td>
						</tr>					
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5">
					<input type = "submit" value ="Delete">
					<input type = "button" value = "Back" onclick="location.href ='calendar.do?command=calendar'">
				</td>			
			</tr>			
		</table>	
	</form>


</body>
</html>