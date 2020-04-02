<%@page import="com.login.dto.MyMemberDto"%>
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
	MyMemberDto dto = (MyMemberDto)request.getAttribute("dto");
%>

<body>

	<h1>Detail page</h1>
		<table border="1">
			<col width="100">
			<col width="200">
			<tr>
				<th>Id</th>
				<td><%=dto.getMyid() %></td>
			</tr>
			<tr>
				<th>Pw</th>
				<td><%=dto.getMypw() %></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><%=dto.getMyname() %></td>
			</tr>
			<tr>
				<th>Address</th>
				<td><%=dto.getMyaddr() %></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><%=dto.getMyphone() %></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=dto.getMyemail() %></td>
			</tr>
			<tr>
				<th>Enabled</th>
				<td><%=dto.getMyenabled() %></td>
			</tr>
			<tr>
				<th>Role</th>
				<td><%=dto.getMyrole() %></td>
			</tr>
		</table>
			<input type = "button" value = "Modify" 
			onclick="location.href = 'logincontroller.jsp?command=updateuserform&myno=<%=dto.getMyno()%>'">
			<input type = "button" value = "withdrawal" 
			onclick ="location.href ='logincontroller.jsp?command=deleteuserres&myno=<%=dto.getMyno()%>'">
			<input type = "button" value = "back" 
			onclick = "history.back()">
</body>
</html>