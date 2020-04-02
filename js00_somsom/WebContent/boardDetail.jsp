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
#detailform th{
	border-top : 1px dotted black;
	background-color: lightgray;
}

#detailform td{
	border-top : 1px dotted black;

}

h1{
	color: green;
	text-align: center;
}

.btnright{
	float: right;
}

.btnleft{
	float: left;

}




</style>

</head>
<body>

	<%@ include file = "./form/header.jsp" %>
	

	<h1>Detail</h1>

		<table id = "detailform">
			<tr>
				<th>Name</th>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<th>Title</th>
				<td>${dto.title }</td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea rows="6" cols="30" name = "content" readonly="readonly">
				${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="3">
					<input class="btnleft" type ="button" value = "Back" onclick="location.href='mylist'">
					<input class="btnright" type = "button" value = "Delete" onclick="location.href = 'bdDelete?seq=${dto.seq}'">
					<input class="btnright" type = "button" value = "Modify" onclick="location.href ='bdUpdateForm?seq=${dto.seq}'">
				</td>
			</tr>
		</table>
		
	<%@ include file ="./form/footer.jsp" %>
		
		
</body>
</html>