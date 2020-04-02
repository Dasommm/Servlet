<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
			
			function areaChange(){
				var seoul = ["강남구", "강북구", "강서구", "관악구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "성동구", "성북구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구"];
				var gyeonggi = ["가평군", "고양시", "과천시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "성남시", "안양시", "양주시", "양평시", "여주시", "연천군", "의정부시", "파주시", "포천시", "하남시"];
				
				var selectLoc = $('#loc1').val();
				var changeArea;
				
				if(selectLoc == "서울"){
					changeArea = seoul;
				} else if(selectLoc == "경기"){
					changeArea = gyeonggi;
				}
				
				$('#area').empty();
				
				for(var count = 0; count < changeArea.length; count++){
					var option = $('<option value="'+changeArea[count]+'">' + changeArea[count] +'</option>');
					$('#area').append(option);
				}
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
	padding-top: 2em;
	padding-botton: 2em;
}

.items>label{
	margin: 0;
}

.inputbox{
	border: 1px;
	border-color: gray;
	border-radius: 4px;
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

select{
	width: 100px;
	height: 35px;
	font-size: 13pt;
}
#area{
	width: 140px;
}

.items>span{
	display: inline-block;
	margin-left: 10px;
	height: 30px;
}
label{
	font-size: 15pt;
	font-weight: bold;
}

textarea{
	width : 600px;
	height: 50px;
	resize: none;
	border: none;
	background-color: #f2f2f2;
	border-radius: 4px;
	font-size: 14pt;
}
</style>
</head>
<body>
	<%@ include file="../home/header.jsp" %>
	
	<section>
		<div id="outline">
		<h1 style="font-weight:bold;">경매 신청</h1>
		<form action="../registauction.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="newauction">
			<input type="hidden" name="mem_id" value= "${sessionScope.dto.mem_id}">
			
			<div class="items"><label>상품명</label><br>
			<input type="text" name="stock_name" class="inputbox"></div>
			
			<div class="items"><label>상품 소개</label> <br>
			<textarea name="stock_detail_01"></textarea><br>
			
			<div class="items"><label>상품 대표 이미지</label><br>
			<input type="file" name="stock_image_01"></div>
			
			<div class="items"><label>생산지역</label><br>
			<select id="loc1" onchange="areaChange();">
				<option>서울</option>
				<option>경기</option>
			</select>
			
			<select id="area" name="stock_location">
				<option value="강남구">강남구</option>
				<option value="강북구">강북구</option>
				<option value="강서구">강서구</option>
				<option value="관약구">관악구</option>
				<option value="구로구">구로구</option>
				<option value="금천구">금천구</option>
				<option value="노원구">노원구</option>
				<option value="도봉구">도봉구</option>
				<option value="동대문구">동대문구</option>
				<option value="동작구">동작구</option>
				<option value="마포구">마포구</option>
				<option value="서대문구">서대문구</option>
				<option value="성동구">성동구</option>
				<option value="성북구">성북구</option>
				<option value="양천구">양천구</option>
				<option value="영등포구">영등포구</option>
				<option value="용산구">용산구</option>
				<option value="은평구">은평구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
			</select>
			
			</div>
			
			<div class="items"><label>품목</label><br>
			<select name="stock_kind">
				<option value="1">과일</option>
				<option value="2">채소</option>
				<option value="3">곡류</option>
				<option value="4">견과류</option>
				<option value="5">약용작물</option>
				<option value="6">버섯류</option>
			</select>
			</div>

			<div class="items"><label>무게</label><br>
			<input type="text" name="stock_kg" class="inputbox"><span> kg</span>
			</div>
			
			<div class="items"><label>경매 시작 가격</label><br>
			<input type="text" name="auc_startPrice" class="inputbox"><span> 원</span></div>

			<div class="items"><label>경매 종료일</label><br>
			<input type="date" id="enddate" name="auc_endDate"></div>
			
			<div class="items"><label>상품 특징</label> <br>
			<p>상품 이미지 3장과 그에 따른 상세설명 3가지를 작성해 주세요.<p>
			<input type="file" name="stock_image_02"><br>
			<textarea name="stock_detail_02"></textarea><br>
			<input type="file" name="stock_image_03"><br>
			<textarea name="stock_detail_03"></textarea><br>
			<input type="file" name="stock_image_04"><br>
			<textarea name="stock_detail_04"></textarea><br>
			</div>

			
			<br>
			<br>
			<br>
			<input type="submit" value="등록 신청">
		    

		</form>
		</div>
	</section>
	
	<footer><%@ include file="../home/footer.jsp" %></footer>
</body>
</html>