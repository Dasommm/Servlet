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
<body>


<%
int seq = Integer.parseInt(request.getParameter("seq"));

MDBoardDao dao = new MDBoardDao();
MDBoardDto dto = dao.selectOne(seq);


%>

<%@ include file = "./form/header.jsp"%>


	<h1>Update</h1>
		<form action="updateres.jsp" method = "post">
		<input type="hidden" name= "seq" value = "<%=dto.getSeq()%>">
		
		<table border="1">
			 <tr>
			 	<th>Name</th>
			 	<td><%=dto.getWriter()%></td>
			 </tr>
			 <tr>
			 	<th>Title</th>
			 	<td><input type= "text" name = "title" value="<%=dto.getTitle() %>"></td>
			 </tr>
			 <tr>
			 	<th>Text</th>
			 	<td><textarea rows="5" cols="50" name = "content"><%=dto.getContent() %></textarea></td>
			 </tr>
			<tr>
				<td colspan = "2">
					<input type = "submit" value = "update" >					
					<input type = "button" value ="cancel" onclick="location.href ='boardlist.jsp'">
				
				</td>		
			</tr>
		</table>
		</form>

<%@ include file = "./form/footer.jsp" %>



</body>
</html>