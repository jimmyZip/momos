<%@page import="com.jimmyzip.momos.model.domain.member.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Members adminId = (Members)session.getAttribute("admin");
%>
<h2 class="green">
	<span>관리자용 페이지입니다.</span>
	<%if(adminId!=null) {%>
		<b>관리자 ID : <%=adminId.getUserid() %></b>
		<button onClick="adminLogout()">로그아웃</button>
	<%} %>
	<button onClick="goAdminMain()">관리자메인</button>
</h2>
<script type="text/javascript">
	function adminLogout(){
		location.href="/admin/logout";
	}
	function goAdminMain(){
		//location.href="/admin/admin_main.jsp";
		location.href="/admin/goAdmin";
	}
</script>