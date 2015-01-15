var eventDate = new Date(2015,2,14);
var now = new Date();
var count = eventDate - now;
var seconds = count/1000;
var days = Math.ceil(seconds / (60*60*24));
var windowHeight = window.innerHeight;

$("#count-day").html(days);

if($("nav.header .mobile-header").css("display") == "block")
	windowHeight -= 50;

$(".page-header").css("height",window.windowHeight);
$(window).on("resize",function(){
	$(".page-header").css("height",window.windowHeight);
	
});
$(window).on("scroll",function(){
	if($(window).scrollTop() > window.windowHeight)
	{
		$("nav.header").addClass("header-fixed");
	}
	else{
		$("nav.header").removeClass("header-fixed");
	}		
});
$("nav.header .mobile-header span").click(function(){
	$("nav.header ul").toggle();
})
$("nav.header ul li a").click(function(){
		if($("nav.header .mobile-header").css("display") == "block")
		$("nav.header ul").hide();
});