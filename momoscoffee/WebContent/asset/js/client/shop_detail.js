/**
 * 클라이언트 제품 상세페이지 스크립트
 */
//제품 상세페이지 탭베이직 영역
$(function(){
	//탭 버튼
	$(".detail_panelList:not(:first)").hide();
	$(".detail_tab li a").bind("click focusin", function(){
		$(".detail_panelList").hide();
		$($(this).attr("href")).show();
		$(".detail_tab li a").removeClass();
		$(this).addClass("detail_selected");
		var detail_tabArea = $(".detail_tabArea").offset().top;
		$("html, body").animate({scrollTop:detail_tabArea},500);
	});
	
});
