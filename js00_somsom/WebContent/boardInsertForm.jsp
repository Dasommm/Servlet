<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: auto;
}

#insertform th{
	border-top : 1px dotted black;
	background-color: lightgray;
}

#insertform td{
	border-top : 1px dotted black;

}

h1{
	color: green;
	text-align: center;
}


input[type='submit']{

	float: right;
}

#okayButton{
	float : right;
}


</style>
</head>
<body>

<%@ include file = "./form/header.jsp" %>

	<h1>New</h1>

	<form action="bdInsertRes" method = "post">
		<table id = "insertform">
			<tr>
				<th>Name</th>
				<td><input type = "text" name = "name"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type = "text" name = "title"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="6" cols="30" name = "content"></textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type ="button" value = "Back" onclick="location.href='mylist'">
					<input type = "submit" value = "Okay" class="okayButton">
				</td>
			</tr>
		</table>
	</form>
	
	<%@ include file ="./form/footer.jsp" %>
	
	
</body>
</html>