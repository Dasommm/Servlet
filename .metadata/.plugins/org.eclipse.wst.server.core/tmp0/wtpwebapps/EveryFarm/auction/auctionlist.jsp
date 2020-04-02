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
<script type="text/javascript" src="../resources/js/auction/auctionlist.js"></script>
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
   int pagegroup = (int)Math.ceil((double)currentpage.getCurrentpage()/currentpage.getUnderpagescale());
   int startseq = currentpage.getUnderpagescale() * (pagegroup - 1) + 1;
   int endseq = currentpage.getUnderpagescale() * pagegroup;
   int totalpage = currentpage.getTotalpage();
   int cPage =currentpage.getCurrentpage(); //상품 페이징 	

   List<ProductDto>productlist = (List<ProductDto>)session.getAttribute("productlist");
   List<ProductDto>bestlist =(List<ProductDto>)session.getAttribute("bestlist");
   
   //리스트용 구분값
   String listGubun =(String)session.getAttribute("listGubun");
   //String paramtype = (String)session.getAttribute("paramtype");
   

%>
<body>
<script type="text/javascript">
	var sessionMem = '${sessionScope.dto.mem_grade}'; 
	var sessionId = '${sessionScope.dto.mem_id}'; 
	//alert("[세션]\n mem_grade= "+sessionMem+"\n\n// 0:비회원, 1:회원, 2:농부,3:관리자  ");
	//alert("[세션]\n mem_id= "+sessionId);
	
</script>
<!-- *****************************실시간 Ajax 영역******************************** -->
<script type="text/javascript">
var cPage=<%=currentpage.getCurrentpage()%>; //상품 페이징
var listGubun = "<%=listGubun%>"; // action이면 기본, 

$(document).ready(function(){
   //alert(cPage+"cPage");
    liveTimeAuc();   // 실시간 남은시간 현황  1초마다(종료시간-현재시간) /실시간  최고가 현황 1초마다 /실시간 참여인원 현황 1초마다
    ajaxProduct();
    
      function liveTimeAuc(){    // 실시간 남은시간 현황  1초마다(종료시간-현재시간)
         $.ajax({
              type: "post",
              url: "../product.do?command=livetimeajax&currentpage=",
              /* data: "start="+start+"end="+end+"fund_status="+fund_status, */
              success: function(data){ // callback함수 --> 결과값 돌려받는다.
            	  alert("success");
            	  $(".ajaxbestDiv").html(data); // 결과 출력
          
              },
              error: function(){
                // alert("오류");
              }, 
              complete: function(){
                 alert("complete");
              }
         });
        setTimeout(liveTimeAuc,10000);
      }
    
      ajaxProduct();
    //ajaxProductDiv
      function ajaxProduct(){    // 실시간 남은시간 현황  1초마다(종료시간-현재시간)
         $.ajax({
              type: "post",
              url: "../product.do?command=liveProductAjax&currentpage="+cPage,
              /* data: "start="+start+"end="+end+"fund_status="+fund_status, */
              success: function(data){ // callback함수 --> 결과값 돌려받는다.
            	  alert("success");
                 $(".ajaxProductDiv").html(data); // 결과 출력
              },
              error: function(){
                // alert("오류");
              },
              complete: function(){
                 alert("complete");
              }
         });
        setTimeout(ajaxProduct,10000);
      }
});
</script>
<!-- *****************************실시간 Ajax 영역******************************** -->
<script type="text/javascript">

var zoneoneval ="dummy";
var zonetwoval ="dummy";
   $(function(){
      $("#zone").change(function(){
      var zone = document.getElementById("zone").value;
         if(zone=="서울"){
            $("#zoneone").show();
            $("#zonetwo").hide();
         }else if(zone=="경기도"){
            $("#zonetwo").show();
            $("#zoneone").hide();
         }
      });
      
      $("#btnOne").click(function(){
         var zone = document.getElementById("zone").value;
         var btnUrl ="";
         
         if(zone=="서울"){
             zoneoneval = $("#zoneone option:selected").val();
             btnUrl="../product.do?command=searchArea&currentpage="+cPage+"&paramtype="+zoneoneval;
         
         }else if(zone=="경기도"){
             zonetwoval = $("#zonetwo option:selected").val();
             btnUrl="../product.do?command=searchArea&currentpage="+cPage+"&paramtype="+zonetwoval;
         }
         alert("btnOne");
         ///////////////////////////
          $.ajax({
               type: "post",
               url: btnUrl,
               success: function(data){ // callback함수 --> 결과값 돌려받는다.
             	  alert("success지역 검색 테스트");
             	  $(".ajaxProductDiv").html(data); // 결과 출력
               },
               error: function(){
                 // alert("오류");
               }
          });
           setTimeout(ajaxProduct,10000);
          ///////////////////////////
      });
      
     $("#btnTwo").click(function(){
         var searchtype = document.getElementById("searchtype").value;
         var btnUrl ="../product.do?command=searchtype&currentpage="+cPage+"&paramtype="+searchtype;
       // alert("btnTwo");
         /////////////////////
         $.ajax({
             type: "post",
             url: btnUrl,
             success: function(data){ // callback함수 --> 결과값 돌려받는다.
           	  alert("success상품타입 검색 테스트");
           	  $(".ajaxProductDiv").html(data); // 결과 출력
             },
             error: function(){
            //    alert("오류");
             }
        }); 
   });
   });
   
