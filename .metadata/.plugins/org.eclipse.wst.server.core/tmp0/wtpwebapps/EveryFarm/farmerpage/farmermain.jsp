<%@page import="com.everyfarm.member.dto.MemberDto"%>
<%@page import="com.everyfarm.member.dao.MemberDaoImpl"%>
<%@page import="com.everyfarm.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	
	section{
		height: 1000px;
		width: auto;
		
	}
	
</style>
</head>

<body>
	
		<div id="wapper"> 
		<!--헤더--> 
		
				<%@ include file="../home/header.jsp" %>
		 
		
			
		<!--콘텐츠부분--> 
			<section style="height:1000px;"> 
				<div id="left">
				<%@ include file="../home/sidemenu_fm.jsp" %>
				</div>
				
				<div id="right">
					<h1>마이페이지</h1>
					<div class="mypage-main">프로필
						<input type="hidden" value="">
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				
				
				
				
			</section>
			
			
			
		<!--풋터--> 
			<footer><%@ include file="../home/footer.jsp" %></footer> 
		
		</div> 
	

	
	
</body>
</html>