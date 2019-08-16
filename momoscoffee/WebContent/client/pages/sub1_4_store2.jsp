<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
	<div class="sub1-4-2_container sub1-4-store">
		<ul class="pageRoute">
			<li class="route_before"><span>ABOUT</span></li>
			<li class="route_before"><span>LOCATION</span></li>
			<li class="route_here">
				<a href="/pages/sub1_4_store1.jsp" title="store_ONCHEON">센텀점 &nbsp;▼</a>
				<ul>
					<li><a href="/pages/sub1_4_store1.jsp" title="store_ONCHEON">온천장점</a></li>
					<li><a href="/pages/sub1_4_store2.jsp" title="store_CENTUM">센텀점</a></li>
				</ul>
			</li>
		</ul><!--◁ 페이지 경로 ▷-->
		<section class="store_visualWrap store2Visual">
			<h2 class="hidden">센텀매장 이미지 영역</h2>
			<p class="store_visualText">
				<strong>센텀점</strong><br/>
				<span>클래식한 멋과 품격있는 맛</span>
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
			<ul class="bxslider">
				<li><img src="/asset/img/sub1_4_b/mall1.jpg" alt="센텀몰 사진1"/></li>
				<li><img src="/asset/img/sub1_4_b/mall2.jpg" alt="센텀몰 사진2"/></li>
				<li><img src="/asset/img/sub1_4_b/mall3.jpg" alt="센텀몰 사진3"/></li>
				<li><img src="/asset/img/sub1_4_b/mall4.jpg" alt="센텀몰 사진4"/></li>
				<li><img src="/asset/img/sub1_4_b/mall5.jpg" alt="센텀몰 사진5"/></li>
			</ul>
			<h2 class="hidden">모모스커피 센텀시티점 매장정보</h2>
			<div class="store_addr">
				<p><em>주소 : </em><span>부산 해운대구 센텀4로 15 1F</span></p>
				<p><em>전화번호 : </em><a href="tel:051-745-1427" title="온천장점 전화번호">051) 745-1427</a></p>
				<p><em>영업시간 : </em><span>08:00 ~ 23:00</span></p>
				<p><em>마지막 주문 : </em><span>22:00</span></p>
			</div>
			<article class="store_direct">
				<h3>지점 오시는 길</h3>
				<div class="store2_map store_map"></div>
				<div class="store_transit">
					<p>
						<em>지하철 :</em><span>부산 2호선 센텀시티역(BEXCO, 신세계) 12번 출구</span>
					</p>
					<p>
						<em>버 스 : </em><span>신세계센텀시티 (5-1, 39, 40, 63, 141, 155),<br/>롯데백화점센텀시티점 (115,181,307)<br/>센텀시티4번출구, 센텀벤처타운사거리(해운대구3-1, 해운대구3-2)</span>
					</p>
				</div>
			</article>
		</section><!--◁ content ▷-->
	</div><!--◀ container ▶-->

	<script src="/asset/js/gmaps.js"></script>
	<script src="http://maps.google.com/maps/api/js"></script>
	<script type="text/javascript">
		var map=null;
		var lat=35.1698635;
		var lng=129.12827189999996;
		
		$(function(){
			map = new GMaps({"el":".store2_map","lat":lat,"lng":lng});
			map.addMarker({
			  lat: 35.1698635,
			  lng: 129.12827189999996,
			  title: '모모스커피 센텀점',
				infoWindow: {
				  content: '<p>모모스커피 센텀점</p>'
				}
			});
		});	
	</script><!--◀ google map script▶-->
<%@include file="/include/footer.jsp"%>