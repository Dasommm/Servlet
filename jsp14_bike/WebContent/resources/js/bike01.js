
$(function(){ //load하면 실행되는 것 (window.onload와 같다)
	getJsonTest();
});

function getJsonTest(){
	$.getJSON("resources/json/bike.json",function(data){	
	//Load JSON => $.getJSON(url-String [,data-object/String][,success-function(object data/ String textStatus/ jqXHR jqXHR)])
		$.each(data,function(key,val){	
		//$.each(array/object-iterate, callback-function(Integer indexInArray, Object value))
			//그냥 function과 callback function의 차이점은 다시 돌아오는지의 여부
			if(key=="DESCRIPTION"){
				$("table").attr("border","1");
				
				$("thead").append(
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
			}else if(key=="DATA"){
				var list = val;
				for(var i=0 ; i<list.length;i++){
					var str = list[i];
					$("tbody").append(
							"<tr>"
							+"<td>"+str.addr_gu+"</td>"
							+"<td>"+str.content_id+"</td>"
							+"<td>"+str.content_nm+"</td>"
							+"<td>"+str.new_addr+"</td>"
							+"<td>"+str.cradle_count+"</td>"
							+"<td>"+str.longitude+"</td>"
							+"<td>"+str.latitude+"</td>"
							+"<input type='hidden' name='bike' value='"+str.addr_gu+"/"+str.content_id+"/"+str.content_nm+"/"+str.new_addr+"/"+str.cradle_count+"/"+str.longitude+"/"+str.latitude+"'>"
							+"</tr>"
					);
				}
				
			}
		})
	})
	
}

