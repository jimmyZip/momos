<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/idpw.css" />
	<script type="text/javascript">
		$(function(){
			$(".boxC, .boxD").hide();
			$(".boxA").delay(3500).fadeOut(500);
			$(".boxB .box2").delay(4500).animate({"width":"346px"},500, "linear");
			$(".boxB .box1").delay(5000).animate({"height":"141px"},500, "linear");
			$(".boxB .box4").delay(5500).animate({"width":"346px"},500, "linear");
			$(".boxB .box3").delay(6000).animate({"height":"141px"},500, "linear");
			$(".boxB").delay(6500).fadeOut(500);
			$(".boxC").delay(6000).fadeIn(2000);
		});
		function loginByEnter(){
			if(event.keyCode==13){
				login();
			}
		}
		function login(){
			var userid=document.getElementById("userid");
			var userpass=document.getElementById("userpass");
			if(userid.value!=null && userpass.value!=null){
				$("form[name='loginForm']").attr({
					method:"post",
					action:"/member/login"
				});
				$("form[name='loginForm']").submit();
			}
		}
	</script>
	<script type="text/javascript" src="/asset/js/member/modal.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp"%>
		<div class="login_container">
			<p class="topLine"></p>
			<section class="login_content">
				<h2 class="hidden">로그인 영역</h2>
				<div class="welcome">
					<div class="login_imgArea">
						<ul class="box boxA">
							<li class="hBox box1"></li>
							<li class="wBox box2"></li>
							<li class="hBox box3"></li>
							<li class="wBox box4"></li>
						</ul>
						<ul class="box boxB">
							<li class="hBox box1"></li>
							<li class="wBox box2"></li>
							<li class="hBox box3"></li>
							<li class="wBox box4"></li>
						</ul>
						<p class="box boxC">
							<img src="/asset/img/logoAni.png" alt="logoImg" />
						</p>
					</div>
					<p class="login_textArea">
						MOMOS COFFEE에 오신것을 환영합니다.
					</p>
				</div>
				<!-- <form action="php/04_login_control.php" method="post"> -->
				<form name="loginForm">
					<div id="idPw">
						<p>
							<input id="userid" type="text" name="userid" title="ID 입력" placeholder="아이디를 입력해주세요." maxlength="10"/>
						</p>
						<p>
							<input id="userpass" type="password" name="userpass" title="PW 입력" placeholder="비밀번호를 입력해주세요" maxlength="8" onKeyDown="loginByEnter()"/>
						</p>
					</div>
					<div class="logBtn">
						<input type="button" id="btnLog" title="로그인버튼" value="로그인" onClick="login()"/>
					</div>
					<div class="joinMember">
						<a href="javascript:findIdModal();" title="아이디 찾기">아이디 찾기</a><span>|</span>
						<a href="javascript:resetPassModal();" title="비밀번호 재설정">비밀번호 재설정(분실찾기)</a><span>|</span>
						<a href="/member/goRegist" title="회원가입">회원가입</a>
					</div>
				</form>
			</section>
		</div>
		<%@include file="/include/footer.jsp"%>
	</div>
	<div id="modal_full"></div>
	<div id="modal_view"></div>
	<p class="closeModal">닫기</p>
</body>
</html>