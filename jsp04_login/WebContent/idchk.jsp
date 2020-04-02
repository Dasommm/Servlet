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

	function myconfirm(bool) {
		if(bool == 'true'){
			opener.document.getElementsByName("mypw")[0].focus();
			opener.document.getElementsByName("myid")[0].title='y';			
		}else{
			opener.document.getElementsByName("myid")[0].focus();
		}
		self.close();
	}
	onload=function(){
		var id = opener.document.getElementsByName("myid")[0].value;
		document.getElementsByName("id")[0].value=id;
	}

</script>


</head>
<%
	String idnotused = request.getParameter("idnotused");
	//보낸 값은 boolean인데 왜 String일까 
	// request에서 보낸 값들은 모두 String으로 넘어온다 
%>

<body>

	<table>
		<tr>
			<td><input type = "text" name = "id"></td>
		</tr>
		<tr>
			<td><%=idnotused.equals("true")?"아이디 생성 가능 ":"중복된 아이디 존재" %></td>
		</tr>
		<tr>
			<td>
				<input type = "button" value ="확인" onclick="myconfirm('<%=idnotused%>')"> 
				<!--function안에 ''가 중요하다 없다면 객체로 인식, 있으면 문자열로 인식 -->
			</td>								
		</tr>	
	</table>




</body>
</html>