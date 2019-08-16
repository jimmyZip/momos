<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/header.jsp" %>
	<section class="cartWrap">
		<h2>장바구니</h2>
		<p class="topLine"></p>
		<div>
			<table class="cartBox" cellspacing=0 cellpadding=0>
				<caption class="hidden">장바구니</caption>
				<colgroup>
					<col width="50%">
				</colgroup>
				<thead>
					<tr>
						<th>상품명/옵션</th>
						<th>수량</th>
						<th>주문금액</th>
						<th>배송비</th>
						<th>쿠폰</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5">장바구니에 등록된 상품이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<div class="select_del_btn">
				<p>선택상품 삭제</p>
			</div>
			<div class="calculWrap">
				<table class="calcul_box">
					<colgroup>
						<col width="20%"/>
						<col width="20%" />
						<col width="20%" />
						<col width="40%" />
					</colgroup>
					<thead>
						<tr>
							<th>상품 합계금액</th>
							<th>총 배송비</th>
							<th>적립금</th>
							<th>최종 결제금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>0원</td>
							<td>0원</td>
							<td>0원</td>
							<td style="color:red;">0원</td>
						</tr>
					</tbody>
				</table>
				<p class="plusBox">+</p>
				<p class="equalBox">=</p>
			</div>
			<div class="btnArea">
				<a href="#none" title="견적서 보기">견적서보기</a>
				<a href="#none" title="장바구니 비우기">장바구니 비우기</a>
				<a href="#none" title="쇼핑계속하기">쇼핑계속하기</a>
				<a href="#none" title="상품주문하기">상품주문하기</a>
			</div>
		</div>
	</section>
<%@include file="/include/footer.jsp"%>