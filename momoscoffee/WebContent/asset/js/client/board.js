/**
 * client side freeboard관련 스크립트
 */

//board_write에서 글 등록 요청
function registBoard(){
	$("form[name='regist-form']").attr({
		method:"post",
		action:"/client/board"
	});
	$("form[name='regist-form']").submit();
	//form data전송 후 임시저장 데이터 비우기
}

//board_write에서 글목록 리스트로 돌아가기
function backToList(){
	alert("게시물 목록 페이지로 돌아갑니다.");
	location.href="/client/goBoard/page";
}