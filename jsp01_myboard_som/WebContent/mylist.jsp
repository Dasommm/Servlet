<%@page import="com.my.dto.MyDto"%>
<%@page import="java.util.List"%>
<%@page import="com.my.dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>som's board</title>
</head>
<body>

<%
MyDao dao = new MyDao();
List<MyDto> list = dao.selectList();	// 받아오는 list타입(dto들이 담긴)의 MyDto의 이름을 list로 변수 선언

%>

	<h1>All list</h1>
		
	<table border ="1">
		<col width ="50">
		<col width ="100">
		<col width ="200">
		<col width ="100">
		
  <tr>
    <th>No</th>
    <th>Name</th>
    <th>Title</th>
    <th>Date</th>
  </tr>
  
  <%
  	if(list.size() == 0){	//받아온 list의 사이즈가 0이라면=> 값이 없다면
  
  %>
  
  <tr>
  	<td colspan="4">---There is no comment here---</td>
  </tr>
  <%
  	}else{					// 받아온 list의 사이즈가 0이 아니라면 => 값이 있다면
  	for(MyDto dto : list){	//받아온 list안의 dto들을 하나하나 꺼내온다
  %>
  	<tr>
  		<td align = "center"><%=dto.getMyno() %></td>
  		<td align = "center"><%=dto.getMyname() %></td>
  		<td align = "center"><a href ="mydetail.jsp?myno=<%=dto.getMyno()%>"><%=dto.getMytitle() %></a></td>
  		<td align = "center"><%=dto.getMydate() %></td>  	
  	</tr>  
  
  <%
  		}
  	}
  %>
  <tr>
  	<td colspan="4" align ="right">
  		<input type = "button" value ="글쓰기" onclick="location.href='myinsert.jsp'"/>
  	</td>  	
  </tr>
  
</table>


</body>
</html>