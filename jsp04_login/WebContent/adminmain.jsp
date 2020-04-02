<%
//브라우저가 캐시에 화면(응답된 도큐먼트) 저장하지 않도록 설정
response.setHeader("Pragma", "no-cache"); //http 1.0
response.setHeader("Cache-control", "no-store");	//http 1.1
response.setHeader("Expires", "0");	//proxy server

%>


<%@page import="com.login.dto.MyMemberDto"%>
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
<%

	MyMemberDto dto = (MyMemberDto)session.getAttribute("dto");

	if(dto == null){
		pageContext.forward("index.jsp");
	}
%>

<body>

	<h1><%=dto.getMyname() %>님, 환영합니다<a href = "logincontroller.jsp?command=logout">logout</a></h1>
	<h3>등급 : <%=dto.getMyrole() %></h3>

	<div>
		<div>
			<a href = "logincontroller.jsp?command=selectlist">회원정보 조회(ALL)</a>
		</div>
		<div>
			<a href = "logincontroller.jsp?command=selectenabled">회원정보 조회(Enabled)</a>
		</div>
	
	</div>

</body>
</html>











