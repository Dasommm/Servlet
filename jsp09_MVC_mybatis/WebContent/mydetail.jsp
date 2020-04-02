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

	<h1>Detail</h1>

	<table border="1">
		<tr>
			<th>NAME</th>
			<td><jsp:getProperty property="writer" name="dto"/></td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td><jsp:getProperty property="title" name="dto"/></td>
		</tr>
		<tr>
			<th>CONTENT</th>
			<td><textarea rows="10" cols="60" readonly="readonly">
			<jsp:getProperty property="content" name="dto"/></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "button" value ="Modify" onclick="location.href='con.do?command=updateform&seq='+${dto.seq}">
				<input type = "button" value ="Delete" onclick="location.href='con.do?command=delete&seq='+${dto.seq }">
				<input type = "button" value ="list" onclick="location.href='con.do?command=list'">
			</td>
		</tr>
	</table>

</body>
</html>