<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<title>마이페이지</title>
</head>

<style type="text/css">
	.box{border: 1px solid gray; padding:10px; margin:30px; background: white; border-radius: 10px;	}
	.button{margin-right: 10px; margin-top: 10px;}
</style>
<body>
<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <h4><strong>나의 프로필</strong></h4>
	      <img alt="프로필이미지" src="../resources/images/home/header/member.png" style="border-radius:50px; width:100px; height:100px;">
	      ${sessionScope.dto.mem_id }님
	      <div class="wrap">
	        <a href="#" class="button" onclick="location.href='../letters.do?command=letters&mem_id=${sessionScope.dto.mem_id}';">쪽지</a>
	      	<a href="#" class="button" onclick="location.href='../memberMyPage.do?command=myinfo&mem_id=${sessionScope.dto.mem_id}';">내정보 보기</a>
	      	<a href="#" class="button" onclick="location.href='../memberMyPage.do?command=memberdelete';">회원탈퇴</a>
	      </div>
	      </fieldset>
	      <fieldset class="box">
	      <h4>농장 신청 내역</h4>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th>농장이름</th>
	      				<th>분양 평수</th>
	      				<th>주소</th>
	      				<th>승인상태</th>
	      				<th>신청일</th>
	      			</tr>
	      		</thead>
	      	</table>
	       
	       
	      </fieldset>
	       <hr/>
	    <fieldset class="box">
	      <h4>펀드, 경매 내역</h4>
	       <table class="table">
	      		<thead>
	      			<tr>
	      				<th>종류</th>
	      				<th>이름</th>
	      				<th>상태</th>
	      				<th>무게</th>
	      				<th>가격</th>
	      				<th>신청일</th>
	      			</tr>
	      		</thead>
	      	</table>
	    </fieldset>
	    <hr/>
	    <fieldset class="box">
	     <h4> 환불, 배송</h4>
	      <table class="table">
	      		<thead>
	      			<tr>
	      				<th>주문번호</th>
	      				<th>상품이름</th>
	      				<th>무게</th>
	      				<th>거래상태</th>
	      				<th>배송상태</th>
	      			</tr>
	      		</thead>
	      	</table>
	    </fieldset>
	    
	   		 </div>
	     </div>
	  </div>
	
	
<%@ include file="../home/footer.jsp" %>
</body>
<script type="text/javascript">
	if(${empty sessionScope.dto.mem_id}){
		alert("로그인이 필요합니다");
		location.href="../home/section.jsp";
	}
</script>
</html>