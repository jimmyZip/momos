/**
 * id찾기, pw재설정 모달 띄우기
 */
$(function(){
	$("#modal_full,#modal_view,.closeModal").hide();
	
	$("#modal_full,.closeModal").click(function(){
		$("#modal_full,#modal_view,.closeModal").hide();
	});
});
//id찾기용 모달							
function findIdModal(){
	//modal_view에 아이디 찾기 폼양식 불러오기
	$.ajax({
		url:"/client/member/findId.jsp",
		type:"get",
		dataType:"html",
		success:function(html){
			$("#modal_view").html(html);
		},error:function(){
			alert("에러가 발생했습니다.");
		}
	});
	$("#modal_full,#modal_view,.closeModal").show();
}

//비밀번호 재설정 용 모달

function resetPassModal(){
	//modal_view에 비밀번호 재설정 폼양식 불러오기
	$.ajax({
		url:"/client/member/resetPass.jsp",
		type:"get",
		dataType:"html",
		success:function(html){
			$("#modal_view").html(html);
		},error:function(){
			alert("에러가 발생했습니다.");
		}
	});
	$("#modal_full,#modal_view,.closeModal").show();
}




