<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<style type="text/css">
		.page_href{
			display:unset;
		}
		/*버튼영역*/
		#btnArea{
			width:100%;
			margin:20px 0;
		}
		.btn_write{
			display:block;
			width:80px;
			margin:0 auto;
			padding:.5em .8em;
			border:none;
			background-color:transparent;
			border-radius:3px;
			color:#749D7F;
			border:1px solid #749D7F;
			font-weight:700;
			cursor:pointer;
			transition:.3s all ease-in-out;
		}
		.btn_write:hover{
			color:#fff;
			background-color:#749D7F;
		}
	</style>
	<script type="text/javascript">
		//글 등록 페이지로 이동
		function goWritePage(){
			location.href="/client/board/goRegist";
		}
	</script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp" %>
		<div class="notice_container">
			<p class="topLine"></p>
			<section class="notice_content">
				<h2 class="hidden">자유게시판</h2>
				<table id="noticeBoard" class="noticeBoard" title="공지사항 게시판">
					<caption>모모스커피 Freeboard</caption>
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="18%">
						<col width="20%">
						<col width="12%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">글쓴이</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="curPos" value="${pager.curPos}"/>
						<c:set var="num" value="${pager.num}"/>
						<c:forEach var="board" items="${boardList }" begin="${pager.curPos }" end="${pager.curPos+pager.pageSize}">
							<tr style="text-align:center;">
								<td>${num}</td>
								<td style="text-align:left;">
									<a href="/client/board/${board.board_id }" title="title">${board.title}</a>
								</td>
								<td>${board.members.userid }</td>
								<td>${board.wdate }</td>
								<td>${board.hit }</td>
							</tr>
							<c:set var="num" value="${num-1 }"/>
						</c:forEach>
					</tbody>
					<tr>
						<td colspan="5" align="center">
							<!-- 이전 블럭 -->
							<c:if test="${pager.firstPage-1>0 }">
								<a class="page_href" href="/client/goBoard/page?currentPage=${pager.firstPage-1} }">[prev]</a>
							</c:if>
							<c:if test="${pager.firstPage-1<=0 }">
								<a class="page_href" href="javascript:alert('첫 번째 페이지입니다.')">[prev]</a>
							</c:if>
							<!-- 페이지 표시 -->
							<c:forEach var="i" begin="${pager.firstPage }" end="${pager.lastPage }">
								<c:if test="${i<=pager.totalPage }">
									<a href="/client/goBoard/page?currentPage=${i}">[${i}]</a>
								</c:if>
							</c:forEach>
							<!-- 다음 블럭 -->
							<c:if test="${pager.lastPage+1<pager.totalPage }">
								<a  class="page_href" href="/client/goBoard/page?currentPage=${pager.lastPage+1 }">[next]</a>
							</c:if>
							<c:if test="${pager.lastPage+1>=pager.totalPage }">
								<a  class="page_href" href="javascript:alert('마지막 페이지입니다.')">[next]</a>
							</c:if>
						</td>
					</tr>
				</table>		
			</section><!--◁ content ▷-->
			<div id="btnArea">
				<button class="btn_write" onClick="goWritePage()">글쓰기</button>
			</div>
		</div><!--◀ container ▶-->
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>