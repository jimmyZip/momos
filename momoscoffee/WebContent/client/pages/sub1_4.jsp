<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
	<div class="sub1-4_container">
		<ul class="pageRoute">
			<li><span>ABOUT</span></li>
			<li>
				<a href="/pages/sub1_4.jsp" title="LOCATION">LOCATION &nbsp;▼</a>
				<ul>
					<li><a href="/pages/sub1_1.jsp" title="PHILOSOPHY">PHILOSOPHY</a></li>
					<li><a href="/pages/sub1_2.jsp" title="HISTORY">HISTORY</a></li>
					<li><a href="/pages/sub1_3.jsp" title="PEOPLE">PEOPLE</a></li>
					<li><a href="/pages/sub1_4.jsp" title="LOCATION">LOCATION</a></li>
					<li><a href="/pages/sub1_5.jsp" title="OUTREACH">OUTREACH</a></li>
				</ul>
			</li>
		</ul><!--◁ 페이지 경로 ▷-->
		<div class="location_visualWrap">
			<h2 class="hidden">서브 이미지 영역</h2>
			<p class="location_visualText">
				<strong>LOCATION</strong><br/>
				<span>모모스로 떠나는 즐거운 여정</span>
			</p>
		</div><!--◁ visual ▷-->
		<section class="location_content">
			<h2 class="hidden">모모스 매장안내</h2>
			<article class="location_shop1">
				<h3 class="hidden">온천장점</h3>
				<a class="location_shop1Img" href="/pages/sub1_4_store1.jsp" title="온천장점 정보">
					<p class="location_imgArea">
						<img src="/asset/img/sub1_4/location0.jpg" alt="온천장점 전경"/>
					</p>
					<p class="location_bg"></p>
				</a>
				<div class="location_dateBoxWrap">
					<div class="location_dateBox">
						<p class="location_title">
							<span>위치</span>
							<span>주소</span>
						</p>
						<div class="location_date1">
							<p>온천장점</p>
							<div>
								<address>부산광역시 금정구<br/>오시게로 18-1 (부곡동)</address>
								<a href="#none" title="지도로 위치 확인하기">지도로 위치 확인하기
									<span><img src="/asset/img/sub1_4/mapIcon1.png" alt="맵 아이콘"/></span>
								</a>
							</div>
						</div>
						<div class="location_date2">
							<span>전화번호 : 051) 512-7036</span>
							<span>매일 09:00 ~ 22:00 연중무휴  (마지막 주문시간 : pm 09:30)</span>
						</div>
					</div>
				</div>
			</article>
			<article class="location_shop2">
				<h3 class="hidden">센텀시티점</h3>
				<a class="location_shop2Img" href="/pages/sub1_4_store2.jsp" title="센텀시티점 정보">
					<p class="location_imgArea">
						<img src="/asset/img/sub1_4/location1.jpg" alt="센텀시티점 전경"/>
					</p>
					<p class="location_bg"></p>
				</a>
				<div class="location_dateBoxWrap">
					<div class="location_dateBox">
						<p class="location_title">
							<span>위치</span>
							<span>주소</span>
						</p>
						<div class="location_date1">
							<p>센텀시티점</p>
							<div>
								<address>부산광역시 해운대구<br/>센텀4로 15 1F (우동)</address>
								<a href="#none" title="지도로 위치 확인하기">지도로 위치 확인하기
									<span><img src="/asset/img/sub1_4/mapIcon1.png" alt="맵 아이콘"/></span>
								</a>
							</div>
						</div>
						<div class="location_date2">
							<span>전화번호 : 051) 745-1427</span>
							<span>매일 10:00 ~ 22:00 연중무휴  (마지막 주문시간 : pm 09:30)</span>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div><!--◁ content ▷-->
<%@include file="/include/footer.jsp"%>