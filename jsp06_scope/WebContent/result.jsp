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

	<h1>RESULT</h1>

	page : <%=pageContext.getAttribute("pageId") %> <br>	<!-- 페이지 내에서만 가능하기 때문에  null값 /pageContext의 객체 -->
	request : <%=request.getAttribute("requestId") %> <br>	<!-- 받은 request가 다르기 때문에 null값 /한페이지에서 요청한 페이지 전까지-->
	session : <%=session.getAttribute("sessionId") %> <br>	<!-- 세션이 만료되기 전까지 계속 값을 가지고 있다. -->
	application : <%=application.getAttribute("applicationId") %> <br> <!-- 프로젝트가 시작부터 끝나기 전까지 값을 가지고 있다 -->

</body>
</html>