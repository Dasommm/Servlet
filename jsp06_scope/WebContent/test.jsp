<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("pageId", "myPageValue");
	request.setAttribute("requestId", "myRequestValue");
	session.setAttribute("sessionId", "mySessionValue");
	application.setAttribute("applicationId", "myApplicationValue");
%>
</head>
<body>

	<h1>INDEX</h1>

	page : <%=pageContext.getAttribute("pageId") %> <br>
	request : <%=request.getAttribute("requestId") %> <br>
	session : <%=session.getAttribute("sessionId") %> <br>
	application : <%=application.getAttribute("applicationId") %> <br>
	
	<a href = "result.jsp">result</a>
	<a href = "scope.do?req=test">servlet</a>
	
	
	<!-- 
	<%pageContext.forward("scope.do"); %>
	 -->
	
	
</body>
</html>