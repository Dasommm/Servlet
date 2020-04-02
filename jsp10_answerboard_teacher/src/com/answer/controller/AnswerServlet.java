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
import com.answer.dto.AnswerDto;

@WebServlet("/AnswerServlet")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String command = request.getParameter("command");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		AnswerBiz biz = new AnswerBiz();
		
		if(command.equals("list")) {
			List<AnswerDto> list = biz.selectList();
			request.setAttribute("list", list);
			dispatch("answerlist.jsp",request,response);
		} else if(command.equals("writeform")) {
			response.sendRedirect("write.jsp");
		} else if(command.equals("writeres")) {
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			AnswerDto dto = new AnswerDto(title, content, writer);
			
			int res = biz.insert(dto);
			if(res > 0) {
				jsResponse("글 작성 성공", "answer.do?command=list", response);
			} else {
				jsResponse("글 작성 실패", "answer.do?command=writeform", response);
			}
		} else if(command.equals("detail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			AnswerDto dto = biz.selectOne(boardno);
			request.setAttribute("dto", dto);
			dispatch("detail.jsp", request, response);
		} else if(command.equals("updateform")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			AnswerDto dto = biz.selectOne(boardno);
			request.setAttribute("dto", dto);
			dispatch("update.jsp", request, response);
		} else if(command.equals("updateres")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			AnswerDto dto = new AnswerDto(boardno, title, content);

			int res = biz.update(dto);
			if(res > 0) {
				jsResponse("글 수정 성공", "answer.do?command=list", response);
			} else {
				jsResponse("글 수정 실패", "answer.do?command=updateform&boardno="+boardno, response);
			} 
		} else if(command.equals("delete")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));

			int res = biz.delete(boardno);
			if(res > 0) {
				jsResponse("글 삭제 성공", "answer.do?command=list", response);
			} else {
				jsResponse("글 삭제 실패", "answer.do?command=detail&boardno="+boardno, response);
			} 
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		doGet(request, response);
	}

	private void jsResponse(String msg, String url, 
			HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+url+"'");
		out.println("</script>");
	}
	
	private void dispatch(String url, 
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}
	
	
	
	
}
