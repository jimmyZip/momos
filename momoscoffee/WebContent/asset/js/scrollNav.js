	// 스크롤 네비게이션
	
	$(function(){
		$(window).scroll(function(){
			var nowScroll = $(document).scrollTop()
			//console.log(nowScroll);
			if(nowScroll>80){
				$("#fixNav").stop().animate({"top":"0"},300,"linear");
			}
			else{
				$("#fixNav").stop().animate({"top":"-80px"},300,"linear");
			}
		});
	});