///**
// * admin_branch_detail.jsp 관련 기능
// */

var image;//이미지태그
var con;//이미지 컨트롤러버튼 영역
var c;//con의 자식요소 span태그

function init(){
	image = document.getElementsByClassName("branchImg");
	for(var a=0;a<image.length;a++){
		if(a==0){
			image[a].style.zIndex="1";
		}else{
			image[a].style.zIndex="-1";
		}
	}
	con = document.getElementById("imgController");
	c=con.children;
	c[0].classList.add("selected");
}

function setZindex(n){
	//이미지변경
	for(var i=0;i<image.length;i++){
		if(i==n){
			image[i].style.zIndex=n;
		}else{
			image[i].style.zIndex="-1";
		}
	}

	//컨트롤러 버튼 선택처리
	for(var a=0;a<c.length;a++){
		if(a==n){
			c[a].classList.add("selected");
		}else{
			c[a].classList.remove("selected");
		}
	}
}

//지점관리 전체목록으로 돌아가기
function showAllBranch(){
	alert("지점관리 전체목록으로 돌아갑니다.");
	location.href="/admin/branch/page";
}

window.addEventListener("load",function(){
	init();
});