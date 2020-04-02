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
<title>펀드내역</title>
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
	      <h4><strong>펀드 투자 내역</strong></h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>펀드번호</th>
	      				<th>펀드이름</th>
	      				<th>무게</th>
	      				<th>펀드상태</th>
	      				<th>참여액수</th>
	      				<th>참여일</th>
	      				<th>취소하기</th>
	      			</tr>
	      		</thead>
			</table>
		</fieldset>
	 </div>
	</div>
   </div>
    
</body>
</html>