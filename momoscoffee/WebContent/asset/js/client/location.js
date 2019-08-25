/**
 * client side location subpage 기능관련
 */
$(function(){
	//모달창 숨겨놓기
	$("#full,#map").hide();
	
	$("#full").click(function(){
		$("#full,#map").hide();
	});
});

//지도로 위치 확인하기 클릭이벤트
//1. 모달창에 해당 좌표로 지도출력
//2. 모달 띄우기
function showMapURL(longi,lati){
	console.log("전달받은 longi 확인 : "+longi);
	console.log("전달받은 lati 확인 : "+lati);
	
	/*
	 	//basic
	 	var mapOptions = {
	    	center: new naver.maps.LatLng(lati, longi),
	    	zoom: 12
		};
		var map = new naver.maps.Map('map', mapOptions);
	*/
	var position = new naver.maps.LatLng(lati,longi);
	var map = new naver.maps.Map('map',{
		center: position,
		zoom:12
	});
	
	var contentString=[
		'<div class="iw_inner">',
		'<img src="/asset/img/logo.png" width="90" height="61" alt="모모스커피" class="thumb"/>',
		'</div>'
	].join('');
	
	var marker = new naver.maps.Marker({
		map:map,
		position:position
	});
	var infowindow = new naver.maps.InfoWindow({
		content:contentString
	});
	
	naver.maps.Event.addListener(marker,'click',function(e){
		if(infowindow.getMap()){
			infowindow.close();
		}else{
			infowindow.open(map,marker);
		}
	});
	
	
	//모달 팝
	$("#full, #map").show();
	
	//a태그 멈추기
	return false;
}

//지점 상세페이지로 이동
function goBranchDetail(branch_id){
	location.href="/client/goLocation/"+branch_id;
}