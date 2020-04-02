<%@page import="com.my.dto.MyDto"%>
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
	int myno = Integer.parseInt(request.getParameter("myno"));
	String mytitle =request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");

	
	MyDto dto = new MyDto(myno, null, mytitle,mycontent,null);
	
//	dto.setMytitle(mytitle);
//	dto.setMycontent(mycontent);	위처럼 한번에 적어도 된다
	
	MyDao dao = new MyDao();
	int res = dao.update(dto);
	
	if(res >0){	
	
%>
<script type="text/javascript">
alert("success!");
location.href = "mydetail.jsp?myno="+<%=dto.getMyno()%>;
</script>

<%
	}else{
%>
<script type="text/javascript">
alert("failed");
location.href = "myupdate.jsp?myno=<%=dto.getMyno()%>";
</script>

<%
	}
%>



</body>
</html>