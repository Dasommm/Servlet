$(function(){
	$("#weaview").click(function(){
		var url = "weather";
		var code = $("#address option:selected").val();
		$.ajax({
			type :"GET",
			url : url+"?code="+code,
			datatype : "text",
			success : function(msg){
				var tmp = $.trim(msg);
				var obj = JSON.parse(tmp);
				
				$("#pubData").val(obj.pubDate);
				$("#temp").val(obj.temp);
				$("#x").val(obj.x);
				$("#y").val(obj.y);
				$("#reh").val(obj.reh);
				$("#pop").val(obj.pop);
				$("#wfKor").val(obj.wfKor);
				
				var condition = obj.wfKor;
				if(condition == "맑음"){
					$("#weather_img").attr("src","./image/sun.png");
				}else if(condition =="비"){
					$("#weather_img").attr("src","./image/rain.png");
				}else if(condition =="눈"){
					$("#weather_img").attr("src","./image/snow.png");
				}else if(condition =="흐림"){
					$("#weather_img").attr("src","./image/cloud.png");
				}else if(condition =="구름조금"){
					$("#weather_img").attr("src","./image/cloud_sun.png");
				}else {
					$("#weather_img").attr("src","./image/etc.png");
				}
			},
			error : function(){
				alert("data load failed");
			}
		})
	})
})