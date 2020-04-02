<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".submenu").click(function(){
			var submenu = $(this).next("div");
			if(submenu.is(":visible")){
				submenu.slideUp();
			}else{
				submenu.slideDown();
			}
		});
	});
</script>
<style type="text/css">


#sidebar-wrapper {
	position: fixed;
    left: 0;
    bottom: 0;
    padding-top: 100px;
    width: 260px;
    height: 100%;
    background-color: black;
    z-index: 1;
    float: left;
    
}
.sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
ul {
	list-style: none;
}
   .sidebar-nav li {
  
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    margin-left: 20px;
    text-decoration: none;
    color: #999;
  }
  .sidebar-nav li a:hover{
  	color: white;
  }

  .hidden {
  	display: none;
  }
  .hidden ul li a{
  	padding: 0em;
  	display: block;
    margin-left: 20px;
    text-decoration: none;
    color: #999;
  }


</style>

</head>
<body>

	<div id="sidebar-wrapper">
		<ul class="sidebar-nav" >
				<li><a href='#' onclick="location.href='../farmerdetail.do?command=applyfund';">펀드신청</a></li>
				<li><a href="#" onclick="location.href='../farmerdetail.do?command=applyauction';" >경매신청</a></li>
			    <li><a class="submenu" style="color: #999;">펀드상세</a>
			    	<div class="sidebar-nav hidden">
			    	<ul>
			    		<li><a href="#">펀드진행현황</a></li>
			    		<li><a href="">펀드완료내역</a></li>
			    		<li><a href="">펀드환불현황</a></li>
			    	</ul>
			    	</div>
			    </li>
			    <li><a class="submenu" style="color: #999;">경매상세</a>
			    	<div class="sidebar-nav hidden">
			    	<ul>
			    		<li><a href="">경매진행현황</a></li>
			    		<li><a href="">경매완료내역</a></li>
			    	</ul>
			    	</div>
			    </li>
				<li><a href="" >배송내역</a></li>
				<li><a href="" >주말농장 관리</a></li>
				<li><a href="" >쪽지</a></li>
		</ul>
	</div>
	
	
	

</body>
</html>