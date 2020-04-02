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

	<h1>수정</h1>
	
	<form action="mvc.do" method = "post">
	<input type = "hidden" name = "command" value = "updateres">
	<input type= "hidden" name = "seq" value = "<%=dto.getSeq()%>">
	<table border = "1">
		<tr>
			<th>이름</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type ="text" name ="title" value ="<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="50" name = "content">
			<%=dto.getContent() %></textarea></td>
		</tr>		
	</table>
	
	<input type = "submit" value = "okay">
	<input type = "button" value = "Back" onclick="location.href = 'mvc.do?command=detail&seq=<%=dto.getSeq()%>'">
	
	</form>
	

</body>
</html>