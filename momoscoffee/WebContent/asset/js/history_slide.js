	$(function(){
		$(window).resize(function(){$(".nextBtn").click();});
		width = $(".imgScreen").width();

		// 스크린 각각의 맨 마지막 사진이 필름 앞으로 오게끔 만들기
		for(var i=0; i<11; i++){
			$(".history"+i+" .imgFilm").prepend($(".history"+i+" .scene:last"));
		}
		$(".imgFilm").css({"marginLeft":"-"+width+"px"});

		// 다음 버튼을 누르면 이미지가 왼쪽으로 넘어가게 만들기
		for(var x=0; x<11; x++){
			slide_next(x);
		}
		function slide_next(x){
			$(".nextBtn"+x).click(function(){
				width = $(".imgScreen").width();

				$(".imgFilm"+x+":not(:animated)").stop().animate({"marginLeft":"-="+width+"px"},500,"swing",function(){
					$(".imgFilm"+x).append($(".imgFilm"+x+" li:first"));
					$(".imgFilm"+x).css({"marginLeft":"-"+width+"px"});	
				});				

			});	
		}

		// 이전 버튼을 누르면 이미지가 오른쪽으로 넘어가게 만들기
		for(var y=0; y<11; y++){
			slide_prev(y);
		}
		function slide_prev(y){
			$(".prevBtn"+y).click(function(){
				width = $(".imgScreen").width();

				$(".imgFilm"+y+":not(:animated)").stop().animate({"marginLeft":"+="+width+"px"},500,"swing",function(){
					$(".imgFilm"+y).prepend($(".imgFilm"+y+" li:last"));
					$(".imgFilm"+y).css({"marginLeft":"-"+width+"px"});	
				});				

			});	
		}

	});