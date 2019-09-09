<%@page import="com.jimmyzip.momos.model.domain.product.Subcategory"%>
<%@page import="com.jimmyzip.momos.model.domain.product.Topcategory"%>
<%@page import="com.jimmyzip.momos.model.domain.product.Product"%>
<%@page import="com.jimmyzip.momos.common.Pager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css"/>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/product.css"/>
	<style type="text/css">
		.page_href{
			display:unset;
		}
	</style>
	<script type="text/javascript" src="/asset/js/page_related/index.js"></script>
	<script type="text/javascript" src="/asset/js/admin/product.js"></script>
	<title>momos_관리자용 페이지_상품관리</title>
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
						<ul class="regist_zone">
							<li class="regist_row">
								<div class="regist_label cate_label">
									<span>상품분류</span>
									<select id="topSelect" onChange="getSubList(this.value)">
									</select>
									<!-- <select id="subSelect" name="subcategory_id" onChange="getSortProdList(this.value)">
									</select> -->
									<select id="subSelect" name="subcategory_id" onChange="getSortProdList(this.value)">
									</select>
								</div>
								<div class="regist_label prod_search">
									<span>상품검색</span>
									<%if(request.getParameter("prodSearch")==null){ %>
										<input type="text" placeholder="검색어 입력" id="prodSearch" onkeydown="prodSearchKey()"/>
									<%}else{ %>
										<input type="text" placeholder="검색어 입력" id="prodSearch" onkeydown="prodSearchKey()"/>
									<%} %>
								</div>
							</li>
							<li class="regist_row">
								<div class="regist_label name_label">
									<span>상품명</span>
									<input type="text" name="prod_name_kor" placeholder="상품명(한글, 필수)" required="required"/>
									<input type="text" name="prod_name_eng" placeholder="영문명(선택)"/>
								</div>
								<div class="regist_label price_label">
									<span>상품가격</span>
									<input type="text" name="price" placeholder="상품가격입력" required="required"/>
								</div>
							</li>
							<li class="regist_row">
								<div class="regist_label img_label">
									<span>이미지</span>
									<input id="fake_input" class="fake_input" type="text" value="선택 파일명" disabled="disabled"/>
									<!-- <input class="hidden" type="file" id="prod_img" name="prod_img" multiple/> -->
									<input class="hidden" type="file" id="prod_img" name="myFile" multiple="multiple" onChange="getImgInfo(this)"/>
									<label for="prod_img">업로드 파일 선택</label>
								</div>
								<div class="regist_label stock_label">
									<span>재고수량</span>
									<input type="number" name="stock" value="0" min="0" step="1"/>
								</div>
							</li>
							<li class="regist_row">
								<div class="regist_label desc_label">
									<span>상품설명</span>
									<textarea name="prod_desc" placeholder="describe product here"></textarea>
								</div>
							</li>
						</ul>
					</form>
					<div class="infoBtnZone">
						<div class="summInfo">
							<span>총 상품 수 :</span>&nbsp;<i></i>,&nbsp;
							<span>검색상품수 :</span>&nbsp;<i></i>
						</div>
						<div class="prod_btn_zone">
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