/**
 * 게시판관리 게시물 상세페이지 기능관련
 */
$(function(){
	init();
});
function init(){
	CKEDITOR.replace('content');
}

//글삭제
function deleteThisArticle(board_id){
	if(!confirm("정말 해당글을 삭제하시겠습니까?")){
		return;
	}
	location.href="/admin/board/del/"+board_id;
}
//목록으로 돌아가기
function showAllBoard(){
	location.href="/admin/board/page";
}