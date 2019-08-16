		// infomenu : sns 버튼영역
	$(function(){
		$(".snsBtnArea").hide();
		$(".snsBtn").bind("mouseenter focusin", function(){
			$(".snsBtnIcon").css({"transform":"scale(1.1)"});
			$(".snsBtnArea").stop().slideDown(300);
		}).bind("mouseleave focusout", function(){
			$(".snsBtnIcon").css({"transform":"scale(1)"});
			$(".snsBtnArea").stop().slideUp(300);
		});
	});