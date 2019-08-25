<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/client/location.css"/>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=pg5xr50eua"></script>
	<script type="text/javascript" src="/asset/js/client/location.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="sub1-4_container">
			<ul class="pageRoute">
				<li><span>ABOUT</span></li>
				<li>
					<a href="/pages/sub1_4.jsp" title="LOCATION">LOCATION &nbsp;▼</a>
					<%@include file="/include/client/philo_sub_nav.jsp" %>
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
				<c:forEach var="branch" items="${branchList}">
					<article class="location_shop1">
						<h3 class="hidden">${branch.branch_name}</h3>
						<a class="location_shop1Img" href="#none" onClick="goBranchDetail(${branch.branch_id})" title="${branch.branch_name} 정보">
							<p class="location_imgArea">
								<img src="/data/${branch.branchImage[0].branch_img}" alt="${branch.branch_name }전경"/>
								<!-- <img src="/asset/img/sub1_4/location0.jpg" alt="온천장점 전경"/> -->
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
									<p>${branch.branch_name}</p>
									<div>
										<address>${branch.branch_addr }</address>
										<a href="#none" title="지도로 위치 확인하기" onClick="showMapURL(${branch.longi},${branch.lati})">지도로 위치 확인하기
											<span><img src="/asset/img/sub1_4/mapIcon1.png" alt="맵 아이콘"/></span>
										</a>
									</div>
								</div>
								<div class="location_date2">
									<span>전화번호 : ${branch.branch_tel}</span>
									<span>매일 ${branch.open_h} ~ ${branch_close_h} 연중무휴  (마지막 주문시간 : ${branch.last_order})</span>
								</div>
							</div>
						</div>
					</article>
				</c:forEach>
			</section>
		</div><!--◁ content ▷-->
		<div id="full"></div>
		<div id="map"></div>
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>