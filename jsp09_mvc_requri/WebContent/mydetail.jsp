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
				<th>name</th>
				<td>${dto.writer }</td>			
			</tr>
			<tr>
				<th>title</th>
				<td>${dto.title }</td>			
			</tr>
			<tr>
				<th>content</th>
				<td><textarea rows="10" cols="60" readonly="readonly">${dto.writer }</textarea></td>			
			</tr>
			<tr>
				<td>
					<input type = "button" value = "modify" onclick="location.href ='updateform?seq=${dto.seq }'">
					<input type = "button" value = "delete" onclick="location.href ='delete?seq=${dto.seq}'">
					<input type = "button" value = "back" onclick="location.href = 'mylist'">
				</td>
			</tr>
			
			
		</table>
</body>
</html>