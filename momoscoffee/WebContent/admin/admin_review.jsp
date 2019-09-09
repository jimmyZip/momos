<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css"/>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/review.css"/>
	<style type="text/css">
		.page_href{
			display:unset;
		}
	</style>
	<script type="text/javascript" src="/asset/js/admin/review.js"></script>
	<title>momos_관리자용 페이지_리뷰관리</title>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="main_container">	
			<%@include file="/include/adminSubHeader.jsp" %>
			<div class="admin_container">
				<!-- admin side menu starts -->
				<%@include file="/include/adminSide.jsp" %>
				<!-- admin side menu ends -->
				<section id="adminContents">
					<form id="prodForm" enctype="multipart/form-data" name="prodForm">
						
					</form>
					<div class="infoBtnZone">
						<div class="summInfo">
							<span>총 리뷰 수 :</span>&nbsp;<i></i>,&nbsp;
							<span>검색리뷰 수 :</span>&nbsp;<i></i>
						</div>
						<div class="review_btn_zone">
							<button id="showAllProdBtn" onClick="showAllProd()">전체상품보기</button>
							<button id="registProdBtn" onClick="registProd()">상품등록</button>
							<button id="editProdBtn" onClick="updateProd()">상품수정</button>
							<button id="deleteProdBtn" onClick="deleteProd()">선택상품삭제</button>
							<button id="checkAllBtn" onClick="checkAll()">전체선택/해제</button>					
							<button id="saveAsExcelBtn" onClick="saveAsExcel()">전체목록 Excel 저장</button>
						</div>
					</div>
					<table class="table_basic">
						<thead>
							<tr>
								<th>선택</th>
								<th>순서</th>
								<th>대분류</th>
								<th>소분류</th>
								<th>이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>재고수량</th>
								<th>설명</th>
							</tr>
						</thead>
						<tbody id="container">
							
						</tbody>				
					</table>
				</section>
			</div>
		</div>
		<!--◀ container ▶-->
		<%@include file="/include/footer.jsp" %>
	</div>
</body>
</html>