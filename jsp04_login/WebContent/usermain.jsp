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

%>

<body>
<!-- 내 정보 보기(detail-아이디랑 번호 뺴고), 수정(update), 탈퇴하기(update 변형) -->
	<h1>usermain</h1>
	<h1><%=dto.getMyname() %>님, 환영합니다</h1>
	<h3>등급 : <%=dto.getMyrole() %></h3>
	
		<input type = "button" value = "내 정보 보기" 
		onclick="location.href = 'logincontroller.jsp?command=detailform&myno=<%=dto.getMyno()%>'">
</body>
</html>