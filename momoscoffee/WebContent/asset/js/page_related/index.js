/**
 * index.jsp에 포함된 기능 스크립트 분리
 * main slide기능, FindUs기능, BestSeller slide기능, 
 */
$(document).ready(function(){
	/*========main slider script=============*/
	var swiper = new Swiper('.swiper-container', {
		nextButton : '.swiper-button-next',
		prevButton : '.swiper-button-prev',
		slidesPerView : 1,
		paginationClickable : true,
		spaceBetween : 30,
		loop : true
	});

	var autoClick = setInterval(function() {
		$(".swiper-button-next").click();
	}, 5000);
	$(".swiper-container").mouseover(function() {
		clearInterval(autoClick);
	});
	$(".swiper-container").mouseout(function() {
		clearInterval(autoClick);
		autoClick = setInterval(function() {
			$(".swiper-button-next").click();
		}, 5000);
	});

	//아래로 이동 이미지
	$(".slide_downMove").bind("click focus", function() {
		var main_introText = $(".main_introText").offset().top;
		$("html, body").animate({
			scrollTop : main_introText
		}, 500);
	});
	/*========main slider script ends=============*/
	
	/*========FindUs=============*/
	$(".findUs_box1 a").bind("mouseover focusin", function() {
		$(".findUs_img1").stop().animate({
			"backgroundSize" : "150%"
		}, 5000);
		$(".findUs_text").css({
			"backgroundColor" : "rgb(200,200,125)",
			"color" : "#5A4931",
			"textDecoration" : "none"
		});
		$(".findUs_text strong").css({
			"color" : "#333"
		});
		$(".findUs_text span").css({
			"color" : "#fff",
			"fontWeight" : "700",
			"textShadow" : "3px 3px 5px rgba(0,0,0,0.5)"
		});
	}).bind("mouseleave focusout", function() {
		$(".findUs_img1").stop().animate({
			"backgroundSize" : "100%"
		}, 2000);
		$(".findUs_text").css({
			"backgroundColor" : "#fff"
		});
		$(".findUs_text strong").css({
			"color" : "#5A4931"
		});
		$(".findUs_text span").css({
			"color" : "#333",
			"fontWeight" : "400",
			"textShadow" : "0 0 0 rgba(0,0,0,0)"
		});
	});
	$(".findUs_box2 a").bind("mouseover focusin", function() {
		$(".findUs_box2 a").stop().animate({
			"backgroundSize" : "150%"
		}, 5000);
	}).bind("mouseleave focusout", function() {
		$(".findUs_box2 a").stop().animate({
			"backgroundSize" : "100%"
		}, 2000);
	});
	/*========FindUs script ends=============*/
	
	/*========best seller=============*/
	$(window).resize(function() {
		$(".main_shop_nextBtn").click();
	});
	width = $(".main_shopScene").width();
	$(".main_shopFilm").prepend($(".main_shopScene:last"));
	$(".main_shopFilm").css({
		"marginLeft" : "0"
	});

	$(".main_shop_nextBtn").click(function() {
		width = $(".main_shopScene").width();
		$(".main_shopFilm").stop().animate({
			"marginLeft" : "-=" + width + "px"
		}, 500, "swing", function() {
			$(".main_shopFilm").append($(".main_shopScene:first"));
			$(".main_shopFilm").css({
				"marginLeft" : "0"
			});
		});
	});

	$(".main_shop_prevBtn").click(function() {
		width = $(".main_shopScene").width();
		$(".main_shopFilm").stop().animate({
			"marginLeft" : "+=" + width + "px"
		}, 500, "swing", function() {
			$(".main_shopFilm").prepend($(".main_shopScene:last"));
			$(".main_shopFilm").css({
				"marginLeft" : "0"
			});
		});
	});

	var autoClick = setInterval(function() {
		$(".main_shop_nextBtn").click();
	}, 4000);

	$(".main_shopScreen, .main_shopBtn").mouseover(function() {
		clearInterval(autoClick);
	});
	$(".main_shopScreen, .main_shopBtn").mouseleave(function() {
		clearInterval(autoClick);
		autoClick = setInterval(function() {
			$(".main_shop_nextBtn").click();
		}, 4000);
	});
	/*========best seller script ends=============*/
	
	/*========article academy script=============*/
	$(".academyImg1").bind("mouseover focusin", function() {
		$(".hobbyBack").css({
			"opacity" : "1"
		});
	}).bind("mouseout focusout", function() {
		$(".hobbyBack").css({
			"opacity" : "0"
		});
	});
	$(".academyImg2 a").bind("mouseover focusin", function() {
		$(this).css({
			"backgroundColor" : "rgba(200,200,100,0.5)"
		});
		$(this).siblings().css({
			"transform" : "scale(1.1)"
		});
	}).bind("mouseout focusout", function() {
		$(this).css({
			"backgroundColor" : "rgba(0,0,0,0)"
		});
		$(this).siblings().css({
			"transform" : "scale(1)"
		});
	});
	/*========article academy script ends=============*/
	
	/*========article _ direct episode================*/
	$("#directEpisode").bind("mouseover focusin", function() {
		$(this).children("img").css({
			"transform" : "scale(1.1)"
		});
		$(".episodeText a").css({
			"backgroundColor" : "rgba(200,200,100,0.5)"
		});
		$(".episodeText").css({
			"backgroundColor" : "rgba(0,0,0,0.5)"
		});
	}).bind("mouseout focusout", function() {
		$(this).children("img").css({
			"transform" : "scale(1)"
		});
		$(".episodeText a").css({
			"backgroundColor" : "rgba(0,0,0,0)"
		});
		$(".episodeText").css({
			"backgroundColor" : "rgba(0,0,0,0)"
		});
	});
	/*========article _ direct episode ends================*/
	
	/*========artice _ notice ================*/
	$(".main_notice_link").bind("mouseover focusin", function() {
		$(this).children("img").css({
			"transform" : "scale(1.1)"
		});
		$(this).children("a").css({
			"backgroundColor" : "rgba(0,0,0,0.3)",
			"perspective" : "300px"
		});
	}).bind("mouseout focusout", function() {
		$(this).children("img").css({
			"transform" : "scale(1.0)"
		});
		$(this).children("a").css({
			"backgroundColor" : "rgba(0,0,0,0)",
			"perspective" : 0
		});
	});
	/*========artice _ notice ends===============*/
});