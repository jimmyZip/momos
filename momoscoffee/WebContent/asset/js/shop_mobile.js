	$(function(){
		// shop 모바일버전
		$("#shopMobileBtn ul li:eq(0)").addClass("addBtn");
		width = $("#shopScreen").width();
		$("#shopMobileBtn ul li").click(function(){
			var btnIndex = $(this).index();
			width = $("#shopScreen").width();
			$("#shopMobileBtn ul li").removeClass();
			$("#shopMobileBtn ul li:eq("+btnIndex+")").addClass("addBtn");
			for(var i=0; i<width; i++){
				if(btnIndex== i ){
					$("#shopFilm").animate({"marginLeft":"-"+width*btnIndex+"px"},500);
				}
			}
		});
	});