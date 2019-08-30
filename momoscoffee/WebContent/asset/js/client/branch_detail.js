/**
 * client side branch_detail.jsp 관련 기능
 */
$(function() {
	// 페이지 로딩 될 때 지도 출력
	showMap();

	// bxSlider 이미지 전환 모드 변경
	$(".bxslider").bxSlider({
		adaptiveHeight : true,
		mode : 'fade'
	});
	
	$("#nearbyTransResult").hide();
});

// 버스타입 매칭
var busTypeJson = {
	"1" : "일반",
	"2" : "좌석",
	"3" : "마을",
	"4" : "직행좌석",
	"5" : "공항",
	"6" : "간선급행",
	"10" : "외곽",
	"11" : "간선",
	"12" : "지선",
	"13" : "순환",
	"14" : "광역",
	"15" : "급행",
	"20" : "농어촌버스",
	"21" : "제주 시외형",
	"22" : "경기 시외형",
	"26" : "급행 간선"
}
//지도 변수 전역화
var position;
var map;//지도
var markers = [];//지도 위 마커들 담을 배열
var infoWindows = [];//마커 클릭 시 나올 정보창 담을 배열

// 지도 출력
function showMap() {
	// 지도좌표 얻기
	var lati = document.getElementById("hiddenLati").value;
	var longi = document.getElementById("hiddenLongi").value;
	// console.log("lati확인 : "+lati);
	// console.log("longi확인 : "+longi);
	// 지도 센터포지션 설정
	position = new naver.maps.LatLng(lati, longi);
	// 지도생성
	map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(lati, longi),
		zoom : 11
	});

	// 마커 클릭 시 등장정보 설정
	var contentString = [
			'<div class="iw_inner">',
			'<img src="/asset/img/logo.png" width="90" height="61" alt="모모스커피" class="thumb"/>',
			'</div>' ].join('');

	// 마커 설정
	var marker = new naver.maps.Marker({
		map : map,
		position : position
	});
	markers.push(marker);
	
	// 정보창
	var infoWindow = new naver.maps.InfoWindow({
		content : contentString
	});
	infoWindows.push(infoWindow);
	console.log("페이지 처음 마커 배열 길이 : "+markers.length);
	console.log("페이지 처음 info배열 길이 : "+infoWindows.length);

	// 마커 클릭이벤트::처음 페이지 로딩 때
	naver.maps.Event.addListener(marker, 'click', function(e) {
		if (infoWindow.getMap()) {
			infoWindow.close();
		} else {
			infoWindow.open(map, marker);
		}
	});
}

// 정보영역 감추고 있다가 버튼 누르면 펼치기
// api 컨트롤러에 좌표 주변 정류장, 지하철역, 노선 정보 요청
function getPubTransInfo() {
	//감추던 정보영역 펼치기
	$("#nearbyTransResult").show();
	
	//api에 정보요청
	var lati = encodeURIComponent(parseFloat(document
			.getElementById("hiddenLati").value));
	var longi = encodeURIComponent(parseFloat(document
			.getElementById("hiddenLongi").value));
	console.log(lati);
	console.log(longi);
	var xhr = new XMLHttpRequest();
	var url = "https://api.odsay.com/v1/api/pointBusStation?x=" + longi + "&y="
			+ lati + "&apiKey=kWAnYhK47E4KTOdcP1N3bg";
	console.log("encodedURI 확인 : " + url);
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			// json데이터가 넘어오는 것 확인
			//console.log(xhr.responseText);// xhr.responseText 로 결과를 가져올 수 있음
			//console.log("api결과 타입확인 : " + typeof (xhr.responseText));
			var resultObj = JSON.parse(xhr.responseText);
			//console.log("api결과 스트링을 jsonObj로 바꾼 결과 확인 : " + resultObj);
			renderTransData(resultObj);
		}
	}
}

