<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Pager pager = (Pager)request.getAttribute("pager");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css"/>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/board.css"/>
	<style type="text/css">
		.page_href{
			display:unset;
		}
	</style>
	<script type="text/javascript" src="/asset/js/admin/board.js"></script>
	<title>momos_관리자용 페이지_게시판관리</title>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="main_container">	
			<h2 class="green">관리자 게시판관리 페이지 입니다.</h2>
			<div class="admin_container">
				<!-- admin side menu starts -->
				<%@include file="/include/adminSide.jsp" %>
				<!-- admin side menu ends -->
				<section id="adminContents">
					<div id="boardSchZone">					
						<h3>게시글 검색 zone</h3>
						<p class="schBoard">
							<input type="text" placeholder="검색어(제목 또는 내용) 입력" id=""/>
						</p>
					</div>
					<div class="infoBtnZone">
						<div class="summInfo">
							<span>총 게시글 수 :</span>&nbsp;<i></i>,&nbsp;
							<span>검색목록수 :</span>&nbsp;<i></i>
						</div>
						<div class="board_btn_zone">
							<button id="showAllBoardBtn" onClick="showAllBranch()">전체글보기</button>
							<button id="checkAllBtn" onClick="checkAll()">전체선택/해제</button>
							<button id="selectByIP" onClick="selectByIp()">선택IP글 모아보기</button>
							<button id="selectByMember" onClick="selectByMember()">선택작성자글 모아보기</button>					
							<button id="deleteBranchBtn" onClick="deleteBranch()">선택글삭제</button>
						</div>
					</div>
					<table class="table_basic sub_table">
						<thead>
							<tr>
								<th>선택</th>
								<th>No</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성자</th>
								<th>게시일시</th>
								<th>수정일시</th>
								<th>작성ip</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody id="container">
						</tbody>
					</table>
					<!-- 페이징 버튼 zone -->
					<!-- <div id="subPaging">					
					</div> -->		
					<!-- 페이징 버튼 zone ends-->
				</section>
			</div>
		</div>
		<!--◀ container ▶-->
		<%@include file="/include/footer.jsp" %>
	</div>
</body>
</html>