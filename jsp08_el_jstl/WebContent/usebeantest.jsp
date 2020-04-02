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
	<!-- bean ? java에서의 class 혹은 객체를 의미한다 -->
	<jsp:useBean id="lee" class ="com.test.dto.Score" scope = "session"></jsp:useBean>
	<!-- session scope로  객체 생성 -->
	<!-- Score lee = new Score();와 같은 의미 -->

	<jsp:setProperty property="name" name="lee" value = "이순신"/>
	<!-- lee.setName("이순신"); -->
	
	<jsp:getProperty property="name" name="lee"/>
	<!-- lee.getName(); -->

	<a href = "res.jsp">result</a>
</body>
</html>