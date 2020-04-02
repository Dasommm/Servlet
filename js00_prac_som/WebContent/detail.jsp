<%@page import="com.dto.SomDto"%>
<%@page import="com.dao.SomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
</head>
<body>

<%

int snum = Integer.parseInt(request.getParameter("snum"));

SomDao dao = new SomDao();

SomDto dto = dao.selectOne(snum);




%>



<h1>Detail</h1>
	<table border="1">
	<tr>
		<th>Name</th>
			<td><%=dto.getSname() %></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><%=dto.getStitle() %></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea rows="5" cols="50" name = "scontent" readonly ="readonly"><%=dto.getScontent() %></textarea></td>
		</tr>
	</table>
		<input type = "button" value = "Delete" onclick="location.href='delete.jsp?snum=<%=dto.getSnum()%>'">
		<input type= "button" value = "Modify" onclick="location.href = 'update.jsp?snum=<%=dto.getSnum()%>'">
		<input type = "button" value = "cancel" onclick="location.href='main.jsp'">

</body>
</html>