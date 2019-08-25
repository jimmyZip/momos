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
		<div id="container">
			<!-- 페이지경로 -->
			<ul class="pageRoute">
				<li><span>ABOUT</span></li>
				<li>
					<a href="/pages/sub1_5.jsp" title="OUTREACH">OUTREACH &nbsp;▼</a>
					<%@include file="/include/client/philo_sub_nav.jsp" %>
				</li>
			</ul><!--◁ 페이지 경로 ▷-->
			<!-- 페이지경로 -->
			<section id="content">
				<h2 class="hidden">아웃리치</h2>
				<%@include file="/include/preparing.jsp" %>
			</section>
		</div><!--◁ content ▷-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>