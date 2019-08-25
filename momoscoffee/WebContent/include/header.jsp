<%@page import="com.jimmyzip.momos.model.domain.member.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Members members = (Members)session.getAttribute("members");
%>
<div id="headerWrap">
	<header id="header">
		<a id="navBtn" href="#btn" title="메뉴">
			<span class="bar bar1"></span>
			<span class="bar bar2"></span>
			<span class="bar bar3"></span>
			<span class="arrowBtn arrowBtn1"></span>
			<span class="arrowBtn arrowBtn2"></span>
		</a>
		<a href="#mobileBtn" title="메뉴" id="mobileNavBtn">
			<span class="bar bar1"></span>
			<span class="bar bar2"></span>
			<span class="bar bar3"></span>
			<span class="arrowBtn arrowBtn1"></span>
			<span class="arrowBtn arrowBtn2"></span>
		</a>
		<h1>
			<a href="/index.jsp" title="Go_main_page">
				<img src="/asset/img/logo.png" alt="logo"/>
			</a>
		</h1>
		<div id="fixNav">
			<p class="logoBox">
				<a href="index.jsp" title="메인으로 이동">
					<img src="/asset/img/logo_head.png" alt="로고 이미지" />
				</a>
			</p>
			<ul class="fixGnb">
				<li class="fixGnbList1">
					<a href="/client/pages/philosophy.jsp" title="about" class="fgl">ABOUT</a>
					<ul class="fix_subNav">
						<li><a href="/client/pages/philosophy.jsp" title="PHILOSOPHY">PHILOSOPHY</a></li>
						<li><a href="/client/pages/history.jsp" title="HISTORY">HISTORY</a></li>
						<li><a href="/client/pages/people.jsp" title="PEOPLE">PEOPLE</a></li>
						<li><a href="/client/goLocation" title="LOCATION">LOCATION</a></li>
						<li><a href="/client/pages/outreach.jsp" title="OUTREACH">OUTREACH</a></li>
					</ul>
				</li>
				<li class="fixGnbList2">
					<a href="sub2_1.jsp" title="shop" class="fgl">SHOP</a>
					<ul class="fix_subNav">
						<li><a href="sub2_1.jsp" title="GOODs">GOODs</a></li>
						<li><a href="index.jsp" title="GREEN BEAN" onClick="enterNotice();">GREEN BEAN</a></li>
					</ul>
				</li>
				<li class="fixGnbList3">
					<a href="sub3_1.jsp" title="business" class="fgl">BUSINESS</a>
					<ul class="fix_subNav">
						<li><a href="sub3_1.jsp" title="CAFE">CAFE</a></li>
						<li><a href="sub3_2.jsp" title="DIRECT TRADE">DIRECT TRADE</a></li>
						<li><a href="sub3_3.jsp" title="ROASTERY">ROASTERY</a></li>
						<li><a href="sub3_4.jsp" title="EDUCATION">EDUCATION</a></li>
					</ul>
				</li>
				<li class="fixGnbList4">
					<a href="php/05_list.jsp" title="customer" class="fgl">CUSTOMER</a>
					<ul class="fix_subNav">
						<li><a href="php/05_list.jsp" title="NOTICE">NOTICE</a></li>
						<li><a href="sub4_2.jsp" title="FAQ">FAQ</a></li>
						<li><a href="sub4_3.jsp" title="Q &amp; A">Q &amp; A</a></li>
					</ul>
				</li>
			</ul>
			<ul class="fixInfo">
				<li class="fix_loginBtn">
					<a href="login.jsp" title="로그인 or 회원가입">
						<img src="/asset/img/icons/login.png" alt="로그인 or 회원가입"/>
					</a>
				</li>
				<li class="fix_cartBtn">
					<a href="cart.jsp" title="장바구니">
						<img src="/asset/img/icons/cart.png" alt="장바구니" />
					</a>
				</li>
				<li class="fix_snsBtn">
					<a class="fix_snsBtnIcon" href="#snsIcon" title="sns버튼">
						<img src="/asset/img/icons/sns.png" alt="snsBtnIcon" />
					</a>
					<div class="fix_snsBtnArea">
						<a href="https://www.facebook.com/momoscoffee" title="페이스북"><img src="/asset/img/icons/facebookIcon.png" alt="페이스북 이미지1" /></a>
						<a href="https://www.instagram.com/momos_coffee/" title="인스타그램"><img src="/asset/img/icons/instaIcon.png" alt="인스타그램 이미지1" /></a>
						<a href="blog.naver.com/momoscoffee" title="블로그"><img src="/asset/img/icons/blogIcon.png" alt="블로그 이미지1" /></a>
						<a href="https://twitter.com/momoscoffee" title="트위터"><img src="/asset/img/icons/twitterIcon.png" alt="트위터 이미지1" /></a>
						<a href="cafe.daum.net/CAFEMOMOS" title="다음카페"><img src="/asset/img/icons/daumcafeIcon.png" alt="다음카페 이미지1" /></a>
					</div>
				</li>
			</ul>
		</div>
		<nav id="gnbArea">
			<h2 class="hidden">네비게이션 메뉴</h2>
			<ul id="gnb">
				<li class="navImg">
					<img src="/asset/img/blackcoffee.jpg" alt="모모스 드립커피" />
				</li>
				<li class="navList navAbout">
					<dl>
						<dt>ABOUT</dt>
						<dd>
							<a href="/client/pages/philosophy.jsp" title="PHILOSOPHY">PHILOSOPHY</a>
							<a href="/client/pages/history.jsp" title="HISTORY">HISTORY</a>
							<a href="/client/pages/people.jsp" title="PEOPLE">PEOPLE</a>
							<a href="/client/goLocation" title="LOCATION">LOCATION</a>
							<a href="/client/pages/outreach.jsp" title="OUTREACH">OUTREACH</a>
						</dd>
					</dl>
				</li>
				<li class="navList navShop">
					<dl>
						<dt>SHOP</dt>
						<dd>
							<a href="sub2_1.jsp" title="GOODs">GOODs</a>
							<a href="index.jsp" title="GREEN BEAN" onClick="enterNotice();">GREEN BEAN</a>
						</dd>
					</dl>
				</li>
				<li class="navList navBusiness">
					<dl>
						<dt>BUSINESS</dt>
						<dd>
							<a href="sub3_1.jsp" title="CAFE">CAFE</a>
							<a href="sub3_2.jsp" title="DIRECT TRADE">DIRECT TRADE</a>
							<a href="sub3_3.jsp" title="ROASTERY">ROASTERY</a>
							<a href="sub3_4.jsp" title="EDUCATION">EDUCATION</a>
						</dd>
					</dl>
				</li>
				<li class="navList navCustomer">
					<dl>
						<dt>CUSTOMER</dt>
						<dd>
							<a href="php/05_list.jsp" title="NOTICE">NOTICE</a>
							<a href="sub4_2.jsp" title="FAQ">FAQ</a>
							<a href="sub4_3.jsp" title="Q&amp;A">Q&amp;A</a>
						</dd>
					</dl>
				</li>
			</ul>
		</nav>
		<div id="gnbArea_mobile">
			<ul id="gnbMobile">
				<li class="gnbMobileList">
					<div><em>ABOUT</em><span class="wLine"></span><span class="hLine"></span></div>
					<p>
						<a href="/client/pages/philosophy.jsp" title="PHILOSOPHY">PHILOSOPHY</a>
							<a href="/client/pages/history.jsp" title="HISTORY">HISTORY</a>
							<a href="/client/pages/people.jsp" title="PEOPLE">PEOPLE</a>
							<a href="/client/goLocation" title="LOCATION">LOCATION</a>
							<a href="/client/pages/outreach.jsp" title="OUTREACH">OUTREACH</a>
					</p>
				</li>
				<li class="gnbMobileList">
					<div><em>SHOP</em><span class="wLine"></span><span class="hLine"></span></div>
					<p>
						<a href="sub2_1.jsp" title="GOODs">GOODs</a>
						<a href="index.jsp" title="GREEN BEAN" onClick="enterNotice();">GREEN BEAN</a>
					</p>
				</li>
				<li class="gnbMobileList">
					<div><em>BUSINESS</em><span class="wLine"></span><span class="hLine"></span></div>
					<p>
						<a href="sub3_1.jsp" title="CAFE">CAFE</a>
						<a href="sub3_2.jsp" title="DIRECT TRADE">DIRECT TRADE</a>
						<a href="sub3_3.jsp" title="ROASTERY">ROASTERY</a>
						<a href="sub3_4.jsp" title="EDUCATION">EDUCATION</a>
					</p>
				</li>
				<li class="gnbMobileList">
					<div><em>CUSTOMER</em><span class="wLine"></span><span class="hLine"></span></div>
					<p>
						<a href="sub4_1.jsp" title="NOTICE">NOTICE</a>
						<a href="sub4_2.jsp" title="FAQ">FAQ</a>
						<a href="sub4_3.jsp" title="Q&amp;A">Q&amp;A</a>
					</p>
				</li>
			</ul>
			<div id="mobileSvc">
				<p id="mobileSns">
					<a href="https://m.facebook.com/momoscoffee" title="facebook"><img src="/asset/img/icons/facebookIcon.png" alt="facebook"/></a>
					<a href="https://www.instagram.com/momos_coffee/" title="instagram"><img src="/asset/img/icons/instaIcon.png" alt="instagram"/></a>
					<a href="https://mobile.twitter.com/momoscoffee" title="twitter"><img src="/asset/img/icons/twitterIcon.png" alt="twitter"/></a>
					<a href="https://m.youtube.com/channel/UC9f-9yDLgw5oea1DbKVRHXQ" title="youtube"><img src="/asset/img/icons/youtubeIcon.png" alt="youtube"/></a>
					<a href="http://m.cafe.naver.com/momoscoffee" title="naverblog"><img src="/asset/img/icons/blogIcon.png" alt="naverblog"/></a>
					<a href="http://m.cafe.daum.net/CAFEMOMOS/_rec" title="daumcafe"><img src="/asset/img/icons/daumcafeIcon.png" alt="daumcafe"/></a>
				</p>
			</div>
		</div>         	
		<ul id="infoMenu">
			<li class="loginBtn">
				<a href="/admin/goLogin" title="관리자로그인"><img src="/asset/img/icons/admin.png" alt="관리자로그인" /></a>
				<!-- 
					<div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
				 -->
			</li>
			<li class="loginBtn">
				<a href="/member/goLogin" title="로그인 or 회원가입"><img src="/asset/img/icons/login.png" alt="로그인 or 회원가입" /></a>
			</li>
			<li class="cartBtn">
				<a href="cart.jsp" title="장바구니"><img src="/asset/img/icons/cart.png" alt="장바구니" /></a>
			</li>
			<li class="snsBtn">
				<a class="snsBtn" href="#none" title="sns버튼"><img src="/asset/img/icons/sns.png" alt="snsButtonIcon" /></a>
				<div class="snsBtnArea">
					<a href="https://www.facebook.com/momoscoffee" title="페이스북">
						<img src="/asset/img/icons/facebookIcon.png" alt="페이스북 이미지1"/>
					</a>
					<a href="https://www.instagram.com/momos_coffee/" title="인스타그램">
						<img src="/asset/img/icons/instaIcon.png" alt="인스타그램 이미지1"/>
					</a>
					<a href="http://blog.naver.com/momoscoffee" title="블로그">
						<img src="/asset/img/icons/blogIcon.png" alt="블로그 이미지1"/>
					</a>	
					<a href="https://twitter.com/momoscoffee" title="트위터">
						<img src="/asset/img/icons/twitterIcon.png" alt="트위터 이미지1"/>
					</a>	
					<a href="http://cafe.daum.net/CAFEMOMOS" title="다음카페">
						<img src="/asset/img/icons/daumcafeIcon.png" alt="다음카페 이미지1"/>
					</a>	
				</div>
			</li>
		</ul>
		<%if(members!=null){ %>
         	<!-- member welcome -->
         	<p class="welcomeMan">
         		<span><%=members.getUserid()%>님 환영합니다.</span>
         		<button class="logoutBtn" onClick="logout()">로그아웃</button>
         	</p>
         	<script type="text/javascript">
         		function logout(){
         			if(confirm("로그아웃 하시겠습니까?")){		
         				location.href="/member/logout";
         			}
         		}
         	</script>
         <%}%>
	</header>
</div>
<!-- header -->
