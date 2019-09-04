<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/client/board_detail.css" />
	<script type="text/javascript" src="/asset/js/client/board_detail.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="notice_container">
			<p class="topLine"></p>
			<section class="notice_content">
				<h2>MOMOS BOARD<span style="color:red">DETAIL</span></h2>
				<form name="update-form">
					<c:set var="board" value="${board}"/>
					<input type="hidden" name="member_id" value="${members.member_id }"/>
					<input type="hidden" name="board_id" value="${board.board_id }"/>
					<p>
						<label for="title">제목</label><input id="title" type="text" name="title" value="${board.title }" required readonly/>
					</p>
					<p>
						<label for="userid">작성자</label><input id="userid" type="text" name="userid" value="${board.members.userid}" readonly/>
					</p>
					<p>
						<label for="ip">작성자ip</label><input id="ip" type="text" name="ip" value="${board.ip}" readonly/>	
					</p>
					<p>
						<label for="wdate">작성시간</label><input id="wdate" type="text" name="wdate" value="${board.wdate}" readonly/>	
					</p>
					<p class="content">
						<textarea id="content" name="content"  readonly/>${board.content }</textarea>
					</p>
				</form>
			</section><!--◁ content ▷-->
			<div id="btnArea">
				<button id="editBtn" onClick="edit('${board.board_id}','${members.userid}')">글수정</button>
				<button id="saveUpdate" onClick="editBoard()" disabled>변경사항저장</button>
				<button id="delBtn" onClick="del('${board.board_id}','${members.userid}')">글삭제</button>
				<button onClick="backToList()">글목록</button>
			</div>
		</div><!--◀ container ▶-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>