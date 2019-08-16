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
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/branch.css"/>
	<style type="text/css">
		.page_href{
			display:unset;
		}
	</style>
	<!-- <script type="text/javascript" src="/asset/js/page_related/index.js"></script> -->
	<!-- 주소를 통한 좌표검색을 위한 api모듈 -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=pg5xr50eua&submodules=geocoder"></script>
	<script type="text/javascript" src="/asset/js/admin/branch.js"></script>
	<title>momos_관리자용 페이지_지점관리</title>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="main_container">	
			<h2 class="green">관리자 지점관리 페이지 입니다.</h2>
			<div class="admin_container">
				<!-- admin side menu starts -->
				<%@include file="/include/adminSide.jsp" %>
				<!-- admin side menu ends -->
				<section id="adminContents">
					<div id="contentInnerWrap">
						<div id="branchSchZone">
							<h3>지점 검색 zone</h3>
							<p class="schByName">
								<input type="text" placeholder="검색어 입력" id="branchSearch" onkeydown="branchSearchKey()"/><button class="searchBtn" onClick="branchSearch()">검색</button>
							</p>
							<div class="selectByLoc">
								<p class="province">
									<select name="provinceSelect">
										<option>특별/광역/도</option>
									</select><!-- 
							   --><button class="searchBtn">검색</button>
								</p>
								<p class="city">
									<select name="citySelect">
										<option>시/군/구</option>
									</select><!-- 
							   --><button class="searchBtn">검색</button>
								</p>
							</div>
						</div>
						<div id="registZone">
							<h3>지점 등록 zone</h3>
							<form id="branchForm" enctype="multipart/form-data" name="branchForm">
								<ul id="registInner">
									<li class="regist_row">
										<div class="regist_label addr_search">
											<span>주소검색</span>
											<input type="text" name="addrSearch" placeholder="도로명 주소를 입력해주세요" id="addrSearch" onkeydown="addrSearchKey()"/>
										</div>
									</li>
									<li class="regist_row">
										<div class="regist_label name_label">
											<span>지점명</span>
											<input type="text" name="branch_name" required="required"/>
										</div>
										<div class="regist_label tel_label">
											<span>전화번호</span>
											<input type="tel" name="branch_tel" placeholder="ex) 000-0000-0000" required="required" onblur="focusMove()"/>
										</div>
									</li>
									<li class="regist_row">
										<div class="regist_label addr_label">
											<span>지점주소</span>
											<input type="text" name="branch_addr" readonly onClick="alert('수정은 상단의 주소검색을 통해서 해주세요.')"/>
											<input type="hidden" name="longi"/>
											<input type="hidden" name="lati"/>											
										</div>
									</li>
									<li class="regist_row">
										<div class="regist_label msg_label">
											<span>Message</span>
											<input type="text" name="message" placeholder="매장을 표현하는 문구,슬로건,메시지"/>										
										</div>
									</li>
									<li class="regist_row">
										<div class="regist_label time_label">
											<span>운영시간</span>
											<label for="open_h">open</label><input id="open_h" type="time" name="open_h"/>&nbsp;
											<label for="close_h">close</label><input id="close_h" type="time" name="close_h"/>&nbsp;
											<label for="last_order">주문마감</label><input id="last_order" type="time" name="last_order"/>
										</div>
									</li>
									<li class="regist_row">
										<div class="regist_label img_label">
											<span>매장이미지</span>
											<input id="fake_input" class="fake_input" type="text" value="선택 파일명" disabled="disabled"/>
											<input id="multiFile" class="hidden" type="file" name="branchFile" multiple="multiple" onChange="getImgInfo(this)"/>
											<label for="multiFile">업로드 파일 선택</label>
										</div>
									</li>
								</ul>
							</form>
						</div>
					</div>
					<div class="infoBtnZone">
						<div class="summInfo">
							<span>총 상품 수 :</span>&nbsp;<i></i>,&nbsp;
							<span>검색상품수 :</span>&nbsp;<i></i>
						</div>
						<div class="prod_btn_zone">
							<button id="showAllBranchBtn" onClick="showAllBranch()">전체지점보기</button>
							<button id="registBranchBtn" onClick="registBranch()">지점등록</button>
							<button id="editBranchBtn" onClick="updateBranch()">지점정보수정</button>
							<button id="deleteBranchBtn" onClick="deleteBranch()">선택지점삭제</button>
							<button id="checkAllBtn" onClick="checkAll()">전체선택/해제</button>					
							<button id="saveAsExcelBtn" onClick="saveAsExcel()">전체목록 Excel 저장</button>
						</div>
					</div>
					<table class="table_basic">
						<thead>
							<tr>
								<th>선택</th>
								<th>No</th>
								<th>지점명</th>
								<th>주소</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody id="container"></tbody>				
					</table>
				</section>
			</div>
		</div>
		<!--◀ container ▶-->
		<%@include file="/include/footer.jsp" %>
	</div>
</body>
</html>