// pc버전 GNB
	$(function(){
		var now=false;
		$("#navBtn").click(function(){
			if(now==false){
				$("#gnb").animate({"height":"500px"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"0"});
				$(".bar1").css({"transform":"rotate(45deg) translate(5px,8px)","width":"30px"});
				$(".bar3").css({"transform":"rotate(-45deg) translate(5px,-8px)","width":"30px"});
				now=true;
			}
			else{
				$("#gnb").animate({"height":"0"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"1"});
				$(".bar1").css({"transform":"rotate(0deg) translate(0px,0px)"});
				$(".bar3").css({"transform":"rotate(0deg) translate(0px,0px)"});
				now=false;
			}
		});
	});

// 모바일 버전 GNB
	$(function(){
		var now1=false;
		$("#mobileNavBtn").click(function(){
			if(now1==false){
				$("#gnbArea_mobile").animate({"left":"0"},300,"linear");
				$("h1").animate({"opacity":"0"},300,"linear");
				$("#infoMenu").animate({"width":"80px"},300,"linear");
				$(".cartBtn").animate({"left":"50px"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"0"});
				$(".bar1").css({"transform":"rotate(45deg) translate(5px,8px)","width":"30px"});
				$(".bar3").css({"transform":"rotate(-45deg) translate(5px,-8px)","width":"30px"});
				now1=true;
			}
			else{
				$("#gnbArea_mobile").animate({"left":"-767px"},300,"linear");
				$("h1").animate({"opacity":"1"},300,"linear");
				$("#infoMenu").animate({"width":"30px"},300,"linear");
				$(".cartBtn").animate({"left":"100px"},300,"linear");
				$(".bar2, .arrowBtn").css({"opacity":"1"});
				$(".bar1").css({"transform":"rotate(0deg) translate(0px,0px)"});
				$(".bar3").css({"transform":"rotate(0deg) translate(0px,0px)"});
				now1=false;
			}
			//	return false;
		});

		// 모바일 네비게이션 아코디언
		var now2=false;
		$(".gnbMobileList div").click(function(){
			if(now2==false){
				$(this).siblings().children("a").animate({"height":"50px"},300,"linear");
				$(this).children(".hLine").animate({"opacity":"0"},300);
				now2=true;
			}
			else{
				$(this).siblings().children("a").animate({"height":"0"},300,"linear");
				$(this).children(".hLine").animate({"opacity":"1"},300);
				now2=false;
			}
		});
	});

	// infomenu : sns 버튼영역
	$(function(){
		$(".snsBtnArea").hide();
		$(".snsBtn").bind("mouseenter focusin", function(){
			$(".snsBtnIcon").css({"transform":"scale(1.1)"});
			$(".snsBtnArea").stop().slideDown(300);
			//sns버튼이 slideDown될 때, welcomeMan(환영문구,로그아웃버튼)을 좌측으로 이동시킴
			$(".welcomeMan").stop().animate({"right":"7%"},300,"linear");
		}).bind("mouseleave focusout", function(){
			$(".snsBtnIcon").css({"transform":"scale(1)"});
			$(".snsBtnArea").stop().slideUp(300);
			//sns버튼이 slideDown될 때, 로그인한 상태에만 보이는 로그아웃 버튼이 희미해져야함
			$(".logoutBtn").css({"display":"block","zIndex":"3"});
			//sns버튼이 slideUp될 때, welcomeMan(환영문구,로그아웃버튼) 원상복구
			$(".welcomeMan").stop().animate({"right":"3%"},400,"linear");
		});
	});

	// GNB 버튼 마우스 호버 반응
	$(function(){
		$("#navBtn").bind("mouseover focusin",function(){
			$(".arrowBtn").css({"left":"25px"});
			$(".bar2").css({"width":"35px"});
			$(".bar1, .bar3").css({"width":"20px"});
		}).bind("mouseout focusout",function(){
			$(".arrowBtn").css({"left":"-25px"});
			$(".bar2").css({"width":"30px"});
			$(".bar1, .bar3").css({"width":"30px"});
		});
	});

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

// 서브페이지 경로 영역
	$(function(){
		$(".pageRoute li").bind("click mouseenter",function(){
			$(this).stop().children("ul").slideDown(500);
		}).bind("click mouseleave",function(){
			$(this).stop().children("ul").slideUp(500);
		});
		$(".pageRoute li ul li").mouseover(function(){
			$(this).css("backgroundColor","#ccc");
		}).mouseleave(function(){
			$(this).css("backgroundColor","#fff");
		});
	});

	function enterNotice(){
		history.back;
		alert("사업자로 승인된 고객만 입장이 가능합니다.");
		parent.location.replace("index.php")


	}