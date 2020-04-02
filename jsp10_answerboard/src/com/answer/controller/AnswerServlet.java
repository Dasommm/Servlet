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

import com.answer.biz.AnswerBiz;
import com.answer.biz.AnswerBizImpl;
import com.answer.dao.AnswerDao;
import com.answer.dto.answerDto;


@WebServlet("/answer.do")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		AnswerBiz biz = new AnswerBizImpl();
		
		if(command.equals("list")) {
			List<answerDto> list = biz.selectAll();	
			request.setAttribute("list", list);
			dispatch("list.jsp", request, response);		
		}else if(command.equals("insert")) {
			response.sendRedirect("insertform.jsp");
			
		}else if(command.equals("insertres")) {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			answerDto dto = new answerDto();
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.insert(dto);
			
			if(res>0) {
				jsResponse("success", "answer.do?command=list", response);
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('failed')");
				out.println("history.back();");
				out.println("</script>");
				
			}
			
		}else if(command.equals("detail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			answerDto dto = biz.selectOne(boardno);
			request.setAttribute("dto", dto);
			dispatch("detail.jsp", request, response);
		}else if(command.equals("delete")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			int res = biz.delete(boardno);
			
			if(res>0) {
				jsResponse("success", "answer.do?command=list", response);
			}else {
				jsResponse("failed", "answer.do?command=detail&boardno="+boardno, response);				
			}
			
		}else if(command.equals("updateform")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			answerDto dto = biz.selectOne(boardno);
			request.setAttribute("dto", dto);
			dispatch("updateform.jsp", request, response);
			
		}else if(command.equals("updateres")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			answerDto dto = new answerDto();
			dto.setBoardno(boardno);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = biz.update(dto);
			
			if(res>0) {
				jsResponse("success", "answer.do?command=detail&boardno="+boardno, response);
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('failed')");
				out.println("history.back();");
				out.println("</script>");
			}
			
		}else if(command.equals("rpinsertform")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			answerDto dto = biz.selectOne(boardno);
			request.setAttribute("dto", dto);
			dispatch("rpinsertform.jsp", request, response);
				
		}else if(command.equals("rpinsertres")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			answerDto dto = new answerDto();
			dto.setBoardno(parentboardno);
			dto.setWriter(writer);
			dto.setTitle(title);
			dto.setContent(content);
			
			
			int res = biz.replyInsert(dto);
			
			if(res>0) {
				jsResponse("success", "answer.do?command=list", response);
			}else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('failed')");
				out.println("history.back();");
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
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	
		
		doGet(request, response);
	}

}
