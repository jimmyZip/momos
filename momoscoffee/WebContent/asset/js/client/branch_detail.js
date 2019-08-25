/**
 * client side branch_detail.jsp 관련 기능
 */
$(function(){
	//페이지 로딩 될 때 지도 출력
	showMap();
	
	//bxSlider 이미지 전환 모드 변경
	$(".bxslider").bxSlider({
		adaptiveHeight: true,
		mode:'fade'
	});
});

//지도 출력
function showMap(){
	//지도좌표 얻기
	var lati = document.getElementById("hiddenLati").value;
	var longi = document.getElementById("hiddenLongi").value;
	//console.log("lati확인 : "+lati);
	//console.log("longi확인 : "+longi);
	//지도 센터포지션 설정
	var position = new naver.maps.LatLng(lati,longi);
	//지도생성
	var map = new naver.maps.Map('map',{
		center:position,
		zoom:11
	});
	
	//마커 클릭 시 등장정보 설정
	var contentString=[
		'<div class="iw_inner">',
		'<img src="/asset/img/logo.png" width="90" height="61" alt="모모스커피" class="thumb"/>',
		'</div>'
	].join('');
	
	//마커 설정
	var marker = new naver.maps.Marker({
		map:map,
		position:position
	});
	
	//정보창
	var infowindow = new naver.maps.InfoWindow({
		content:contentString
	});
	
	//마커 클릭이벤트
	naver.maps.Event.addListener(marker,'click',function(e){
		if(infowindow.getMap()){
			infowindow.close();
		}else{
			infowindow.open(map,marker);
		}
	});
}

//api 컨트롤러에 좌표 주변 정류장, 지하철역, 노선 정보 요청
/*
function getPubTransInfo(lati,longi){
	console.log("넘겨받은 lati확인 : "+lati);
	console.log("넘겨받은 lati 자료형 확인 : "+typeof(lati));//number
	console.log("넘겨받은 longi 확인 : "+longi);
	console.log("넘겨받은 longi 자료형 확인 : "+typeof(longi));//number
	var latitude = parseFloat(lati);
	latitude = latitude.toFixed(7);
	console.log("소수점 고정 후 확인한 latitude: "+latitude);
	console.log("소수점 고정 후 확인한 latitude: "+latitude);
	var longitude = parseFloat(longi);
	longitude = longitude.toFixed(7);
	console.log("소수점 고정 후 확인한 longitude: "+longitude);
	
	var latlongArray = new Array();
	latlongArray.push(lati);
	latlongArray.push(longi);


	$.ajax({
		url:"/api/transinfo/"+latitude+"/"+longitude,
		type:"get",
		success:function(data){
			console.log("서버로 부터 넘어온 data : "+data);
		}
	});
}*/

/*
function getPubTransInfo(){
	var lati = document.getElementById("hiddenLati").value;
	var longi = document.getElementById("hiddenLongi").value;
	console.log(lati);
	console.log(longi);
	var xhr = new XMLHttpRequest();
	var url = "https://api.odsay.com/v1/api/pointBusStation?x="+longi+"&y="+lati+"&apiKey=kWAnYhK47E4KTOdcP1N3bg";
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log( xhr.responseText ); // <- xhr.responseText 로 결과를 가져올 수 있음
		}
	}
}
*/