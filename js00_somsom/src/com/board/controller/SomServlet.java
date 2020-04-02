package com.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.biz.SomiBiz;
import com.board.biz.SomiBizImpl;
import com.board.dto.SomiDto;



@WebServlet(urlPatterns = {"/mylist","/bdInsertForm","/bdInsertRes","/bdDetail","/bdDelete",
		"/bdUpdateForm","/bdUpdateRes"})
public class SomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SomiBiz biz;
	
	private void getRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		biz = new SomiBizImpl();
		
		String command = request.getRequestURI();
		System.out.println("<"+command+">");
	
		if(command.endsWith("/mylist")) {
			doSomiList(request,response);
		}else if(command.endsWith("/bdInsertForm")) {
			doSomiInsert(request, response);
		}else if(command.endsWith("/bdInsertRes")) {
			doSomiInsertRes(request,response);
		}else if(command.endsWith("/bdDetail")) {
			doSomiDetail(request,response);
		}else if(command.endsWith("/bdDelete")) {
			doSomiDelete(request,response);
		}else if(command.endsWith("/bdUpdateForm")) {
			doSomiUpdateForm(request,response);
		}else if(command.endsWith("/bdUpdateRes")) {
			doSomiUpdateRes(request,response);
		}
	
	
	}
	
	
    private void doSomiUpdateRes(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	SomiDto dto = new SomiDto();
    	dto.setTitle(title);
    	dto.setContent(content);
    	dto.setSeq(seq);
    	
    	int res = biz.update(dto);
    	
    	if(res>0) {
    		jsResponse("success", "bdDetail?seq="+seq, response);
    	}else {
    		PrintWriter out = response.getWriter();
    		out.println("<script>");
        	out.println("alert('failed')");
        	out.println("history.back()");
        	out.println("</script>");
    		
    	}
    	
	}

	private void doSomiUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	SomiDto dto = biz.selectOne(seq);
    	request.setAttribute("dto", dto);
    	dispatch("boardUpdate.jsp", request, response);
    		
	}

	private void doSomiDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	int res = biz.delete(seq);
    	if(res >0) {
    		jsResponse("success", "mylist", response);
    	}else {
    		jsResponse("failed", "bdDetail.jsp?seq"+seq, response);
    	}
    	
	}

	private void doSomiDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int seq = Integer.parseInt(request.getParameter("seq"));
    	
    	SomiDto dto = biz.selectOne(seq);
    	request.setAttribute("dto", dto);
    	dispatch("boardDetail.jsp", request, response);
    	
	}

	private void doSomiInsertRes(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String name = request.getParameter("name");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	SomiDto dto = new SomiDto();
    	dto.setName(name);
    	dto.setTitle(title);
    	dto.setContent(content);
    	
    	int res = biz.insert(dto);
    	
    	if(res >0 ) {
    		jsResponse("success", "mylist", response);
    	}else {
    		PrintWriter out = response.getWriter();
    		out.println("<script>");
        	out.println("alert('failed')");
        	out.println("history.back()");
        	out.println("</script>");
       
    	}
    	
    	
	}

	private void doSomiInsert(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	response.sendRedirect("boardInsertForm.jsp");
	}

	private void doSomiList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<SomiDto> list = biz.selectAll();
		request.setAttribute("list", list);
		dispatch("somlist.jsp", request, response);    	
    	
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
    

	public SomServlet() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		getRequest(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		getRequest(request, response);
		
	}

}
