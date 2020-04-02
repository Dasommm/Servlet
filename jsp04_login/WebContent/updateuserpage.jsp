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

<h1>Update page</h1>
	<form action="logincontroller.jsp?command=userupdateres" method = "post">
	<input type="hidden" name = "myno" value ="<%=dto.getMyno()%>">
		<table border="1">
			<col width="100">
			<col width="200">
			<tr>
				<th>Id</th>
				<td><%=dto.getMyid() %></td>
			</tr>
			<tr>
				<th>Pw</th>
				<td><input type= "text" name = "mypw" value="<%=dto.getMypw() %>"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type= "text" name = "myname" value="<%=dto.getMyname() %>"></td>
			</tr>
			<tr>
				<th>Address</th>
				<td><input type= "text" name = "myaddr" value="<%=dto.getMyaddr() %>"></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><input type= "text" name = "myphone" value="<%=dto.getMyphone() %>"></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type= "text" name = "myemail" value="<%=dto.getMyemail() %>"></td>
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
			<input type = "submit" value = "okay">
			<input type = "button" value = "back" 
			onclick = "location.href ='logincontroller.jsp?command=detailform&myno=<%=dto.getMyno()%>'">
		</form>
		

</body>
</html>