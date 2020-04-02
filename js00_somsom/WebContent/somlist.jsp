<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

*{
	margin: auto;
}


.tr{
	border-top : 1px dotted black;
	border-bottom: 1px dotted black;
	background-color: lightgray;
}
.formtd{
	border-bottom: 1px dotted black; 
}

h1{
	color: green;
	text-align: center;
}


#newButton{
	float : right;
}


</style>

<script type="text/javascript">

	function allChk(bool){
		var chks = document.getElementsByName("chk");
		for(var i = 0; i < chks.length ; i++){
			chks[i].checked = bool;
		}
		
	}


</script>

</head>
<body>

<%@ include file = "./form/header.jsp" %>

	<h1>Welcome to the Som's Board!</h1>
	
	<table>
		<col width="30">
		<col width="50">
		<col width="100">
		<col width="200">
		<col width="100">
		
		<tr class="tr">
			<th><input type = checkbox name = "all" onclick="allChk(this.checked);"></th>
			<th>No</th>
			<th>Name</th>
			<th>Title</th>
			<th>Date</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="5">-----No Comment-----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td align = "center" class="formtd"><input type ="checkbox" name = "chk"></td>
						<td align = "center" class="formtd">${dto.seq }</td>
						<td align = "center" class="formtd">${dto.name }</td>
						<td align = "center" class="formtd"><a href = "bdDetail?seq=${dto.seq }">${dto.title }</a></td>
						<td align = "center" class="formtd">${dto.regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="5">
			<input type= "button" value = "Delete">
			<input type = "button" value = "New" id="newButton" onclick="location.href = 'bdInsertForm'">
			</td>
		</tr>
	</table>
<%@ include file ="./form/footer.jsp" %>

</body>
</html>