<%@page import="com.my.dao.MyDao"%>
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
//보낸 값을 받아준다
int myno = Integer.parseInt(request.getParameter("myno"));

MyDao dao = new MyDao();
int res = dao.delete(myno);

if(res >0){
%>

<script type="text/javascript">
alert("success!");
location.href = "mylist.jsp"
</script>

<%
}else{
%>

<script type="text/javascript">
alert("failed");
location.href = "mydetail.jsp?myno=<%=myno%>";
</script>

<%
}
%>

</body>
</html>