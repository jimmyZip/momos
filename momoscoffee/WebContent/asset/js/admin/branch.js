/**
 * admin page 중 admin_branch관련기능
 */
var flag=false;
var fileMap = new Map();//기존 등록 사진을 담을 객체

$(function(){
	//admin_branch.jsp가 로딩되자마자 전체지점목록을 얻어온다.
	getBranchList();
	getOriginImg();
});

//기존 이미지 정보 얻기
function getOriginImg(){
	$.ajax({
		url:"/admin/branch/img",
		type:"get",
		success:function(result){
			handleOriginImg(JSON.parse(result));
		}
	});
}
//기존 이미지 얻어서 fileMap에 담기
function handleOriginImg(jsonArray){
	for(var a=0;a<jsonArray.length;a++){
		var arr = jsonArray[a];
		fileMap.set(arr.branch_img,arr.branch_id);
	}
}

//branch_id와 맞는 기존 이미지를 지우기 위한 이미지이름 세팅
function removeOriginImg(branch_id){
	console.log("넘겨받은 branch_id확인 : "+branch_id);
	var delImgName = new Array();
	var fileMapIterator = fileMap.entries();
	console.log(fileMapIterator);
	
	var result = fileMapIterator.next();
	while(!result.done){
		conse [key, value] = result.value;
		if(value==branch_id){
			delImgName.push(key);
		}
		result = fileMapIterator.next();
	}
	for(var a=0;a<delImgName.length;a++){
		var html="<input type='hidden' name='deleteFile' value='"+delImgName[a]+"'>";
		$("#branchForm").append(html);
	}
}

//컨트롤러에 지점 전체목록 요청
function getBranchList(){
	console.log("지점관리 페이지 들어오자마자 목록 요청");
	$.ajax({
		url:"/admin/branch",
		type:"get",
		success:function(result){
			renderAllBranch(JSON.parse(result));
		}
	});
}

//컨트롤러에서 얻어온 지점 전체목록 테이블 출력
function renderAllBranch(jsonArray){
	$("#container").html("");
	if(jsonArray.length>0){		
		for(var a=0;a<jsonArray.length;a++){
			var arr = jsonArray[a];
			$("#container").append("<tr>");
			$("#container").append("<td width='5%'><input type=\"checkbox\" name=\"chkbox\" value='"+arr.branch_id+"' onClick=\"selectedBranch()\"/></td>");
			$("#container").append("<td class='seq' width='5%'>"+(a+1)+"</td>");
			$("#container").append("<td class='branchName' width='5%'><a href=\"javascript:getBranchDetail("+arr.branch_id+");\" title=\"지점상세정보\" style='text-decoration:underline'>"+arr.branch_name+"</a></td>");
			$("#container").append("<td class='branchAddr' width='5%'>"+arr.branch_addr+"</td>");
			$("#container").append("<td class='branchTel' width='5%'>"+arr.branch_tel+"</td>");
			$("#container").append("</tr>");
		}
	}else{
		$("#container").append("<tr>");
		$("#container").append("<td colspan='5'>등록/검색된 지점이 없습니다.</td>");
		$("#container").append("</tr>");
	}
}

//지점 목록에서 지점명(링크) 클릭 시 지점 상세정보 요청
function getBranchDetail(branch_id){
	//컨트롤러에 지점 1개 정보 요청
	
	//api place정보 요청
	
	//상세페이지 이동
}

////////////////////////////////////네이버 지도 주소 좌표 검색 ///////////////////////
//address값으로 전달될 주소 value얻기
function addrSearchKey(){
	if(event.keyCode==13){
		addrSearch();
	}
}
function addrSearch(){
	var addr = document.getElementById("addrSearch").value;
	//alert(addr);
	//console.log("검색할 주소 인코딩 확인 : "+encodeURIComponent(addr));
	//주소로 좌표검색 api호출
	$.ajax({
		type:'post',
		url:'/api/addr',
		data:{
			//'address':encodeURIComponent(addr)
			//"address":encodeURI(addr)
			'address':addr
		},
		dataType:'json',
		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		timeout:10000,
		cache:false,
		error:function(x,e){
			alert('요청하신 작업을 수행하던 중 예상치 못하게 중지되었습니다.\n\n다시 시도해 주세요.');
		},
		success:function(data){
			//var data = JSON.parse(decodeURIComponent(data));
			console.log("서버로 부터 넘어온 data : "+data);//결과값은 JSON으로 parsing되어 넘어옴
			console.log(data);
			console.log("서버로 부터 넘어온 data 타입확인 : "+typeof(data));
			//console.log("서버로 부터 넘어온 data의 인코딩 확인 : "+);
			//var longi = data.result.items[0].point.x;//결과의 첫 번째 값의 좌표 가져오기. 단 상세주소 없이 검색된 경우는 값이 여러개로 넘어올 수 있다.
			//var lati = data.result.items[0].point.y;
			
		    var roadAddress = decodeURIComponent(data.addresses[0].roadAddress);
			var longi = data.addresses[0].x;//결과의 첫 번째 값의 좌표 가져오기. 단 상세주소 없이 검색된 경우는 값이 여러개로 넘어올 수 있다.
			var lati = data.addresses[0].y;
			console.log("longi 확인 : "+longi);
			console.log("lati확인 : "+lati);
			//console.log("도로명주소 확인 : "+decodeURIComponent(data.addresses[0].roadAddress));
			//console.log("도로명주소 확인 : "+decodeURIComponent(data.addresses[0].roadAddress));
			console.log("도로명 주소 디코딩 잘 되었나 확인 : "+roadAddress);
			//resultDataHandle(addr,longi,lati);
			//resultDataHandle(decodeURIComponent(data.addresses[0].roadAddress),longi,lati);
			resultDataHandle(roadAddress,longi,lati);
		}
	});
}

