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

	<h1>Join</h1>
	
	<form action="login.do?" method ="post">
	<input type ="hidden" name ="command" value ="joinInsert">
		<table border="1">
			<tr>
				<th>Id : </th>
				<td><input type ="text" name = "id"></td>
			</tr>
			<tr>
				<th>Password : </th>
				<td><input type ="password" name = "pw"></td>
			</tr>
			<tr>
				<th>Confirm password : </th>
				<td><input type ="password"></td>
			</tr>
			<tr>
				<th>Name : </th>
				<td><input type ="text" name = "name"></td>
			</tr>
			<tr>
				<th>Address : </th>
				<td><input type ="text" name = "addr"></td>
			</tr>
			<tr>
				<th>Mobile : </th>
				<td><input type ="text" name = "mobile"></td>
			</tr>
			<tr>
				<th>Email : </th>
				<td><input type ="text" name = "email"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type= "submit" value = "Join">
					<input type= "button" value = "Cancel" onclick="history.back();">
				</td>
			</tr>
			
		</table>
	</form>

</body>
</html>