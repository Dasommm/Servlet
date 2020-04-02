<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src ="resources/js/bike01.js"></script>

</head>
<body>

	<form action="bike.do" method = "post">
		<input type= "hidden" name= "command" value ="firstdb">
		<input type= "submit" value = "db저장">
		<table>
			<thead></thead>
			<tbody></tbody>			
		</table>
	</form>



</body>
</html>