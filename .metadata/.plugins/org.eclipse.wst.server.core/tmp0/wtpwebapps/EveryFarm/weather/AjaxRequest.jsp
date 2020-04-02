<%@ page language="java" import="java.io.*, java.net.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
    <% response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	URL url = new URL(request.getParameter("getUrl"));
	URLConnection connection = url.openConnection();
	connection.setRequestProperty("CONTENT-TYPE","text/html"); 
    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
    String inputLine;
    String buffer = "";
    while ((inputLine = in.readLine()) != null){
     	buffer += inputLine.trim();
    }
    System.out.println("buffer : " + buffer);
    in.close();
%><%=buffer%>


</body>
</html>