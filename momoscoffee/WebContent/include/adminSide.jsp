<%@page import="com.jimmyzip.momos.model.domain.member.Members"%>
<%@page import="com.jimmyzip.momos.model.domain.member.Auth"%>
<%@page import="com.jimmyzip.momos.common.member.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!Admin admin = new Admin();%>
<%
	Auth auth = ((Members)session.getAttribute("admin")).getAuth();
%>
<div class="sidebar_wrap">
	<h2 class="sidebar_h2">Admin PAGE</h2>
	<ol>
		<%if(auth.isAdmin_assign()){ %>
			<li><a href="#" onClick="location.href='/admin/assign/page'">권한 관리 </a></li>
		<%}%>
		<%if(auth.isProduct_del()) {%>
			<li><a href="#" onClick="location.href='/admin/category/page'">카테고리 관리</a></li>
		<%} %>
		<%if(auth.isProduct_del()) {%>
			<li><a href="#" onClick="location.href='/admin/product/page'">제품 관리</a></li>
		<%} %>
		<%if(auth.isBranch_del()) {%>
			<li><a href="#" onClick="location.href='/admin/branch/page'">지점 관리</a></li>
		<%} %>
		<%if(auth.isMember_del()) {%>
			<li><a href="#" onClick="location.href='/admin/member/page'">맴버 관리</a></li>
		<%}%>
		<%if(auth.isReview_del()) {%>
			<li><a href="#" onClick="location.href='/admin/review/page'">리뷰 관리</a></li>
		<%} %>
		<%if(auth.isReview_comment_del()) {%>
			<li><a href="#" onClick="location.href='/admin/review_comment/page'">리뷰 코멘트 관리</a></li>
		<%} %>
		<%if(auth.isBoard_del()) {%>
			<li><a href="#" onClick="location.href='/admin/board/page'">게시판 관리</a></li>
		<%} %>
	</ol>	    
</div>