<%@page import="com.board.dto.PagingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	a{
		text-decoration: none;
		color: black
	}
	a:visited{
		text-decoration: none;
		color: black;
	}
	a:hover{
		color: red;
	}

</style>

<%
	PagingDto paging = (PagingDto)request.getAttribute("paging");
	int pagegroup = (int)Math.ceil((double)paging.getCurrentpage()/paging.getPagescale());
	int startpage = paging.getPagescale()*(pagegroup-1)+1;
	int endpage = paging.getPagescale()*pagegroup;
	int totalpage = paging.getTotalpage();

%>

</head>
<body>


	<table border="1" style="margin-left: auto; margin-right: auto;">
		<col width="75">
		<col width="150">
		<col width="300">
		<col width="150">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	<c:choose>
		<c:when test="${empty list }">
			<tr colspan="4" align="center">
				<td>- - - - - - - - - - 게시글이 존재하지 않습니다 - - - - - - - - - -</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<tr align="center">
					<td>${dto.seq }</td>
					<td>${dto.name }</td>
					<td><a href="">${dto.title }</a></td>
					<td>${dto.regdate }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center">
<%
				if(pagegroup > 1){
%>
					<a href="board.do?command=list&page=<%=startpage-1%>">&lt;&lt;prev</a>
<%
				}
				for(int pagenum = startpage; pagenum <= ((endpage < totalpage)?endpage:totalpage); pagenum++){
%>
					<a href ="board.do?command=list&page=<%=pagenum%>"><%=pagenum %></a>
<%
				}
				if(endpage < paging.getTotalpage()){
%>
					<a href="board.do?command=list&page=<%=endpage+1%>">next&gt;&gt;</a>	

<%
				}
%>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>	
	</table>


</body>
</html>