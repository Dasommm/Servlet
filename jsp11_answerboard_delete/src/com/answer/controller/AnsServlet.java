package com.answer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.answer.biz.AnsBiz;
import com.answer.biz.AnsBizImpl;
import com.answer.dto.AnsDto;


@WebServlet("/ans.do")
public class AnsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		AnsBiz biz = new AnsBizImpl();
		
		if(command.equals("list")) {
			List<AnsDto> list = biz.selectAll();
			request.setAttribute("list", list);
			dispatcher("list.jsp", request, response);
			
		}else if(command.equals("insertform")) {
			response.sendRedirect("insertform.jsp");
		}else if(command.equals("insertres")) {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			AnsDto dto = new AnsDto();
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				jsResponse("success", "ans.do?command=list", response);
				
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('failed')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else if(command.equals("detail")) {
			int bdno = Integer.parseInt(request.getParameter("bdno"));
			AnsDto dto = biz.selectOne(bdno);
			request.setAttribute("dto", dto);
			dispatcher("detail.jsp", request, response);
	
		}else if(command.equals("delete")) {
			int bdno = Integer.parseInt(request.getParameter("bdno"));
			int res = biz.delete(bdno);
			
			if(res>0) {
				jsResponse("success", "ans.do?command=list", response);
			}else {
				jsResponse("failed", "ans.do?command=detail&bdno="+bdno, response);
			}
			
		}else if(command.equals("updateform")) {
			int bdno = Integer.parseInt(request.getParameter("bdno"));
			AnsDto dto = biz.selectOne(bdno);
			request.setAttribute("dto", dto);
			dispatcher("updateform.jsp", request, response);
			
		}else if(command.equals("updateres")) {
			int bdno=Integer.parseInt(request.getParameter("bdno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			AnsDto dto = new AnsDto();
			dto.setBdno(bdno);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.update(dto);
			
			if(res>0) {
				jsResponse("success", "ans.do?command=detail&bdno="+bdno, response);
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('failed')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}else if(command.equals("replyform")) {
			int bdno = Integer.parseInt(request.getParameter("bdno"));
			AnsDto dto = biz.selectOne(bdno);
			request.setAttribute("dto", dto);
			dispatcher("rpInsert.jsp", request, response);
			
		}else if(command.equals("rpinsertres")) {
			int bdno = Integer.parseInt(request.getParameter("bdno"));
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			AnsDto dto = new AnsDto();
			dto.setBdno(bdno);
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.reInsert(dto);
			
			if(res>0) {
				jsResponse("success", "ans.do?command=list", response);
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('failed')");
				out.println("history.back()");
				out.println("</script>");
				
			}
			
		}
		
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+url+"'");
		out.println("</script>");
	}
	
	private void dispatcher (String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}

}
