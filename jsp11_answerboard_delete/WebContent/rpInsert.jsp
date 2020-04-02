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

	<h1>Reply</h1>
	
	<form action="ans.do?" method = "post">
		<input type = "hidden" name = "command" value = "rpinsertres">
		<input type ="hidden" name = "bdno" value = "${dto.bdno }">
		<table border="1">
			<tr>
				<th>Name</th>
				<td><input type="text" name ="writer"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name ="title" value ="RE:${dto.title }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="5" cols="60" name= "content"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "okay">
					<input type= "button" value = "back" onclick="location.href ='ans.do?command=detail&bdno=${dto.bdno}'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>