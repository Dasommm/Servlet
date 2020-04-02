

<%@page import="com.dto.MyDto"%>
<%@page import="com.dao.MyDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 자바영역은 server에서 실행된다
	MyDao dao = new MyDao();	//dao를 통해서 db에 요청을 했다
	List<MyDto> list = dao.selectList();

%>

	<h1>List</h1>
	
	<table border = "1">
		<col width="50"/>
		<col width="100"/>
		<col width="200"/>
		<col width="100"/>
		
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>			
		</tr>

<%

	for(int i =0; i < list.size(); i++){	// 담아온 값을 반복해서 뿌려준다
		
%>

<!-- java에서 받아온 데이터를 html로 보내준다(컴파일은 서버에서 진행되고 html로) -->
	<tr>
		<td><%= list.get(i).getMyNo() %></td> <!-- 꺽쇠 =의 의미는 java의 값을 가져와서 html<td>태그에 넣어준다  -->
		<td><%= list.get(i).getMyName() %></td>
		<td><a href="mydetail.jsp?myno=<%=list.get(i).getMyNo()%>"><%= list.get(i).getMyTitle() %></a></td>
		<td><%= list.get(i).getMyDate() %></td>		
	</tr>

<%		
		
	}

%>
	 <tr>
	 	<td colspan = "4" align = "right">
	 		<input type = "button" onclick = "location.href='myinsert.jsp'" value = "글쓰기"/>	 <!-- ./는 생략가능 -->
	 	</td>	 
	 </tr>	
	</table>

</body>
</html>