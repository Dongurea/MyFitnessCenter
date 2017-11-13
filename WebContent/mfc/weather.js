var APPID = "f58d1d744d203643c460a3e056e15a9b";
var temp;
var loc;
var icon;
var humidity;
//var wind;
//var direction;
var wear;

function update(weather) {
    icon.src = "/MFC/mfc/img/codes/" + weather.code + ".jpg"
    humidity.innerHTML = weather.humidity;
    loc.innerHTML = weather.location;
    //direction.innerHTML = weather.direction;
    temp.innerHTML = weather.temp;
    //wind.innerHTML = weather.wind;
    
    var wearMsg;
    
    
    if(weather.temp > 27){
    	if(weather.humidity <= 100 && weather.humidity >70){
    		wearMsg="<b>매우 덥고, 습도가 매우높습니다.</b>";	
    	}else if(weather.humidity < 70 && weather.humidity >= 60){
    		wearMsg="<b>매우 덥고, 습도가 조금높습니다.</b>"
    	}else if(weather.humidity < 60 && weather.humidity >= 50){
    		wearMsg="<b>매우 덥고, 습도는 보통입니다.</b>";
    	}else if(weather.humidity < 50 && weather.humidity >= 30){
    		wearMsg="<b>매우 덥고, 조금 건조합니다.</b>";
    	}else if(weather.humidity < 30){
    		wearMsg ="<b>매우 덥지만, 건조합니다.</b>";
    	}
    }
    
    else if(weather.temp <= 27){
    	if(weather.humidity <= 100 && weather.humidity >70){
    		wearMsg="<b>덥고, 습도가 매우높습니다.</b>";	
    	}else if(weather.humidity < 70 && weather.humidity >= 60){
    		wearMsg="<b>덥고, 습도가 조금높습니다.</b>"
    	}else if(weather.humidity < 60 && weather.humidity >= 50){
    		wearMsg="<b>덥고, 습도는 보통입니다.</b>";
    	}else if(weather.humidity < 50 && weather.humidity >= 30){
    		wearMsg="<b>덥고, 조금 건조합니다.</b>";
    	}else if(weather.humidity < 30){
    		wearMsg ="<b>덥고, 건조합니다.</b>";
    	}
    }
    
    else if(weather.temp <= 24){
    	if(weather.humidity <= 100 && weather.humidity >70){
    		wearMsg="<b>선선하지만, 습도가 매우높습니다.</b>";	
    	}else if(weather.humidity < 70 && weather.humidity >= 60){
    		wearMsg="<b>선선하고,  습도가 조금 높습니다.</b>"
    	}else if(weather.humidity < 60 && weather.humidity >= 50){
    		wearMsg="<b>선선하고,  습도는 보통입니다.</b>";
    	}else if(weather.humidity < 50 && weather.humidity >= 30){
    		wearMsg="<b>선선하고, 조금 건조합니다.</b>";
    	}else if(weather.humidity < 30){
    		wearMsg ="<b>선선하고, 건조합니다.</b>";
    	}
    }
    
    else if(weather.temp <= 19){
    	if(weather.humidity <= 100 && weather.humidity >70){
    		wearMsg="<b>조금 쌀쌀하고, 습도가 매우 높습니다.</b>";	
    	}else if(weather.humidity < 70 && weather.humidity >= 60){
    		wearMsg="<b>조금 쌀쌀하고,  습도가 조금 높습니다.</b>"
    	}else if(weather.humidity < 60 && weather.humidity >= 50){
    		wearMsg="<b>조금 쌀쌀하고,  습도는 보통입니다.</b>";
    	}else if(weather.humidity < 50 && weather.humidity >= 30){
    		wearMsg="<b>조금 쌀쌀하고, 조금 건조합니다.</b>";
    	}else if(weather.humidity < 30){
    		wearMsg ="<b>조금 쌀쌀하고, 건조합니다.</b>";
    	}
    }
    
    else if(weather.temp <= 10){
    	if(weather.humidity <= 100 && weather.humidity >70){
    		wearMsg="<b>춥고, 습도가 매우높습니다.</b>";	
    	}else if(weather.humidity < 70 && weather.humidity >= 60){
    		wearMsg="<b>춥고,  습도가 조금 높습니다.</b>"
    	}else if(weather.humidity < 60 && weather.humidity >= 50 ){
    		wearMsg="<b>춥고,  습도는 보통입니다.</b>";
    	}else if(weather.humidity < 50 && weather.humidity >= 30){
    		wearMsg="<b>춥고, 조금 건조합니다.</b>";
    	}else if(weather.humidity < 30){
    		wearMsg ="<b>춥고, 건조합니다.</b>";
    	}
    }
    
    else if(weather.temp < 0 ){
    	if(weather.humidity <= 100 && weather.humidity >70){
    		wearMsg="<b>매우 춥고, 습도가 매우높습니다.</b>";	
    	}else if(weather.humidity < 70 && weather.humidity >= 60){
    		wearMsg="<b>매우 춥고,  습도가 조금 높습니다.</b>"
    	}else if(weather.humidity < 60 && weather.humidity >= 50 ){
    		wearMsg="<b>매우 춥고,  습도는 보통입니다.</b>";
    	}else if(weather.humidity < 50 && weather.humidity >= 30){
    		wearMsg="<b>매우 춥고, 조금 건조합니다.</b>";
    	}else if(weather.humidity < 30){
    		wearMsg ="<b>매우 춥고, 건조합니다.</b>";
    	}
    }
    
    wear.innerHTML = wearMsg;
}

window.onload = function () {
    temp = document.getElementById("temperature");
    loc = document.getElementById("location");
    icon = document.getElementById("icon");
    humidity = document.getElementById("humidity");
   //wind = document.getElementById("wind");
   //direction = document.getElementById("direction");
    wear = document.getElementById("wear");

    /* NEW */
    if(navigator.geolocation){
	var showPosition = function(position){
	    updateByGeo(position.coords.latitude, position.coords.longitude);
	}
	navigator.geolocation.getCurrentPosition(showPosition);
    } else {
	var zip = window.prompt("Could not discover your location. What is your zip code?");
	updateByZip(zip);
    }

}

/* NEW */

function updateByGeo(lat, lon){
    var url = "http://api.openweathermap.org/data/2.5/weather?" +
	"lat=" + lat +
	"&lon=" + lon +
	"&APPID=" + APPID;
    sendRequest(url);    
}


function updateByZip(zip){
    var url = "http://api.openweathermap.org/data/2.5/weather?" +
	"zip=" + zip +
	"&APPID=" + APPID;
    sendRequest(url);
}


function sendRequest(url){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
	if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            var data = JSON.parse(xmlhttp.responseText);
	    var weather = {};
	    weather.code = data.weather[0].id;
	    weather.humidity = data.main.humidity;
	    //weather.wind = data.wind.speed;
	    /* NEW */
	    //weather.direction = degreesToDirection(data.wind.deg)
	    weather.location = data.name;
	    /* NEW */
	    weather.temp = K2F(data.main.temp);	
	    update(weather);
	}
    };

    xmlhttp.open("GET", url, true);
    xmlhttp.send();    
}
/*
function degreesToDirection(degrees){
    var range = 360/16;
    var low = 360 - range/2;
    var high = (low + range) % 360;
    var angles = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
    for( i in angles ) {
	if(degrees >= low && degrees < high){
	    console.log(angles[i]);
	    return angles[i];
	    console.log("derp");
	}
	low = (low + range) % 360;
	high = (high + range) % 360;
    }
    return "N";
    
}
*/
function K2F(k){
    return Math.round(k-273.15);

}
