package com.mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.biz.MyBiz;
import com.mvc.biz.MyBizImpl;
import com.mvc.dto.MyDto;

@WebServlet(urlPatterns = {"/mylist","/mydetail","/writeform","/mywriteres","/updateform","/updateres","/delete"})
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	MyBiz biz;
	
	private void getRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		biz= new MyBizImpl();
		
		String command = request.getRequestURI();
		System.out.printf("[%s]\n",command);
		
		if(command.endsWith("/mylist")) {
			doMyList(request,response);
		}else if(command.endsWith("/mydetail")) {
			doMyDetail(request,response);
			
		}else if(command.endsWith("/writeform")) {
			doMyWriteform(request,response);
			
		}else if(command.endsWith("/mywriteres")) {
			doMyWriteres(request,response);
			
		}else if(command.endsWith("/updateform")) {
			doMyUpdateform(request, response);
			
		}else if(command.endsWith("updateres")) {
			doMyupdateres(request,response);
		}else if(command.endsWith("delete")) {
			doMyDelete(request,response);
			
		}
		
	}
   
    private void doMyDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	int res = biz.delete(seq);
    	
    	if(res>0) {
    		jsResponse("success", "mylist", response);
    	}else {
    		jsResponse("failed", "mydetail", response);
    	}
    	
	}

	private void doMyupdateres(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	MyDto dto = new MyDto();
    	dto.setTitle(title);
    	dto.setContent(content);
    	dto.setSeq(seq);
    	
    	int res = biz.update(dto);
    	
    	if(res >0) {
    		jsResponse("success", "mylist", response);
    	}else {
    		PrintWriter out = response.getWriter();
        	out.println("<script>");
        	out.println("alert('failed')");
        	out.println("history.back()");
        	out.println("</script>");    	
        	}
    	}
	
	private void doMyUpdateform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	MyDto dto = biz.selectOne(seq);
    	request.setAttribute("dto", dto);
    	
    	dispatch("updateform.jsp", request, response);
    	
	}

	private void doMyWriteres(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String writer = request.getParameter("writer");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	MyDto dto = new MyDto();
    	dto.setWriter(writer);
    	dto.setTitle(title);
    	dto.setContent(content);
    	
    	int res = biz.insert(dto);
    	
    	if(res>0) {
    		jsResponse("success", "mylist", response);
    	}else {
    	  	PrintWriter out = response.getWriter();
        	out.println("<script>");
        	out.println("alert('failed')");
        	out.println("history.back()");
        	out.println("</script>");    	
        	}
    	
    	
	}

	private void doMyWriteform(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.sendRedirect("mywrite.jsp");
    	
    	
	}

	private void doMyDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	MyDto dto = biz.selectOne(seq);
    	request.setAttribute("dto", dto);
    	dispatch("mydetail.jsp", request, response);
    	
    	
    	
	}

	private void doMyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<MyDto> list = biz.selectList();
    	request.setAttribute("list", list);
    	dispatch("mylist.jsp", request, response);
		
	}
    
    private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    	dispatcher.forward(request, response);
    }
    
    private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
    	PrintWriter out = response.getWriter();
    	out.println("<script>");
    	out.println("alert('"+msg+"')");
    	out.println("location.href='"+url+"'");
    	out.println("</script>");
    	
    }

	public MyServlet() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		getRequest(request, response);	//get 방식이든 post방식이든 둘다 request 받는다
		
	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		getRequest(request, response); //get 방식이든 post방식이든 둘다 request 받는다
		
		
	}

}
