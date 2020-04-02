<%@page import="com.mvc.dao.MVCDao"%>
<%@page import="comm.mvc.dto.MVCDto"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.biz.MVCBiz"%>
<%@page import="com.mvc.biz.MVCBizImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Controller</title>
</head>
<body>
<%

	String command = request.getParameter("command");
	System.out.println("<"+command+">");
	
	MVCBiz biz = new MVCBizImpl(); 

	if(command.equals("list")){
		//1. 받을 데이터가 있는지? -> no
		//2. db에서 가져올 데이터 ? -> selectlist
		List<MVCDto> list = biz.selectList();
		request.setAttribute("list", list);
		//3. 어디로 갈건지 ? -> boardlist로 갈거다
		pageContext.forward("boardlist.jsp");	//forward : 모든 권한을 넘긴다, 보낼 데이터가 있을 경우
		
	}else if(command.equals("writeform")){
	// 1. 받을 데이터가 있는지? -> no
	// 2. db에서 가져올 데이터가 있는지?-> no
	// 3. 어디로 갈건지? -> 
	response.sendRedirect("boardwrite.jsp"); //보낼 데이터가 없을 경우 
		
	}else if(command.equals("detailform")){
		// 1. 받을 데이터가 있는지? ->
		int seq = Integer.parseInt(request.getParameter("seq"));
		// 2. db에서 가져올 데이터가 있는지?-> 
		MVCDto dto = biz.selectOne(seq);
		request.setAttribute("dto", dto);	
		// 3. 어디로 갈건지? -> 
		pageContext.forward("detail.jsp");		
		
	}else if(command.equals("delete")){
		// 1. 받을 데이터가 있는지? -> 
		int seq = Integer.parseInt(request.getParameter("seq"));
		// 2. db에서 가져올 데이터가 있는지?-> row값
		int res =biz.delete(seq);
		// 3. 어디로 갈건지? -> 		
		if(res >0){
	%>
	<script type="text/javascript">
		alert("success");
		location.href="controller.jsp?command=list";
	</script>	
	<%
		}else{
	%>
	<script type="text/javascript">
		alert("failed");
		location.href = "controller.jsp?command=detailform&seq=<%=seq%>";
	</script>
	<%		
		}
			
	}else if(command.equals("updateform")){
		// 1. 받을 데이터가 있는지? -> seq
		int seq = Integer.parseInt(request.getParameter("seq"));
		// 2. db에서 가져올 데이터가 있는지?-> selectone
		MVCDto dto = biz.selectOne(seq);
		request.setAttribute("dto", dto);
		// 3. 어디로 갈건지? -> 
		// response.sendRedirect("update.jsp");	//얘는 보내줄 값이 없을 때 	
		pageContext.forward("update.jsp");
		
	}else if(command.equals("updateres")){
		// 1. 받을 데이터가 있는지? -> title, content
		int seq = Integer.parseInt(request.getParameter("seq"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");		
		
		MVCDto dto = new MVCDto();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setSeq(seq);
		
		// 2. db에서 가져올 데이터가 있는지?-> row 값
		int res = biz.update(dto);
				
		// 3. 어디로 갈건지? -> 
		if(res >0){
		%>	
		<script type="text/javascript">
			alert("success");
			location.href = "controller.jsp?command=detailform&seq=<%=dto.getSeq()%>";
		</script>			
		<%	
		}else{
		%>
		<script type="text/javascript">
			alert("failed");
			history.back();
		</script>
		<%			
		}	
		
	}else if(command.equals("writeres")){
	
	
		// 1. 받을 데이터가 있는지? ->
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MVCDto dto = new MVCDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		// 2. db에서 가져올 데이터가 있는지?-> 적용된 row의갯수
		int res = biz.insert(dto);		
		
		// 3. 어디로 갈건지? -> 	
		if(res >0){
%>
	<script type="text/javascript">
		alert("success");
		location.href = "controller.jsp?command=list";
	</script>
<%
		}else{
%>
	<script type="text/javascript">
	alert("failed");
	location.href = "controller.jsp?command=writeform";			
	</script>
			
<%			
		}
		
	}else if(command.equals("muldel")){
	//1. 
	String[] seqs = request.getParameterValues("chk");
	
	//2.
	boolean res = biz.multiDelete(seqs);
		
	//3.
		if(res){
%>
	<script type="text/javascript">
		alert("success");
		location.href = "controller.jsp?command=list"
	</script>

<%
		}else{
%>		
	<script type="text/javascript">
		alert("failed")
		location.href = "controller.jsp?command=list"
	</script>		
		
<%
		}
	}

%>		
	

<h1>Wrong page</h1>

</body>
</html>