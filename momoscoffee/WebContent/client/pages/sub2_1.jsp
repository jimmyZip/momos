<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
	<div class="showAll_container">
		<ul class="pageRoute">
			<li><a href="index.jsp" title="메인 홈">HOME</span></li>
			<li>
				<a href="/pages/sub2_1.jsp" title="SHOP">SHOP &nbsp;▼</a>
				<ul>
					<li><a href="/pages/sub2_1.jsp" title="GOODs">GOODs</a></li>
					<li><a href="/pages/sub2_2.jsp" title="GREEN BEAN">GREEN BEAN</a></li>
				</ul>
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
						<a href="/pages/goods001.jsp" title="배너_커피">
							<img src="/asset/img/sub2_1/banner1.jpg" alt="커피 배너이미지" />
							<p class="textArea">
								<span>COFFEE</span><br/>
								<em>콜롬비아 카우카 베스트컵 8위 라 팔마</em>
								<span><img src="/asset/img/sub2_1/arrow.png" alt="화살표"/></span>
							</p>
						</a>
					</li>
					<li>
						<a href="/pages/goods001.jsp" title="모모스 텀블러">
							<img src="/asset/img/sub2_1/banner2.jpg" alt="모모스 텀블러 이미지" />
							<p class="textArea">
								<span>GIFT SET</span><br/>
								<em>모모스 텀블러</em>
								<span><img src="/asset/img/sub2_1/arrow.png" alt="화살표"/></span>
							</p>
						</a>
					</li>
					<li>
						<a href="/pages/goods001.jsp" title="모모스 드립백">
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
						<li><a class="goods_selected" href="#none" title="전체보기 버튼">전체</a></li>
						<li><a href="#none" title="커피 버튼">커피</a></li>
						<li><a href="#none" title="선물용 버튼">선물용</a></li>
						<li><a href="#none" title="드립도구 버튼">드립도구</a></li>
					</ul>
				</div>
				<ul class="goods_list">
					<!-- goods_list 1단위 시작-->
					<li class="showAll_goods showAll_goods1 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="weekly market">
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
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods2 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="10주년 기념 클래식 브랜드">
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
					<li class="showAll_goods showAll_goods3 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="오시게">
							<p>
								<img src="/asset/img/goods_img/goods3.jpg" alt="오시게 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>부드러운 촉감과<br/>완벽한 밸런스<br/><i>momos jay</i>
								</span>
							</p>
							<p>오시게</p>
						</a>
						<div>
							<p class="goods_desc">마카다미아, 카라멜, 베리, 크리미 / 에스프레소 블렌드</p>
							<p class="goods_price">12,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods4 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="에스쇼콜라">
							<p>
								<img src="/asset/img/goods_img/goods4.jpg" alt="에스쇼콜라 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>신선하고<br/>진한 한모금<br/><i>momos lei</i>
								</span>
							</p>
							<p>에스쇼콜라</p>
						</a>
						<div>
							<p class="goods_desc">다크체리 초콜렛, 크림, 카카오 / 에스프레소 블랜드</p>
							<p class="goods_price">12,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods5 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="프루티봉봉">
							<p>
								<img src="/asset/img/goods_img/goods5.jpg" alt="프루티봉봉 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>산뜻한 과일의 산미와<br/>청량감이 좋은 커피<br/><i>momos manager</i>
								</span>
							</p>
							<p>프루티 봉봉</p>
						</a>
						<div>
							<p class="goods_desc">자몽,카라멜,시럽 / 시그니처 블렌드</p>
							<p class="goods_price">12,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods6 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="콜롬비아 카우카 베스트컵 8위 라 팔마">
							<p>
								<img src="/asset/img/goods_img/goods6.jpg" alt="콜롬비아 카우카 베스트컵 8위 라 팔마 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>열대과일의 밝은 신맛과<br/>부드럽고 쫀듯한 맛<br/><i>momos manager</i>
								</span>
							</p>
							<p>콜롬비아 카우카 베스트컵 8위 라 팔마</p>
						</a>
						<div>
							<p class="goods_desc">열대과일, 파파야, 멜론, 캔디, 시럽같은 촉감, 클린</p>
							<p class="goods_price">16,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods7 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="청화블렌드">
							<p>
								<img src="/asset/img/goods_img/goods7.jpg" alt="청화 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>이름 그대로<br/>'맑은 꽃'이 떠오르는 맛<br/><i>momos manager</i>
								</span>
							</p>
							<p>청화 淸花 </p>
						</a>
						<div>
							<p class="goods_desc">쟈스민, 청사과, 복숭아, 시럽같은 촉감, 클린, 긴 여운</p>
							<p class="goods_price">19,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods8 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="에티오피아 예가체프 첼체레">
							<p>
								<img src="/asset/img/goods_img/goods8.jpg" alt="에티오피아 예가체프 첼체레 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>생강꿀차의 달큰한 느낌과<br/>부드러운 촉감<br/><i>momos manager</i>
								</span>
							</p>
							<p>에티오피아 예가체프 첼체레</p>
						</a>
						<div>
							<p class="goods_desc">쟈스민, 플로럴, 라임, 꿀차, 긴 여운</p>
							<p class="goods_price">12,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods9 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="브라질 상 주앙">
							<p>
								<img src="/asset/img/goods_img/goods9.jpg" alt="브라질 상 주앙 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>크리미한 촉감과<br/>아몬드의 구수한 향<br/><i>momos manager</i>
								</span>
							</p>
							<p>브라질 상 주앙</p>
						</a>
						<div>
							<p class="goods_desc">구운아몬드, 캬라멜, 라임, 시럽, 클린</p>
							<p class="goods_price">12,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods10 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="케냐 오레티">
							<p>
								<img src="/asset/img/goods_img/goods10.jpg" alt="케냐 오레티 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>망고의 달콤한 느낌과<br/>시럽같은 부드러운 촉감<br/><i>momos manager</i>
								</span>
							</p>
							<p>케냐 오레티</p>
						</a>
						<div>
							<p class="goods_desc">패션후르츠, 자몽, 캔디, 밀크캬라멜, 시럽</p>
							<p class="goods_price">14,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods11 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="콜롬비아 디카페인 커피">
							<p>
								<img src="/asset/img/goods_img/goods11.jpg" alt="콜롬비아 디카페인 커피 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>카카오와<br/>다크초콜릿의 단맛<br/><i>momos manager</i>
								</span>
							</p>
							<p>콜롬비아 디카페인 커피</p>
						</a>
						<div>
							<p class="goods_desc">카카오, 다크 초콜릿</p>
							<p class="goods_price">14,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods12 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="정기배송-싱글오리진">
							<p>
								<img src="/asset/img/goods_img/goods12.jpg" alt="정기배송-싱글오리진 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>커피를 마시는 일이<br/>일상인 그대를 위해~<br/><i>momos manager</i>
								</span>
							</p>
							<p>정기배송-싱글오리진</p>
						</a>
						<div>
							<p class="goods_desc">매주 특별한 커피를 받아보세요.</p>
							<p class="goods_price">-<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods13 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="정기배송-블렌드">
							<p>
								<img src="/asset/img/goods_img/goods13.jpg" alt="정기배송-블렌드 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>커피를 마시는 일이<br/>일상인 그대를 위해~<br/><i>momos manager</i>
								</span>
							</p>
							<p>정기배송-블렌드</p>
						</a>
						<div>
							<p class="goods_desc">매주 특별한 커피를 받아보세요.</p>
							<p class="goods_price">-<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods14 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="모모스 드립백">
							<p>
								<img src="/asset/img/goods_img/goods14.jpg" alt="모모스 드립백 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>언제 어디서나<br/>편리하게 커피한잔<br/><i>momos manager</i>
								</span>
							</p>
							<p>모모스 드립백</p>
						</a>
						<div>
							<p class="goods_desc">DRIP BAG-1BOX(5EA)</p>
							<p class="goods_price">8,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods15 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="모모스 멀티 컨테이너">
							<p>
								<img src="/asset/img/goods_img/goods15.jpg" alt="모모스 멀티 컨테이너 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>정리가 필요한 어디든<br/>멀티풀하게 사용하세요.<br/><i>momos manager</i>
								</span>
							</p>
							<p>모모스 멀티 컨테이너</p>
						</a>
						<div>
							<p class="goods_desc">momos multi container</p>
							<p class="goods_price">8,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods16 goodsType1 goodsType0">
						<a href="/pages/goods001.jsp" title="모모스 커피 텀블러">
							<p>
								<img src="/asset/img/goods_img/goods16.jpg" alt="모모스 커피 텀블러 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>모모스 드립백과<br/>함께라면 금상첨화<br/><i>momos manager</i>
								</span>
							</p>
							<p>모모스 커피 텀블러</p>
						</a>
						<div>
							<p class="goods_desc">momos coffee tumbler</p>
							<p class="goods_price">29,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods17 goodsType2 goodsType0">
						<a href="/pages/goods001.jsp" title="모모스 드립백 선물세트">
							<p>
								<img src="/asset/img/goods_img/goods17.jpg" alt="모모스 드립백 선물세트 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>선물할 곳 있으신가요?<br/>그럼 모모스 드립백!<br/><i>momos manager</i>
								</span>
							</p>
							<p>모모스 드립백 선물세트</p>
						</a>
						<div>
							<p class="goods_desc">드립백 선물세트(15EA)</p>
							<p class="goods_price">22,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods18 goodsType3 goodsType0">
						<a href="/pages/goods001.jsp" title="칼리타 웨이브 포트">
							<p>
								<img src="/asset/img/goods_img/goods18.jpg" alt="칼리타 웨이브 포트 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>사용자에게 편리하게<br/>맞춰진 포트<br/><i>momos manager</i>
								</span>
							</p>
							<p>칼리타 웨이브 포트</p>
						</a>
						<div>
							<p class="goods_desc">KALITA Wave Pot</p>
							<p class="goods_price">81,800<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods19 goodsType3 goodsType0">
						<a href="/pages/goods001.jsp" title="칼리타 서버 300ml">
							<p>
								<img src="/asset/img/goods_img/goods19.jpg" alt="칼리타 서버 300ml 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>안심하고 사용할 수 있는<br/>가볍고 튼튼한 내열유리<br/><i>momos manager</i>
								</span>
							</p>
							<p>칼리타 서버 300ml</p>
						</a>
						<div>
							<p class="goods_desc">KALITA Drip Server 300ml</p>
							<p class="goods_price">11,900<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods20 goodsType3 goodsType0">
						<a href="/pages/goods001.jsp" title="칼리타 웨이브 필터 185">
							<p>
								<img src="/asset/img/goods_img/goods20.jpg" alt="칼리타 웨이브 필터 185 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>균일한 섬유질의<br/>천연펄프 필터<br/><i>momos manager</i>
								</span>
							</p>
							<p>칼리타 웨이브 필터 185</p>
						</a>
						<div>
							<p class="goods_desc">KALITA Wave Coffee Filter 185</p>
							<p class="goods_price">9,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods21 goodsType3 goodsType0">
						<a href="/pages/goods001.jsp" title="칼리타 웨이브 필터 155">
							<p>
								<img src="/asset/img/goods_img/goods21.jpg" alt="칼리타 웨이브 필터 155 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>균일한 섬유질의<br/>천연펄프 필터<br/><i>momos manager</i>
								</span>
							</p>
							<p>칼리타 웨이브 필터 155</p>
						</a>
						<div>
							<p class="goods_desc">KALITA Wave Coffee Filter 155</p>
							<p class="goods_price">8,800<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods22 goodsType3 goodsType0">
						<a href="/pages/goods001.jsp" title="칼리타 웨이브 드리퍼 185">
							<p>
								<img src="/asset/img/goods_img/goods22.jpg" alt="칼리타 웨이브 드리퍼 185 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>조화로운 추출을<br/>보여주는 드리퍼<br/><i>momos manager</i>
								</span>
							</p>
							<p>칼리타 웨이브 드리퍼 185</p>
						</a>
						<div>
							<p class="goods_desc">KALITA Wave Dripper 185</p>
							<p class="goods_price">28,800<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
					<li class="showAll_goods showAll_goods23 goodsType3 goodsType0">
						<a href="/pages/goods001.jsp" title="칼리타 웨이브 드리퍼 155">
							<p>
								<img src="/asset/img/goods_img/goods23.jpg" alt="칼리타 웨이브 드리퍼 155 이미지"/>
								<span class="feel_review">
									<b>"</b><br/>조화로운 추출을<br/>보여주는 드리퍼<br/><i>momos manager</i>
								</span>
							</p>
							<p>칼리타 웨이브 드리퍼 155</p>
						</a>
						<div>
							<p class="goods_desc">KALITA Wave Dripper 155</p>
							<p class="goods_price">27,000<span class="gray">원</span></p>
						</div>
					</li>
					<!-- goods_list 1단위 끝-->
				</ul>
			</div>
		</section>
	</div><!-- container -->
	<script type="text/javascript">
			$(function(){
				for(var i=0; i<4; i++){
					goods_panel(i);
				}
				function goods_panel(i){			
					$(".goods_btnArea ul li a:eq("+i+")").click(function(){
						$(".goods_list li").hide();
						$(".goodsType"+i).show();
						$(".goods_btnArea ul li a").removeClass();
						$(this).addClass("goods_selected");
						var showAll_goodsWrap = $(".showAll_goodsWrap").offset().top;
						$("html, body").animate({scrollTop:showAll_goodsWrap},500);
					})
				}
			});
		</script><!--상품 품종별로 보기 버튼-->
		<script type="text/javascript">
			$(function(){
				$(".feel_review").hide();
				$(".showAll_goods a p").bind("mouseover focus",function(){
					$(this).children(".feel_review").css({"display":"block"});
				}).bind("mouseleave focusout",function(){
					$(this).children(".feel_review").css({"display":"none"});
				});
			});

		</script><!--매니져 상품평 한줄 스크립트-->
<%@include file="/include/footer.jsp"%>