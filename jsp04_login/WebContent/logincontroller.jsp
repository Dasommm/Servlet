<%@page import="java.util.List"%>
<%@page import="com.login.dto.MyMemberDto"%>
<%@page import="com.login.biz.MyMemberBizImpl"%>
<%@page import="com.login.biz.MyMemberBiz"%>
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
<%

	String command = request.getParameter("command");
	System.out.println("<"+command+">");
	
	MyMemberBiz biz = new MyMemberBizImpl();
	
	if(command.equals("login")){
		String myid = request.getParameter("id");
		String mypw = request.getParameter("pw");
		
		MyMemberDto dto = biz.login(myid, mypw);
		
		if(dto.getMyid() != null){
			//session : 만료되기 전까지 어플리케이션 전체에서 사용 가능
			session.setAttribute("dto", dto);
			// setMaxInactiveInterval (second):해당 초만큼 활동이 없으면 session을 invalid 한다.
			//(default : 30분 / 음수 : 무제한)
			session.setMaxInactiveInterval(10*60);
			
			if(dto.getMyrole().equals("ADMIN")){
				response.sendRedirect("adminmain.jsp");
			}else if(dto.getMyrole().equals("USER")){
				response.sendRedirect("usermain.jsp");		
			}
			
		}else{
		//로그인 안됐을 경우	
		%>
		<script type="text/javascript">
			alert("id와 pw를 확인해주세요");
			location.href = "index.jsp";		
		</script>		
		<%	
			
		}
		
	}else if(command.equals("logout")){
		session.invalidate();	//세션 만료시키는 것. 만료되면서 dto에 담긴 값이 사라진다 
		response.sendRedirect("index.jsp");
		
	}else if(command.equals("selectlist")){
		//db에서 유저 정보 다 가져와라
		List<MyMemberDto> list = biz.selectList();
		request.setAttribute("list", list);		
		//담아라		
		pageContext.forward("userselectlist.jsp");//보내라
		
	}else if(command.equals("selectenabled")){
		List<MyMemberDto> list = biz.selectEnabled();
		request.setAttribute("list", list);	
		//userselectenabled.jsp로 보내라
		pageContext.forward("userselectenabled.jsp");
		
	}else if(command.equals("updateroleform")){
		int myno = Integer.parseInt(request.getParameter("myno"));
		MyMemberDto dto = biz.selectUser(myno);
		request.setAttribute("select", dto);		
		pageContext.forward("updaterole.jsp");
		
	}else if(command.equals("updateroleres")){
		int myno = Integer.parseInt(request.getParameter("myno"));
		String role = request.getParameter("role");
		
		int res = biz.updateRole(myno, role);
		
		if(res>0){
	%>
	<script type="text/javascript">
		alert("success");
		location.href = "adminmain.jsp";
	
	</script>
			
	<%		
		}else{
	%>		
	<script type="text/javascript">
		alert("failed");
		location.href ="logincontroller.jsp?command=updateroleform&myno=<%=myno%>";
	
	</script>
			
	<%		
		}
		
	}else if(command.equals("detailform")){
		int myno = Integer.parseInt(request.getParameter("myno"));
		MyMemberDto dto = biz.selectUser(myno);
		request.setAttribute("dto", dto);
		pageContext.forward("detailpage.jsp");
		
		
	}else if(command.equals("updateuserform")){
		int myno = Integer.parseInt(request.getParameter("myno"));
		MyMemberDto dto = biz.selectUser(myno);
		request.setAttribute("dto", dto);
		pageContext.forward("updateuserpage.jsp");
	
	}else if(command.equals("userupdateres")){
		String mypw = request.getParameter("mypw");
		String myname = request.getParameter("myname");
		String myaddr = request.getParameter("myaddr");
		String myphone = request.getParameter("myphone");
		String myemail = request.getParameter("myemail");
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		MyMemberDto dto = new MyMemberDto();
		dto.setMypw(mypw);
		dto.setMyname(myname);
		dto.setMyaddr(myaddr);
		dto.setMyphone(myphone);
		dto.setMyemail(myemail);
		dto.setMyno(myno);
		
		int res = biz.updateUser(dto);
		
		if(res >0){
	%>		
		<script type="text/javascript">
			alert("success");
			location.href ="logincontroller.jsp?command=detailform&myno=<%=myno%>";
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
		
	}else if(command.equals("deleteuserres")){
		int myno = Integer.parseInt(request.getParameter("myno"));
		
		int res = biz.deleteUser(myno);
		
		if(res > 0){
	%>		
		<script type="text/javascript">
			alert("success");
			location.href="logincontroller.jsp?command=detailform&myno=<%=myno%>";
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
	}else if(command.equals("registform")){
		response.sendRedirect("registform.jsp");
				
	}else if(command.equals("idchk")){
		String myid = request.getParameter("id");
		MyMemberDto dto = biz.idChk(myid);
		
		boolean idnotused = true;	//아이디가 저장되어있지 않다 =사용가능
		if(dto != null){	// =>daoImpl에서  MyMemberDto dto = new MyMemberDto();로 해놓은 경우엔 if(dto.getMyid() != null){  로 쓴다
			// 뉴로 초기화 했다면 Dto 객체가 만들어짐. 그래서 값이 무엇이 되든 일단 객체가 만들어지기 때문에 그 안의 값(value)을 확인해야한다.
			// 하지만 null로 초기화 한경우엔 dto로 그냥 해도 된다
			idnotused = false;
		}
		response.sendRedirect("idchk.jsp?idnotused="+idnotused);
		
	}else if(command.equals("registres")){
		String myid = request.getParameter("myid");
		String mypw = request.getParameter("mypw");
		String myname = request.getParameter("myname");
		String myaddr = request.getParameter("myaddr");
		String myphone = request.getParameter("myphone");
		String myemail = request.getParameter("myemail");
		
		MyMemberDto dto = new MyMemberDto();
		dto.setMyid(myid);
		dto.setMypw(mypw);
		dto.setMyname(myname);
		dto.setMyaddr(myaddr);
		dto.setMyphone(myphone);
		dto.setMyemail(myemail);
		
		int res = biz.insertUser(dto);
		
		if(res > 0){
	%>
		<script type="text/javascript">
			alert("success");
			location.href = "index.jsp";		
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
		
	}	
%>


	<h1 style = "color:red;">wrong page</h1>


</body>
</html>