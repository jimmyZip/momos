	$(function(){

		// 모바일 버전 GNB
		var now1=false;
		$("#mobileNavBtn").click(function(){
			if(now1==false){
				$("#gnbArea_mobile").animate({"left":"0"},300,"linear");
				$("h1").animate({"opacity":"0"},300,"linear");
				$("#infoMenu").animate({"width":"80px"},300,"linear");
				$(".cartBtn").animate({"left":"50px"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"0"});
				$(".bar1").css({"transform":"rotate(45deg) translate(5px,8px)","width":"30px"});
				$(".bar3").css({"transform":"rotate(-45deg) translate(5px,-8px)","width":"30px"});
				now1=true;
			}
			else{
				$("#gnbArea_mobile").animate({"left":"-767px"},300,"linear");
				$("h1").animate({"opacity":"1"},300,"linear");
				$("#infoMenu").animate({"width":"30px"},300,"linear");
				$(".cartBtn").animate({"left":"100px"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"1"});
				$(".bar1").css({"transform":"rotate(0deg) translate(0px,0px)"});
				$(".bar3").css({"transform":"rotate(0deg) translate(0px,0px)"});
				now1=false;
			}
//			return false;
		});

		// 모바일 네비게이션 아코디언
		var now2=false;
		$(".gnbMobileList div").click(function(){
			if(now2==false){
				$(this).siblings().children("a").animate({"height":"50px"},300,"linear");
				$(this).children(".hLine").animate({"opacity":"0"},300);
				now2=true;
			}
			else{
				$(this).siblings().children("a").animate({"height":"0"},300,"linear");
				$(this).children(".hLine").animate({"opacity":"1"},300);
				now2=false;
			}
		});
	});