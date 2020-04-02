<%@page import="com.mvc.dto.MVCDto"%>
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


	<h1>세부내용</h1>
	
	<table border = "1">
		<tr>
			<th>이름</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="50" name = "content" readonly="readonly">
			<%=dto.getContent() %></textarea></td>
		</tr>		
	</table>
	
	<input type = "button" value = "Modify" onclick="location.href = 'mvc.do?command=updateform&seq=<%=dto.getSeq()%>'">
	<input type = "button" value = "Delete" onclick="location.href = 'mvc.do?command=delete&seq=<%=dto.getSeq()%>'">
	<input type = "button" value = "Back" onclick="location.href = 'mvc.do?command=list'">

</body>
</html>