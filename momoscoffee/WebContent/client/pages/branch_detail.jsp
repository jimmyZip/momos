<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/plugin/plugin/bxslider/jquery.bxslider.css" />
	<link rel="stylesheet" type="text/css" href="/asset/css/client/branch_detail.css" />
	<script type="text/javascript" src="/asset/plugin/plugin/bxslider/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=pg5xr50eua"></script>
	<script type="text/javascript" src="/asset/js/client/branch_detail.js"></script>
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
						<c:forEach var="allB" items="${allBranchList }">
							<!-- 현재 보는 지점 상세페이지가 아닌 다른 상세페이지만 나오도록 -->
							<c:if test="${allB.branch_id!=branch.branch_id}">							
								<li><a href="javascript:void(0)" onClick="goBranchDetail(${allB.branch_id})" title="${allB.branch_name}">${allB.branch_name}</a></li>
							</c:if>
						</c:forEach>
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
			<!--◁ info, store_content ▷-->
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
							<h4 class="infoMsg">지하철역 이름이나 버스정류장 이름을 클릭해서 지도위치를 보실 수 있습니다.</h4>
							<div id="transResultList">
								<dl id="subwayResult">
							      <dt>주변 지하철</dt>
							      <dd id="nearSubway">
							        <ul id="nearSubwayInner"></ul>
							      </dd>
							    </dl>
							    <dl id="busResult">
							      <dt>주변 버스</dt>
							      <dd id="nearBus">
							        <ul id="nearBusInner"></ul>
							      </dd>
							    </dl>
							</div>
						</div>
					</div>
					<p id="goBackBtn">
						<button onClick="prevPage()">지점목록 페이지로 돌아가기</button>
					</p>
				</article>
			</section><!--◁ content ▷-->
		</div><!--◀ container ▶-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>