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
    <style type="text/css">
    	span {
    		display: inline-block;
    	}
    	table{
    		width: 100%; table-layout: fixed;
    	}
    	th{
    		color: #333333;
    	}
    	th:nth-child(7){
    		 font-size:15px;
    	}
    	td{
    		padding: 5px;
    		text-align: center;
    		vertical-align: middle;
    		overflow: hidden;
    		white-space: nowrap;
    		text-overflow: ellipsis;
    	}
    	td:nth-child(2){
    		text-align: justify;
    		margin-left: 5px;
    	}
    </style>
   	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    	// 깜빡임
    	$(function() {
        	$("td").eq(3).addClass('blink');
        	setInterval("$('.blink').fadeOut().fadeIn();", 1000);
		});
		var lastID = 0;
    	// 새로고침 간격
		function getInfiniteChat() {
			setInterval(function() {
				chatListFunction(lastID);
			}, 1000);
		}
    	// 게시글 출력 기준 ten == 10
		$(document).ready(function(){
			chatListFunction('ten');
			getInfiniteChat();
		});
		function chatListFunction(type) {
			$.ajax({
				type: "POST",
				url: "./RealtimeServlet",
				data: {
					listType: type,
				},
				success: function(data){
					if(data=="") return; 
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i=0; i<result.length; i++){
						addChat(result[i][0].value, result[i][1].value, result[i][2].value);
					}
					lastID = Number(parsed.last);
				}
			});
		}
		function addChat(chatName, chatContent, chatTime) {
			$('#chatList').append('<div class="row">'+
							'<div class="col-lg-12">'+
							'<div class="media">'+
							'<a class="pull-left" href="#">'+
							'<img class="media-object img-circle" src="images/icon.png" style="width: 50px;">'+
							'</a>'+
							'<div class="media-body">'+
							'<h4 class="media-heading">'+
							chatName +
							'<span class="small pull-right">' +
							chatTime +
							'</span>'+
							'</h4>'+
							'<p>'+
							chatContent +
							'</p>'+
							'</div>'+
							'</div>'+
							'</div>'+
							'</div>'+
							'<hr>');
			$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
		}
    </script>
    
</head>

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
			<h2 style="margin: 40px;">실시간 경매</h2>
			
			<div style="margin: 20px;">
				<div style="background-color: gray; text-align: center;">
					<div style="padding:1.2%;">
						<table class="table-bordered">
						<col width=10%><col width=28%><col width=15%><col width=15%>
						<col width=12%><col width=12%><col width=8%>
							<tr>
								<th>아이디</th>
								<th>상품명</th>
								<th>시작가</th>
								<th>현재가</th>
								<th>등록일</th>
								<th>종료일</th>
								<th>참가인원</th>
							</tr>
						</table>
					</div>	
					
				</div>
				<div style="padding:1%; background-color: lightgray; overflow-y: auto;" >
					<div style="padding:1%; background-color: white; border-radius: 10px; overflow-y: auto;">
						<table class="table-bordered">
						<col width=10%><col width=28%><col width=15%><col width=15%>
						<col width=12%><col width=12%><col width=8%>
							<tr>
								<td>user</td>
								<td>꿀사과</td>
								<td>2,000,000원</td>
								<td>12,000,000원</td>
								<td>2020.02.01</td>
								<td>2020.02.28</td>
								<td>125명</td>
							</tr>
						</table>
					</div>				
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