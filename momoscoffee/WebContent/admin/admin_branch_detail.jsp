<%@page import="com.jimmyzip.momos.model.domain.branch.BranchImage"%>
<%@page import="com.jimmyzip.momos.model.domain.branch.Branch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Branch branch = (Branch)request.getAttribute("branch_info");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css"/>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/branch_detail.css"/>
	<script type="text/javascript" src="/asset/js/admin/branch_detail.js"></script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="main_container">	
			<h2 class="green">모모스커피 <%=branch.getBranch_name() %>지점 상세페이지</h2>
			<div class="admin_container">
				<!-- admin side menu starts -->
				<%@include file="/include/adminSide.jsp" %>
				<!-- admin side menu ends -->
				<section id="adminContents">
					<div id="contentInnerWrap">
						<div class="visual_wrap">
							<h3><%=branch.getBranch_name() %> 이미지</h3>
							<%-- <div class="screen">
								<ul class="film">
									<%for(int i=0;i<branch.getBranchImage().size();i++){ %>
										<%BranchImage img = branch.getBranchImage().get(i); %>
										<li class="scene">
											<img src="/data/<%=img.getBranch_img()%>" alt="지점이미지<%=i %> class="film<%=i%>"/>
										</li>
									<%} %>
								</ul>
							</div> --%>
							<div class="mask">
								<div class="imgFrame">
									<%for(int i=0;i<branch.getBranchImage().size();i++){ %>
										<%BranchImage img = branch.getBranchImage().get(i);%>
										<img class="branchImg" src="/data/<%=img.getBranch_img()%>"/>
									<%} %>
								</div>
							</div>
							<div id="imgController">
								<%for(int i=0;i<branch.getBranchImage().size();i++){ %>
									<span onClick="setZindex(<%=i%>)"></span>
								<%} %>
							</div>
						</div>
					</div>
					<div class="infoBtnZone">
						<ul class="info_zone">
							<li class="info info_msg">
								<span>메시지</span>
								<%=branch.getMessage() %>
							</li>
							<li class="info info_addr">
								<span>매장주소</span>
								<%=branch.getBranch_addr() %>
							</li>
							<li class="info info_tel">
								<span>매장전화번호</span>
								<%=branch.getBranch_tel() %>
							</li>
							<li class="info info_time">
								<span>매장운영시간</span>
								<i>오픈시간 : </i><%=branch.getOpen_h() %>&nbsp;~&nbsp;<i>마감시간 : </i><%=branch.getClose_h() %><b>마지막주문 접수시간 : </b><%=branch.getLast_order() %>
							</li>
						</ul>
						<div class="btn_zone">
							<button id="showAllBranchBtn" onClick="showAllBranch()">지점목록으로</button>
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