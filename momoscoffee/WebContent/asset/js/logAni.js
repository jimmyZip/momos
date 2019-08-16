	$(function(){
		$(".boxC").hide();
		$(".boxA").delay(3500).fadeOut(500);
		$(".boxB .box2").delay(4500).animate({"width":"346px"},500, "linear");
		$(".boxB .box1").delay(5000).animate({"height":"141px"},500, "linear");
		$(".boxB .box4").delay(5500).animate({"width":"346px"},500, "linear");
		$(".boxB .box3").delay(6000).animate({"height":"141px"},500, "linear");
		$(".boxB").delay(6500).fadeOut(500);
		$(".boxC").delay(6000).fadeIn(2000);
	});