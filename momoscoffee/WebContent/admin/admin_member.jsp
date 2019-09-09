<%@page import="com.jimmyzip.momos.common.Pager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Members> memberList = (List)request.getAttribute("memberList");
	Pager pager = (Pager)request.getAttribute("pager");
	List<Auth> authList = (List)request.getAttribute("authList");
%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="/asset/css/admin/admin.css"/>
	<style type="text/css">
		.page_href{
			display:unset;
		}
		/*테이블 윗부분 검색 input box */
		#memberSearch{
			display:inline-block;
			padding:.5em .8em;
			margin-bottom:10px;
		}
	</style>
	<script type="text/javascript" src="/asset/js/page_related/index.js"></script>
	<script type="text/javascript">
		//회원삭제
		function deleteMember(member_id){
			if(!confirm("해당 회원을 정말 삭제하시겠습니까?")){
				return;
			}
			$.ajax({
				url:"/admin/member/"+member_id,
				type:"DELETE",
				success:function(result){
					var json=JSON.parse(result);
					if(json.resultCode==0){
						alert(json.msg);
					}
					location.reload(true);
				}
			});
		}
		
		//회원의 권한변경
		function updateAuth(member_id,button){
			var trTag = button.parentElement.parentElement; // tr 태그
			var auth_id = trTag.childNodes[15].children[0].value;
			$.ajax({
				url:"/admin/member/"+member_id+"/"+auth_id,
				type:"put",
				success:function(){
					location.reload(true);
				}
			});
		}
		
		//회원 검색
		function memberSearch(){
			var data= $("#memberSearch").val();
			if(data==""){
				location.href='/admin/member/page';
			}else{
				location.href='/admin/member/page?currentPage=1&search='+data;
			}
		}
		
		function memberSearchKey(){
			if(event.keyCode==13){
				memberSearch();
			}
		}
	</script>
	<title>momos_관리자용 페이지_멤버관리</title>
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
					<%if(request.getParameter("search")==null){ %>
						<input type="text" placeholder="검색어 입력" id="memberSearch" onkeydown="memberSearchKey()"/>
					<%}else{ %>
						<input type="text" placeholder="검색어 입력" id="memberSearch" onkeydown="memberSearchKey()" value="<%=request.getParameter("search")%>"/>
					<%} %>
					<table class="table_basic">
						<thead>
							<tr>
								<th>순서</th>
								<th>ID</th>
								<th>이름</th>
								<th>이메일</th>
								<th>핸드폰</th>
								<th>주소1</th>
								<th>주소2</th>
								<th>우편앞</th>
								<th>우편뒤</th>
								<th>신우편</th>
							</tr>
						</thead>
						<tbody id="container">
							<%int num=pager.getNum(); %>
							<%int curPos = pager.getCurPos(); %>
							<%for(int i=0;i<pager.getPageSize();i++){ %>
								<%if(num<1) break;%>
								<%Members mem = memberList.get(curPos++); %>
								<tr>
									<td><%=num-- %></td>
									<td><%=mem.getUserid() %></td>
									<td><%=mem.getUsername() %></td>
									<td><%=mem.getUsermail() %></td>
									<td><%=mem.getUserphone() %></td>
									<td><%=mem.getAdd1() %></td>
									<td><%=mem.getAdd2() %></td>
									<td><%=mem.getPost1() %></td>
									<td><%=mem.getPost2() %></td>
									<td><%=mem.getPost3() %></td>
									<td>
										<select name="auth">
											<%for(int j=0;j<authList.size();j++){ %>
												<%Auth memAuth = authList.get(j); %>
												<option value="<%=memAuth.getAuth_id()%>" <%if(mem.getAuth().getAuth_id()==memAuth.getAuth_id()){ %>selected <%} %>>
		           									<%=memAuth.getAuth_name() %>
		           								</option>
											<%} %>
										</select>
									</td>
									<td>
										<button onClick="updateAuth('<%=mem.getMember_id() %>',this)">권한수정</button>
										<button onClick="deleteMember('<%=mem.getMember_id()%>')">탈퇴</button>
									</td>
								</tr>
							<%} %>
							<tr>
								<td colspan="11">
									<!-- 페이징 버튼 zone -->
									<%if(pager.getFirstPage()-1>0){ %>
										<%if(request.getParameter("search")==null){ %>
											<a class="page_href" href="/admin/member/page?currentPage=<%=pager.getFirstPage()-1%>">[prev]</a>
										<%}else{ %>									
											<a class="page_href" href="/admin/member/page?currentPage=<%=pager.getFirstPage()-1%>&search=<%=request.getParameter("search")%>">[prev]</a>
										<%} %>									
									<%}else{ %>
										<a class="page_href" href="javascript:alert('첫 페이지 입니다.')">[prev]</a>
									<%} %>
									<%for( int i=pager.getFirstPage();i<=pager.getLastPage();i++){ %>
										<%if(i>pager.getTotalPage()) break;%>
										<%if(request.getParameter("search")==null){ %>
											<a class="page_href" href="/admin/member/page?currentPage=<%=i%>">[<%=i %>]</a>
										<%}else{ %>
											<a class="page_href" href="/admin/member/page?currentPage=<%=i %>&search=<%=request.getParameter("search")%>">[<%=i %>]</a>								
										<%} %>
									<%} %>
									<%if(pager.getLastPage()+1<pager.getTotalPage()){ %>
										<%if(request.getParameter("search")==null){ %>
											<a class="page_href" href="/admin/member/page?currentPage=<%=pager.getLastPage()+1%>">[next]</a>
										<%}else{ %>
											<a class="page_href" href="/admin/member/page?currentPage=<%=pager.getLastPage()+1%>&search=<%=request.getParameter("search")%>">[next]</a>
										<%} %>
									<%}else{ %>
										<a class="page_href" href="javascript:alert('마지막 페이지입니다.')">[next]</a>
									<%} %>
									<!-- 페이징 버튼 zone ends-->
								</td>
							</tr>
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