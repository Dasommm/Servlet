package com.cal.dao;

import java.text.SimpleDateFormat;
import java.util.List;

import com.cal.dto.CalDto;

import java.sql.Timestamp;

public class Util {

	// 한자리 수 -> 두자리 수
	public static String isTwo(String msg) {
		
		return (msg.length()<2) ? "0"+msg : msg;
	}
	
	//폰트 컬러 변경, 일요일이면 red, 토요일은 blue, 그 외에는 black
	public static String fontColor(int date, int dayOfWeek) {
		
		String color = "";
		if((dayOfWeek)%7 ==1){
			color ="red";
		}else if((dayOfWeek)%7 == 0) {
			color = "blue";
		}else {
			color ="black";
		}
		
		return color;
	}
	
	private String todates;
	
	public String getTodates() {
		return todates;
	}
	public void setTodates(String mdate) {
		// yyyyMMddhhmm -> yyyy-mm-dd hh:mm:00
		String m = mdate.substring(0,4)+"-"+
					mdate.substring(4,6)+"-"+
					mdate.substring(6,8)+" "+
					mdate.substring(8,10)+":"+
					mdate.substring(10)+":00";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시 mm분");
		Timestamp tm = Timestamp.valueOf(m);
		todates = sdf.format(tm);
		
	}
	public static String getCalView(int date, List<CalDto> clist) {
		
		String d = isTwo(date+"");
		String res = "";
		
		for(CalDto dto : clist) {
			if(dto.getMdate().substring(6,8).equals(d)) {	//해당일에 맞는 데이터가 있으면 p tag로 만들어준다
				res += "<p>"+
						((dto.getTitle().length()>6) ? 	//제목이 너무 길면 잘라주기 위해서
								dto.getTitle().substring(0,6)+"...":
									dto.getTitle()+"</p>");
			}
		}
		
		return res;
	}
	
}
