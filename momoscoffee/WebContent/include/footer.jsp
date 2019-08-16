<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer">
	<h2 class="hidden">꼬릿말 영역</h2>
	<p class="footerLink">
		<a href="#none" title="이용약관">이용약관</a>
		<a href="#none" title="개인정보 취급방침">개인정보 취급방침</a>
		<a href="#none" title="이메일 무단수집 거부">이메일 무단수집 거부</a>
		<a href="#none" title="사업자정보">사업자정보</a>
		<a href="recruit.jsp" title="채용안내">채용안내</a>
	</p>
	<div class="footerMap">
		<div class="footerLeft">
			<p class="f_logo">
				<img src="/asset/img/logo.png" alt="logo" />
			</p>
			<address>
				부산광역시 금정구 오시게로 18-1(부곡동)<br/>
				대표번호 :<a href="tel:051-512-7036" title="전화번호"> 051-512-7036</a><br/>
				e-mail : 	<a href="#none" title="email">momoscoffee@gmail.com</a>
			</address>
		</div>
		<div class="footerRight">
			<p class="community">
				<a href="https://m.facebook.com/momoscoffee" title="facebook"><img src="/asset/img/icons/facebookIcon.png" alt="facebook"/></a>
				<a href="https://www.instagram.com/momos_coffee" title="instagram"><img src="/asset/img/icons/instaIcon.png" alt="instagram"/></a>
				<a href="https://mobile.twitter.com/momoscoffee" title="twitter"><img src="/asset/img/icons/twitterIcon.png" alt="twitter"/></a>
				<a href="https://m.youtube.com/channel/UC9f-9yDLgw5oea1DbKVRHXQ" title="youtube"><img src="/asset/img/icons/youtubeIcon.png" alt="youtube"/></a>
				<a href="http://m.cafe.naver.com/momoscoffee" title="naverblog"><img src="/asset/img/icons/blogIcon.png" alt="naverblog"/></a>
				<a href="http://m.cafe.daum.net/CAFEMOMOS/_rec" title="daumcafe"><img src="/asset/img/icons/daumcafeIcon.png" alt="daumcafe"/></a>
			</p>
			<p class="copyRight">
				&copy; 2016 LEETAEGYU. &amp; &copy; 2019 JIMMYZIP. <br/>
				All right reserved.
			</p>
		</div>
	</div>
</footer><!-- footer -->
<script type="text/javascript">
	//footer_sns
	$(function(){
		$(".community a").bind("mouseover focus",function(){
			$(this).css({"transform":"scale(1.1)"});
		}).bind("mouseout blur",function(){
			$(this).css({"transform":"scale(1)"});
		});
	});
</script>
<div class="topBtn">
	<a href="#none" title="맨위로 가기">
		<p class="circle1"></p>
		<p class="circle2"></p>
		<span>TOP</span>
	</a>
</div>