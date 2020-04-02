<%@page import="com.md.dao.MDBoardDao"%>
<%@page import="com.md.dto.MDBoardDto"%>
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

MDBoardDto dto = new MDBoardDao().selectOne(Integer.parseInt(request.getParameter("seq")));


%>

<body>

<%@ include file = "./form/header.jsp"%>


	<h1>Detail</h1>
	
		<table border="1">
			 <tr>
			 	<th>Name</th>
			 	<td><%=dto.getWriter()%></td>
			 </tr>
			 <tr>
			 	<th>Title</th>
			 	<td><%=dto.getTitle() %></td>
			 </tr>
			 <tr>
			 	<th>Text</th>
			 	<td><textarea rows="5" cols="50" readonly="readonly"><%=dto.getContent() %></textarea></td>
			 </tr>
			<tr>
				<td colspan = "2">
					<input type = "button" value = "modify" onclick = "location.href='update.jsp?seq=<%=dto.getSeq() %>'" >	
					<input type = "button" value = "delete" onclick = "location.href='delete.jsp?seq=<%=dto.getSeq() %>'" >										
					<input type = "button" value ="list" onclick= "location.href ='boardlist.jsp'">
				
				</td>		
			</tr>
		</table>

<%@ include file = "./form/footer.jsp" %>


</body>
</html>