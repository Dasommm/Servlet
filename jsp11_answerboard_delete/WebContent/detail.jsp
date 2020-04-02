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
	<col width="100">
	<col width="300">
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
			<td><textarea rows="5" cols="50" readonly="readonly">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "button" value ="Delete" onclick="location.href = 'ans.do?command=delete&bdno=${dto.bdno}'">
				<input type = "button" value = "Modify" onclick="location.href = 'ans.do?command=updateform&bdno=${dto.bdno}'">
				<input type = "button" value = "Back" onclick="location.href = 'ans.do?command=list'">
				<input type= "button" value = "Reply" onclick="location.href = 'ans.do?command=replyform&bdno=${dto.bdno}'">
			</td>
		</tr>
	</table>
</body>
</html>