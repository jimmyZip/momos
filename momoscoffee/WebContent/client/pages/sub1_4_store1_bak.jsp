<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="sub1-4-1_container sub1-4-store">
			<ul class="pageRoute">
				<li class="route_before"><span>ABOUT</span></li>
				<li class="route_before"><span>LOCATION</span></li>
				<li class="route_here">
					<a href="/pages/sub1_4_store1.jsp" title="store_ONCHEON">온천장점 &nbsp;▼</a>
					<ul>
						<li><a href="/pages/sub1_4_store1.jsp" title="store_ONCHEON">온천장점</a></li>
						<li><a href="/pages/sub1_4_store2.jsp" title="store_CENTUM">센텀점</a></li>
					</ul>
				</li>
			</ul><!--◁ 페이지 경로 ▷-->
			<section class="store_visualWrap store1Visual">
				<h2 class="hidden">온천장매장 이미지 영역</h2>
				<p class="store_visualText">
					<strong>온천장점</strong><br/>
					<span>전통한옥과 아름다운 정원의 조화</span>
				</p>
			</section><!--◁ visual ▷-->
	
			<script type="text/javascript" src="/asset/plugin/bxslider/jquery.bxslider.min.js"></script>
			<link rel="stylesheet" type="text/css" href="/asset/plugin/bxslider/jquery.bxslider.css" />
			<script type="text/javascript">
			  $(document).ready(function() {
				$(".bxslider").bxSlider();
			  });
			</script>
			<section class="store_content">
				<h2 class="hidden">모모스커피 온천장점 매장정보</h2>
				<ul class="bxslider">
					<li><img src="/asset/img/sub1_4_a/garden0.jpg" alt="온천점 사진1"/></li>
					<li><img src="/asset/img/sub1_4_a/garden1.jpg" alt="온천점 사진2"/></li>
					<li><img src="/asset/img/sub1_4_a/garden2.jpg" alt="온천점 사진3"/></li>
					<li><img src="/asset/img/sub1_4_a/garden3.jpg" alt="온천점 사진4"/></li>
					<li><img src="/asset/img/sub1_4_a/garden4.jpg" alt="온천점 사진5"/></li>
				</ul>
				<div class="store_addr">
					<p><em>주소 : </em><span>부산광역시 금정구 오시게로 18-1(부곡동)</span></p>
					<p><em>전화번호 : </em><a href="tel:051-512-7036" title="온천장점 전화번호">051) 512-7036</a></p>
					<p><em>영업시간 : </em><span>08:00 ~ 23:00</span></p>
					<p><em>마지막 주문 : </em><span>22:00</span></p>
				</div>
				<article class="store_direct">
					<h3>지점 오시는 길</h3>
					<div class="store1_map store_map"></div>
					<div class="store_transit">
						<p>
							<em>지하철 :</em><span>부산 1호선 온천장역 4번 출구</span>
						</p>
						<p>
							<em>버 스 :</em><span>온천장역 (8, 11, 12, 16, 144, 183, 1008, 1200, 1300, 1500)</span>
						</p>
					</div>
				</article>
			</section><!--◁ content ▷-->
		</div><!--◀ container ▶-->

		<script src="/asset/js/gmaps.js"></script>
		<script src="http://maps.google.com/maps/api/js"></script>
		<script type="text/javascript">
			var map=null;
			var lat=35.2191997;
			var lng=129.08635630000003;
			
			$(function(){
				map = new GMaps({"el":".store1_map","lat":lat,"lng":lng});
				map.addMarker({
				  lat: 35.2191997,
				  lng: 129.08635630000003,
				  title: '모모스커피 온천장점',
					infoWindow: {
					  content: '<p>모모스커피 온천장점</p>'
					}
				});
			});	
		</script><!--◀ google map 스크립트▶-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>