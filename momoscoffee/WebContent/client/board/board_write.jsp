<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/client/board_write.css" />
	<script type="text/javascript" src="/asset/js/client/board.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="notice_container">
			<p class="topLine"></p>
			<section class="notice_content">
				<h2>MOMOS BOARD<span style="color:red">WRITE</span></h2>
				<form name="regist-form">
					<input type="hidden" name="member_id" value="${members.member_id }"/>
					<input type="hidden" name="ip" value="${clientIp}"/>
					<p>
						<label for="title">제목</label><input id="title" type="text" name="title" required/>
					</p>
					<p>
						<label for="userid">작성자</label><input id="userid" type="text" name="userid" value="${members.userid }" readonly/>
					</p>
					<p class="content">
						<textarea id="content" name="content" placeholder="Put your Content here.." onfocus="this.placeholder = ''" onblur="this.placeholder = 'Content'" required/></textarea>
					</p>
				</form>
			</section><!--◁ content ▷-->
			<div id="btnArea">
				<button onClick="registBoard()">글등록</button>
				<button onClick="backToList()">글목록</button>
			</div>
		</div><!--◀ container ▶-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>