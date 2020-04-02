package com.score.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/score.cal")
public class ScoreAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		int sum = kor+eng+math;
		double avg = sum/3.0;
		
		//json simple jar에 있던 클래스
		JSONObject obj = new JSONObject();
		obj.put("name", name);
		obj.put("sum",sum);
		obj.put("avg", avg);
		//warning이 뜨는 이유는 map의 형태(k=v)로 만들어져있다. 따라서 타입을 선언해주는 지네릭을 써줄래? 라는 warning이다
	
		String res = obj.toJSONString();
		System.out.println("servlet에서 만들어진 결과 : "+res);
		
		PrintWriter out = response.getWriter();
		out.println(res);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		doGet(request, response);
	}

}
