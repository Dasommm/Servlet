package com.bike.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bike.biz.BikeBiz;
import com.bike.biz.BikeBizImpl;
import com.bike.dto.BikeDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import sun.rmi.server.Dispatcher;


@WebServlet("/BikeServlet")
public class BikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BikeBiz biz = new BikeBizImpl();
		biz.delete();
		
		String command = request.getParameter("command");
		
		if(command.equals("first")) {
			response.sendRedirect("bike01.jsp");
		}else if(command.equals("firstdb")) {
			String[] bike = request.getParameterValues("bike");
			List<BikeDto> bikes = new ArrayList<BikeDto>();
			for(int i =0; i <bike.length;i++) {
				String[] tmp = bike[i].split("/");
				//System.out.println(tmp[2]+" "+tmp[5]+", "+tmp[6]);
				//1.dto에 담자
				BikeDto dto = new BikeDto();
				dto.setAddrGu(tmp[0]);
				dto.setContentId(Integer.parseInt(tmp[1]));
				dto.setContentNum(tmp[2]);
				dto.setNewAddr(tmp[3]);
				dto.setCradleCount(Integer.parseInt(tmp[4]));
				dto.setLongitude(Double.parseDouble(tmp[5]));
				dto.setLatitude(Double.parseDouble(tmp[6]));				
				
				//2.dto를 list(bikes)에 담자
				bikes.add(dto);
			}
			//3.dao에 list를 보내서 insert하자
			int res = biz.insert(bikes);
			
			if(res == bikes.size()) {
				System.out.println("Insert success");
			}else {
				System.out.println("Insert failed");
			}
			//4.저장완료되면 index.html로 보내자
			response.sendRedirect("index.html");
		}else if(command.equals("second")) {
			response.sendRedirect("bike02.jsp");
			
		}else if(command.equals("second_db")) {
			
			String txt = request.getParameter("obj");
			//System.out.println(txt);
			JsonElement element = JsonParser.parseString(txt);
			//JsoElement는 JsonObject, JsonArray 등등이 될 수 있다. => Json이라는 것을 의미한다 
			//JsonParser Json data를 읽어오는 것. 문자열을 Json으로 가져와준다. 그러나 이게 object인지 뭔지 모르기 때문에 JsonElement로 받아준다
			//System.out.println(element.getAsJsonObject().get("DESCRIPTION"));
			List<BikeDto> list = new ArrayList<BikeDto>();
			
			for(int i = 0; i < element.getAsJsonObject().get("DATA").getAsJsonArray().size();i++) {
					//element(=Json이다)를 jsonObject{}로 받을거다.(뭘 받을지 모르니까 object로) 그 중에 "DATA"를.=여기까지는 JsonElement이다.
					//그 중에 JsonArray로.그 배열의 끝까지
				JsonObject tmp = element.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
				//나머지는 위와 같고, get(i)로 한다면 여기까지 JsonElement이다. 그래서 그게 뭔지 모르니까 Object로 받는다
				//System.out.println(tmp.get("addr_gu").getAsString());
				
				JsonElement addr_gu_je = tmp.get("addr_gu"); //""키에 맞는 value가 나오는데 그게 뭔지 모르니 element로 받는다
				JsonElement content_id_je = tmp.get("content_id");
				JsonElement content_nm_je = tmp.get("content_nm");
				JsonElement new_addr_je = tmp.get("new_addr");
				JsonElement cradle_count_je = tmp.get("cradle_count");
				JsonElement longitude_je = tmp.get("longitude");
				JsonElement latitude_je = tmp.get("latitude");
				
				String addr_gu = addr_gu_je.getAsString();	// 위에 변수는 Json으로 되어있기 때문에 JAVA에서 쓸 수 있도록 int,String으로 변수 선언해준다.
				int content_id = content_id_je.getAsInt();
				String content_nm = content_nm_je.getAsString();
				String new_addr = new_addr_je.getAsString();
				int cradle_count = cradle_count_je.getAsInt();
				double longitude = longitude_je.getAsDouble();
				double latitude = latitude_je.getAsDouble();

				BikeDto dto = new BikeDto(addr_gu,content_id,content_nm,new_addr,cradle_count,longitude,latitude);
				list.add(dto);
			}
			
			int res = biz.insert(list);
			if(res == 1163) {
				System.out.println("Insert success");
			}else {
				System.out.println("Insert failed");
			}
			
			response.getWriter().append(res+"");
		}
	}
	
	
	public static void dispatcher(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
