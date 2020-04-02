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
String sname = request.getParameter("sname");
String stitle = request.getParameter("stitle");
String scontent = request.getParameter("scontent");


SomDto dto = new SomDto();
dto.setSname(sname);
dto.setStitle(stitle);
dto.setScontent(scontent);

SomDao dao = new SomDao();

int res = dao.insert(dto);

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
history.back();
</script>

<%
}
%>

</body>
</html>