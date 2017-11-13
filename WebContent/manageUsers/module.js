/**
 * 		XMLHttpRequest Module
 */

var request = null;

function getXMLHttpRequest() {
	if( window.ActiveXObject ){
		//IE인 경우
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(ee){
				return null;
			}
		}
		
	}else{
		//다른 브라우저
		try{
			return new XMLHttpRequest();
		}catch(e){
			return null;
		}
	}
}

function sendRequest( callback, url, params, method ) {
	request = getXMLHttpRequest();
	
	if(request == null) {
		alert("request null");
		return;
	}
	
	// callback
	request.onreadystatechange = callback;
	
	//method
	var httpMethod = method?method:"GET";
	if( httpMethod != "POST" && httpMethod != "GET" ){
		httpMethod = "GET";
	}
	
	//params
	var httpParams = (params==null||params=="") ? 
								null : encodeURI(params);
	
	//name=홍길동&age=30
	
	
	//url 
	var httpUrl = httpMethod == "GET" 
					 ? (url + "?" + httpParams) : url;

	request.open(httpMethod, httpUrl, true);
	request.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	request.send(httpMethod=="POST" ? httpParams : null );

}





