<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매내역</title>
<style type="text/css">
	.box{border: 1px solid gray; padding:10px; margin:30px; background: white; border-radius: 10px;}
	button{width: 100px; height:30px; float:right;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <h4><strong>경매 참가 내역</strong></h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>경매번호</th>
	      				<th>경매이름</th>
	      				<th>참여일</th>
	      				<th>종료일</th>
	      				<th>경매상태</th>
	      				<th>참여액수</th>
	      				<th>결제하기</th>
	      			</tr>
	      		</thead>
			</table>
		</fieldset>
	 </div>
	</div>
   </div>
    
</body>
</html>