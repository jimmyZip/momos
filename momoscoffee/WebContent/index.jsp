<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<script type="text/javascript" src="/asset/js/page_related/index.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="main_container">
			<div class="main_screen">
				<h2 class="hidden">배너광고 슬라이드 영역</h2>
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide1 swiper-slide">
							<img src="/asset/img/main0.jpg" alt="커피에 가치를 담다." />
							<p>
								<img src="/asset/img/mainSlide_scene0_text0.png" alt="all in coffee" />
								<strong>ALL IN COFFEE,<br />MOMOS
								</strong> <span>새로운 로고와 함께 지금보다 한층 더<br />성숙해진 모습으로 당신을 기다리고
									있겠습니다.
								</span>
							</p>
						</div>
						<div class=" swiper-slide2 swiper-slide">
							<img src="/asset/img/main1.jpg" alt="센텀시티 오픈" />
							<p>
								<img src="/asset/img/mainSlide_scene1_text0.png" alt="centum" /> <strong>CENTUM
									CITY <br />NOW OPEN
								</strong> <span> 모모스커피의 새로운 모습<br /> 모던함 속의 클래식을 느껴보세요.
								</span> <a href="sub1_4_store2.jsp" title="센텀시티점 안내">센텀점 더 보기</a>
							</p>
						</div>
						<div class="swiper-slide3 swiper-slide">
							<img src="/asset/img/main2.jpg" alt="채용공고" />
							<p>
								<img src="/asset/img/mainSlide_scene2_text0.png" alt="recruit" /> <strong>2017
									하반기 <br />바리스타 채용
								</strong> <span> 커피보다 사람, 실력보다는 인성, 기교보다<br /> 기본의 가치를 아는 당신을
									기다립니다.
								</span> <a href="recruit.jsp" title="채용공고 보기">채용공고 보기</a>
							</p>
						</div>
						<div class="swiper-slide4 swiper-slide">
							<img src="/asset/img/main3.jpg" alt="남강농원과 매향" />
							<p>
								<img src="/asset/img/mainSlide_scene3_text0.png" alt="direct trade" />
								<strong> 모모스와 맺다.<br />남강농원과 매향 <i>딸기</i>
								</strong> <span> 깨끗한 환경에서 건강하게 자라난 알찬 매향딸기,<br /> 모모스 시즌티와 딸기 케이크를
									통해 만나보세요.
								</span> <a href="#none" title="directEpisode">에피소드 보기</a>
							</p>
						</div>
					</div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
					<a href="#main_introText" title="아래로 이동" class="slide_downMove">
						<img src="/asset/img/slide_downMove.png" alt="아래로 이동" />
					</a>
				</div>
				<!--◁ swife_slide ▷-->
			</div>	
			<section class="main_introText">
				<h2 class="hidden">메인 텍스트 영역</h2>
				<strong><b class="orange">Specialty for All</b><br />모두를 위한
					특별한 스페셜티 커피</strong>
				<p>
					맛있는 커피를 마셔보고, 좋은 재료를 찾기 위해 500번의 비행기를 타고 1000일을 외국에서 잠을 잡니다.<br />
					우리가 지금까지 가장 많이 투자를 한 분야는 매장 인테리어가 아닌 커피여행입니다. <br /> 다양한 커피 문화와 커피의
					근본을 알게 됨으로써 행복하게 커피를 만들 수 있길 바라기 때문입니다. <br /> 여러분에게 제공되는 커피 한잔 한잔은
					그렇게 만들어집니다.
				</p>
			</section>
			<!--◁ 메인 소개 문구 ▷-->
			<section class="findUs">
				<h2 class="hidden">매장 안내</h2>
				<div class="findUs_box1">
					<a href="/client/goLocation/1" title="온천장점 소개">
						<p class="findUs_img1"></p>
						<p class="findUs_text">
							<strong>Find us</strong><br /> <span>모모스 커피는 어디에 있을까요?</span>
						</p>
					</a>
				</div>
				<div class="findUs_box2">
					<a href="/client/goLocation/2" title="센텀점 소개"></a>
				</div>
			</section>	
			<section class="main_shop">
				<h2>Best seller</h2>
				<div class="main_shopScreen">
					<ul class="main_shopFilm">
						<li class="main_shopScene main_shopScene0"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best1.jpg"
								alt="베스트셀러0" />
								<p class="main_shop_normal">
									<strong>브라질 상 주앙</strong> <span>구운 아몬드, 캬라멜, 라임, 시럽, 클린</span> <i>12,000원</i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene1"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best2.jpg"
								alt="베스트 아이템2" />
								<p class="main_shop_reduce">
									<strong>에스 쇼콜라</strong> <span>다크체리 초콜렛, 크림, 카카오 / 에스프레소
										블랜드</span> <i>12,000원</i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene2"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best3.jpg"
								alt="베스트 아이템3" />
								<p class="main_shop_normal">
									<strong>정기배송-싱글오리진</strong> <span>매주 특별한 커피를 받아보세요.</span> <i></i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene3"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best4.jpg"
								alt="베스트 아이템4" />
								<p class="main_shop_reduce">
									<strong>오시게</strong> <span>마카다미아, 카라멜, 베리, 크리미 / 에스프레소
										블렌드</span> <i>12,000원</i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene4"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best5.jpg"
								alt="베스트 아이템5" />
								<p class="main_shop_reduce">
									<strong>케냐 오레티</strong> <span>패션후르츠, 자몽, 캔디, 밀크캬라멜, 시럽린</span> <i>14,000원</i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene6"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best6.jpg"
								alt="베스트 아이템6" />
								<p class="main_shop_reduce">
									<strong>콜롬비아 카우카</strong> <span>열대과일, 파파야, 멜론, 캔디, 시럽같은
										촉감, 클린</span> <i>16,000원</i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene7"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best7.jpg"
								alt="베스트 아이템7" />
								<p class="main_shop_normal">
									<strong>프루티 봉봉</strong> <span>자몽,카라멜,시럽 / 시그니처 블렌드</span> <i>12,000원</i>
								</p>
						</a></li>
						<li class="main_shopScene main_shopScene8"><a
							href="goods001.jsp" title=""> <img src="/asset/img/best8.jpg"
								alt="베스트 아이템8" />
								<p class="main_shop_normal">
									<strong>모모스 드립백</strong> <span>DRIP BAG-1BOX(5EA)</span> <i>8,000원</i>
								</p>
						</a></li>
					</ul>
				</div>
				<div class="main_shopBtn">
					<p class="main_shop_nextBtn">
						<img src="/asset/img/icons/slide_arrow_right_bgW.png" alt="다음버튼" />
					</p>
					<p class="main_shop_prevBtn">
						<img src="/asset/img/icons/slide_arrow_left_bgW.png" alt="이전버튼" />
					</p>
				</div>
			</section>
			<section id="articleWrap">
				<h2>Article</h2>
				<div id="articleArea">
					<div class="leftArea">
						<article id="cupping">
							<h3 class="hidden">public_cupping</h3>
							<a class="tuesdayCup" href="#none" title="와요커핑"> <img
								src="/asset/img/tue20.jpg" alt="와요커핑" />
								<p>
									<span class="cuppingTitle">와요커핑</span> <span class="view">view</span>
								</p>
							</a> <a class="businessCup" href="#none" title="비즈니스커핑"> <img
								src="/asset/img/busiCupping01.jpg" alt="비즈니스커핑" />
								<p>
									<span id="cupTitle" class="cuppingTitle">비지니스커핑</span> <span
										class="view">view</span>
								</p>
							</a>
						</article>
						<!--cupping-->
						<article id="busan">
							<h3 class="hidden">부산하다</h3>
							<p id="busanText">
								<a class="logoAppear" href="#none" title="momos and kimi">
									Momos Coffee<br /> X<br />KIMI &amp; 12
								</a> <em>첫번째 콜라보레이션<br />프로젝트
								</em> <a class="busanView" href="#none" title="momos_busan">view</a>
							</p>
							<p id="busanImg">
								<img src="/asset/img/busanani.jpg" alt="부산하다" /> <span>모모스<br />부산하다
								</span>
							</p>
						</article>
						<!--부산하다-->
						<article id="weekly">
							<h3 class="hidden">weekly_market</h3>
							<a href="goods001.jsp" title="위클리마켓">
								<div class="wkBoxA">
									<p class="leftImg">
										<img src="/asset/img/weekly_left.jpg" alt="이미지3" />
									</p>
									<p class="rightText">
										<em> 홈바리스타를 위한<br />합리적인 마켓
										</em> <span class="wk_desc"> 일괄 로스팅 및 팩킹을 통해<br /> 홈바리스타에게<br />
											조금 더 합리적인 커피,<br /> 또는 상품을 전달
										</span>
									</p>
								</div>
								<div class="wkBoxB">
									<p class="rightImg">
										<img class="wkFront" src="/asset/img/weekly_right.jpg" alt="이미지1" />
										<img class="wkBack" src="/asset/img/market.jpg" alt="이미지4" />
									</p>
									<p class="wk_blank"></p>
								</div>
							</a>
						</article>
						<!--위클리마켓-->
						<article id="delivery">
							<h3 class="hidden">원두정기배달</h3>
							<p class="deliveryImg">
								<img src="/asset/img/delivery2.jpg" alt="원두정기배달" /> <span
									class="deliveryWord1">日常茶飯事<br />일상다반사
								</span> <span class="deliveryWord2">커피, 일상의 차와 음식과 같이 특별할 것이 없는 것</span>
							</p>
							<p class="deliveryText">
								<strong>원두 정기 배달</strong> <span>커피를 마시는 일이 일상이 되어버린 당신에게 <br />매주
									특별한 커피를 배달해드립니다.
								</span> <a href="goods001.jsp" title="커피정기배달">view</a>
							</p>
						</article>
						<!--원두정기배달-->
					</div>
					<div class="rightArea">
						<article id="dripbag">
							<h3 class="hidden">새로운 드립백</h3>
							<p class="dripbagVideo">
								<video controls poster="/asset/img/videoposter.jpg">
									<source src="/asset/video/dripbag2.mp4" type="video/mp4" />
								</video>
								<em><span style="color: #c00;">New</span> DripBag C.F.</em>
							</p>
							<p class="dripbagText">
								<strong><span style="color: #c00;">NEW</span> MoMos Drip
									BAG</strong> <span class="dripbagWord1">새로워진 디자인, 간편해진 5개입</span><br />
								<span class="dripbagWord2"> 그냥 물만 준비하세요<br />언제든, 어디서든,
									누구와 함께든<br /> 쉽고 간편하게 모모스 커피를 즐길 수 있어요.
								</span>
							</p>
						</article>
						<!--드립백-->
						<article id="academy">
							<h3 class="hidden">coffee_academy</h3>
							<p class="academyImg1">
								<a href="#none" title="커피교실"> <img class="hobbyFront"
									src="/asset/img/hobby_front.gif" alt="커피교실 이미지1" /> <img
									class="hobbyBack" src="/asset/img/hobby_back.gif" alt="커피교실 이미지2" />
								</a>
							</p>
							<p class="academyImg2">
								<img src="/asset/img/academy.jpg" alt="커피교실 이미지3" /> <a href="#none"
									title="커피교실 더보기">view</a>
							</p>
						</article>
						<!--커피교실-->
						<article id="directEpisode">
							<h3 class="hidden">directEpisode</h3>
							<img src="/asset/img/direct.jpg" alt="네자매 농원 이미지" />
							<p class="episodeText">
								<span class="text1">Direct Episode</span><br /> <span
									class="text2">모모스와 맺다</span><br /> <span class="text3">네자매
									농원과 백향과 쥬스</span> <a href="#none" title="Direct Episode">view</a>
							</p>
						</article>
						<!--다이렉트에피소드-->
						<article class="main_notice">
							<h3 class="hidden">notice</h3>
							<p class="main_recruit1 main_notice_img main_notice_link">
								<img src="/asset/img/recruit.jpg" alt="채용_직원 이미지" /> <a
									href="recruit.jsp" title="recruit"> <span
									class="recruitTitle">Recruit</span> <span class="recruitView">view</span>
								</a>
							</p>
							<p class="main_recruit2">
								<strong> WHO'S NEXT?<br />Recruit
								</strong> <span> 커피보다 사람,<br /> 실력보다 인성,<br /> 기교보다 기본의 가치를<br />
									아는 당신을 기다립니다.
								</span>
							</p>
							<p class="main_centum1 main_notice_img">
								<img src="/asset/img/centum1.jpg" alt="센텀점 오픈" />
							</p>
							<p class="main_centum2 main_notice_img main_notice_link">
								<img src="/asset/img/centum2.jpg" alt="센텀점 오픈" /> <a
									href="sub1_4_store2.jsp" title="센텀점 자세히보기"> <span
									class="centumTitle">CENTUM OPEN</span> <span class="centumView">view</span>
								</a>
							</p>
						</article>
						<!--공지사항-->
					</div>
				</div>
			</section>
			<!--◁ article ▷-->
		</div>
		<!--◀ container ▶-->
		<%@include file="/include/footer.jsp" %>
	</div>
</body>
</html>