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

import com.board.biz.BoardBiz;
import com.board.biz.BoardBizImpl;
import com.board.dto.BoardDto;
import com.board.dto.PagingDto;

import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class BoardServlet
 */
@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		BoardBiz biz = new BoardBizImpl();
		
		if(command.equals("list")) {
			int currentpage = Integer.parseInt(request.getParameter("page"));
			PagingDto paging = new PagingDto();
			paging.setCurrentpage(currentpage);
			paging.setTotalrows(10);
			paging.setPagescale(5);
			paging.setTotalpage(biz.totalPage(paging.getTotalrows()));
			
			List<BoardDto> list = biz.selectAll(paging);
			request.setAttribute("list", list);
			request.setAttribute("paging", paging);
			dispatch("boardlist.jsp", request, response);
			
		
		
		}
		
		
		
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}

}
