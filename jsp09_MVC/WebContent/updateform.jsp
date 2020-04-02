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


	<jsp:useBean id="dto" class="com.mvc.dto.MyDto" scope="request"></jsp:useBean>
	
<h1>Update</h1>

	<form action="con.do" method = "post">
	<input type ="hidden" name = "command" value ="updateres">
	<input type = "hidden" name = "seq" value ="${dto.seq }">
	<table border="1">
		<tr>
			<th>NAME</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td><input type ="text" name ="title" value ="${dto.title }"></td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="60" name = "content">
			${dto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "submit" value ="okay">
				<input type = "button" value ="back" onclick="location.href='con.do?command=detail&seq='+${dto.seq}">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>