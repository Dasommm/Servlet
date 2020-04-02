<%@page import="com.cal.dto.CalDto"%>
<%@page import="java.util.List"%>
<%@page import="com.cal.dao.CalDao"%>
<%@page import="com.cal.dao.Util"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

#calendar{
	border-collapse: collapse;
	border: 1px solid gray;
}
#calendar th{
	width: 80px;
	border: 1px solid gray;
}
#calendar td{
	width: 80px;
	height: 80px;
	border: 1px solid gray;
	text-align: left;
	vertical-align: top;
	position: relative;
}

#blank{
	width: 400px;
	height: 400px;

}
a{
	text-decoration: none;

}

.clist > p{
	font-size: 5px;
	margin: 1px;
	background-color: lightpink;
}

.cpreview{
	position: absolute;
	top: -30px;
	left: 10px;
	background-color: lightgreen;
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border-radius: 40px 40px 40px 1px;

}

</style>
<script type="text/javascript" src = "js/jquery-3.4.1.js"></script>

<script>
function isTwo(n){
	return (n.length<2)?"0"+n :n;
}

$(function(){
	$(".countview").hover(function(){
		var aCountView = $(this);	// this는 a 태그를 말한다
		var year = $(".y").text().trim();
		var month = $(".m").text().trim();
		var cDate = aCountView.text().trim();
		var yyyyMMdd = year + isTwo(month) + isTwo(cDate);
		//alert(yyyyMMdd);
		
		$.ajax({
			type:"POST",						//전송방식
			url : "calcountajax.do",			//요청 경로, 어디로 보낼건지
			data : "id=kh&yyyymmdd="+yyyyMMdd,	// 보낼 데이터
			dataType:"json",					//받을 데이터의 타입
			async:false,						//동기, true : 비동기. default는 true
			success:function(msg){				//msg라는 Json파일이 전달 받았다.
				var count = msg.count;
				aCountView.after("<div class='cpreview'>"+count+"</div>");
			},
			error:function(){
				alert("failed")
			}	
		})
		
	}, function(){
		$(".cpreview").remove();
	})
})

</script>

</head>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	
	if(paramYear != null){
		year = Integer.parseInt(paramYear);
	}
	if(paramMonth != null){
		month = Integer.parseInt(paramMonth);
	}
	if(month < 1){
		month =12;
		year --;
	}
	if(month >12){
		month =1;
		year++;
	}
	// 현재년도, 현재월, 해당 월의 1일로 셋팅
	cal.set(year,month-1, 1);
	
	// 1일의 요일
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// 현재 월의 마지막 일
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
	// 달력에 일정 표현
	CalDao dao = new CalDao();
	String yyyyMM = year + Util.isTwo(String.valueOf(month));
	List<CalDto> clist = dao.getCalViewList("kh", yyyyMM);
	

%>

<body>

	<table id="calendar">
		<caption>
			<a href = "calendar.jsp?year=<%=year-1%>&month=<%=month%>">◁</a>
			<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
			
			<span class="y"><%=year %></span>년
			<span class="m"><%=month %></span>월	
		
			<a href = "calendar.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
			<a href ="calendar.jsp?year=<%=year+1%>&month=<%=month%>">▷</a>
		</caption>
		
		<tr>
			<th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thur</th><th>Fri</th><th>Sat</th>
		</tr>
		<tr>
		<%
		// 요일만큼 공백
		for(int i = 1; i<dayOfWeek; i++){
		%>
			<td><span id="blank"></span></td>		
		<%			
		}
		//달력출력
		for(int i=1; i<= lastDay; i++){
			
		%>
		
		<td>
		<a class="countview" href ="calendar.do?command=list&year=<%=year%>&month=<%=month%>&date=<%=i%>" style="color: <%=Util.fontColor(i, dayOfWeek)%>"><%=i %></a>
		<a href = "insertcalboard.jsp?year=<%=year%>&month=<%=month%>&date=<%=i%>&lastDay=<%=lastDay%>">
			<img alt="일정추가" src="img/pen.png" style="width: 10px; height: 10px">
		</a>
		<div class="clist">
			<%=Util.getCalView(i, clist) %>
		</div>
		</td>
		
		<%
			if(dayOfWeek%7==0){
		%>
		
		</tr>		
		<tr>
		
		<%
			}
		dayOfWeek++;		
		}
		
		//뒤에 공백채우기
		//dayOfWeek 1일의 요일, lastDay 해당월의 마지막날
		for(int i= (dayOfWeek-1)%7; i<7 ;i++){		// 마지막에 추가되는 dayOfWeek++; 때문에 공식이 성립 안되기 때문에 -1을 해주면 공식이 성립된다.
			if(i==0){
				break;
			}
			out.print("<td>&nbsp</td>");
		}
		%>
		</tr>
		
	</table>

</body>
</html>