package com.cal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cal.dao.CalDao;
import com.cal.dao.Util;
import com.cal.dto.CalDto;

import sun.rmi.server.Dispatcher;


@WebServlet("/calendar.do")
public class CalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		CalDao dao = new CalDao();
		
		if(command.equals("calendar")) {
			response.sendRedirect("calendar.jsp");
		}else if(command.equals("insertcal")) {
			String year= request.getParameter("year");
			String month= Util.isTwo(request.getParameter("month"));
			String date =Util.isTwo(request.getParameter("date"));
			String hour =Util.isTwo(request.getParameter("hour"));
			String min =Util.isTwo(request.getParameter("min"));
			String mDate = year+month+date+hour+min;
			
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			CalDto dto = new CalDto();
			dto.setId(id);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setMdate(mDate);
			
			int res = dao.insert(dto);
			
			if(res>0) {
				jsResponse("success", "calendar.do?command=calendar", response);
				
			}else {
				request.setAttribute("msg", "failed");
				dispatch("error.jsp", request, response);
			}
			
		}else if(command.equals("list")) {
			String year = request.getParameter("year");
			String month = Util.isTwo(request.getParameter("month"));
			String date = Util.isTwo(request.getParameter("date"));
			String yyyyMMdd = year+month+date;
			
			List<CalDto> list = dao.selectAll("kh", yyyyMMdd);
			request.setAttribute("list", list);
			dispatch("calendarlist.jsp", request, response);
			
		}else if(command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			CalDto dto = dao.selectOne(seq);
			
		}
		
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+url+"'");
		out.println("</script>");
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response);
	}

}
