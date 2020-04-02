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
<body>
<%

//controller에서 보내준 값을 받는다
MVCDto dto = (MVCDto)request.getAttribute("dto");

%>

	<h1>Update</h1>

<form action="controller.jsp" method = "post" >
	<input type ="hidden" name = "command" value = "updateres">
	<input type = "hidden" name = "seq" value = "<%=dto.getSeq()%>">
	<table border="1">
		<tr>
			<th>Name</th>
			<td><input type = "text" name = "writer" value="<%=dto.getWriter() %>" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type = "text" name = "title" value = "<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<th>Content</th>
			<td><textarea rows="10" cols="60" name = "content"><%=dto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type = "submit" value = "okay">
				<input type = "button" value = "cancel" 
				onclick="location.href ='controller.jsp?command=detailform&seq=<%=dto.getSeq()%>'">
			</td>
		</tr>
	
	</table>

</form>




</body>
</html>