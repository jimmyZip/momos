<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp"%>
	<div class="greenBeen_container">
		<ul class="pageRoute">
			<li><a href="index.jsp" title="메인 홈">HOME</span></li>
			<li>
				<a href="/pages/sub2_1.jsp" title="GREEN BEAN">GREEN BEAN &nbsp;▼</a>
				<ul>
					<li><a href="/pages/sub2_1.jsp" title="GOODs">GOODs</a></li>
					<li><a href="/pages/sub2_2.jsp" title="GREEN BEEN">GREEN BEAN</a></li>
				</ul>
			</li>
		</ul><!--◁ 페이지 경로 ▷-->
		<section id="content">
			<h2 class="hidden">아웃리치</h2>
			<div class="preparing">
				<p class="imgArea">
					<img src="/asset/img/ready_img.jpg" alt="준비중 이미지"/>
				</p>
				<p class="textArea">
					<strong>현재페이지 <span style="color:#00f">준비중</span>입니다.</strong><br/>
					<span class="readyDesc">
						현재 페이지는 관련자료 준비중에 있습니다.<br/>
						빠른 시일 안에 정상 서비스 하도록 하겠습니다.
					</span>
				</p>
				<a href="index.jsp" title="메인페이지로 이동"><span>&lt;</span>&nbsp;&nbsp;메인 페이지로 이동</a>
			</div>
		</section><!--◁ content ▷-->
	</div>
<%@include file="/include/footer.jsp"%>