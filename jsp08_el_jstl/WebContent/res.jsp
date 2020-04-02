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

	<h1>${lee.name }</h1>

	<jsp:useBean id="lee" class="com.test.dto.Score" scope="session"></jsp:useBean>
	<!-- session안에 저장된 객체가 불러와졌다. 만약에 객체 생성이 안되었다면 새로 생성 
	해당 스코프에 값이 있는지 확인하고 있으면 갖다쓰고, 없다면 새로 만든다
	만약 request에 담긴 값이 있다면 scope=request로 쓰고 갖다쓸 수 있다-->
	
	<h1><jsp:getProperty property="name" name="lee"/></h1>
	
</body>
</html>