		// pc버전 GNB
	$(function(){
		var now=false;
		$("#navBtn").click(function(){
			if(now==false){
				$("#gnb").animate({"height":"500px"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"0"});
				$(".bar1").css({"transform":"rotate(45deg) translate(5px,8px)","width":"30px"});
				$(".bar3").css({"transform":"rotate(-45deg) translate(5px,-8px)","width":"30px"});
				now=true;
			}
			else{
				$("#gnb").animate({"height":"0"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"1"});
				$(".bar1").css({"transform":"rotate(0deg) translate(0px,0px)"});
				$(".bar3").css({"transform":"rotate(0deg) translate(0px,0px)"});
				now=false;
			}
		});
	});