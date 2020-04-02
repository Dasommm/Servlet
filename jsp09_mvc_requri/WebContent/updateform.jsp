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

	<h1>Update</h1>
		<form action="updateres">
		<input type = "hidden" name = "seq" value = "${dto.seq }">
		<table border="1">
			<tr>
				<th>name</th>
				<td>${dto.writer }</td>			
			</tr>
			<tr>
				<th>title</th>
				<td><input type = "text" name = "title" value ="${dto.title }"></td>			
			</tr>
			<tr>
				<th>content</th>
				<td><textarea rows="10" cols="60" name = "content">${dto.content }</textarea></td>			
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "okay">
					<input type = "button" value = "back" onclick="location.href = 'mydetail?seq=${dto.seq}'">
				</td>
			</tr>
			
			
		</table>
		</form>

</body>
</html>