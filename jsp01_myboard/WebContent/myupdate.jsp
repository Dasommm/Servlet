<%@page import="com.dao.MyDao"%>
<%@page import="com.dto.MyDto"%>


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
	MyDao dao = new MyDao();
	MyDto dto = dao.selectOne(myno);

%>

	<h1>수정</h1>

	<form action="myupdateres.jsp" method = "post">
		<input type = "hidden" name = "myno" value ="<%=myno%>"/>
		<table border="1">
			<tr>
				<th>이름</th>
				<td><%=dto.getMyName() %></td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type = "text" value="<%=dto.getMyTitle() %>" name = "mytitle"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="6" cols="60" name = "mycontent"><%=dto.getMyContent() %></textarea></td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "수정"/>
					<input type = "button" value = "취소" onclick="location.href='mylist.jsp'"/>
				</td>
			</tr>
		
		</table>	
		
	</form>






</body>
</html>