</script>
<%@ include file="../home/header.jsp" %>
<main>
    <section class="shop">
       <img alt="img" src="../resources/images/auction/introduce.png" style="width:2000px;"/>
   <a id="titleone">지역별:</a><select id="zone">
      <option>서울</option>
      <option>경기도</option>
   </select>
   <select id="zoneone">
      <option>강서구</option>
      <option>양천구</option>
      <option>구로구</option>
      <option>금천구</option>
      <option>영등포구</option>
      <option>마포구</option>
      <option>서대문구</option>
      <option>은평구</option>
      <option>종로구</option>
      <option>관악구</option>
      <option>동작구</option>
      <option>용산구</option>
      <option>중구</option>
      <option>성북구</option>
      <option>강북구</option>
      <option>도봉구</option>
      <option>노원구</option>
      <option>동대문구</option>
      <option>성동구</option>
      <option>강남구</option>
      <option>서초구</option>
      <option>송파구</option>
      <option>광진구</option>
      <option>중랑구</option>
      <option>노원구</option>
      <option>강동구</option>
      
      
   </select>
   <select id="zonetwo" style="display:none;">
      <option>김포시</option>
      <option>파주시</option>
      <option>고양시</option>
      <option>양주시</option>
      <option>의정부시</option>
      <option>동두천시</option>
      <option>연천군</option>
      <option>포천시</option>
      <option>가평군</option>
      <option>의정부시</option>
      <option>남양주시</option>
      <option>구리시</option>
      <option>하남시</option>
      <option>양평군</option>
      <option>여주시</option>
      <option>광주시</option>
      <option>성남시</option>
      <option>과천</option>
      <option>안양</option>
      <option>군포</option>
      <option>광명</option>
      <option>부천</option>
      <option>시흥</option>
      <option>안산시</option>
      <option>화성시</option>
      <option>수원시</option>
      <option>오산시</option>
      <option>용인시</option>
      <option>광주시</option>
      <option>이천시</option>
      <option>인천광역시</option>
      
   </select>
    <input type="button" class="btn" id="btnOne" value="검색"/>
      <a id="titletwo">품목별:</a><select id="searchtype">
      <option value="1">과일</option>
      <option value="2">채소</option>
      <option value="3">곡류</option>
      <option value="4">견과류</option>
      <option value="5">약용작물</option> 
      <option value="6">버섯류</option>
   </select>
   
    <input type="button" class="btn" id="btnTwo" value="검색"/>
       <br/><br/><br/>
       
    <!-- best경매상품 -->      
       <h1 class="bestproduct"><a style="color:darkorange;">Best</a>경매상품</h1>
               <div class="ajaxbestDiv"><!-- best경매상품 ajax영역 --> </div>   
            <!-- best경매상품 끝 -->
        <br/><br/><br/>
      <hr/><br/>
      <!-- 일반경매상품 -->
      <h1 class="bestproduct">경매상품</h1>
            <div class="ajaxProductDiv"><!-- 일반 경매상품 ajax영역 --> </div>   
                <!-- 일반경매상품 끝-->
                 <div class="overlay"></div>
 
    </section>
       <!-- 페이징 시작 -->            
    <div class="pagination">
<%
   if(pagegroup > 1){
%>   
   <a href="../product.do?command=<%=listGubun%>&currentpage=<%=startseq-1 %>&paramtype=${sessionScope.paramtype }" class="prev str">Prev</a>
<%
   }
   for(int pagenum = startseq; pagenum <= ((endseq < totalpage)?endseq:totalpage); pagenum++){
%>
   <a href="../product.do?command=<%=listGubun%>&currentpage=<%=pagenum %>&paramtype=${sessionScope.paramtype }" class="pager"><%=pagenum %></a>   
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
  <!-- 페이징 끝 -->   
</main>
<%@ include file="../home/footer.jsp" %>

<script type="text/javascript">
	function message(){
		
		if(${empty sessionScope.dto.mem_grade}){
			alert("로그인이 필요합니다.");
		}else if(${sessionScope.dto.mem_grade!=1 and sessionScope.dto.mem_grade!=2}){
			alert("권한이 없습니다.");
		}else {
		window.open("message.jsp","","width=400,height=600,left=500,top=100");
		}
	}

</script>
</body>
</html>