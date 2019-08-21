/**
 * 관리자 게시판관리 관련 기능
 */
var flag=false;
var infoMap = new Map();//글 게시자 정보 담을 객체

$(function(){
	getBoardList();
});

//컨트롤러에 게시글 목록 요청
function getBoardList(){
	console.log("게시판 관리자 페이지에서 게시글 목록 요청");
	$.ajax({
		url:"/admin/board",
		type:"get",
		success:function(result){
			renderAllBoard(JSON.parse(result));
		}
	});
}

//컨트롤러에서 얻어온 게시글 전체목록 테이블 출력
function renderAllBoard(jsonArray){
	$("#container").html("");
	if(jsonArray.length>0){		
		for(var a=0;a<jsonArray.length;a++){
			var arr = jsonArray[a];
			$("#container").append("<tr>");
			$("#container").append("<td width='5%'><input type=\"checkbox\" name=\"chkbox\" value='"+arr.board_id+"' onClick=\"selectedBoard("+arr.board_id+","+arr.member_id+","+arr.ip+")\"/></td>");
			$("#container").append("<td class='seq' width='5%'>"+(a+1)+"</td>");
			$("#container").append("<td class='bTitle' width='5%'><a href=\"javascript:getBoardDetail("+arr.board_id+");\" title=\"지점상세정보\" style='text-decoration:underline'>"+arr.title+"</a></td>");
			$("#container").append("<td class='bContent' width='5%'>"+arr.content+"</td>");
			$("#container").append("<td class='bContent' width='5%'>"+arr.username+"</td>");
			$("#container").append("<td class='bWdate' width='5%'>"+arr.wdate+"</td>");
			$("#container").append("<td class='bModidate' width='5%'>"+arr.modidate+"</td>");
			$("#container").append("<td class='ip' width='5%'>"+arr.ip+"</td>");
			$("#container").append("<td class='hit' width='5%'>"+arr.hit+"</td>");
			$("#container").append("</tr>");
		}
	}else{
		$("#container").append("<tr'>");
		$("#container").append("<td colspan='9'>등록/검색된 글이 없습니다.</td>");
		$("#container").append("</tr>");
	}
}

//글 목록에서 글 상세보기 요청
function getBoardDetail(board_id){
	location.href="/admin/board/page/"+board_id;
}

//체크카운트(선택삭제위해 0개~전부)
function checkCnt(){
	var checkArray = new Array();
	$("input[name='checkbox']:checked").each(function(i){
		checkArray.push(parseInt($(this).val()));
	});
	return checkArray;
}

//글 목록에서 체크박스 선택 시
function selectedBoard(brd_id,mem_id,userIp){
	console.log("체크박스를 선택해서 selectedBoard()가 호출되었다.");
	infoMap.clear();//map객체에 담기 전에 clear메서드로 초기화
	//전역으로 설정한 infoMap객체에 매개로 넘겨받은 board_id,member_id,ip를 저장
	infoMap.set("board_id",brd_id);
	infoMap.set("member_id",mem_id);
	infoMap.set("ip",userIp);
}

//검색영역 엔터키
function boardSearchKey(){
	if(event.keyCode==13){
		boardSearch();
	}
}

//글 검색
function boardSearch(){
	var searchWord = document.getElementById("boardSearch").value;
	alert(searchWord+"에 해당되거나 유사한 글을 검색합니다.");
	$.ajax({
		url:"/admin/board/search/"+searchWrod,
		type:"get",
		success:function(result){
			renderAllBoard(JSON.parse(result));
			$("#boardSearch").trigger("reset");
		}
	});
}

//버튼 클릭이벤트
//전체글보기 요청
function showAllBoard(){
	getBoardList();
}

//삭제요청
function deleteBoard(){
	console.log("선택 글 삭제요청");
	var checkArray = checkCnt();
	if(checkArray.length==0){
		alert("삭제대상글을 선택하세요");
	}else{
		if(confirm("정말 해당글을 삭제하시겠습니까?")){
			$.ajax({
				url:"/admin/board/",
				//type:"GET",
				type:"delete",
				data:{
					checkArray:checkArray
				},
				success:function(result){
					var json = JSON.parse(result);
					if(json.result==1){
						getBoardList();
					}else{
						alert("글 삭제 실패");
					}
				}
			});
		}
	}
}

//체크박스 전체선택/해제
function checkAll(){
	if(flag==true) { 
		//해당화면에 전체 checkbox들을 체크해준다 
		$("input[type=checkbox]").prop("checked",true);
	}else{
		 //해당화면에 모든 checkbox들의 체크를해제시킨다. 
		$("input[type=checkbox]").prop("checked",false);
	}
	//체크박스 조작 후 flag변수 반전
	flag=!flag;
}

//선택한 ip로 조회하기(같은 ip글 모아보기)
function selectByIp(){
	var checkArray = checkCnt();
	if(checkArray.length==0){
		alert("ip조회 대상 글 체크박스를 하나 선택해주세요.");
	}else if(checkArray.length>1){
		alert("한 번에 한 ip 조회만 가능합니다. 다시 선택해주세요.");
	}else if(checkArray.length==1){
		var ip = infoMap.get("ip");
		console.log("infoMap으로 부터 얻은 선택 ip 확인 : "+ip);
		$.ajax({
			url:"/admin/board/ip/"+ip,
			type:"get",
			success:function(result){
				renderAllBoard(JSON.parse(result));
				//체크박스 선택 해제
				$("input[type=checkbox]").prop("checked",false);
			}
		});
	}	
}
//<button id="selectByMember" onClick="selectByMember()">선택작성자글 모아보기</button>
//같은 멤버 글 모아보기
function selectByMember(){
	var checkArray = checkCnt();
	if(checkArray.length==0){
		alert("게시자조회 대상 글 체크박스를 하나 선택해주세요.");
	}else if(checkArray.length>1){
		alert("한 번에 한 게시자 조회만 가능합니다. 다시 선택해주세요.");
	}else if(checkArray.length==1){
		var ip = infoMap.get("member_id");
		console.log("infoMap으로 부터 얻은 선택 member_id 확인 : "+member_id);
		$.ajax({
			url:"/admin/board/b/"+member_id,
			type:"get",
			success:function(result){
				renderAllBoard(JSON.parse(result));
				//체크박스 선택 해제
				$("input[type=checkbox]").prop("checked",false);
			}
		});
	}	
}