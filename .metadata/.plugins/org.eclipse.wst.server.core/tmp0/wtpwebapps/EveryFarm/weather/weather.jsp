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

<%@ include file="../home/header.jsp"%>

	<iframe src="https://www.weather.go.kr/weather/main.jsp" style="width:100%; height:1000px;">
	
	</iframe>

<%@ include file="../home/footer.jsp"%>
</body>
</html>