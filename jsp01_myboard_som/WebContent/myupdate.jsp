<%@page import="com.my.dao.MyDao"%>
<%@page import="com.my.dto.MyDto"%>
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
<body>n

<%
int myno = Integer.parseInt(request.getParameter("myno"));
MyDao dao = new MyDao();
MyDto dto = dao.selectOne(myno);

%>

<h1>Modify</h1>
	
	<form action = "myupdateres.jsp" method = "post">
		<input type = "hidden" name ="myno" value = "<%=dto.getMyno()%>">
		<!-- 이렇게 적어주면 모든 값이 수정되는 것이 아니라 내가 지정한 myno의 값만 수정된다 -->
		
		<table border="1">
		<tr>
			<th>Name</th>
			<td><%=dto.getMyname() %></td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type = "text" name = "mytitle" value="<%=dto.getMytitle() %>"></td>
		</tr>
		<tr>
			<th>Text</th>
			<td><textarea rows="5" cols="50" name ="mycontent">
			<%=dto.getMycontent() %></textarea></td>
		</tr>	
		<tr>
			<td colspan = "2" align = "right">
			<input type = "submit" value ="update" >
			<input type = "button" value ="cancel" onclick= "location.href ='mydetail.jsp?myno=<%=dto.getMyno() %>'" >
			</td>			
		</tr>
	
	</table>
	</form>



</body>
</html>