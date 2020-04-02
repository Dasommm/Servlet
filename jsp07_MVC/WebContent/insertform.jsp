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


	<h1>글 작성</h1>

	<form action="mvc.do" method = "post">
	<input type = "hidden" name = "command" value = "insertres">
	<table border = "1">
		<tr>
			<th>이름</th>
			<td><input type = "text" name = "writer"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type = "text" name = "title"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="50" name = "content"></textarea></td>
		</tr>		
	</table>
	<input type = "submit" value = "okay">
	<input type = "button" value = "back" onclick="location.href = 'mvc.do?command=list'">
	</form>
</body>
</html>