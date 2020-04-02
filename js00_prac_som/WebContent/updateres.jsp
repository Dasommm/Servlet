<%@page import="com.dto.SomDto"%>
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

<%
int snum = Integer.parseInt(request.getParameter("snum"));
String stitle = request.getParameter("stitle");
String scontent = request.getParameter("scontent");

SomDto dto = new SomDto();
dto.setSnum(snum);
dto.setStitle(stitle);
dto.setScontent(scontent);


SomDao dao = new SomDao();
int res = dao.update(dto);

if(res >0){

%>

<script type="text/javascript">
alert("success");
location.href = "main.jsp"
</script>

<%
}else{

%>
<script type="text/javascript">
alert("failed");
location.href ="detail.jsp?=<%=dto.getSnum()%>";
</script>

<%
}
%>







<body>

</body>
</html>