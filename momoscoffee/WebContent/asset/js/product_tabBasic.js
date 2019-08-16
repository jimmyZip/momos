	jQuery(document).ready(function(){
		$(".panel_list:not(:first)").hide();

		$(".tab li a").bind("click focusin", function(){
			$(".panel_list").hide();
			$($(this).attr("href")).show();
			$(".tab li a").removeClass();
			$(this).addClass("selected");
		});
	});