//주소로 좌표검색 결과를 세팅
function resultDataHandle(addr,longi,lati){
	var detailAddr = prompt("상세주소를 입력하세요.");
	//채우기 전에 비우기
	$("input[name='branch_addr']").val("");
	$("input[name='longi']").val("");
	$("input[name='lati']").val("");
	
	//주소 세팅
	$("input[name='branch_addr']").val(addr+" "+detailAddr);
	console.log("주소input에 찍은 value : "+$("input[name='branch_addr']").val());
	//longi, lati (hidden input의 value)세팅
	$("input[name='longi']").val(longi);
	console.log("longi input에 찍은 value : "+$("input[name='longi']").val());
	$("input[name='lati']").val(lati);
	console.log("lati input에 찍은 value : "+$("input[name='longi']").val());
}

//지점등록 용도 이미지 선택시 fake input에 대표이미지명 표시
function getImgInfo(fileObj){
	//1. 선택한 이미지를 label역할 fake_input에 표시
	var filePath = fileObj.value;
	var fileName = filePath.substring(filePath.lastIndexOf("/")+1);
	document.getElementById("fake_input").value=fileName;
	
	//2. 지점정보 수정을 위한 체크박스 체크된 게 있다면 
	//branch_id를 매개로 가지고 기존 이미지와 비교해서 삭제대상에 포함하는 함수호출
	var checkArray = checkCnt();
	if(checkArray.length==1){
		var branch_id = parseInt(checkArray[0]);
		console.log("이미지를 바꿀 branch의 pk : "+branch_id);
		removeOriginImg(branch_id);
	}
}

//체크 카운트
function checkCnt(){
	console.log("체크박스 갯수와 그 value를 얻기 위해 checkCnt()가 호출되었다.");
	//선택한 checkbox의 value 가져오기 위해 순차적으로 조회
	//체크박스 선택 시 지점 고유값과 그 고유값을 담을 배열 선언
	var checkArray = new Array();
	//체크된 고유값(branch_id)를 Array에 넣음
	$("input[name='chkbox']:checked").each(function(i){
		checkArray.push(parseInt($(this).val()));
	});
	return checkArray;
}

//지점목록에서 체크박스 선택시 처리
function selectedBranch(){
	console.log("체크박스를 선택해서 selectedBranch()메서드가 호출되었다.");
	var checkArray = checkCnt();
	var branch_id=0;
	if(checkArray.length==1){
		//checkbox의 value인 branch_id추출
		branch_id = parseInt(checkArray[0]);
		console.log("checkArray로부터 추출한 branch_id"+branch_id);
		$.ajax({
			url:"/admin/branch/"+branch_id,
			type:"get",
			success:function(result){
				//alert(result);
				//폼영역 채울 데이터 얻고
				fillData(JSON.parse(result));
				//데이터 얻었으니 checkArray초기화
				checkArray = new Array();
			}
		});
	}
}

//체크박스에서 선택한 지점 정보를 폼영역에 표시
function fillData(result){
	console.log(result);
	console.log("시간은 어떻게 출력되나 확인 : "+result.open_h);
	console.log("지점명 확인 : "+result.branch_name);
	//폼 영역 채우기 전에 초기화
	$("#branchForm").trigger("reset");
	//폼 영역 input, 채우기
	$("input[name='branch_name']").val(result.branch_name);
	$("input[name='branch_tel']").val(result.branch_tel);
	$("input[name='branch_addr']").val(result.branch_addr);
	$("input[name='longi']").val(result.longi);
	$("input[name='lati']").val(result.lati);
	$("input[name='message']").val(result.message);
	$("input[name='open_h']").val(result.open_h);
	$("input[name='close_h']").val(result.close_h);
	$("input[name='last_order']").val(result.last_order);
	$("#fake_input").val(result.branch_img);
}

//검색영역 지점검색 엔터키 처리
function branchSearchKey(){
	if(event.keyCode==13){
		branchSearch();
	}
}
function branchSearch(){
	var searchWord = document.getElementById("branchSearch").value;
	alert(searchWord+"에 맞는 지점을 검색합니다.");
	$.ajax({
		url:"/admin/branch/"+searchWord,
		type:"get",
		success:function(result){
			renderAllBranch(JSON.parse(result));
			$("#branchSearch").trigger("reset");
		}
	});
	
}

