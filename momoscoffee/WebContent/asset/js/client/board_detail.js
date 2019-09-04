/**
 * 게시물 1건 상세페이지 스크립트
 */
//게시물 수정
var flag=true;//수정버튼 클릭해서 본인확인 시 변경사항저장 버튼 활성화 flag

//게시물 수정 활성화
function edit(board_id,userid){
	//1. 작성자 본인여부 확인
	//board_id를 통해 db에 저장된 작성자 userid와 접속자 세션에 저장된 userid비교
	$.ajax({
		url:"/client/board/identi/"+board_id,
		type:"get",
		success:function(result){
			var json = JSON.parse(result);
			if(json.userid==userid){//아이디 일치하면
				alert("작성자 본인이 확인되었습니다. 내용 수정 후 저장 버튼을 눌러주세요.");
				//수정내용 입력은 제목, 내용만
				$("#title").attr("readonly",false);
				$("#content").attr("readonly",false);
				//2.readonly풀기
				flag=!flag;//flag반전
				//3.flag가 false이면 버튼의 텍스트를 저장으로 변경
				btnSwitch(flag);
			}else{
				alert("작성자가 일치하지 않습니다. 확인바랍니다.");
			}
		}
	});
}

//버튼 활성화 변경
function btnSwitch(flag){
	if(flag==true){
		$("#saveUpdate").attr("disabled",true);
		$("editBtn").attr("disabled",false);
	}else{
		$("#saveUpdate").attr("disabled",false);
		$("editBtn").attr("disabled",true);
	}
}

//게시물 수정 요청
function editBoard(){
	if(confirm("정말 수정하시겠습니까?")){
		$("form[name='update-form']").attr({
			action:"/client/board/update",
			method:"post"
		});
		$("form[name='update-form']").submit();
	}else{
		alert("게시물 수정을 취소하셨습니다.");
	}
	flag=!flag;//수정시도 전으로 flag원상복구	
	btnSwitch(flag);
}

//게시물 삭제요청
function del(board_id,userid){
	//1. 본인작성글 확인
	$.ajax({
		url:"/client/board/identi/"+board_id,
		type:"get",
		success:function(result){
			var json = JSON.parse(result);
			if(json.userid==userid){//아이디 일치하면
				if(confirm("정말 삭제하시겠습니까?")){
					$("form[name='update-form']").attr({
						action : "/client/board/del",
						method : "post"
					});
					$("form[name='update-form']").submit();
				}else{
					alert("삭제를 취소하셨습니다.");
				}
			}else{
				alert("작성자 일치 확인바랍니다.");
			}
		}
	});
}

//상세에서 글 목록으로 돌아가기
function backToList(){
	alert("글 목록 페이지로 돌아갑니다.");
	location.href="/client/goBoard/page";
}