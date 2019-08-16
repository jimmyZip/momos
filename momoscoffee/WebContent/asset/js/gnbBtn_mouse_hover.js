	// GNB 버튼 마우스 호버 반응

	$(function(){
		$("#navBtn").bind("mouseover focusin",function(){
			$(".arrowBtn").css({"left":"25px"});
			$(".bar2").css({"width":"35px"});
			$(".bar1, .bar3").css({"width":"20px"});
		}).bind("mouseout focusout",function(){
			$(".arrowBtn").css({"left":"-25px"});
			$(".bar2").css({"width":"30px"});
			$(".bar1, .bar3").css({"width":"30px"});
		});
	});