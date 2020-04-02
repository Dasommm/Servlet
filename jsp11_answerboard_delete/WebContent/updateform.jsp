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

	<form action="ans.do?" method = "post">
	<input type ="hidden" name = "command" value = "updateres">
	<input type = "hidden" name = "bdno" value = "${dto.bdno }">
	<table border="1">
	<col width="100">
	<col width="300">
		<tr>
			<th>Name</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type ="text" name = "title" value ="${dto.title }"></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea rows="5" cols="50" name = "content">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "submit" value = "Okay">
				<input type = "button" value = "Back" onclick="location.href = 'ans.do?command=list'">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>