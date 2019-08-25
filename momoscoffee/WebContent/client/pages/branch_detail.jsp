<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/plugin/plugin/bxslider/jquery.bxslider.css" />
	<script type="text/javascript" src="/asset/plugin/plugin/bxslider/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=pg5xr50eua"></script>
	<script type="text/javascript" src="/asset/js/client/branch_detail.js"></script>
	<style type="text/css">
		/*bxSlider 이미지 너비 설정*/
		.bxslider li img{
			width:100% !important;
		}
		/*bxSlider pager 색상변경 및 hover효과*/
		.bx-wrapper .bx-pager.bx-default-pager a{
			background-color:#fff !important;
		}
		.bx-wrapper .bx-pager.bx-default-pager a:hover, 
		.bx-wrapper .bx-pager.bx-default-pager a.active, 
		.bx-wrapper .bx-pager.bx-default-pager a:focus{
			background-color:#1bbc9b !important;
		}
		
		/*주변교통정보보기 버튼*/
		#showTransBtn{
			display:block;
			width:200px;
			margin:0 auto;
			padding:.5em .8em;
			border:none;
			border:1px solid #ccc;
			color:#ccc;
			background-color:transparent;
			font-weight:900;
			margin-bottom:1.5rem;
			outline:0;
			transition:.3s all;
			cursor:pointer;
		}
		#showTransBtn:hover,#showTransBtn:focus{
			background-color:#ccc;
			color:#223d4b;
		}
	</style>
	<script type="text/javascript">
		function getPubTransInfo(){
			alert(1);
			var lati = encodeURIComponent(parseFloat(document.getElementById("hiddenLati").value));
			var longi = encodeURIComponent(parseFloat(document.getElementById("hiddenLongi").value));
			//var lati = document.getElementById("hiddenLati").value;
			//var longi = document.getElementById("hiddenLongi").value;
			console.log(lati);
			console.log(longi);
			var xhr = new XMLHttpRequest();
			var url = "https://api.odsay.com/v1/api/pointBusStation?x="+longi+"&y="+lati+"&apiKey={kWAnYhK47E4KTOdcP1N3bg}";
			url=encodeURI(url);
			xhr.open("GET", url, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				alert(2);
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log( xhr.responseText ); // <- xhr.responseText 로 결과를 가져올 수 있음
				}
			}
		}
	</script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<c:set var="branch" value="${branch_info}"/>
		
		<div class="sub1-4-1_container sub1-4-store">
			<ul class="pageRoute">
				<li class="route_before"><span>ABOUT</span></li>
				<li class="route_before"><span>LOCATION</span></li>
				<li class="route_here">
					<a href="/pages/sub1_4_store1.jsp" title="store_ONCHEON">${branch.branch_name} &nbsp;▼</a>
					<ul>
						<li><a href="/pages/sub1_4_store1.jsp" title="store_ONCHEON">온천장점</a></li>
						<li><a href="/pages/sub1_4_store2.jsp" title="store_CENTUM">센텀점</a></li>
					</ul>
				</li>
			</ul><!--◁ 페이지 경로 ▷-->
			<section class="store_visualWrap store1Visual">
				<h2 class="hidden">${branch.branch_name } 이미지 영역</h2>
				<p class="store_visualText">
					<strong>${branch.branch_name }</strong><br/>
					<span>${branch.message}</span>
				</p>
			</section><!--◁ visual ▷-->
			<section class="store_content">
				<h2 class="hidden">모모스커피 ${branch.branch_name } 매장정보</h2>
				<c:set var="i" value="1"/>
				<!-- bxSlider이미지 -->
				<ul class="bxslider">
					<c:forEach var="branch_img" items="${branch.branchImage}">				
						<li><img src="/data/${branch_img.branch_img }" alt="온천점 사진${i}"/></li>
						<c:set var="i" value="${i+1}"/>
					</c:forEach>
				</ul>
				<!-- bxSlider이미지 -->
				<div class="store_addr">
					<p><em>주소 : </em><span>${branch.branch_addr }</span></p>
					<p><em>전화번호 : </em><a href="tel:${branch.branch_tel}" title="${branch.branch_name} 전화번호">051) 512-7036</a></p>
					<c:set var="open_h" value="${branch.open_h }"/>
					<c:set var="close_h" value="${branch.close_h }"/>
					<c:set var="last_order" value="${branch.last_order }"/>
					<p><em>영업시간 : </em><span>${fn:substring(open_h,0,5) } ~ ${fn:substring(close_h,0,5) }</span></p>
					<p><em>마지막 주문 : </em><span>${fn:substring(last_order,0,5) }</span></p>
					<input id="hiddenLati" type="hidden" name="lati" value="${branch.lati }"/>
					<input id="hiddenLongi" type="hidden" name="longi" value="${branch.longi }"/>
				</div>
				<article class="store_direct">
					<h3>지점 오시는 길</h3>
					<div class="store_map" id="map"></div>
					<div class="store_transit">
						<%-- <button id="showTransBtn" onClick="getPubTransInfo(${branch.lati},${branch.longi})">주변 대중교통정보 보기</button> --%>
						<button id="showTransBtn" onClick="getPubTransInfo()">주변 대중교통정보 보기</button>
						<div id="nearbyTransResult">
							<!-- 
							<p>
								<em>지하철 :</em><span>부산 1호선 온천장역 4번 출구</span>
							</p>
							<p>
								<em>버 스 :</em><span>온천장역 (8, 11, 12, 16, 144, 183, 1008, 1200, 1300, 1500)</span>
							</p>
							 -->
						</div>
					</div>
				</article>
			</section><!--◁ content ▷-->
		</div><!--◀ container ▶-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>