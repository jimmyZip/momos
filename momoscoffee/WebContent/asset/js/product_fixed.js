	// 제품 구매영역 스크롤시 고정
	
	$(function(){
		$(window).scroll(function(){
			var nowScroll = $(document).scrollTop()
			//console.log(nowScroll);
			if(nowScroll>80){
				$(".purchase_box").css({"position":"fixed"});
			}
			else{
				$(".purchase_box").css({"position":"absolute"});
			}
		});
	});