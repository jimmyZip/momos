
	// 제품 상세페이지 슬라이드 영역

	$(function(){
		$(window).resize(function(){$(".nextBtn").click();});

		width = $(".product_screen").width();

		$(".product_film").prepend($(".product_scene:last"));
		$(".product_film").css({"marginLeft":"-"+width+"px"});

		$(".nextBtn").click(function(){
			width = $(".product_screen").width();

			$(".product_film:not(:animated)").stop().animate({"marginLeft":"-="+width+"px"},500,"swing",function(){
				$(".product_film").append($(".product_scene:first"));
				$(".product_film").css({"marginLeft":"-"+width+"px"});
			});	
		});	

		$(".prevBtn").click(function(){
			width = $(".product_screen").width();

			$(".product_film:not(:animated)").stop().animate({"marginLeft":"+="+width+"px"},500,"swing",function(){
				$(".product_film").prepend($(".product_scene:last"));
				$(".product_film").css({"marginLeft":"-"+width+"px"});
			});	
		});

	var autoClick=setInterval(function(){$(".nextBtn").click();},5000);

	});