//버튼 클릭이벤트
//전체지점보기 요청
function showAllBranch(){
	getBranchList();
	$("#branchForm").trigger("reset");
}
//지점등록 요청
function registBranch(){
	var formData = new FormData();
	formData.append("branch_name",$("input[name='branch_name']").val());
	formData.append("branch_addr",$("input[name='branch_addr']").val());
	formData.append("lati",parseFloat($("input[name='lati']").val()));
	formData.append("longi",parseFloat($("input[name='longi']").val()));
		//lati,longi의 db컬럼 자료형은 double이라 input의 value를 그냥 넘기면 numberFormatException이 발생
		//단, 자바스크립트는 21자리의 정밀도 높은 숫자 처리가 안된다고 함. parseDouble을 사용하면 정의하라는 에러메시지
		//따라서 parseFloat으로 넘겼음
	formData.append("message",$("input[name='message']").val());
	formData.append("branch_tel",$("input[name='branch_tel']").val());
	formData.append("open_h",$("input[name='open_h']").val());
	formData.append("close_h",$("input[name='close_h']").val());
	formData.append("last_order",$("input[name='last_order']").val());
	//formData.append("branchFile",$("input[name='branchFile']").val());
	$($("#multiFile")[0].files).each(function(index,file){
		formData.append("branchFile",file);
	});
	//등록요청
	$.ajax({
		url:"/admin/branch",
		type:"POST",
		//enctype:"multipart/form-data",
		processData:false,
		contentType:false,
		data:formData,
		success:function(result){
			alert("success");
			//등록 후 폼 리셋
			$("#branchForm").trigger("reset");
			//리스트 갱신
			getBranchList();
			getOriginImg();
		}
	});
	
}
//지점정보 수정 요청
function updateBranch(){
	var checkArray = checkCnt();
	console.log("checkArray.length확인 : "+checkArray.length);
	if(checkArray.length==0){
		alert("정보를 수정할 지점을 체크하세요.");
	}else if(checkArray.length>1){
		alert("한 번에 한 지점정보만 수정가능합니다.");
		//체크된 배열은 새로 생성한 것으로 초기화
		checkArray = new Array();
	}
	console.log("지점 수정요청 할 때 checkArray확인 : "+checkArray);
	console.log("checkArray의 타입 확인 : "+typeof(checkArray));
	var branch_id = checkArray[0];
	console.log("branch_id잘 담겼나 확인 : "+branch_id);
	console.log("branch_id넘길 때 타입확인 : "+typeof(branch_id));
	if(confirm("지점정보를 정말 수정하시겠습니까?")){
		var form = $("#branchForm")[0];
		var formData = new FormData(form);
		formData.append("branch_id",branch_id);
		$.ajax({
			url:"/admin/branch/update",
			data:formData,
			enctype:"multipart/form-data",
			type:"POST",
			dataType:"json",
			processData:false,
			contentType:false,
			success:function(resultCode){
				console.log(resultCode);
				//수정등록 후 갱신
				getBranchList();
				//getSortProdList(formData.get('subcategory_id'));
				$("#branchForm").trigger("reset");
				//$("textarea").text("");
				checkArray = new Array();
			}
		});
	}else{
		alert("지점정보 수정을 취소하셨습니다.");
	}
}

//지점정보 삭제요청
function deleteBranch(){
	console.log("선택지점 삭제 요청");
	var checkArray = checkCnt();
	console.log("지점정보 삭제요청해서 얻은 checkArray 확인 : "+checkArray);
	console.log("넘겨받아 변수에 저장한 checkArray 자료형 : "+typeof(checkArray));
	if(checkArray.length==0){
		alert("삭제할 지점정보를 체크하세요.");
	}else{
		if(confirm("선택 지점정보를 삭제하시겠습니까?")==true){
			$.ajax({
				url:"/admin/branch/del",
				type:"GET",
				data:{
					checkArray:checkArray
				},
				success:function(result){
					var json = JSON.parse(result);
					if(json.result==1){						
						getBranchList();
						//getSortProdList($("#subSelect").val());
						//$("#prodForm").trigger("reset");
						//$("textarea").text("");
					}else{
						alert("삭제 실패");
					}
				}
			});
			//체크된 배열은 새로 생성한 것으로 초기화
			checkArray = new Array();
		}else{
			//confirm에서 취소한 경우
			//location.reload(true);
			return;
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
//전제지점목록 Excel저장 요청
function saveAsExcel(){
	console.log("엑셀다운로드 버튼을 눌러 호출됐다.");
	alert("엑셀다운로드를 진행하시겠습니까?");
	location.href="/excelDownload?target=branch";
}

//전화번호 input에서 tab키로 이동할 때 주소(readonly)건너뜀 처리, onblur
function focusMove(){
	$("input[name='message']").focus();
}
