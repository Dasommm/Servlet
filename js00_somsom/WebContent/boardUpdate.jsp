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
#updateform th{
	border-top : 1px dotted black;
	background-color: lightgray;
}

#updateform td{
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


	<h1>Update</h1>

	<form action="bdUpdateRes" method = "post">
	<input type = "hidden" name = "seq" value ="${dto.seq }">
		<table id = "updateform">
			<tr>
				<th>Name</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type = "text" name = "title" value = "${dto.title }"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="6" cols="30" name = "content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type ="button" value = "Back" onclick="history.back()">
					<input type = "submit" value = "Okay" class="okayButton">
				</td>
			</tr>
		</table>
	</form>

<%@ include file ="./form/footer.jsp" %>


</body>
</html>