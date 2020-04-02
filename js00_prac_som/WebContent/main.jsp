<%@page import="com.dao.SomDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.SomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Board</title>

<script type="text/javascript">

function allchk(bool) {
	var chks = document.getElementsByName("chk");
	for(var i = 0 ; i < chks.length ; i++){
		chks[i].checked = bool; 
	}
	
}

</script>

</head>
<%

SomDao dao = new SomDao();
List<SomDto> list = dao.selectAll();

%>
<body>

<h1>Board</h1>

<form action="muldel.jsp" method = "post">
 <table border="1">
 	<col width="30" align = "center">
 	<col width="50"  align = "center">
 	<col width="100" align = "center">
 	<col width="200" align = "center">
 	<col width="100" align = "center">
 	<tr>
 		<th><input type = "checkbox" onclick="allchk(this.checked);"></th>
 		<th>No</th> 	
 		<th>Name</th> 	
 		<th>Title</th> 	
 		<th>Date</th> 	
 	</tr>
 	
 	<%
 	if(list.size() != 0){
	 	for(SomDto dto : list){
 		
 	
 	%>
 	<tr>
 		<td align = "center"><input type = "checkbox" name = "chk" value ="<%=dto.getSnum() %>"></td>
 		<td align = "center"><%=dto.getSnum() %></td> 	
 		<td align = "center"><%=dto.getSname() %></td> 	
 		<td align = "center"><a href = "detail.jsp?snum=<%=dto.getSnum()%>"><%=dto.getStitle() %></a></td> 	
 		<td align = "center"><%=dto.getSdate() %></td> 	
 	</tr>
 	
 	
 	<%
	 	}
 	}else{
 	%>
 	<tr>
 		<td colspan = "5" align = "center">
 		------There is no comment here-----
 		</td>
 	</tr>
 		
 	<% 	
 	}
 	%>
 	
 	</table>
 	
 	<input type = "submit" value = "Delete">
 	<input type = "button" value ="New comment" onclick = "location.href='insert.jsp'">
</form>

</body>
</html>