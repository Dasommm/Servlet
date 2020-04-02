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
   	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<%
	PagingDto paging = (PagingDto)session.getAttribute("upgradelist_paging");
	int pagegroup = (int)Math.ceil((double)paging.getCurrentpage()/paging.getPagescale()); 
	//블록번호 = 현재 페이지 / 블록크기 = 올림 (1/5=0.2=1) 1번째 블록
	int startpage = paging.getPagescale()*(pagegroup-1)+1;
	// 블록의 시작 페이지 번호 = (블록크기 * (블록번호-1)) +1 / 5*(1-1)+1= 블록의 시작은 1
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
			<h2 style="margin: 40px;">등업신청</h2>
			
			<div style="margin: 40px;">
				<table class="table table-striped table-bordered">
				<col width="30%">
				<col width="30%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>등급</th>
						<th>신청상태</th>
						<th>등업</th>
					</tr>
					
					<c:choose>
						<c:when test="${empty upgradelist }">
							<tr>
								<td colspan="5">등업할 목록이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${upgradelist }" var="dto">
								<tr>
									<td>${dto.mem_id }</td>
									<td>${dto.mem_name }</td>
									<td>
										<c:choose>
											<c:when test="${dto.mem_grade eq 2}">
												<c:out value="농부"></c:out>
											</c:when>
											<c:when test="${dto.mem_grade eq 3}">
												<c:out value="관리자"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="회원"></c:out>
											</c:otherwise>											
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${dto.farmer_status eq 2}">
												<c:out value="승인완료"></c:out>
											</c:when>
											<c:otherwise>
												<c:out value="승인대기"></c:out>
											</c:otherwise>											
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${dto.farmer_status eq 1}">
												<button type="button" class="btn btn-primary"
												onclick="location.href='../admin.do?command=upgraderes&id=${dto.mem_id}&pageNumber=<%=currentpage %>'"
												>등업</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-primary" 
												style="background-color: gray; border-color: gray; cursor: default;"
												disabled="disabled">완료</button>
											</c:otherwise>											
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
						<li><a href="../admin.do?command=upgradelist&pageNumber=<%=startpage-1%>">
						<span class="glyphicon glyphicon-chevron-left"></span></a></li>
				<%
					}
					for(int pagenum = startpage; pagenum <= ((endpage<totalpage)?endpage:totalpage); pagenum++){
						if(paging.getCurrentpage()==pagenum){					
				%>					
						<li class="active"><a href="../admin.do?command=upgradelist&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							} else {
				%>
						<li><a href="../admin.do?command=upgradelist&pageNumber=<%=pagenum%>"><%=pagenum %></a></li>
				<%
							}
						}
					if(endpage < paging.getTotalpage()){						
				%>
						<li><a href="../admin.do?command=upgradelist&pageNumber=<%=endpage+1%>">
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