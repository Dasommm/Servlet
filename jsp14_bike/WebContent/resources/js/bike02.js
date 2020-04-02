$(function(){
	parseJsonTest();	
});

/*
 * JSON.parse() :String -> JSON
 * JSON.Stringify() : JSON -> String
 * 
 */

function parseJsonTest(){
	$.getJSON("resources/json/bike.json",function(data){
		$.ajax({
			url:"bike.do?command=second_db", //request가 보내질 url
			method :"post",
			data:{"obj":JSON.stringify(data)},//웹 서버에 데이터를 보낼때, 데이터는 String이어야 한다. 
			//JSON.stringify()는 JavaScript object를 String으로 바꿔준다.
			success:function(msg){	//msg:response 받은 text
				if(msg == 1163){
					//table에 표시하자
					$.each(data,function(key,val){
						if(key=="DESCRIPTION"){
							//DESCRIPTION이라면 ->
							$("table").attr("border","1");
							
							var $tr = $("<tr>");
							for(var i in val){	//i값에는 key값이 들어있다
								$tr.append($("<th>").html(val[i]));	//키(i)값에 맞는 value값이 나온다
							}
							$("thead").append($tr);
							
							/*$("thead").append(
									"<tr>"
									+"<th>"+val.ADDR_GU+"</th>"
									+"<th>"+val.CONTENT_ID+"</th>"
									+"<th>"+val.CONTENT_NM+"</th>"
									+"<th>"+val.NEW_ADDR+"</th>"
									+"<th>"+val.CRADLE_COUNT+"</th>"
									+"<th>"+val.LONGITUDE+"</th>"
									+"<th>"+val.LATITUDE+"</th>"
									+"</tr>"
							);
							*/
						}else if(key=="DATA"){
							//DATA라면 ->
							/*
							for(var i = 0; i <val.length;i++){
								var $tr =$("<tr>");
								for(var j in val[i]){
									$tr.append($("<td>").html(val[i][j]));
								}
								$("tbody").append($tr);
							}
							
							*/
							var list = val;
							for(var i = 0; i < list.length; i++){
								var str = list[i];
							$("tbody").append(
									"<tr>"
									+"<th>"+str.addr_gu+"</th>"
									+"<th>"+str.content_id+"</th>"
									+"<th>"+str.content_nm+"</th>"
									+"<th>"+str.new_addr+"</th>"
									+"<th>"+str.cradle_count+"</th>"
									+"<th>"+str.longitude+"</th>"
									+"<th>"+str.latitude+"</th>"
									+"<input type='hidden' name='bike' value='" 
											+str.addr_gu+"/"
											+str.content_id+"/"
											+str.content_nm+"/"
											+str.new_addr+"/"
											+str.cradle_conut+"/"
											+str.longitude+"/"
											+str.latitude+"'>"
									+"</tr>"							
								)
								
							};
							
						};
						
					})					
					
				}else{
					alert("저장실패");
				}				
			},
			error:function(){
				alert("통신실패");
			}
		});
	});
}