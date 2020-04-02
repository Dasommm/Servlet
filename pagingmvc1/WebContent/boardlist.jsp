<%@page import="java.util.List"%>
<%@page import="com.dto.Dto"%>
<%@page import="com.biz.BizImpl"%>
<%@page import="com.dto.PagingDto"%>
<%@page import="com.biz.Biz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int currentpage = Integer.parseInt(request.getParameter("currentpage"));  //1
	
	Biz biz = new BizImpl();
	PagingDto pagingdto = new PagingDto();
	
	int startseq = (currentpage-1)*pagingdto.getColnum()+1; 
	int endseq = currentpage*pagingdto.getColnum();		
	
	List<Dto>list = biz.selectPaging(startseq,endseq);
	List<Dto>totalcnt = biz.totalcnt();	
	int totalcount = totalcnt.size();  //게시글 전체 갯수
	int understartnum = (((currentpage-1)/10)*10)+1; //밑에 페이지 시작번호
	int underendnum = understartnum+9;   //밑에 페이지 끝번호
	

%>
</head>
<body>
	<h1>글 목록</h1>
	
	<form action="MVCServlet" method="get">
		<input type="hidden" name="command" value="muldel"/>
		<table border="1">
			<col width="30"/>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="100"/>
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked);"/></th>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
<%
	if(list.size() == 0){
%>
			<tr>
				<td colspan="5">-----작성된 글이 없습니다.-----</td>
			</tr>
<%
	}else{
		for(Dto dto: list){
%>	
		<tr>
			<td><input type="checkbox" name="chk" value="<%=dto.getSeq() %>"></td>
			<td><%=dto.getSeq() %></td>
			<td><%=dto.getWriter() %></td>
			<td><a href='controller.do?command=boardone&seq=<%=dto.getSeq()%>'><%=dto.getTitle() %></a></td>
			<td><%=dto.getRegdate() %></td>
		</tr>
<%
		}
	}
%>			
		<tr>
			<td colspan="5">
				<input type="submit" value="선택삭제"/>
				<input type="button" value="글쓰기" onclick="location.href='controller.do?command=mvcinsert';" />  
			</td>
		</tr>
		</table>
<%
	if(1 <=currentpage && currentpage <= 10){  //1~10까지 prev hidden
%>		
		<a style="display:none" href="controller.do?command=list&currentpage=<%=understartnum-1%>">prev</a>
<%
	}else{   //11~20
				
%>
		<a href="controller.do?command=list&currentpage=<%=understartnum-1%>">prev</a>

<%		
	}
		for(int i = understartnum; i < underendnum+1; i++){ //1~10
			/*
			int checkNum =0;
			if(totalcount%10 !=0){
				checkNum = i-1;
			}else{   //totalcount%10 == 0
				checkNum = i;
			}*/
				//totalcount%10 							
			if(totalcount%10 != 0 && totalcount/10 == i-1){ //게시글 전체가 10단위로 떨어지지 않는데 마지막페이지 찍고 break
				
%>
		 <a href="controller.do?command=list&currentpage=<%=i%>">콩<%=i %>끝</a> 
<% 			
					break;
				
			}else if(totalcount%10 == 0 && totalcount/10 == i ){  //게시글 전체가 10단위로 떨어지는데 마지막페이지 찍고 break
%>
			<a href="controller.do?command=list&currentpage=<%=i%>">콩<%=i %>끝</a> 
<%					break;
			}else{    //페이지 prev 1~10 next, prev 11~20 next, prev 21~30 next
%>				
			<a href="controller.do?command=list&currentpage=<%=i%>"><%=i %></a>
<%			
			}
		}		
		//if(totalcount%10 != 0||totalcount/10 != currentpage){
			//if(totalcount/10>underendnum){
			if(totalcount%10 == 0 || (totalcount/10)+1 ==currentpage||totalcount/10 == currentpage){
				
				
%>
	<a style="display:none" href="controller.do?command=list&currentpage=<%=underendnum+1 %>">next</a>
<%					
				
			}else{
%>
	<a href="controller.do?command=list&currentpage=<%=underendnum+1%>">next</a>
<%			
		}
	%>
	
	
	
	</form>
</body>
</html>