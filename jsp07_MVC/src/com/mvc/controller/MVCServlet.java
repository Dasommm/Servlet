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

import com.mvc.biz.MVCBiz;
import com.mvc.biz.MVCBizImpl;
import com.mvc.dto.MVCDto;

@WebServlet("/MVCServlet")
public class MVCServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MVCServlet() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.printf("<%s>\n",command);
		
		MVCBiz biz = new MVCBizImpl();
		
		PrintWriter out = response.getWriter();
		if(command.equals("list")) {
			List<MVCDto> list = biz.selectList();
			request.setAttribute("list", list);
			
			dispatch("mvclist.jsp", request, response);
		
		}else if(command.equals("insertform")) {
			response.sendRedirect("insertform.jsp");		
			
		}else if(command.equals("insertres")) {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			MVCDto dto = new MVCDto();
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.insert(dto);
			
			if(res >0) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('success')");
				out.println("location.href='mvc.do?command=list'");
				out.println("</script>");
				//jsResponse("success", "mvc.do?command=list", response);
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('failed')");
				out.println("history.back()");
				out.println("</script>");
				//jsResponse("failed", "mvc.do?command=inserform", response);
			}
			
		}else if(command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			MVCDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			
			dispatch("detail.jsp", request, response);
			
		}else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			MVCDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			
			dispatch("updateform.jsp", request, response);
		
		}else if(command.equals("updateres")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			MVCDto dto = new MVCDto();
			dto.setSeq(seq);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz. update(dto);
			
			if(res >0) {
				jsResponse("success", "mvc.do?command=detail&seq="+seq, response);
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('failed')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			int res = biz.delete(seq);
			
			if(res >0) {
				jsResponse("success", "mvc.do?command=list", response);
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('failed')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}
		
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String res = "<script type = 'text/javascript'>"
				+ "alert('"+msg+"');"
				+ "location.href = '"+url+"';"
				+ "</script>";
		PrintWriter out = response.getWriter();
		out.println(res);
	}
	
	
	
	//forward해주는 메소드
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}

}
