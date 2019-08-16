// 서브페이지 연혁 년도 변경 스크립트 영역
	$(function(){
		$("#yearBg").hide();

		$(window).scroll(function(){
			
			var nowScroll = $(document).scrollTop()
			//console.log(nowScroll);
			if(nowScroll>250 && nowScroll<5400){
				$("#yearBg").fadeIn();
			}
			else{
				$("#yearBg").fadeOut();
			}
		});
		// .yearArea span[0] = "2007" 이 스크롤값 250~700 사이에만 나타나게 한다. 그 이외는 사라지게 한다.
		// .yearArea span[0] = "2008" 이 스크롤값 700~1000 사이에만 나타나게 한다. 그 이외는 사라지게 한다. 
		$(window).scroll(function(){	
			var years = $(".yearArea").children();
			var nowScroll = $(document).scrollTop()
			if(nowScroll>250 && nowScroll<1000){
				$(years).css({"opacity":"0"});	
				$(years[0]).css({"opacity":"1"});
			}
			else if(nowScroll>=1000 && nowScroll<1600){
				$(years).css({"opacity":"0"});	
				$(years[1]).css({"opacity":"1"});			
			}
			else if(nowScroll>1600 && nowScroll<2000){
				$(years).css({"opacity":"0"});	
				$(years[2]).css({"opacity":"1"});			
			}
			else if(nowScroll>2000 && nowScroll<3000){
				$(years).css({"opacity":"0"});	
				$(years[3]).css({"opacity":"1"});			
			}
			else if(nowScroll>3000 && nowScroll<4000){
				$(years).css({"opacity":"0"});	
				$(years[4]).css({"opacity":"1"});			
			}
			else if(nowScroll>4000 && nowScroll<5000){
				$(years).css({"opacity":"0"});	
				$(years[5]).css({"opacity":"1"});			
			}
			else if(nowScroll>5000 && nowScroll<5400){
				$(years).css({"opacity":"0"});	
				$(years[6]).css({"opacity":"1"});			
			}
		});
	});