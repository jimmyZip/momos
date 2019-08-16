	$(function(){
		// article _ academy
		$(".academyImg1").bind("mouseover focusin", function(){
			$(".hobbyBack").css({"opacity":"1"});
		}).bind("mouseout focusout", function(){
			$(".hobbyBack").css({"opacity":"0"});
		});
		$(".academyImg2 a").bind("mouseover focusin", function(){
			$(this).css({"backgroundColor":"rgba(200,200,100,0.5)"});
			$(this).siblings().css({"transform":"scale(1.1)"});
		}).bind("mouseout focusout", function(){
			$(this).css({"backgroundColor":"rgba(0,0,0,0)"});
			$(this).siblings().css({"transform":"scale(1)"});
		});

		// article _ directEpisode
		$("#directEpisode").bind("mouseover focusin", function(){
			$(this).children("img").css({"transform":"scale(1.1)"});
			$(".episodeText a").css({"backgroundColor":"rgba(200,200,100,0.5)"});
			$(".episodeText").css({"backgroundColor":"rgba(0,0,0,0.5)"});
		}).bind("mouseout focusout", function(){
			$(this).children("img").css({"transform":"scale(1)"});
			$(".episodeText a").css({"backgroundColor":"rgba(0,0,0,0)"});
			$(".episodeText").css({"backgroundColor":"rgba(0,0,0,0)"});
		});

		// article_notice
		$(".centum2, .recruitImg").bind("mouseover focusin", function(){
			$(this).children("img").css({"transform":"scale(1.1)"});
			$(this).children("a").css({"backgroundColor":"rgba(0,0,0,0.3)","perspective":"300px"});
		}).bind("mouseout focusout", function(){
			$(this).children("img").css({"transform":"scale(1.0)"});
			$(this).children("a").css({"backgroundColor":"rgba(0,0,0,0)","perspective":0});
		});

		// footer_SNS
		$("#community a").bind("mouseover focus", function(){
			$(this).css({"transform":"scale(1.1)"});
		}).bind("mouseout blur", function(){
			$(this).css({"transform":"scale(1)"});
		});

	});