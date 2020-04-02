package com.scope.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ScopeController")
public class ScopeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//servlet이란 ? 요청에 맞게 처리해주는 get방식으로 요청하면 doGet으로, post방식으로 요청하면 doPost로 처리, 응답한다
    public ScopeController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
	
		System.out.println("Controller 도착");
		
		String requestId = (String)request.getAttribute("requestId");
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("sessionId");
		ServletContext application = getServletContext();
		String applicationId = (String)application.getAttribute("applicationId");
		
		System.out.println("request : " + requestId);
		System.out.println("session : " + sessionId);
		System.out.println("application : "+ applicationId);
	
		String param = request.getParameter("req");
		System.out.println("request parameter :"+param);
		
		/*
		PrintWriter out = response.getWriter();
		out.println("<h1>응답</h1>");
		out.println("<table border='1'><tr><th>scope</th><th>값</th></tr>"
				+ "<tr><td>page</td><td>null</td><tr>"
				+ "<tr><td>dd</td><td>gg</td></tr>"
				+ "</table>");
		*/
	
		RequestDispatcher dispatch = request.getRequestDispatcher("result.jsp");
		request.setAttribute("requestId", "servlet에서 보내준 request");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		doGet(request, response); //doPost방식에서 doGet방식으로 전달해준다
		
	}

}
