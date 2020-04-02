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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<script type="text/javascript">
	function submitFunction() {
		var auc_id = $('#auc_id').val();
		var auc_name = $('#auc_name').val();
		var auc_init = $('#auc_init').val();
		var auc_curr = $('#auc_curr').val();
		var auc_reg = $('#auc_reg').val();
		var auc_end = $('#auc_end').val();
		var auc_cnt = $('#auc_cnt').val();
		
		$.ajax({
			type: "POST",
			url: "./RealtimeServlet",
			data: {
				auc_id: encodeURIComponent(auc_id),
				auc_name: encodeURIComponent(auc_name),
				auc_init: encodeURIComponent(auc_init),
				auc_curr: encodeURIComponent(auc_curr),
				auc_reg: encodeURIComponent(auc_reg),
				auc_end: encodeURIComponent(auc_end),
				auc_cnt: encodeURIComponent(auc_cnt)
			},
			success: function(result){
				if(result ==1){
					alert('전송에 성공했습니다.');
				} else if(result ==0){
					alert('이름과 내용을 정확히 입력하세요.'); 
				} else {
					alert('데이터베이스 오류가 발생했습니다.');
				}
			}
		});
		$('#auc_name').val('');
	</script>
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
			<h2 style="margin: 40px;">경매등록(테스트용 페이지)</h2>
			
			<div style="margin: 40px;">
				<div style="margin: 1%; color:black;">
					<form action="admin.do" method="post">
						<ul>
							<li>아이디: <input type="text" id="auc_id"></li>			
							<li>상품명: <input type="text" id="auc_name"></li>			
							<li>시작가: <input type="text" id="auc_init"></li>			
							<li>현재가: <input type="text" id="auc_curr"></li>			
							<li>등록일: <input type="text" id="auc_reg"></li>			
							<li>종료일: <input type="text" id="auc_end"></li>			
							<li>참가인원: <input type="text" id="auc_cnt"></li>			
						</ul>
					</form>
					<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
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