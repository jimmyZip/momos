<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div id="sub1-2_container">
			<ul class="pageRoute">
				<li><span>ABOUT</span></li>
				<li>
					<a href="/pages/sub1_2.jsp" title="HISTORY">HISTORY &nbsp;▼</a>
					<%@include file="/include/client/philo_sub_nav.jsp" %>
				</li>
			</ul><!-- 페이지 경로 -->
			<div class="history_visualWrap">
				<h2 class="hidden">서브 이미지 영역</h2>
				<p class="history_visualText">
					<strong>HISTORY</strong><br/>
					<span>걸어온 길</span>
				</p>
			</div><!-- visual -->
			<section class="history_content">
				<h2 class="hidden">모모스 연혁</h2>
				<div class="yearBg">
					<p class="yearArea">
						<span>2007</span>
						<span>2008</span>
						<span>2009</span>
						<span>2010</span>
						<span>2011</span>
						<span>2012</span>
						<span>2016</span>
					</p>
				</div>
				<script type="text/javascript">
					$(function(){
						/*
						var efe= $(".history_visualWrap").width();
						alert(efe);*/
						$(".yearBg").hide();
						
						$(window).scroll(function(){
							var nowScroll = $(document).scrollTop();
							//console.log(nowScroll);
							if(nowScroll>250 && nowScroll<5400){
								$(".yearBg").fadeIn();
							}else{
								$(".yearBg").fadeOut();
							}
						});
						// .yearArea span[0] = "2007" 이 스크롤값 250~700 사이에만 나타나게 한다. 그 이외는 사라지게 한다.
						// .yearArea span[0] = "2008" 이 스크롤값 700~1000 사이에만 나타나게 한다. 그 이외는 사라지게 한다. 
						$(window).scroll(function(){
							var years = $(".yearArea").children();
							var nowScroll = $(document).scrollTop();
							if(nowScroll>250 && nowScroll<1000){
								$(years).css({"opacity":"0"});
								$(years[0]).css({"opacity":"1"});
							}else if(nowScroll>=1000 && nowScroll<1600){
								$(years).css({"opacity":"0"});	
								$(years[1]).css({"opacity":"1"});
							}else if(nowScroll>=1600 && nowScroll<2000){
								$(years).css({"opacity":"0"});	
								$(years[2]).css({"opacity":"1"});
							}else if(nowScroll>=2000 && nowScroll<3000){
								$(years).css({"opacity":"0"});	
								$(years[3]).css({"opacity":"1"});
							}else if(nowScroll>=3000 && nowScroll<4000){
								$(years).css({"opacity":"0"});	
								$(years[4]).css({"opacity":"1"});
							}else if(nowScroll>=4000 && nowScroll<5000){
								$(years).css({"opacity":"0"});	
								$(years[5]).css({"opacity":"1"});
							}else if(nowScroll>=5000 && nowScroll<5400){
								$(years).css({"opacity":"0"});	
								$(years[6]).css({"opacity":"1"});
							}
						});
					});
				</script><!-- history 연도 변경 스크립트 영역 -->
				<ul class="history_list">
					<li class="history_left history0">
						<p class="history_textARea">
							<strong>TAKEOUT SHOP OPEN</strong>
							<span>젊음.열정 이라는 단어가 절대 부끄럽지 않을 ,<br/>
							그 누구 보다 야심차게 준비하여<br/>
							2007년 5월에 오픈을 하게 되었습니다.</span>
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm0">
								<li class="history_scene">
									<img src="/asset/img/sub1_2/history0_a.jpg" alt="takeout 오픈0" />
								</li>
								<li class="history_scene">
									<img src="/asset/img/sub1_2/history0_b.jpg" alt="takeout 오픈1" />
								</li>
								<li class="history_scene">
									<img src="/asset/img/sub1_2/history0_c.jpg" alt="takeout 오픈2" />
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn0">
									<img src="/asset/img/sub1_2/imgArrow_R.png" alt="next버튼" />
								</p>
								<p class="history_prevBtn history_prevBtn0">
									<img src="/asset/img/sub1_2/imgArrow_L.png" alt="prev버튼" />
								</p>
							</div>
						</div>
					</li>
					<li class="history_right history1">
						<p class="history_textArea">
							<strong>'야시' ROASTERY SHOP OPEN</strong>
								<span>
									사무실이었던 공간에 후지로얄로스터를 넣고,<br/>
									손님들이 앉으실 수 있는 의자를 몇개 두어,<br/>
									아기자기한 로스터리샵을 OPEN!
								</span>	
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm1">
								<li class="history_scene">
									<img src="img/sub1_2/history1_0.jpg" alt="로스터리샵 오픈0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history1_1.jpg" alt="로스터리샵 오픈1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history1_2.jpg" alt="로스터리샵 오픈2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn1"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn1"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_left history2">
						<p class="history_textArea">
							<strong>2층 증축 OPEN</strong>
							<span>
								지금도 그대로 남아있는 공간들이 구석구석 있죠.<br/>
								이제,정말 시작하는 모모스입니다.<br/>
								2층으로 올라가는 나무계단이 너무 이쁘죠.<br/>
								이~쁜 나무계단으로 올라가면 2층매장이 나옵니다.
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm2">
								<li class="history_scene">
									<img src="img/sub1_2/history2_0.jpg" alt="2층 증축0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history2_1.jpg" alt="2층 증축1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history2_2.jpg" alt="2층 증축2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn2"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn2"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_right history3">
						<p class="history_textArea">
							<strong>1층 확장 OPEN</strong>
							<span>
								매일 매일 커피에 대한 열정으로<br/>
								하루하루를 성장해 나가는 모모스!<br/>
								성원에 힘입어 1층을 확장하게 되었어요.<br/>
								1층에 이쁜 계단 생겼고 전체적으로 분위가가  Up Up!
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm3">
								<li class="history_scene">
									<img src="img/sub1_2/history3_0.jpg" alt="1층 확장0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history3_1.jpg" alt="1층 확장1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history3_2.jpg" alt="1층 확장2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn3"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn3"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_right history5">
						<p class="history_textArea">
							<strong>원두 제조 및 유통사업 런칭</strong>
							<span>
								"부산에서만 80여 개 카페가 우리 원두를 받아서 쓰고 있습니다.<br/>
								이제는 카페를 넘어 명실상부한 커피회사로 성장 중이죠.<br/>
								홍콩에서 저희 원두를 구매하는 카페도 있습니다.<br/>
								사장님이 소문을 듣고 우리 카페에 찾아왔다가 계속 원두를 구입해서 쓰고 계세요."
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm5">
								<li class="history_scene">
									<img src="img/sub1_2/history5_0.jpg" alt="원두유통사업 런칭0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history5_1.jpg" alt="원두유통사업 런칭1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history5_2.jpg" alt="원두유통사업 런칭2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn5"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn5"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_left history6">
						<p class="history_textArea">
							<strong>커피 LAB &amp; 커피아카데미 개원</strong>
							<span>
								새로운 공간에서 커피에 대한 열정으로  갖가지 연구를 병행할 커피 LAB<br/>
								라마르조꼬 리네아와 란실리오 클라세10이 준비되어있는 강의실
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm6">
								<li class="history_scene">
									<img src="img/sub1_2/history6_0.jpg" alt="커피랩_아카데미 개원0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history6_1.jpg" alt="커피랩_아카데미 개원1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history6_2.jpg" alt="커피랩_아카데미 개원2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn6"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn6"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_right history7">
						<p class="history_textArea">
							<strong>생두 창고 설립</strong>
							<span>
								벌레잡아주는 쎄스코와 항온항습기가 설치 되어있으며<br/>
								18'C~20'C 사이의 온도와 40~60% 의 습도를 유지하고 있습니다.<br/>
								외부의 영향을 최소화 하기 위해 모모스 생두창고의 모든벽면에는<br/>
								은박으로 방습방온 시스템을 갖추고 있습니다.
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm7">
								<li class="history_scene">
									<img src="img/sub1_2/history7_0.jpg" alt="생두창고 설립0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history7_1.jpg" alt="생두창고 설립1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history7_2.jpg" alt="생두창고 설립2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn7"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn7"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_left history8">
						<p class="history_textArea">
							<strong>온라인 쇼핑몰 사업 런칭</strong>
							<span>
								모모스에 새 보금자리가 생겼습니다.<br/>
								모모스 공식홈페이지(www.momos.co.kr)에 방문하여<br/>
								알찬 정보와 따끈한 새소식을 더가까이 만나보세요!!
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm8">
								<li class="history_scene">
									<img src="img/sub1_2/history8_0.jpg" alt="온라인 쇼핑몰사업 런칭0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history8_1.jpg" alt="온라인 쇼핑몰사업 런칭1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history8_2.jpg" alt="온라인 쇼핑몰사업 런칭2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn8"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn8"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_right history9">
						<p class="history_textArea">
							<strong>산지직거래(Direct Trading) 사업 런칭</strong>
							<span>
								모모스는 커피 산지 농장과의 직거래 (Direct Trade)를 통해<br/>
								생산자에게 적절한 가격을 지불하고 수입한 신선하고 퀄리티 높은 커피로<br/>
								소비자들에게 건강한 먹거리와 정직한 정보 제공을 하여,<br/>
								모두 함께 커피를 즐길 수 있기를 바랍니다
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm9">
								<li class="history_scene">
									<img src="img/sub1_2/history9_0.jpg" alt="산지직거래 사업 런칭0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history9_1.jpg" alt="산지직거래 사업 런칭1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history9_2.jpg" alt="산지직거래 사업 런칭2"/>
								</li>
							</ul>
							<div class="history_imgBtn">
								<p class="history_nextBtn history_nextBtn9"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn9"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
					<li class="history_left history10">
						<p class="history_textArea">
							<strong>모모스 센텀시티점 오픈</strong>
							<span>
								모모스커피의 기존에서 한층 더 성숙해진 모습으로<br/>
								새로운 공간에서의 향기로운 두번째 여정
							</span>								
						</p>
						<div class="history_imgScreen">
							<ul class="history_imgFilm history_imgFilm10">
								<li class="history_scene">
									<img src="img/sub1_2/history10_0.jpg" alt="센텀시티점 오픈0"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history10_1.jpg" alt="센텀시티점 오픈1"/>
								</li>
								<li class="history_scene">
									<img src="img/sub1_2/history10_1.jpg" alt="센텀시티점 오픈2"/>
								</li>
							</ul>
							<div class	="history_imgBtn">
								<p class="history_nextBtn history_nextBtn10"><img src="img/sub1_2/imgArrow_R.png" alt="다음버튼"/></p>
								<p class="history_prevBtn history_prevBtn10"><img src="img/sub1_2/imgArrow_L.png" alt="이전버튼"/></p>
							</div>
						</div>
					</li>
				</ul>
				<script type="text/javascript">
					$(function(){
						$(window).resize(function(){
							$(".history_nextBtn").click();
						});	
						width = $(".history_imgScreen").width();
						//스크린 각각의 맨 마지막 사진이 필름 앞으로 오게끔
						for(var i=0;i<11;i++){
							$(".history"+i+" .history_imgFilm").prepend($(".history"+i+" .history_scene:last"));
						}
						$(".history_imgFilm").css({"marginLeft":"-"+width+"px"});
						
						//다음 버튼을 누르면 이미지가 왼쪽으로 넘어가도록
						for(var x=0;x<11;x++){
							slide_next(x);
						}
						
						function slide_next(x){
							$(".history_nextBtn"+x).click(function(){
								width=$(".history_imgScreen").width();
								$(".history_imgFilm"+x+":not(:animated)").stop().animate({"marginLeft":"-="+width+"px"},500,"swing",function(){
									$(".history_imgFilm"+x).append($(".history_imgFilm"+x+" li:first"));
									$(".history_imgFilm"+x).css({"marginLeft":"-"+width+"px"});	
								});
							});
						}
						
						//이전 버튼 누르면 이미지가 오른쪽으로 넘어가게 만들기
						for(var y=0; y<11; y++){
							slide_prev(y);
						}
						function slide_prev(y){
							$(".history_prevBtn"+y).click(function(){
								width = $(".history_imgScreen").width();
	
								$(".history_imgFilm"+y+":not(:animated)").stop().animate({"marginLeft":"+="+width+"px"},500,"swing",function(){
									$(".history_imgFilm"+y).prepend($(".history_imgFilm"+y+" li:last"));
									$(".history_imgFilm"+y).css({"marginLeft":"-"+width+"px"});	
								});				
	
							});	
						}
					});
				</script>
			</section><!-- history_content -->
		</div><!-- sub1-2 container -->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>