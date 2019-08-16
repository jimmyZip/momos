
	$(function(){
		$(".topBtn").hide();

		$(window).scroll(function(){
			
			var nowScroll = $(document).scrollTop()
			//console.log(nowScroll);
			if(nowScroll>200){
				$(".topBtn").fadeIn();
			}
			else{
				$(".topBtn").fadeOut();
			}
		});

		$(".topBtn a").click(function(){
			$("body,html").animate({scrollTop:0},500,"linear");
			return false;
		});
		
	});