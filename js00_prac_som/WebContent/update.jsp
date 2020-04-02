<%@page import="com.dao.SomDao"%>
<%@page import="com.dto.SomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>

<%

int snum = Integer.parseInt(request.getParameter("snum"));

SomDao dao = new SomDao();
SomDto dto = dao.selectOne(snum);

%>


<h1>Update</h1>

<form action="updateres.jsp" method = "post">
<input type = "hidden" name = "snum" value = "<%=dto.getSnum()%>">
	<table border="1">
		<tr>
			<th>Name</th>
			<td><%=dto.getSname()%></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type = "text" name = "stitle" value ="<%=dto.getStitle() %>"></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea rows="5" cols="50" name = "scontent"><%=dto.getScontent() %></textarea></td>
		</tr>
	</table>
		<input type = "submit" value = "okay">
		<input type = "button" value = "cancel" onclick="location.href='detail.jsp?snum=<%=dto.getSnum()%>'">
</form>


</body>
</html>