/**
 * client page 중 shop 메뉴 하위 상품페이지 스크립트
 */

$(function(){
	//카테고리별로 상품보기 버튼
	/*
	for(var i=0; i<4; i++){
		goods_panel(i);
	}
	function goods_panel(i){			
		$(".goods_btnArea ul li a:eq("+i+")").click(function(){
			$(".goods_list li").hide();
			$(".goodsType"+i).show();
			$(".goods_btnArea ul li a").removeClass();
			$(this).addClass("goods_selected");
			var showAll_goodsWrap = $(".showAll_goodsWrap").offset().top;
			$("html, body").animate({scrollTop:showAll_goodsWrap},500);
		})
	}
	*/
	
	//매니저 상품평 한줄 스크립트
	$(".feel_review").hide();
	$(".showAll_goods a p").bind("mouseover focus",function(){
		$(this).children(".feel_review").css({"display":"block"});
	}).bind("mouseleave focusout",function(){
		$(this).children(".feel_review").css({"display":"none"});
	});
});

//상세정보 준비중인 상품
function preparing(){
	alert("상세페이지를 준비중입니다. 불편을 드려 죄송합니다.");
	return;
}
				
//상품 전체보기
function showAllGoods(){
	location.href="/client/goGoods/page";
}
//상품 분류보기
function categoryView(topcategory_id){
	location.href="/client/goGoods/page/sort/"+topcategory_id;
}