<%@page import="com.jimmyzip.momos.model.domain.board.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Freeboard board = (Freeboard)request.getAttribute("board_info");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css"/>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/board_detail.css"/>
	<script src="https://cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
	<script type="text/javascript" src="/asset/js/admin/board_detail.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="main_container">	
			<h2 class="green">모모스커피 게시판 상세페이지</h2>
			<div class="admin_container">
				<!-- admin side menu starts -->
				<%@include file="/include/adminSide.jsp" %>
				<!-- admin side menu ends -->
				<section id="adminContents">
					<div id="contentInnerWrap">
						<div id="infoArea">
							<input type="hidden" name="board_id" value="<%=board.getBoard_id()%>">
							<input type="hidden" name="member_id" value="<%=board.getMembers().getMember_id()%>">
							 <ul>
							 	<li class="infoRow boardTitle">
									<label for="title">제목</label><input type="text" id="title" name="title" value="<%=board.getTitle()%>" readonly>
							 	</li>
							 	<li class="infoRow boardWriter">
									<label for="writer">작성자ID</label><input type="text" id="writer" name="writer" value="<%=board.getMembers().getUserid()%>" readonly>
							 	</li>
								<li class="infoRow boardDate">
									<p class="left">
										<label for="wdate">작성일시</label><input type="text" id="wdate" name="wdate" value="<%=board.getWdate()%>" readonly>
									</p>
									<p>
										<label for="modidate">최종수정일시</label><input type="text" id="modidate" name="modidate" value="<%=board.getModidate()%>" readonly>
									</p>
								</li>
								<li class="infoRow ipHit">
									<p class="left">
										<label for="ip">작성자ip</label><input type="text" id="ip" name="ip" value="<%=board.getIp()%>" readonly>
									</p>
									<p>
										<label for="hit">조회수</label><input type="text" id="hit" name="hit" value="<%=board.getHit()%>" readonly>
									</p>
								</li>
							</ul>
							<!-- 
							<ul>
							 	<li class="infoRow boardTitle">
									<label for="title">제목</label><input type="text" id="title" name="title" value="" readonly>
							 	</li>
							 	<li class="infoRow boardWriter">
									<label for="writer">작성자ID</label><input type="text" id="writer" name="writer" value="" readonly>
							 	</li>
								<li class="infoRow boardDate">
									<p class="left">
										<label for="wdate">작성일시</label><input type="text" id="wdate" name="wdate" value="" readonly>
									</p>
									<p>
										<label for="modidate">최종수정일시</label><input type="text" id="modidate" name="modidate" value="" readonly>
									</p>
								</li>
								<li class="infoRow ipHit">
									<p class="left">
										<label for="ip">작성자ip</label><input type="text" id="ip" name="ip" value="" readonly>
									</p>
									<p>
										<label for="hit">조회수</label><input type="text" id="hit" name="hit" value="" readonly>
									</p>
								</li>
							</ul>
							 -->
						</div>
						<textarea id="content" name="content" style="height: 200px" readonly></textarea>
					</div>
					<div class="btnZone">
						<%-- <button id="delBtn" onClick="deleteThisArticle(<%=board.getBoard_id()%>)">게시글 삭제</button> --%>
						<button id="delBtn" onClick="deleteThisArticle()">게시글 삭제</button>
						<button id="showAllBoardBtn" onClick="showAllBoard()">지점관리목록으로</button>
					</div>
				</section>
			</div>
		</div>
		<!--◀ container ▶-->
		<%@include file="/include/footer.jsp" %>
	</div>
</body>
</html>