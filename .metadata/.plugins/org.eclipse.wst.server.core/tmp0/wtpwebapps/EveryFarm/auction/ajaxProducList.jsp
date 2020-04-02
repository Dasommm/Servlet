<%@page import="com.everyfarm.product.dto.PagingDto"%>
<%@page import="com.everyfarm.product.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="../resources/css/auction/auctionlist.css"    
	  rel="stylesheet"    
	  type="text/css" /> 
<link href="../resources/css/auction/selectbox.css"    
	  rel="stylesheet"    
	  type="text/css" />  	 
</head>
<%
	PagingDto currentpage = (PagingDto)session.getAttribute("pagingdto");
	int cPage = currentpage.getCurrentpage();//상품 페이징
	int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
	int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
	int endseq = currentpage.getUnderpagescale() * pagegroup;
	int totalpage = currentpage.getTotalpage();

	List<ProductDto>productlist = (List<ProductDto>)session.getAttribute("LiveProductlist");
	
	//리스트용 구분값
	String listGubun =(String)session.getAttribute("listGubun");
	
	//String paramtype = (String)session.getAttribute("paramtype");
%>
<script type="text/javascript">
$(function(){
var cPage =<%=currentpage.getCurrentpage()%>; //상품 페이징 	
alert("과일페이징cPage"+cPage);
});
</script>
<body>
 		 <div class="fixed-container">
            <div class="shop-list">
            
<%
	if(productlist.size()==0){
%>     
				<p>게시글이 존재하지 않습니다. </p> 
<%            
	}else{
	for(int i = 0; i < productlist.size(); i++){
%>
               <article class="shop-list__item currently-dont-selling">
				<img
					src="../<%=productlist.get(i).getStock_image().split("/")[0] %>"
					alt="product"
					style="width: 300px; height: 250px; cursor: pointer; margin-left: 7%;"
					onclick="location.href='../product.do?command=auctiondetail&auc_no=<%=productlist.get(i).getAuc_no()%>';">

				<div class="item-disc">
                        <img alt="img" src="../resources/images/auction/EveryFarmimage.png"/>
                        <div id="seller">판매자:<%=productlist.get(i).getMem_id() %></div>
                        <h2 class="item-title" style="cursor:pointer" onclick="location.href='../product.do?command=auctiondetail&auc_no=<%=productlist.get(i).getAuc_no()%>';"><%=productlist.get(i).getStock_name() %> 
                       	<br/><a><b style="color:#330000">EveryFarm</b>에서 승인된 상품입니다.</a>
                        <span id="productprice">최고가:<%=productlist.get(i).getAuc_nowPrice() %>원</span>
                     
                    </div>
                    <div class="item-price-block">
                        <div class="item-price">
                        <table border="1">
                        	<tr>
                        		<td>시작가:<%=productlist.get(i).getAuc_startPrice() %>원</td>
                        		<td>입찰:<%=productlist.get(i).getAuc_join() %></td>
                        	<tr/>
                        </table>
                        	<img alt="img" src="../resources/images/auction/watch.png" style="width:20px; height:20px;">
                        	<div style="margin: -130px 0px 0px 40px;">21시간26분</div>
                        </div>
                    </div>

                </article>
<%
		}
	}
%>                
                </div>
                </div>
<!-- 여기서부터 페이징 -->
                <div class="overlay"></div>
 <div class="pagination"> 에이작스 내의 페이징
<%
   if(pagegroup > 1){
%>   
   <a href="../product.do?command=<%=listGubun%>&currentpage=<%=startseq-1 %>&paramtype=${sessionScope.paramtype }" class="prev str">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a  href="../product.do?command=<%=listGubun%>&currentpage=<%=pagenum %>&paramtype=${sessionScope.paramtype }" class="pager"><%=pagenum %></a>   
<%
   }
   if(endseq < currentpage.getTotalpage()){
%>
   <a href="../product.do?command=<%=listGubun%>&currentpage=<%=endseq+1 %>&paramtype=${sessionScope.paramtype }" class="next str">Next</a>
<%      
   }
///////../product.do?command=searchArea&currentpage=1&zoneval="+zoneoneval;
%>
</div>   
     </section>
<!-- 여기서부터 페이징 -->
</body>
</html>