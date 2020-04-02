<%@page import="com.mvc.dao.MVCDao"%>
<%@page import="comm.mvc.dto.MVCDto"%>
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

<%
MVCDto dto = (MVCDto)request.getAttribute("dto");

%>

<body>

	<h1>Detail</h1>

	<table border="1">
		<tr>
			<th>Name</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea rows="10" cols="60" name = "content" readonly="readonly"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "button" value = "Modify" 
				onclick="location.href = 'controller.jsp?command=updateform&seq=<%=dto.getSeq()%>'">
				<input type = "button" value = "Delete" 
				onclick="location.href = 'controller.jsp?command=delete&seq=<%=dto.getSeq()%>'">
				<input type = "button" value = "Cancel" 
				onclick="location.href = 'controller.jsp?command=list'">
			</td>
		</tr>
	
	</table>

</body>
</html>