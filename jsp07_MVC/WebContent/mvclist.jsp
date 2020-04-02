<%@page import="com.mvc.dto.MVCDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function allChk(bool) {
	
	var chks = document.getElementsByName("chk");	//NodeList 배열로 저장된다
	
		
}

</script>

</head>
<%
	List<MVCDto> list = (List<MVCDto>)request.getAttribute("list");
%>
<body>

	<h1>글목록</h1>

	<table border = "1">
	<col width="30">
	<col width="50">
	<col width="100">
	<col width="200">
	<col width="100">	
		<tr>
			<th><input type = "checkbox" name = "allChk" onclick="allChk(this.checked);"></th>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
	<%
	
	if(list.size() != 0){
		for(MVCDto dto : list){
	%>
		<tr>
			<td align = "center"><input type = "checkbox" name ="chk"></td>
			<td align = "center"><%=dto.getSeq() %></td>
			<td align = "center"><%=dto.getWriter() %></td>
			<td align = "center"><a href = "mvc.do?command=detail&seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
			<td align = "center"><%=dto.getRegdate() %></td>
		</tr>	
	
	<%	
		}
	
	}
	
	%>
	
	</table>
	<input type = "button" value = "delete">
	<input type = "button" value = "New" onclick="location.href = 'mvc.do?command=insertform'">
	

</body>
</html>