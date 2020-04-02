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
</head>
<body>
<%
	//muldel.jsp?chk=1&chk=2&chk=5와 같은 형식으로 받아질 것이다
	//request.getParameterValues() 같은 이름의 여러 값을 받을 때 사용
	
	String [] seq = request.getParameterValues("chk");

	if (seq == null|| seq.length==0){
%>
<script type="text/javascript">
	alert("하나 이상 체크박스를 선택하세요");
	location.href = "./boardlist.jsp";
</script>
<%
	}else{
		MDBoardDao dao = new MDBoardDao();
		int res = dao.multiDelete(seq);
		if(res>0){
%>
 <script type="text/javascript">
 	alert("success");
 	location.href = "boardlist.jsp";
 </script>

<%
	}else{
%>
<script type="text/javascript">
	alert("failed");
	location.href = "boardlist.jsp"

</script>

<%
	}
}
%>

</body>
</html>