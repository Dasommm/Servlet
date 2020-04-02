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

	<h1>New</h1>

	<form action="answer.do?" method = "post">
		<input type = "hidden" name = "command" value = "insertres">
		<table border="1">
			<tr>
				<th>Name</th>
				<td><input type = "text" name = "writer"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type = "text" name = "title"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="5" cols="60" name = "content"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "okay">
					<input type = "button" value = "back" onclick="location.href='answer.do?command=list'">
				</td>
			</tr>
		</table>
	</form>
	

</body>
</html>