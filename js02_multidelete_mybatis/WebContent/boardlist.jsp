<%@page import="java.util.List"%>
<%@page import="com.md.dao.MDBoardDao"%>
<%@page import="com.md.dto.MDBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "https://code.jquery.com/jquery-3.4.1.js">

$(function () {
	$("#muldelform").submit(function () {
		if($("#muldelform input :checked").length ==0){
			alert("하나 이상 체크해주세요");
			retrun false;
		}
		
	});
	
});

</script>

<script type="text/javascript">

	function writeForm() {
		location.href ="boardwriteform.jsp";
	}
	
	function allchk(bool) {
		var chks = document.getElementsByName("chk"); //node list로 반환된다 [chk,chk,chk,...]
		for(var i = 0; i <chks.length;i++){
			chks[i].checked = bool;			
		}		
	}

</script>

</head>

<%
	MDBoardDao dao = new MDBoardDao();
	List<MDBoardDto> list = dao.selectList();
%>

<body>
	<%@ include file="./form/header.jsp" %>
	<!-- include된 파일이 현재 어디에 있는지(어디에 포함되고 있는지)를 기준으로 상대경로 -->	
	
	<h1>All list</h1>
	
	<form action="./muldel.jsp" method = "post" id = "muldelform">
	
		<table border="1">
			<col width="30">
			<col width="50">
			<col width="100">
			<col width="300">
			<col width="100">
			<tr>
				<th><input type ="checkbox" name = "all" onclick ="allchk(this.checked);"></th>
				<th>No</th>
				<th>Name</th>
				<th>Title</th>
				<th>Date</th>
			</tr>
			<%
				if(list.size() ==0){
					
			%>
			<tr>
				<td colspan="5">-----There is no comment here-----</td>
			</tr>
			
			<%			
					
				}else{
					for(MDBoardDto dto :list){
						
			%>
				<tr>
					<td><input type = "checkbox" name = "chk" value ="<%=dto.getSeq()%>"></td>
					<td><%=dto.getSeq() %></td>
					<td><%=dto.getWriter() %></td>
					<td><a href = "./detail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle() %></a></td>
					<td><%=dto.getRegdate()%></td>				
				</tr>
			
			<%						
					}
				}
			
			%>
			<tr>
				<td colspan="5">
					<input type = "submit" value = "select delete">
					<input type = "button" value = "insert" onclick="writeForm();">
				</td>		
			</tr>					
		</table>	
	</form>
	
	<%@ include file = "./form/footer.jsp" %>
	
</body>
</html>