<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/asset/css/client/boardPreview.css">
	<script type="text/javascript" src="/asset/js/client/boardPreview.js"></script>
</head>
<body>
	<div id="wrap">
		<div class="preview_container">
			<section class="notice_content">
				<h2 class="hidden">MOMOS BOARD<span style="color:red">미리보기</span></h2>
				<form name="preview-form">
					<p class="userid">
						<label for="userid">작성자</label>
						<input type="text" id="userid" readonly/>
					</p>
					<p class="ip">
						<label for="ip">작성자 ip</label>
						<input type="text" id="ip" readonly/>
					</p>
					<p class="title">
						<label for="title">제목</label>
						<input id="title" type="text" readonly/>
					</p>
					<p class="content">
						<textarea id="content" name="content" readonly/></textarea>
					</p>
				</form>
			</section><!--◁ content ▷-->
			<div id="btnArea">
				<input type="button" value="닫기"/>
			</div>
		</div><!--◀ container ▶-->
	</div>
</body>
</html>