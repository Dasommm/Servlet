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

	<h1>Detail</h1>
	
	<table border="1">
			<tr>
				<th>Name</th>
				<td>${dto.writer }</td>
			</tr>
			<tr>
				<th>Title</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="5" cols="60" name = "content" readonly="readonly">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type = "button" value = "delete" 
					onclick="location.href='answer.do?command=delete&boardno=${dto.boardno}'">
					<input type= "button" value ="modify" 
					onclick="location.href='answer.do?command=updateform&boardno=${dto.boardno}'">
					<input type = "button" value = "back" onclick="location.href='answer.do?command=list'">
					<input type= "button" value = "reply" 
					onclick="location.href='answer.do?command=rpinsertform&boardno=${dto.boardno}'">
				</td>
			</tr>
		</table>

</body>
</html>