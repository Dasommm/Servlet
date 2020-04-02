<%@page import="com.my.dao.MyDao"%>
<%@page import="com.my.dto.MyDto"%>
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
//dto에 담겨온 데이터(name, title,content)를 dao를 통해 db연결
//request에 담겨있기 때문에 다시 꺼내와야한다

	String myname = request.getParameter("myname");
	String mytitle = request.getParameter("mytitle");
	String mycontent = request.getParameter("mycontent");
	
	
	//받아온 데이터들을 데이터베이스에 insert하기 위해서 dao에게 보내야하는데 
	//하나하나 보내기 귀찮으니까 dto에 담아서 한번에 보내준다.
	MyDto dto = new MyDto();
	dto.setMyname(myname);
	dto.setMytitle(mytitle);
	dto.setMycontent(mycontent);
	
	MyDao dao = new MyDao();
	
	//dao보내고 return받을거다
	int res = dao.insert(dto);
	
	if(res >0){

%>

<script type="text/javascript">
	alert("success!");
	location.href = "mylist.jsp";
</script>

<%
	}else{
%>

<script type="text/javascript">
	alert("failed");
	location.href = "myinsert.jsp";
</script>

<%
	}
%>

</body>
</html>