<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Auth> authList = (List)request.getAttribute("authList");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css" />
	<script type="text/javascript" src="/asset/js/page_related/index.js"></script>
	<script type="text/javascript" src="/asset/js/admin/auth.js"></script>
	
	<title>momos_관리자용 페이지_권한관리</title>
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
					<table class="table_basic">
						<thead>
							<tr>
								<th>이름 &nbsp;<button onClick="authAdd()">신규추가</button></th>
								<th>권한 수정</th>
								<th>멤버 관리</th>
								<th>게시판 관리</th>
								<th>리뷰 관리</th>
								<th>리뷰 코멘트 관리</th>
								<th>상품 관리</th>
								<th>지점 관리</th>
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