<%@page import="com.everyfarm.admin.dto.PagingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>EveryFarm</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/home/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/home/animate.css">
    <link rel="stylesheet" href="../resources/css/home/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/home/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/home/magnific-popup.css">
    <link rel="stylesheet" href="../resources/css/home/aos.css">
    <link rel="stylesheet" href="../resources/css/home/ionicons.min.css">
    <link rel="stylesheet" href="../resources/css/home/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../resources/css/home/jquery.timepicker.css">
    <link rel="stylesheet" href="../resources/css/home/flaticon.css">
    <link rel="stylesheet" href="../resources/css/home/icomoon.css">
    <link rel="stylesheet" href="../resources/css/home/style.css">

    <link rel="stylesheet" href="../resources/css/admin/sidebar.css">
    <link rel="stylesheet" href="../resources/css/admin/bootstrap.css">
</head>
<%
	PagingDto paging = (PagingDto)session.getAttribute("approvallist_paging");
	int pagegroup = (int)Math.ceil((double)paging.getCurrentpage()/paging.getPagescale()); 
	int startpage = paging.getPagescale()*(pagegroup-1)+1;
	int endpage = paging.getPagescale()*pagegroup;
	int totalpage = paging.getTotalpage();
	int currentpage = paging.getCurrentpage();
%>
<body>
<%@ include file="../home/header.jsp" %>
	<!-- 섹션 -->
	<div class="section_total">
		<!-- 사이드바 -->
		<div class="section_sidebar">
			<%@ include file="admin_sidebar.jsp" %>
		</div>
		
		<!-- 바디 -->
		<div class="section_content">
			<h2 style="margin: 40px;">경매승인</h2>
			
			<div style="margin: 40px;">
				<table class="table table-striped table-bordered">
				<col width="15%">
				<col width="35%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
					<tr>
						<th>아이디</th>
						<th>상품명</th>
						<th>시작가</th>
						<th>등록일</th>
						<th>종료일</th>
						<th>승인</th>
					</tr>
					
					<c:choose>
						<c:when test="${empty approvallist }">
							<tr>
								<td colspan="6">경매 목록이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${approvallist }" var="dto">
								<tr>
									<td>${dto.mem_id }</td>
									<td>${dto.stock_name }</td>
									<td>${dto.auc_startPrice }</td>
									<td>${dto.auc_regDate }</td>
									<td>${dto.auc_endDate }</td>
									<td>
										<c:choose>
											<c:when test="${dto.auc_status eq 1}">
												<button type="button" class="btn btn-primary"
												onclick="location.href='../admin.do?command=approvalres&no=${dto.auc_no}'"
												>미등록</button>
											</c:when>
											<c:when test="${dto.auc_status eq 2}">
												<button type="button" class="btn btn-success"
												style="cursor: default;" disabled="disabled"
												onclick="location.href='#'"
												>진행중</button>
											</c:when>
											<c:when test="${dto.auc_status eq 3}">
												<button type="button" class="btn btn-primary" 
												style="background-color: gray; border-color: gray; cursor: default;"
												disabled="disabled">낙찰</button>
											</c:when>										
										</c:choose>
									</td>
								</tr>								
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				
				<!-- 페이징 영역 -->
				<div align="center">
				<ul class="pagination" style="margin: 0 auto; display: inline-block;">
				<%
					if(pagegroup>1){
				%>							
						<li><a href="../admin.do?command=auctionapproval&pageNumber=<%=startpage-1%>">
						<span class="glyphicon glyphicon-chevron-left"></span></a></li>
				<%
					}
					for(int pagenum = startpage; pagenum <= ((endpage<totalpage)?endpage:totalpage); pagenum++){
						if(paging.getCurrentpage()==pagenum){					
				%>					
						<li class="active"><a href="../admin.do?command=auctionapproval&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							} else {
				%>
						<li><a href="../admin.do?command=auctionapproval&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							}
						}
					if(endpage < paging.getTotalpage()){						
				%>
						<li><a href="../admin.do?command=auctionapproval&pageNumber=<%=endpage+1%>">
						<span class="glyphicon glyphicon-chevron-right"></span></a></li>
				<%
					}
				%>
				</ul>
				</div>
				
			</div>
				
		</div>
	</div>
<%-- 	<%@ include file="../home/footer.jsp" %> --%>
<div class="temp_footer">footer</div>
	

  <!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="../resources/js/home/jquery.min.js"></script>
  <script src="../resources/js/home/jquery-migrate-3.0.1.min.js"></script>
  <script src="../resources/js/home/popper.min.js"></script>
  <script src="../resources/js/home/bootstrap.min.js"></script>
  <script src="../resources/js/home/jquery.easing.1.3.js"></script>
  <script src="../resources/js/home/jquery.waypoints.min.js"></script>
  <script src="../resources/js/home/jquery.stellar.min.js"></script>
  <script src="../resources/js/home/owl.carousel.min.js"></script>
  <script src="../resources/js/home/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/home/aos.js"></script>
  <script src="../resources/js/home/jquery.animateNumber.min.js"></script>
  <script src="../resources/js/home/bootstrap-datepicker.js"></script>
  <script src="../resources/js/home/jquery.timepicker.min.js"></script>
  <script src="../resources/js/home/scrollax.min.js"></script>
  <script src="../resources/js/home/google-map.js"></script>
  <script src="../resources/js/home/main.js"></script>

</body>
</html>