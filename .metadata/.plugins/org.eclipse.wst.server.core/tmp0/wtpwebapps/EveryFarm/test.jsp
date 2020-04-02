<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 관리자 Ajax 적용 -->
<script src="resources/ajax.js"></script>

</head>
<body>
<div id="countdown"></div>
<!-- First Action -->
<!-- 게시글이 있으면 -->

	<!-- 본문영역 -->
	<div class="liveAucDesc">
		<!-- 결과 출력 -->
	</div>

</body>
 <script type="text/javascript">
 /* Timer */
 function countdown( elementId, seconds ){
   var element, endTime, hours, mins, msLeft, time;

   function updateTimer(){
     msLeft = endTime - (+new Date);
     if ( msLeft < 0 ) {
       console.log('done');
     } else {
       time = new Date( msLeft );
       hours = time.getUTCHours();
       mins = time.getUTCMinutes();
       element.innerHTML = (hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
       setTimeout( updateTimer, time.getUTCMilliseconds());
       // if you want this to work when you unfocus the tab and refocus or after you sleep your computer and come back, you need to bind updateTimer to a $(window).focus event^^
     }
   }

   element = document.getElementById( elementId );
   endTime = (+new Date) + 1000 * seconds;
   updateTimer();
 }

 countdown('countdown', 9000);	 // second base
</script>
<style type="text/css">
div {
  color: #1B232F;
  font-family: Verdana, Arial, sans-serif;
  font-size: 18px;
  font-weight: bold;
  text-decoration: none;
}
</style>
</html>