function renderTransData(jsonArray) {
	console.log("render함수에서 확인하는 api리턴값 : " + jsonArray);
	var result = jsonArray.result;
	$("#nearBusInner").html("");
	$("#nearSubwayInner").html("");
	var busTag = "";
	var subwayTag = "";
	
	//주변 대중교통 정보 출력
	for (var a = 0; a < result.lane.length; a++) {
		if (result.lane[a].stationClass == 1) {// 버스노선이라면
			busTag += "<li class='list_row'>";
			busTag += "<div class='list_item'>";
			var stName = result.lane[a].stationName;
			busTag += "<a class='list_link' href='#none' onClick=\"addMarker('"+result.lane[a].x+"','"+result.lane[a].y+"','"+stName+"')\">";
			busTag += "<span>" + result.lane[a].stationName + "</span><br/>";
			busTag += "</a>";
			for (var b = 0; b < result.lane[a].busList.length; b++) {
				busTag += "<b class='btype'>"
						+ busTypeJson[result.lane[a].busList[b].type] + "</b>";
				busTag += "<span>" + result.lane[a].busList[b].busNo
						+ "</span>&nbsp;";
			}
			busTag += "</div>";
			busTag += "</li>";
		} else if (result.lane[a].stationClass == 2) {// 지하철이라면
			subwayTag += "<li>";
			subwayTag += "<div class='list_item'>";
			var stName = result.lane[a].stationName;
			subwayTag +=  "<a class='list_link' href='#none' onClick=\"addMarker('"+result.lane[a].x+"','"+result.lane[a].y+"','"+stName+"')\">";
			subwayTag += "<span>"+result.lane[a].subwayLaneName+"</span><br/>";
			subwayTag += "<span>"+result.lane[a].stationName+"역</span>";
			subwayTag += "</a>";
			subwayTag += "</div>";
			subwayTag += "</li>";
		}
	}
	$("#nearBusInner").html(busTag);
	$("#nearSubwayInner").html(subwayTag);
}

//주변 대중교통 포인트명(지하철, 버스정류장명) 클릭 시 상단 지도에 marker추가
function addMarker(x,y,stName){
	alert("장소좌표 해당 마커를 지도에 추가합니다.");
	console.log("넘겨받은 x좌표 확인 : "+x);//x예시 :: 129.085515581321 :: 경도 :: longitude
	console.log("넘겨받은 y좌표 확인 : "+y);//y예시 :: 35.21909172941961 :: 위도 :: latitude
	console.log("넘겨받은 stationName확인 : "+stName);
	//맵은 먼저 불러놨으니 마커만 추가할 수 있도록 상단에 전역변수화 해놓음
	//추가 마커 설정
	var marker = new naver.maps.Marker({
		position : new naver.maps.LatLng(y,x),
		map : map
	});
	markers.push(marker);
	// 마커 클릭 시 등장정보 설정
	var contentString = [
			'<div class="iw_inner">',
			'<b>'+stName+'<b/>',
			'</div>' ].join('');
	
	//새로추가된 마커에 클릭이벤트 부여해서 역 이름이나 정류소 이름표시
	var infoWindow = new naver.maps.InfoWindow({
        content: contentString
    });
	
    infoWindows.push(infoWindow);
    console.log("마커배열 길이 : "+markers.length);
    console.log("info배열 길이 : "+infoWindows.length);
    //addEventHandler();
    
    //마커 클릭이벤트 연결
    //마커 클릭이벤트::처음 페이지 로딩 때
	naver.maps.Event.addListener(marker, 'click', function(e) {
		if (infoWindow.getMap()) {
			infoWindow.close();
		} else {
			infoWindow.open(map, marker);
		}
	});
}
/*
 * 이 코드블럭은 지도가 처음 불러질 때 동시에 생성된 여러 마커에
 * 이벤트 리스너를 연결하되, for loop의 속도차이로 마지막 index만 적용되는것을 방지하기 위해
 * closure방식으로 호출을 하는 예제코드이다.
 * 하지만, 나의 경우는 최초 1개의 마커 이후에 선택적인 좌표를 가지고 
 * 마커가 사후에 추가된 경우이기 때문에 마커추가함수 내부에
 * 개별적으로 이벤트 리스너를 부여하면 되므로 소용이 없었다.
 * 다만 나중에 보면 클로져를 쉽게 떠올리거나, 마커에 이벤트리스너 연결이 쉬울 것 같아 남겨둔다.
function addEventHandler(){
	for(var k=1;k<markers.length;k++){
    	naver.maps.Event.addListener(markers[k],'click',bindClick[k]);
    }
}
function bindClick(k){
	alert(1);
	console.log(k+"번째 마커가 클릭되었다!!");
	console.log("infoWindows길이 : "+infoWindows.length);
	console.log("markers의 길이 : "+markers.length);
	console.log(k);
	return function(e){
		var marker = markers[k];
		var infoWindow = infoWindows[k];
		
		if(infoWindow.getMap()){
			infoWindow.close();
		}else{
			infoWindow.open(map,marker);
		}
	}
}
*/

//페이지 상단 서브네비게이션 역할을 하는 페이지 루트에서 다른 상세페이지로 이동
function goBranchDetail(branch_id){
	location.href="/client/goLocation/"+branch_id;
}
//지점 목록으로 (사실상 이전 페이지로) 돌아가기
function prevPage(){
	window.history.back();
}