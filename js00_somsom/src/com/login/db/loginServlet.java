package com.login.db;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.biz.MbBiz;
import com.login.biz.MbBizImpl;
import com.login.dto.MbDto;

import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String command = request.getParameter("command");
		System.out.println("<"+command+">");
		
		MbBiz biz = new MbBizImpl();
		HttpSession session = request.getSession(); 
		
		if(command.equals("login")) {
			String mbid = request.getParameter("mbid");
			String mbpw = request.getParameter("mbpw");
			
			MbDto dto = biz.login(mbid, mbpw);
			session.setAttribute("login", dto);
			dispatcher("somlist.jsp", request, response);
			
		}else if(command.equals("join")) {
			response.sendRedirect("joinForm.jsp");
			
		}else if(command.equals("joinInsert")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			
			MbDto dto = new MbDto();
			dto.setMbid(id);
			dto.setMbpw(pw);
			dto.setMbname(name);
			dto.setMbaddr(addr);
			dto.setMbmobile(mobile);
			dto.setMbemail(email);
			
			int res = biz.join(dto);
			if(res>0) {
				jsResponse("success", "somlist.jsp", response); 
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

	private void dispatcher(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
