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

<%@ include file = "./form/header.jsp"%>


	<h1>insert</h1>
	
	<form action="./inputres.jsp" method = "post"><!-- request header는 길이가 길어질 경우 보내지지 않을 수 있으니 웬만하면 post로하자 -->
		<table border="1">
			 <tr>
			 	<th>Name</th>
			 	<td><input type ="text" name = "writer"></td>
			 </tr>
			 <tr>
			 	<th>Title</th>
			 	<td><input type ="text" name = "title"></td>
			 </tr>
			 <tr>
			 	<th>Text</th>
			 	<td><textarea rows="5" cols="50" name = "content"></textarea></td>
			 </tr>
			<tr>
				<td colspan = "2" align = "right">
					<input type = "submit" value = "okay" >
					<input type = "button" value ="cancel" onclick="location.href ='boardlist.jsp'">
				
				</td>		
			</tr>
		</table>
	</form>
<%@ include file = "./form/footer.jsp" %>
</body>
</html>