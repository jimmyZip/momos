<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/client/shop.css"/>
	<script type="text/javascript" src="/asset/js/client/shop_detail.js"></script>
	</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
	<div class="detail_container">
		<ul class="pageRoute">
			<li><a href="/" title="메인 홈">HOME</span></li>
			<li class="route_before">
				<a href="/pages/sub2_1.jsp" title="SHOP">SHOP &nbsp;▼</a>
				<ul>
					<li><a href="/pages/sub2_1.jsp" title="GOODs">GOODs</a></li>
					<li><a href="/pages/sub2_2.jsp" title="GREEN BEAN">GREEN BEAN</a></li>
				</ul>
			</li>
			<li class="route_product"><span>weekly market</span></li>
		</ul><!-- 페이지 경로 -->
		<section class="detail_content goods001">
			<h2>
				위클리 마켓<br/>
				<small>홈 바리스타를 위한 합리적인 가격의 원두!</small>
			</h2>
			<div class="starArea">
				<form action="#" method="get">
					<label for="star5"><i class="material-icons">favorite</i></label>
					<input id="star5" type="radio" name="star5" class="star5 star" title="평점 별5"/>
					<label for="star4"><i class="material-icons">favorite</i></label>
					<input id="star4" type="radio" name="star4" class="star4 star" title="평점 별4"/>
					<label for="star3"><i class="material-icons">favorite</i></label>
					<input id="star3" type="radio" name="star3" class="star3 star" title="평점 별3"/>
					<label for="star2"><i class="material-icons">favorite</i></label>
					<input id="star2" type="radio" name="star2" class="star2 star" title="평점 별2"/>
					<label for="star1"><i class="material-icons">favorite</i></label>
					<input id="star1" type="radio" name="star1" class="star1 star" title="평점 별1"/>
				</form>
			</div>
			<p class="tagArea">
				<em>#밝고 풍부한 향</em><em>#굿밸런스</em><em>#클린함</em><em>#플로럴한 아로마</em>
			</p>
			<ul class="detail_slide">
				<li><img src="/asset/img/goods_img/goods001_img1.jpg" alt="상품 이미지1" /></li>
			</ul>
			<link rel="stylesheet" type="text/css" href="plugin/bxslider/jquery.bxslider.css" />
			<div class="detail_tabArea">
				<ul class="detail_tab">
					<li><a class="detail_selected" href="#tab0" title="상품안내">상품안내</a></li>
					<li><a href="#tab1" title="이용후기">이용후기</a></li>
					<li><a href="#tab2" title="배송안내">배송안내</a></li>
					<li><a href="#tab3" title="질문과 답변">질문과 답변</a></li>
				</ul>
				<c:set var="product" value="${product }"/>
				<ul class="detail_panel">
					<li id="tab0" class="detail_panelList product_info">
						<h3 class="hidden">상품안내</h3>
						<p class="desc_imgArea">
							<img src="/data/${product.productImage[0].prod_img}"/>
						</p>
						<p class="desc_textArea">
							<strong>Weekly Market</strong><br/>
								<span>${product.prod_name_eng }</span>
								<span class="detail_descText">${product.prod_desc}</span>
						</p>
						<div class="coffee_info">
							<h4><span>COFFEE INFORMATION</span></h4>
							<ol>
								<li class="single4">
									<p class="singleIcon">
										<img src="/asset/img/icons/regionIcon.png" alt="지역 아이콘" />
									</p>
									<p class="singleText">
										지역 /<br/><span class="singleGray">콜롬비아</span>
									</p>
								</li>
								<li class="single4">
									<p class="singleIcon"><img src="/asset/img/icons/farmIcon.png" alt="농장 아이콘"/></p>
									<p class="singleText">농장 /<br/><span class="singleGray">알제리아</span></p>
								</li>
								<li class="single4">
									<p class="singleIcon"><img src="/asset/img/icons/raceIcon.png" alt="품종 아이콘"/></p>
									<p class="singleText">품종 /<br/><span class="singleGray">카투라</span></p>
								</li>
								<li class="single4">
									<p class="singleIcon"><img src="/asset/img/icons/processIcon.png" alt="가공방식 아이콘"/></p>
									<p class="singleText">가공방식 /<br/><span class="singleGray">워시드</span></p>
								</li>
								<li class="singleFlovar">
									<p class="singleIcon"><img src="/asset/img/icons/flovarIcon.png" alt="향미 아이콘"/></p>
									<p class="singleText">
										향미 / 
										<span class="singleGray">
											다크 초콜릿의 달콤 쌉싸름한 단맛과 크리미한 촉감, 헤이즐넛의 긴 여운
										</span>
									</p>			
								</li>
							</ol>
						</div>
						<div class="brew_guide">
							<h4><span>BREW GUIDE</span></h4>
							<ul>
								<li>
									<span class="guideTitle">Espresso</span>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/scales.png" alt="저울 이미지"/></span>
										<span class="brewCont">18g</span>									
									</p>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/Thermometer.png" alt="온도계 이미지"/></span>
										<span class="brewCont">91~2℃</span>									
									</p>	
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/clock.png" alt="자명종 이미지"/></span>
										<span class="brewCont" style="font-size:13px;">28s ~ 31s (프리인퓨전 7s)</span>									
									</p>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/beaker.png" alt="비커 이미지"/></span>
										<span class="brewCont">65±5ml</span>									
									</p>
								</li>
								<li>
									<span class="guideTitle">Aeropress</span>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/scales.png" alt="저울 이미지"/></span>
										<span class="brewCont">15g</span>									
									</p>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/Thermometer.png" alt="온도계 이미지"/></span>
										<span class="brewCont">87˚C</span>									
									</p>	
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/clock.png" alt="자명종 이미지"/></span>
										<span class="brewCont" style="font-size:13px;">우려내기 40s, 프레스 20s</span>									
									</p>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/beaker.png" alt="비커 이미지"/></span>
										<span class="brewCont">220ml</span>									
									</p>
								</li>
								<li>
									<span class="guideTitle">Dutch Coffee</span>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/scales.png" alt="저울 이미지"/></span>
										<span class="brewCont">40g</span>									
									</p>
									<p>
										<span class="brewIcon"><img src="/asset/img/icons/beaker.png" alt="비커 이미지"/></span>
										<span class="brewCont">400ml</span>									
									</p>
								</li>
							</ul>
						</div>
						<div class="direct_desc">
							<h4><span>다이렉트 트레이드 커피를 새롭게 바라보다.</span></h4>
							<ul>
								<li>
									<p class="directImg">
										<img src="/asset/img/goods_img/direct_trade_desc0.jpg" alt="다이렉트 트레이드 이미지0"/>
									</p>
									<p class="directText">
										<em>산지방문 다이렉트 트레이드</em><br/>
										모모스는 좋은 커피를 찾기 위해<br/>
										아프리카, 중남미, 아시아 등을 직접 방문하고 있습니다.<br/>
										뿐만 아니라 마야인 "피커"들을 위한 지속적인 후원을 하고 있습니다.
									</p>
								</li>
								<li>
									<p class="directImg">
										<img src="/asset/img/goods_img/direct_trade_desc1.jpg" alt="다이렉트 트레이드 이미지1"/>
									</p>
									<p class="directText">
										<em>항온항습 컨테이너 운송</em><br/>
										한국의 지리적인 특성상 일어날 수 있는 커피품질의 저하를 예방하기 위해<br/>
										산지에서 부산까지 저온창코 컨테이너로 운송하고 있습니다. 
									</p>
								</li>
								<li>
									<p class="directImg">
										<img src="/asset/img/goods_img/direct_trade_desc2.jpg" alt="다이렉트 트레이드 이미지2"/>
									</p>
									<p class="directText">
										<em>항온항습 생두창고보관</em><br/>
										부산에 도착한 커피 또한 모모스 내 항온항습 생두창고에서<br/> 신선하게 보관합니다.
									</p>
								</li>
								<li>
									<p class="directImg">
										<img src="/asset/img/goods_img/direct_trade_desc3.jpg" alt="다이렉트 트레이드 이미지3"/>
									</p>
									<p class="directText">
										<em>R&amp;D팀</em><br/>
										커피 R&amp;D팀 운영으로 끊임 없는 연구 개발뿐 아니라<br/>
										일일 컵테이스팅을 통해 커피특징이 잘 표현하기 위해 노력하고 있으며,<br/>
										소비자의 스페셜티커피의 인식을 높이기 위해 움직입니다.
									</p>
								</li>
								<li>
									<p class="directImg">
										<img src="/asset/img/goods_img/direct_trade_desc4.jpg" alt="다이렉트 트레이드 이미지4"/>
									</p>
									<p class="directText">
										<em>전문핸드픽</em><br/>
										소비자에게 결점없는 커피만을 공급하기 위해 디스토너 설치 뿐 아니라<br/>
										핸드픽만을 담당하는 직원이 있습니다. 
									</p>
								</li>
								<li>
									<p class="directImg">
										<img src="/asset/img/goods_img/direct_trade_desc5.jpg" alt="다이렉트 트레이드 이미지5"/>
									</p>
									<p class="directText">
										<em>친근한 서비스</em><br/>
										친절함을 넘어 친근한 서비스로 소비자에게 커피에 행복을 담아 전달합니다. 
									</p>
								</li>
							</ul>
						</div>
					</li>
					<li id="tab1" class="detail_anelList detail_review">
						<h3 class="hidden">이용후기(3)</h3>
						<ul class="detail_reviewBox">
							<li class="detail_review1">
								<div class="userArea">
									<form action="#" method="post">
										<p class="userImg">
											<img src="/asset/img/icons/userIcon.png" alt="사용자 이미지"/>
										</p>
										<p class="userInfo">
											<a href="#none" title="사용자 아이디">koallazon</a>
											<span>·</span>
											<span class="reviewDate">2017.2.5</span>
										</p>
										<p class="userEval">
											<label for="star50"><i class="material-icons">favorite</i></label>
											<input id="star50" type="radio" name="grade" class="star5 star" title="평점 별5"/>
											<label for="star40"><i class="material-icons">favorite</i></label>
											<input id="star40" type="radio" name="grade" class="star4 star" title="평점 별4"/>
											<label for="star30"><i class="material-icons">favorite</i></label>
											<input id="star30" type="radio" name="grade" class="star3 star" title="평점 별3"/>
											<label for="star20"><i class="material-icons">favorite</i></label>
											<input id="star20" type="radio" name="grade" class="star2 star" title="평점 별2"/>
											<label for="star10"><i class="material-icons">favorite</i></label>
											<input id="star10" type="radio" name="grade" class="star1 star" title="평점 별1"/>
										</p>
										<p class="user_comment">
											오전에 배송받자 마자, 드립으로 내려먹었어요.<br/>
											머신이 고장나서 걱정했는데, 드립으로도 맛있네요.<br/>
											뜨거운 1차 적시고 커피빵이 제대로 생기는 거로 신선함 인증+감동!!<br/>
											다 먹으면 바로 재주문 해야겠어요.^^
										</p>
									</form>
								</div>
								<div class="adminArea">
									<p class="adminImg">
										<img src="/asset/img/logo.png" alt="관리자이미지" />
									</p>
									<p class="adminInfo">
										<a href="#none" title="관리자 아이디">momos coffee</a>
										<span>·</span>
										<span class="replyDate">2017.2.6</span>
									</p>
									<p class="admin_comment">
										핸드드립으로 그냥 내려드시기에도 너무 좋고 또 게이샤의 화사한 향이 굿입니다.<br/>
										맛있게 이용해주셔서 감사합니다!
									</p>
								</div>
							</li>
							<!-- <li class="detail_review2"></li> -->
							<!-- <li class="detail_review3"></li> -->
						</ul>
					</li>
					<li id="tab2" class="detail_panelList delivery_info">
						<h3 class="hidden">배송관련 안내사항</h3>
						<div class="pdInfo_desc">
							<h4>배송 안내</h4>
							<p>
								<em><span>12</span>시</em>
								<span class="pdInfo_text">
									오후 12시까지 주문완료시 당일 배송을 원칙으로 하고 있으나,<br/>
									로스터 휴무 등 사정에 따라 배송이 하루 정도 연기 될 수 있습니다. 
								<span>
							</p>
							<p>
								<em><span>3</span>만원</em>
								<span class="pdInfo_text">
									기본배송료는 2,500원이며 30,000원 이상 구매시 무료배송입니다.<br/>
									(도서산간 일부지역은 배송비가 추가될 수 있습니다.) 
								<span>
							</p>
							<p>
								<em><span>1~5</span>일</em>
								<span class="pdInfo_text">
									본 상품은 평균 배송기간은 입금 확인 후 1~5일이며, 배송예정일은 주문 시점에<br/>
									따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다. 
								<span>
							</p>
						</div>
						<div class="visit_receipt">
							<h4>방문 수령 안내</h4>
							<p class="visit_receipt_time">
								주문 <span>오후 1시</span>까지<br/>
								수령 <span>오후 5시</span>이후
							</p>
							<p class="visit_receipt_text">
								방문 수령은, 평일 오후 1시까지 주문 완료건에 한해,<br/>
								당일 오후 5시 이후 매장에서 수령 가능합니다.<br/>
								방문 수령을 원한 경우, 수령 예정일 / 시간을 주문 시 코멘트에 꼭 남겨주세요!
							</p>
						</div>
						<div class="sellByDate">
							<h4>품질 유지기한 안내</h4>
							<p class="sellByDate_title">
								건냉한 곳<br/>밀폐 보관
							</p>
							<p class="sellByDate_text">
								품질 유지기한은 적절한 방법으로 보관할 경우, 해당 식품의 고유 품질이 유지 될 수 있는<br/>
								기한을 말합니다. 적절한 보관방법은 건냉한 곳에 밀폐보관하는 것이며, 본 상품의<br/>
								품질 유지가한은 제조일로부터 1개월입니다. 제조연월일은 상품에 별도표시 되어 집니다.
							</p>
						</div>
						<div class="refund">
							<h4>교환, 환불 안내</h4>
							<p>
								전자상거래 등에서의 소비자 보호에 관한 법률 제 17조 제 1항에 의해 통신 판매업자와 재화 등의 구매에 관한 계약을 맺은
								소비자는 청약 후 또는 상품을 공급받는 날로부터 7일 이내에는 단순 변심에 의한 청약철회도 가능합니다.
								다만, 소비자의 귀책사유로 인한 상품의 멸실 또는 훼손된 경우 등은 제외됩니다. 
							</p>
							<p>
								상품의 특성상 일부 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객의 단순변심에
								의한 교환, 반품이 불가능 할 수 있습니다. 상품가치 훼손시에는 1일 이내라도 교환 및 반품이 불가능합니다.
							</p>
							<p>
								이벤트 상품, 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다. (제품의 하자, 배송오류는 제외)
							</p>
						</div>
						<div class="company_info">
							<p>
								<i>문의전화</i><span>051-512-7036</span>
							</p>
							<p>
								<i>Email</i><span>mall@momos.co.kr</span>
							</p>
							<p>
								<i>계좌번호</i><span>하나은행 : 833-910016-10705, 예금주 : 모모스 커피(주)</span>
							</p>
						</div>
					</li>
					<li id="tab3" class="detail_panelList detail_question">
						<h3 class="hidden">질문과 답변</h3>
						<!-- <div class="loginConfrom">로그인을 하시면 질문을 등록할 수 있습니다. </div> -->
						<div class="quest_input">
							<form action="#" method="post">
								<div>
									<p class="questImg">
										<img src="/asset/img/icons/userIcon.png" alt="사용자 이미지" />
									</p>
									<span>(아이디)</span>님께서 궁금하신 내용을 질문해주세요.
								</div>
								<p class="inputArea">
									<textArea id="quest_content" name="quest_content" title="질문 입력란" placeholder="궁금한 점이 있으신가요? 무엇이든 물어보세요."></textArea>
								</p>
								<p class="questBtn">
									<input class="" type="button" value="질문 등록하기" title="질문 등록버튼">
								</p>
							</form>
						</div>

						<ul class="detail_questBox">
							<li class="detail_question1">
								<div class="userArea">
									<form action="#" method="post">
										<p class="userImg">
											<img src="/asset/img/icons/userIcon.png" alt="사용자 이미지" />
										</p>
										<p class="userInfo">
											<a href="#none" title="사용자 아이디">서미형</a>
											<span>·</span>
											<span class="reviewDate">2017.1.19</span>
										</p>
										<p class="user_comment">
											보통 언제 로스팅 된걸 받을 수 있나요?
										</p>
									</form>
								</div>
								<div class="adminArea">
									<p class="adminImg">
										<img src="/asset/img/logo.png" alt="관리자 이미지" />
									</p>
									<p class="adminInfo">
										<a href="#none" title="관리자 아이디">momos coffee</a>
										<span>·</span>
										<span class="replyDate">2017.1.20</span>
									</p>
									<p class="admin_comment">
										보통 주문 접수 하시는 날짜 기준으로 1~2일이전에 로스팅이 이루어진 상품으로<br/>
										배송이 이루어집니다 ^^<br/>
										배송까지 이루어지게 되면 3~4일정도 이전에 로스팅된거라고 보시면 좋을것 같아요!
									</p>
								</div>
							</li>
							<!-- <li class="detail_question2"></li> -->
						</ul>
					</li>
				</ul>
			</div>
		</section><!-- content -->
		<aside class="purchase_box">
			<h2 class="hidden">구매영역</h2>
			<div class="purchaseArea">
				<form action="#" method="post">
					<p class="roastingDate">
						<em>로스팅 날짜</em>
						<input type="rDate" type="text" name="rDate" title="로스팅 날짜" value="2017. 7. 5" readonly/>
					</p>
					<p class="weightArea">
						<em>중량 선택</em>
						<select name="weight" id="weight">
							<option value="weightSelect" selected>중량을 선택해주세요.</option>
							<option value="wSelect1">200g (+25,000원)</option>
							<option value="wSelect2">500g (+40,000원)</option>
						</select>
					</p>
					<p class="grindingArea">
						<em>분쇄상태 선택</em>
						<select name="grindingState" id="grindingState">
							<option value="grindingSelect" selected>분쇄상태를 선택해주세요.</option>
							<option value="gSelect1">분쇄 안함 <span>Whole Bean</span></option>
							<option value="gSelect2">프렌치프레스 <span>French Press</span></option>
							<option value="gSelect3">하리오 (핸드드립) <span>Hand Drip</span></option>
							<option value="gSelect4">칼리타 (핸드드립) <span>Hand Drip</span></option>
							<option value="gSelect5">클레버 <span>Clever</span></option>
							<option value="gSelect6">케멕스 <span>Chemex</span></option>
							<option value="gSelect7">커피메이커 <span>Coffee Maker</span></option>
							<option value="gSelect8">에어로프레스 <span>AeroPress</span></option>
							<option value="gSelect9">가정용더치 <span>Dutch</span></option>
							<option value="gSelect10">모카포트 <span>Moka Pot</span></option>
							<option value="gSelect11">에스프레소 <span>Espresso Machine</span></option>
						</select>
					</p>
					<p class="deliverArea">
						<em>방문수령 및 도서산간지역</em>
						<select name="deliveryMethod" id="deliveryMethod">
							<option value="deliverySelect" selected>배송방법 및 지역을 선택해주세요.</option>
							<option value="dSelect1">기본 배송 (+ 2,500원)</option>
							<option value="dSelect2">제주도 및 도서지역 배송 (+ 5,000원)</option>
							<option value="dSelect3">방문수령 (온천장점 본점 수령, 안내 참고)</option>
						</select>
					</p>
					<p class="numArea">
						<em>수량</em>
						<input id="num" type="number" name="num" min="1" max="50" value="1"/>
						<span>EA</span>
					</p>
					<p class="resultArea">
						<label for="result">총 결제금액</label>
						<input id="result" type="text" name="result" value="0" readonly/><span>원</span>
					</p>
					<p class="purchaseBtnArea">
						<input id="cartBtn" class="buyBtn1" type="button" value="장바구니에 담기" title="장바구니 담기"/>
						<input id="orderBtn" class="buyBtn2" type="button" value="바로 주문하기" title="바로 주문하기"/>
					</p>
				</form>
			</div>
		</aside><!-- 구매영역 -->
	</div><!-- container -->
	
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>