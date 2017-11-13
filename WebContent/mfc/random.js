$(document).ready(function(){
	programpick();
	replypick();
});
function programpick(){
	$.ajax({
		type: "POST",
		url: "/MFC/selectRandomClass.do",
		dataType:"text",
		success:function(response){
			$("#bestprogram").html(response);
		}
	});
}
function replypick(){
	$.ajax({
		type: "POST",
		url: "/MFC/selectRandomReply.do",
		dataType:"text",
		success:function(response){
			$("#reply").html(response);
		}
	});
}