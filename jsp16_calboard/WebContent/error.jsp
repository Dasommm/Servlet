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

	<h1 style="color:red;">ERROR!</h1>
	
	<%=request.getAttribute("msg") %><br>
	<a href = "calendar.do?command=calendar">처음으로</a>

</body>
</html>