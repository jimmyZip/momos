	$(function(){
		$(window).resize(function(){$(".nextBtn").click();});

		width = $("#visualScreen").width();

		$(".visualFilm").prepend($(".scene:last"));

		$(".visualFilm").css({"marginLeft":"-"+width+"px"});
		$("#btn2 ul li:eq(0)").addClass("addBtn");

		$(".nextBtn").click(function(){
			width = $("#visualScreen").width();

			$(".visualFilm:not(:animated)").stop().animate({"marginLeft":"-="+width+"px"},500,"swing",function(){
				$(".visualFilm").append($(".scene:first"));
				$(".visualFilm").css({"marginLeft":"-"+width+"px"});

				var btnNum=$(".scene img").attr("src").substring(8,9);

				btnNum=Number(btnNum)+1;
				if(btnNum==3){btnNum=0;}
				var newClass=$("#btn2 ul li:eq("+btnNum+")");
				$("#btn2 ul li").removeClass();
				newClass.addClass("addBtn");
				});
			});	

		$(".prevBtn").click(function(){
			width = $("#visualScreen").width();

			$(".visualFilm:not(:animated)").stop().animate({"marginLeft":"+="+width+"px"},500,"swing",function(){
			$(".visualFilm").prepend($(".scene:last"));
			$(".visualFilm").css({"marginLeft":"-"+width+"px"});

			var btnNum=$(".scene img").attr("src").substring(8,9);
			btnNum=Number(btnNum)+1;
			if(btnNum==3){btnNum=0;}
		
			var newClass=$("#btn2 ul li:eq("+btnNum+")");
			$("#btn2 ul li").removeClass();
			newClass.addClass("addBtn");
			});
		});
	var autoClick=setInterval(function(){$(".nextBtn").click();},5000);

		$(".stopBtn").click(function(){clearInterval(autoClick);});
		$(".playBtn").click(function(){
			setInterval(function(){$(".nextBtn").click();},5000);
		});
	
	});