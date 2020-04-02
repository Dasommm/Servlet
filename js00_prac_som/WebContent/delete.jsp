<%@page import="com.dao.SomDao"%>
<%@page import="com.dto.SomDto"%>
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

<%

int snum = Integer.parseInt(request.getParameter("snum"));

SomDao dao = new SomDao();

int res = dao.delete(snum);

if(res >0){
	
%>
<script type="text/javascript">
alert("success");
location.href = "main.jsp";
</script>	
<%
}else{

%>	
<script type="text/javascript">
alert("failed");
location.href = "datail.jsp?snum=<%=snum%>"

</script>	
<%
}
%>

</body>
</html>