$("#start-hours").on("change",function(){
	setStartTime();
});
$("#start-minutes").on("change",function(){
	setStartTime();
});
function setStartTime(){
	var time = $("#start-hours").val()+":"+$("#start-minutes").val();
	$("#schedule_start_time").val(time);
}

$("#end-hours").on("change",function(){
	setEndTime();
});
$("#end-minutes").on("change",function(){
	setEndTime();
});
function setEndTime(){
	var time = $("#end-hours").val()+":"+$("#end-minutes").val();
	$("#schedule_end_time").val(time);
}