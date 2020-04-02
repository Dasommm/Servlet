<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

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

	
* {box-sizing: border-box;}

body { 
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}


.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 25px;
  border-radius: 4px;
}

.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

.header a:hover {
  background-color: #ddd;
  color: black;
}

.header a.active {
  background-color: dodgerblue;
  color: white;
}

.header-right {
  float: right;
  width: 300px;
}

footer{
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  height: 30px;
	text-align: center;
	line-height: 30px;
  
  }

@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  
  .header-right {
    float: none;
  }
}
.header-right input{
	float : right;
}

</style>


</head>
<body>

	
<div class="header">
  <a href="#default" class="logo">logo</a>
  <div class="header-right">
    <a class="active" href="mylist">Home</a>
    <c:choose>
    	<c:when test="${empty login }">
		    <form action="login.do?" method = "post">
		    <input type ="hidden" name = "command" value ="login">
			<table>
				<tr>
					<th>ID : </th>
					<td><input type = "text" name = "id"></td>
				</tr>
				<tr>
					<th>PW : </th>
					<td><input type = "password" name = "pw"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value = "LogIn">
						<input type ="button" value = "Join" onclick="location.href='login.do?command=join'">
					</td>		
				</tr>
			</table>
		    </form>
    	</c:when>
    	<c:otherwise>
			<input type="button" value = "Logout" onclick="">
    	</c:otherwise>
    </c:choose>
    
	</div>
</div>

</body>
</html>