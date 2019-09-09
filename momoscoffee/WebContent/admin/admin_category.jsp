<%@page import="com.jimmyzip.momos.model.domain.product.Topcategory"%>
<%@page import="com.jimmyzip.momos.model.domain.product.Subcategory"%>
<%@page import="com.jimmyzip.momos.common.Pager"%>
<%@page import="java.util.List"%>
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
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/category.css"/>
	<style type="text/css">
		.page_href{
			display:unset;
		}
	</style>
	<!-- <script type="text/javascript" src="/asset/js/page_related/index.js"></script> -->
	<script type="text/javascript" src="/asset/js/admin/category.js"></script>
	<title>momos_관리자용 페이지_카테고리관리</title>
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
					<div id="topManage">
						<div class="cateNameInsert topInsert">
							<h3>상위분류 관리</h3>
							<form name="topcateForm">
								<input type="text" name="topcate_name" placeholder="상위카테고리명 입력"/>
							</form>
							<button id="topcateInsert" onClick="topcateInsert()">등록</button>
						</div>
						<table class="table_basic top_table">
							<thead>
								<tr>
									<th>No</th>
									<th>대분류명</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody id="container">
							</tbody>
						</table>
						<div id="topPaging">
							<!-- 페이징 버튼 zone -->
							
							<!-- 페이징 버튼 zone ends-->
						</div>	
					</div>
					<div id="subManage">
						<div class="cateNameInsert subInsert">
							<h3>하위분류 관리</h3>
							<form name="subcateForm">
								<select name="topcategory_id"></select>
								<input type="text" name="subcate_name" placeholder="하위카테고리명 입력"/>
							</form>
							<button id="subcateInsert" onClick="subcateInsert()">등록</button>
							<div id="topRadioZone"></div>
						</div>
						<table class="table_basic sub_table">
							<thead>
								<tr>
									<th>No</th>
									<th>대분류명</th>
									<th>소분류명</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody id="subContainer">
							</tbody>
						</table>
						<div id="subPaging">						
							<!-- 페이징 버튼 zone -->
							
							<!-- 페이징 버튼 zone ends-->
						</div>		
					</div>
				</section>
			</div>
		</div>
		<!--◀ container ▶-->
		<%@include file="/include/footer.jsp" %>
	</div>
</body>
</html>