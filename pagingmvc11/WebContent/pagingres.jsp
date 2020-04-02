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
	int currentpage = Integer.parseInt(request.getParameter("currentpage"));

	
%>
	<script type="text/javascript">
	
		location.href="boardlist.jsp?currentpage=<%=currentpage%>";
	</script>
</head>
<body>

</body>
</html>