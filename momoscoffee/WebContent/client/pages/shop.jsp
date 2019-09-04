<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/client/shop.css"/>
	<script type="text/javascript" src="/asset/js/client/shop.js"></script>
	</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="showAll_container">
			<ul class="pageRoute">
				<li><a href="/" title="메인 홈">HOME</span></li>
				<li>
					<a href="#none" title="SHOP">SHOP &nbsp;▼</a>
					<!-- <ul>
						<li><a href="/pages/sub2_1.jsp" title="GOODs">GOODs</a></li>
						<li><a href="/pages/sub2_2.jsp" title="GREEN BEAN">GREEN BEAN</a></li>
					</ul> -->
				</li>
			</ul><!--◁ 페이지 경로 ▷-->
			<div class="showAll_visualWrap">
				<h2 class="hidden">온라인 샵</h2>
				<p class="showAll_visualText">
					<strong>SHOP</strong><br/>
					<span>좋은 재료, 맛있는 커피</span>
				</p>
			</div><!--◁ visual ▷-->
			<section class="showAll_content">
				<h2 class="hidden">모모스 상품</h2>
				<div class="showAll_banner">
					<h4>추천 상품</h4>
					<ul>
						<li>
							<a href="#none" title="배너_커피" onClick="preparing()">
								<img src="/asset/img/sub2_1/banner1.jpg" alt="커피 배너이미지" />
								<p class="textArea">
									<span>COFFEE</span><br/>
									<em>콜롬비아 카우카 베스트컵 8위 라 팔마</em>
									<span><img src="/asset/img/sub2_1/arrow.png" alt="화살표"/></span>
								</p>
							</a>
						</li>
						<li>
							<a href="#none" title="모모스 텀블러" onClick="preparing()">
								<img src="/asset/img/sub2_1/banner2.jpg" alt="모모스 텀블러 이미지" />
								<p class="textArea">
									<span>GIFT SET</span><br/>
									<em>모모스 텀블러</em>
									<span><img src="/asset/img/sub2_1/arrow.png" alt="화살표"/></span>
								</p>
							</a>
						</li>
						<li>
							<a href="#none" title="모모스 드립백" onClick="preparing()">
								<img src="/asset/img/sub2_1/banner3.jpg" alt="모모스 드립백 이미지" />
								<p class="textArea">
									<span>GIFT SET</span><br/>
									<em>모모스 드립백</em>
									<span><img src="/asset/img/sub2_1/arrow.png" alt="화살표"/></span>
								</p>
							</a>
						</li>
					</ul>
				</div>
				<div class="showAll_goodsWrap">
					<h4>모든 상품</h4>
					<div class="goods_btnArea">
						<ul>
							<li><a class="goods_selected" href="#none" title="전체보기 버튼" onClick="showAllGoods()">전체</a></li>
							<c:forEach var="topcategory" items="${topcateList}">
								<!-- 
								<li><a href="#none" title="커피 버튼">커피</a></li>
								<li><a href="#none" title="선물용 버튼">선물용</a></li>
								<li><a href="#none" title="드립도구 버튼">드립도구</a></li> 
								-->
								<li><a href="#none" title="${topcategory.topcate_name} 버튼" onClick="categoryView(${topcategory.topcategory_id})">${topcategory.topcate_name }</a></li>
							</c:forEach>
						</ul>
					</div>
					<ul class="goods_list">
						<!-- goods_list 1단위 시작 :: 공통으로 빼지 못한부분-->
						<li class="showAll_goods showAll_goods1 goodsType1 goodsType0">
							<a href="#none" title="weekly market" onClick="preparing()">
								<p>
									<img src="/asset/img/goods_img/goods1.jpg" alt="위클리 마켓 이미지"/>
									<span class="feel_review">
										<b>"</b><br/>부드럽고 다양한<br/>산미를 느껴보세요.<br/><i>momos manager</i>
									</span>
								</p>
								<p>위클리마켓 (7월 5일 일괄배송)</p>
							</a>
							<div>
								<p class="goods_desc">홈바리스타를 위한 합리적인 마켓</p>
								<p class="goods_price">16,500<span class="gray">원</span></p>
							</div>
						</li>
						<!-- goods_list 1단위 끝 :: 공통으로 빼지 못한부분-->
						<li class="showAll_goods showAll_goods2 goodsType1 goodsType0">
							<a href="#none" title="10주년 기념 클래식 브랜드" onClick="preparing()">
								<p>
									<img src="/asset/img/goods_img/goods2.jpg" alt="10주년 기념커피 이미지"/>
									<span class="feel_review">
										<b>"</b><br/>2007년의 크래식한<br/>커피를 재연하다.<br/><i>momos rara</i>
									</span>
								</p>
								<p>10주는 기념 클래식 브랜드</p>
							</a>
							<div>
								<p class="goods_desc">다크 초콜렛, 크리미, 버터스윗, 긴 여운</p>
								<p class="goods_price">12,000<span class="gray">원</span></p>
							</div>
						</li>
						<!-- goods_list 1단위 끝-->
						<c:set var="curPos" value="${pager.curPos }"/>
						<c:forEach var="product" items="${prodList}" begin="${pager.curPos }" end="${pager.curPos+pager.pageSize-1}">
							<!-- goods_list 공통화 시킨 부분 -->
							<li class="showAll_goods showAll_goods3 goodsType1 goodsType0">
								<a href="/client/goGoodsDetail/${product.product_id }" title="${product.prod_name_kor }">
									<p>
										<img src="/data/${product.productImage[0].prod_img }" alt="${product.prod_name_kor } 이미지"/>
										<span class="feel_review">
											<!-- <b>"</b><br/>부드러운 촉감과<br/>완벽한 밸런스<br/><i>momos jay</i> -->
											<b>"</b><br />리뷰 준비중<i>momos</i>
										</span>
									</p>
									<p>${product.prod_name_kor }</p>
								</a>
								<div>
									<p class="goods_desc">${product.prod_desc }</p>
									<p class="goods_price">${product.price }<span class="gray">원</span></p>
								</div>
							</li>
							<!-- goods_list 1단위 끝-->
						</c:forEach>
					</ul>
					<!-- paging btn start -->
					<div class="page cl">
				    	<!-- 이전 블럭 -->
						<c:if test="${pager.firstPage-1>0} }">
							<a href="/client/goGoods/page?currentPage=${pager.firstPage-1}">prev</a>
						</c:if>
						<c:if test="${pager.firstPage-1<=0}">
							<a href="javascript:alert('첫페이지 입니다.')">prev</a>
						</c:if>
						<!-- 페이지 표시 -->
						<c:forEach var="i" begin="${pager.firstPage}" end="${pager.lastPage}">
							<c:if test="${i<=pager.totalPage}">
								<a class="cnt" href="/client/goGoods/page?currentPage=${i}">${i}</a>
							</c:if>
						</c:forEach>
						<!-- 다음 블럭 -->
						<c:if test="${pager.lastPage+1<pager.totalPage}">
							<a href="/client/goGoods/page?currentPage=${pager.lastPage+1}">next</a>
						</c:if>
						<c:if test="${pager.lastPage+1>=pager.totalPage }">
							<a href="javascript:alert('마지막 페이지입니다.')">next</a>
						</c:if>
				    </div>
					<!-- paging btn end -->
				</div>
			</section>
		</div><!-- container -->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>