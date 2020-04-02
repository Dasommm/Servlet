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
	
	<form action="con.do?" method = "post">
	<input type = "hidden" name ="command" value = "insertres">
		<table border="1">
			<tr>
				<th>NAME</th>
				<td><input type = "text" name = "writer"></td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type = "text" name = "title"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea rows="5" cols="50" name = "content"></textarea></td>
			</tr>
		</table>
		<input type = "submit" value = "okay">
		<input type = "button" value = "back" onclick = "location.href ='con.do?command=list'">
	</form>

</body>
</html>