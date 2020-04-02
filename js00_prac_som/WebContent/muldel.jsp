<%@page import="com.dao.SomDao"%>
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
String [] snum = request.getParameterValues("chk");

if(snum == null || snum.length ==0 ){

%><script type="text/javascript">
alert("choose the checkbox");
location.href = "main.jsp";
</script>
<%
}else{
	SomDao dao = new SomDao();
	int res = dao.multiDelete(snum);
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
location.href = "main.jsp";
</script>
<%
	}
}
%>

</body>
</html>