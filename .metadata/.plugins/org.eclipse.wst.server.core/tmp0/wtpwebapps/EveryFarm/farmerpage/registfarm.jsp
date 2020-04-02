<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 도로명 API -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){            
		$("#zonecode").click(function(){
	
			openDaumZipAddress();
		
		});
		
	});
	function openDaumZipAddress() {   
		
		new daum.Postcode({
	
			oncomplete:function(data) {
	
				jQuery("#postcode1").val(data.postcode1);
	
				jQuery("#postcode2").val(data.postcode2);
	
				jQuery("#zonecode").val(data.zonecode);
	
				jQuery("#address").val(data.address);
	
				jQuery("#address_etc").focus();
	
				console.log(data);
	
			}
	
		}).open();
		$("#detail01").show();
		$("#detail02").show();
	}
	

</script>
<style type="text/css">



#outline{
	width: 70%;
    height: auto;
    position: relative;
    top: 30%;
    right: 15%;
    left: 15%;
    padding-top: 100px;
    padding-bottom: 100px;
}

form{
	position: relative;
	width: auto;
	left: 15%;
	height : auto;
	padding-top: 30px;
}
.items{
	padding-top: 1em;
	padding-botton: 1em;
}


.inputbox{
	border: 1px;
	border-color: gray;
	border-radius: 3px;
	background: #f2f2f2;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
	vertical-align: center;
	width: 300px;
}

input[type="submit"]{
	width: 150px;
	height: 3em;
	border: 0;
	background-color: black;
	color : white;
	border-radius: 5px;
	font-size: 13pt;
	margin-left: 65%;
}



.items>span{
	display: inline-block;
	margin: 5px;
}
label{
	font-size: 14pt;
}

</style>
</head>
<body>

	<%@ include file="../home/header.jsp" %>
	
	<section>
		<div id="outline">
		<h1 style="font-weight:bold;">임대 농장 등록</h1>
		<form action="../farmer.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="registform">
			<input type="hidden" name="mem_id" value= "${sessionScope.dto.mem_id}">
			
			<div class="items"><label style="margin: 0;">농장 이름</label><br>
			<input type="text" name="wfarm_title" class="inputbox"></div>
			
			<div class="items">농장 대표 이미지<label style="margin: 0;"></label><br>
			<input type="file" name="wfarm_image_01"></div>
			
			<div class="items"><label style="margin: 0;">농장 주소</label><br>
			<input type="text" name="wfarm_zoneCode" id="zonecode" readonly class="inputbox"><br>
			<input type="text" name="wfarm_addr" id="address" readonly class="inputbox"></div>
			
			<div class="items"><label style="margin: 0;">총 평수</label><br>
			<input type="text" name="wfarm_totalArea" class="inputbox"><span> 평</span></div>

			<div class="items"><label style="margin: 0;">평당 가격</label><br>
			<input type="text" name="wfarm_price" class="inputbox"><span> 원</span></div>

			<div class="items"><label style="margin: 0;">농장 상세 사진</label> <br>
			<input type="file" name="wfarm_image_02"><br>
			<input type="file" name="wfarm_image_03"><br>
			<input type="file" name="wfarm_image_04"></div>

			<div class="items"><label style="margin: 0;">농장 상세 정보</label></div>
			<textarea name="wfarm_content" cols="100" rows="30"></textarea>	
			<br>
			<br>
			<input type="submit" value="등록 신청">
		    

		</form>
		</div>
	</section>
	
	<footer><%@ include file="../home/footer.jsp" %></footer>
</body>
</html>