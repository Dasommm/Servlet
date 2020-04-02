<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New</title>
</head>
<body>

<h1>New Comment</h1>

<form action="insertres.jsp" method = "post">
	<table border="1">
		<tr>
			<th>Name</th>
			<td><input type = "text" name = "sname"></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type = "text" name = "stitle"></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea rows="5" cols="50" name = "scontent"></textarea></td>
		</tr>
	</table>
		<input type = "submit" value = "okay">
		<input type = "button" value = "cancel" onclick="location.href='main.jsp'">
</form>


</body>
</html>