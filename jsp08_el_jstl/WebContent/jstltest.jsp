<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL Test</h1>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
			<th>등급</th>
		</tr>
		<c:forEach items = "${list }" var ="score">	<!-- items은 컬렉션이 들어가고  -->
			<tr>
				<td>
					<c:if test="${score.name eq '이름10' }"> <!-- eq는 =을 의미 -->
						<c:out value="홍길동"></c:out>
					</c:if>
					<c:choose>
						<c:when test="${score.name eq '이름20'}">
							<c:out value="${score.name }님"></c:out>
						</c:when>
						<c:otherwise>
							<c:out value="누구지?"></c:out>
						</c:otherwise>
					</c:choose>					
				</td>
				<td>${score.kor }</td>			
				<td>${score.eng }</td>
				<td>${score.math }</td>
				<td>${score.sum }</td>
				<td>${score.avg }</td>
				<td>
					<c:choose>
						<c:when test="${score.grade eq 'A' || score.grade eq 'B' }">
							<c:out value="PASS"></c:out>
						</c:when>
						<c:otherwise>
							<c:out value="FAIL"></c:out>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:forEach var = "i" begin ="1" end ="10" step= "1">	<!-- java의 향상된 for문과 동일하게 사용할 수 있다. -->
		${i }<br>
	
	<hr>
	
	<h1>구구단</h1>
	<c:forEach var = "i" begin = "2" end ="9" step = "1">
			<br>
			${i}단 <br>
		<c:forEach var = "j" begin = "1" end = "9" step = "1">
			${i } * ${j } = ${i*j }<br>
		</c:forEach>
	</c:forEach>
	
	
	
	</c:forEach>
	
	
	
	
	
	

</body>
</html>