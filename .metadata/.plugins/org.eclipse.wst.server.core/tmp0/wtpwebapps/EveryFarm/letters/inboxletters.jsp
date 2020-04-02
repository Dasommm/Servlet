<%@page import="com.everyfarm.letters.dto.LettersDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/membermypage/buttonstyle.css">
<title>받은쪽지함</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	.box{padding:10px; margin:30px; background: white; border-radius: 10px;}
	.button{font-weight: bold; font-size: large; margin-bottom: 15px;}
	#inbox{background-color: #2EE59D;}
	.title:hover{text-decoration: underline; cursor: pointer;}
	
</style>
</head>
<body>
<%
	List<LettersDto> list = (List<LettersDto>)session.getAttribute("inbox");
%>
	<%@ include file="../home/header.jsp" %>
	<div class="container-fluid">
	  <div class="row">
	  <%@ include file="../home/sidemenu.jsp" %>
	    <div class="col" >
	    	<fieldset class="box">
	      <input type="button" id="inbox" class="button" value="받은 쪽지함" >
	      <input type="button" class="button" value="보낸 쪽지함" onclick="location.href='../letters.do?command=sent&mem_id=${dto.mem_id}'">
	       <form action="../letters.do?command=muldel" method="post">
	       <input type="hidden" name="mem_id" value=${dto.mem_id }>
	      	<table class="table">
	      		<thead>
	      			<tr>
	      				<th><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
	      				<th>보낸사람</th>
	      				<th>제목</th>
	      				<th>날짜</th>
	      			</tr>
	      		</thead>
<%
			if(list.size() == 0){
%>
					<tr>
						<td colspan="4">쪽지가 없습니다.</td>
					</tr>
<%
			} else{
				for(LettersDto dto : list){
%>	      		
					<tr>
					    <td><input type="checkbox" name="chk" value="<%=dto.getLetter_id() %>"></td>
						<td class="sender"><%=dto.getLetter_sender() %></td>
						<input type="hidden" name="letter_sender" value=<%=dto.getLetter_sender() %>>
						<td class="title"><%=dto.getLetter_title() %></td>
						<input type="hidden" name="letter_title" value=<%=dto.getLetter_title() %>>
						<td><f:formatDate value="<%=dto.getLetter_regdate() %>" pattern="yyyy.MM.dd"/></td>
					    <input type="hidden" name="letter_content" value=<%=dto.getLetter_content() %>>
					</tr>
<%
				}
			}
%>
					<tr>
						<td colspan="4">
							<input type="submit" value="선택삭제" class="button"  id="muldel" style="float: left;">
							<input type="button" value="쪽지쓰기" class="button"  id="write" style="float: right">
						</td>
					</tr>
	      	</table>
	     	</form>	 
	      </fieldset>
	     </div>
	    </div>
	   </div>
</body>
<script type="text/javascript">
	function allChk(bool){
		var chks= document.getElementsByName("chk");
		for(var i=0; i<chks.length; i++){
			chks[i].checked = bool;
		}
	}
	$(function(){
		$("#write").click(function(){
			var option = "width=450, height=600,top = 100, left = 500, location = no"
			window.open("../letters/writeletters.jsp?mem_id=${dto.mem_id}","쪽지쓰기",option);
		})
		
		$(".title").each(function(i){
			$(this).click(function(e){
					var mem_id = document.getElementsByName("mem_id")[0].value;
					var letter_id = document.getElementsByName("chk")[i].value;
					location.href="../letters.do?command=detail&letter_id="+letter_id+"&mem_id="+mem_id;
					e.preventDefault();
			})
		})
		
		$("#muldel").click(function(){
			if($("input:checked").length == 0){
				alert("하나 이상 체크해 주세요");
				return false;
			}
		})
	})
</script>
</html>