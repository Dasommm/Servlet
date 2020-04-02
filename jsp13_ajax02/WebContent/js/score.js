/*
 * XMLHttpRequest : 서버와 통신을 도와주는 객체, http를 통한 데이터 송수신 지원.(javaScript object)
 * 
 * --readystate
 * 0:uninitialized -실행(load)되지 않음
 * 1:loading -로드 중
 * 2:loaded -로드 됨
 * 3:interactive - 통신 됨
 * 4:complete -통신완료
 * 
 * --status
 * 200:통신성공
 * 400:bad request
 * 401:unauthorized
 * 403:forbidden
 * 404:not found
 * 500:internal server error
 * 
 * -- encodeURIComponent(): 모든 문자를 인코딩
 * encodURI(): 주소줄에 사용되는 특수문자는 제외하고 인코딩
 * 
 * -- decodeURIComponent(): 인코딩을 디코딩한다
 * 
 * 
 * 
 * 
 * */
function load(){
	var url = getParameterValues();
	
	//변수의 호이스팅 
	httpRequest =new XMLHttpRequest();	//서버와 통신-비동기통신
	httpRequest.onreadystatechange=callback;	//처리할 함수-readystate가 change event(on)될때 callback(요청하면 back)할거다 
	httpRequest.open("GET",url,true);	//true:비동기 , false=동기로 요청할 수 있다 
	httpRequest.send();	//"GET" : send() /"POST" :send(String)
	
}


function callback(){
	alert("readyState:"+httpRequest.readyState);
	
	if(httpRequest.readyState==4){	//통신완료
		alert("status:"+httpRequest.status);
		if(httpRequest.status==200){	//통신성공 =>JQuery에서 success라고 적어둔 곳과 같은 의미
			var obj = JSON.parse(httpRequest.responseText);	//요청해서 응답받은 데이터를
				//JSON.parse:String을 JSON obj으로 parsing해준다. 데이터가 클라이언트와 서버사이를  왔다갔다 할때는 type이 String이기 때문에 이 데이터가 JSON이라고 알려줘야한다
			document.getElementById("result").innerHTML=decodeURIComponent(obj.name)+"님의 총점은"	//화면에 뿌려준다
			+obj.sum+"이고, 평균은"+obj.avg+"입니다.";
			
		}else{
			alert("통신실패");
		}
	}
}


function getParameterValues(){
	var name="name="+encodeURIComponent(document.getElementById("name").value);
	var kor="kor="+document.getElementById("kor").value;
	var eng="eng="+document.getElementById("eng").value;
	var math="math="+document.getElementById("math").value;
	
	var url="score.cal?"+name+"&"+kor+"&"+eng+"&"+math;
	console.log(url);
	
	return url;
	
	
}