/**
 * admin page 중 admin_product관련 기능
 */
//체크박스 토글 제어용 flag
var flag=false;
var fileMap = new Map();//등록된 사진을 담을 객체
	//ECMAScript 6에서 값들을 매핑하기 위한 데이터구조로 Map객체 지원

$(function(){
	//admin_product.jsp가 로딩되자마자 얻어올 목록은 topcategory_id만 얻어온다.
	getTopList();
	getOriginImg();
});

//topcategory 목록 얻어오기
function getTopList(){
	console.log("상품관리 페이지 들어오자마자 카테고리 목록 요청");
	$.ajax({
		url:"/admin/category/top",
		type:"get",
		success:function(result){
			createTopOption(JSON.parse(result));
		}
	});
}

//동적으로 topcategory select박스 옵션 생성
function createTopOption(jsonArray){
	$("#topSelect").html("");
	$("#topSelect").append("<option value='0' selected>상위분류선택</option>");
	for(var i=0;i<jsonArray.length;i++){
		var topArr = jsonArray[i];
		$("#topSelect").append("<option value=\""+topArr.topcategory_id+"\">"+topArr.topcate_name+"</option>")
	}
}

//topcategory 선택 onChange이벤트에 의해 subcategory 목록 얻어오기
function getSubList(topcategory_id){
	console.log("선택한 상위 id는 : "+topcategory_id);
	$.ajax({
		url:"/admin/category/sort/"+topcategory_id,
		type:"get",
		success:function(result){
			createSubOption(JSON.parse(result));
		}
	});
}

//동적으로 subcategory select박스 옵션 생성
function createSubOption(jsonArray){
	console.log("subcategory select태그 option재료확인 : "+jsonArray);
	//채우기 전에 초기화
	$("#subSelect").html("");
	$("#subSelect").append("<option value='' selected>하위분류선택</option>");
	//채우기
	for(var i=0;i<jsonArray.length;i++){
		var arr = jsonArray[i];
		//console.log("jsonArray세부내용물 확인 sub_id: "+arr.subcategory_id);
		//console.log("jsonArray로 넘어온 sub_id타입확인 : "+typeof(arr.subcategory_id));
		//console.log("jsonArray세부내용물 확인 sub_name: "+arr.subcate_name);
		$("#subSelect").append("<option value=\""+arr.subcategory_id+"\">"+arr.subcate_name+"</option>");
	}
}

//subcategory 하위에 등록된 상품 목록 가져오기

function getSortProdList(subcategory_id){
	console.log("선택한 sub_id",subcategory_id);
	$.ajax({
		url:"/admin/product/prod/"+subcategory_id,
		type:"get",
		success:function(result){
			renderProdSortList(JSON.parse(result));
		}
	});
}

//서버로부터 얻은 selected subcategory 하위 상품목록 출력
function renderProdSortList(jsonArray){
	//console.log("여기까지 오긴 오냐? subcate선택했을 때 하위 상품들 array확인",jsonArray);
	//출력 전 테이블 내 데이터 출력영역 초기화
	$("#container").html("");
	//$("#prodForm").trigger("reset");
	//$("textarea").text("");
	for(var a=0;a<jsonArray.length;a++){
		var arr = jsonArray[a];
		$("#container").append("<tr>");
		$("#container").append("<td width='5%'><input type=\"checkbox\" name=\"chkbox\" value='"+arr.product_id+"' onClick=\"selectedProd()\"/></td>");
		$("#container").append("<td class='seq' width='5%'>"+(a+1)+"</td>");
		$("#container").append("<td class='topName' width='5%'>"+arr.topcate_name+"</td>");
		$("#container").append("<td class='subName' width='5%'>"+arr.subcate_name+"</td>");
		$("#container").append("<td class='prodImg' width='5%'><img src='/data/"+arr.prod_img+"' width='40' height='40'/></td>");
		$("#container").append("<td class='prodName' width='5%'>"+arr.prod_name_kor+"<br>("+arr.prod_name_eng+")</td>");
		$("#container").append("<td class='prodPrice' width='5%'>"+arr.price+"</td>");
		$("#container").append("<td class='prodStock' width='5%'>"+arr.stock+"</td>");
		$("#container").append("<td class='prodDesc' width='60%'>"+arr.prod_desc+"</td>");
		$("#container").append("</tr>");
	}
}

//showAllProdBtn클릭이벤트 구현
function showAllProd(){
	$.ajax({
		url:"/admin/product",
		type:"get",
		success:function(result){
			console.log("서버에서 받아온 목록 수 : "+result.length);
			renderAllProd(JSON.parse(result));
			//rplLine(JSON.parse(result));
			//renderAllProd(result);
			$("#prodForm").trigger("reset");
		}
	});
}
/*
function rplLine(value){
	if(value!=null&&value!=""){
		renderAllProd(value.replace(/\n/g,"\\n"));
	}else{
		renderAllProd(value);
	}
}
*/
//상품전체보기 요청으로 얻은 전체목록 출력
function renderAllProd(jsonArray){
	console.log("상품 전체목록 또는 검색된 목록 테이블 출력");
	console.log("totalArray 길이: "+jsonArray.length);
	console.log("totalArray[0] : "+jsonArray[0]);
	$("#container").html("");
	//$("#prodForm").trigger("reset");
	//$("textarea").text("");
	if(jsonArray.length>0){		
		for(var a=0;a<jsonArray.length;a++){
			var arr = jsonArray[a];
			console.log("목록 테이블 출력 전 Array내용물 확인 top_id: "+arr.topcategory_id);
			console.log("목록 테이블 출력 전 Array내용물 확인 prod_img: "+arr.prod_img);
			//console.log("전체목록 테이블 출력 전에 array내의 img확인 : "+arr.prod_img.product_image_id);
			$("#container").append("<tr>");
			$("#container").append("<td width='5%'><input type=\"checkbox\" name=\"chkbox\" value='"+arr.product_id+"' onClick=\"selectedProd()\"/></td>");
			$("#container").append("<td class='seq' width='5%'>"+(a+1)+"</td>");
			$("#container").append("<td class='topName' width='5%'>"+arr.topcate_name+"</td>");
			$("#container").append("<td class='subName' width='5%'>"+arr.subcate_name+"</td>");
			console.log("js:: 상품리스트 테이블에 출력도중에 jsonArray에서 img 확인 : "+arr.prod_img);
			$("#container").append("<td class='prodImg' width='5%'><img src='/data/"+arr.prod_img+"' width='40' height='40'/></td>");
			$("#container").append("<td class='prodName' width='5%'>"+arr.prod_name_kor+"<br>("+arr.prod_name_eng+")</td>");
			$("#container").append("<td class='prodPrice' width='5%'>"+arr.price+"</td>");
			$("#container").append("<td class='prodStock' width='5%'>"+arr.stock+"</td>");
			$("#container").append("<td class='prodDesc' width='60%'>"+arr.prod_desc+"</td>");
			$("#container").append("</tr>");
		}
	}else{
		$("#container").append("<tr>");
		$("#container").append("<td colspan='9'>등록/검색된 상품이 없습니다.</td>");
		$("#container").append("</tr>");
	}
}

//상품등록
function registProd(){
	//subcategory를 필수로 선택했는지 유효성 체크
	if($("#subSelect").val()==""){
		alert("상품을 등록하려면 하위분류를 필수로 선택해야합니다.");
		return;
	}
	//등록요청
	var form = $("#prodForm")[0];
	var formData = new FormData(form);
	console.log("formData확인 "+formData);
	formData.append("subcategory_id",$("#subSelect option:selected").val());
	//console.log("formData sub_id보유확인 :  "+formData.has('subcategory_id'));
	//console.log("formData sub_id확인 : "+formData.get('subcategory_id'));
	$.ajax({
		url:"/admin/product",
		type:"POST",
		data:formData,
		enctype:"multipart/form-data",
		processData:false,
		contentType:false,
		success:function(result){
			alert("success");
			//등록한 상품의 subcategory_id에 해당 상품들 출력
			getSortProdList(formData.get('subcategory_id'));
			//등록 후 폼 리셋
			$("#prodForm").trigger("reset");
			//리스트 갱신
			getTopList();
			getOriginImg();
		}
	});
}

//상품등록 용도 이미지 선택시 fake input에 대표이미지명 표시
function getImgInfo(fileObj){
	//1. 선택한 이미지를 label역할 fake_input에 표시
	var filePath = fileObj.value;
	var fileName = filePath.substring(filePath.lastIndexOf("/")+1);
	document.getElementById("fake_input").value=fileName;
	
	//2. 만약 상품정보 수정을 위한 체크박스가 체크된 것이 있다면
		//product_id를 매개로 가지고 기존이미지와 비교해서 삭제대상에 포함하는 함수 호출
	var checkArray = checkCnt();
	if(checkArray.length==1){
		var product_id = parseInt(checkArray[0]);
		console.log("이미지를 바꿀 product의 pk: "+product_id);
		removeOriginImg(product_id);
	}
}

//기존 이미지 불러오기
function getOriginImg(){
	//업로드 된 
	$.ajax({
		url:"/admin/product/img",
		type:"get",
		success:function(result){
			//console.log(result);
			//console.log(result.length);
			handleOriginImg(JSON.parse(result));
		}
	});
}

//기존 이미지들을 fileMap에 담기
function handleOriginImg(jsonArray){
	for(var a=0;a<jsonArray.length;a++){
		var arr = jsonArray[a];
		console.log(arr);
		//fileArray.push(arr.prod_img);//key:product_id와 value:이미지명으로 매핑하기 위해 array를 Map으로 업그레이드
		//fileMap.set(arr.product_id,arr.prod_img);
		fileMap.set(arr.prod_img,arr.product_id);
			//key중복 때문에 value에 해당하는 img명이 하나만 담기는 문제를 피하기 위해 key:prod_img, value:product_id로 바꿨다.
	}
	//console.log(fileMap);
	//fileMap으로 부터 key만 뽑아낸다.
	//var keys = fileMap.keys();
	//console.log(keys);
	
	//fileMap으로부터 [key,value]형태의 arrray로 집어넣은 순서대로 가지고 있는 iterator객체 반환시킨다.
	//var fileMapIterator = fileMap.entries();
	//console.log(fileMapIterator);
	//console.log(fileMapIterator.next().value[0]);//iterator가 가진 value 중 key :: prod_img
	//console.log(fileMapIterator.next().value[1]);//iterator가 가진 value 중 value :: product_id
}
//product_id와 맞는 기존 이미지 지우기 위한 이미지명 세팅
function removeOriginImg(product_id){
	console.log("removeOriginImg함수가 넘겨받은 product_id 확인 : "+product_id);
	var delImgName = new Array();
	
	//fileMap으로부터 [key,value]형태의 arrray로 집어넣은 순서대로 가지고 있는 iterator객체 반환시킨다.
	var fileMapIterator = fileMap.entries();
	console.log(fileMapIterator);
	//체크박스로 부터 넘어온 checkArray의 value인 product_id와 fileMapIterator가 가진 각각의 value 중 product_id를 비교한다.
	
	//var count=0;
	var result = fileMapIterator.next();
	while(!result.done){
		//const data = fileMapIterator.next().value;
		const [key, value] = result.value;
		console.log("while loop 순회 확인 : "+key+' , '+value);
		
		if(value==product_id){
			//매개로 넘겨받은 product_id와 일치하는 prod_img들을 delImgName라는 Array에 담는다.
			//console.log("fileMapIterator반복문 내부 조건문 수행 확인용"+count++);
			delImgName.push(key);
		}
		result = fileMapIterator.next();
			//이 줄이 없으면 iterator마지막 순회 다음 순회에서 .done이 true를 반환하며 값들이 undefine되기 때문에
			//iterator마지막 순회로 덮어써주는 것 같다. 이게 없으면 에러가 발생한다.
	}
	console.log("delImgName에 담긴 값 확인한다.");
	console.log(delImgName);
	for(var a=0;a<delImgName.length;a++){
		var html="<input type='hidden' name='deleteFile' value='"+delImgName[a]+"'>";
		$("#prodForm").append(html);
	}
}

//체크 카운트
function checkCnt(){
	console.log("체크박스 갯수와 그 value를 얻기 위해 checkCnt()가 호출되었다.");
	//선택한 checkbox의 value 가져오기 위해 순차적으로 조회
	//체크박스 선택 시 상품 고유값과 그 고유값을 담을 배열 선언
	var checkArray = new Array();
	//체크된 고유값(product_id)를 Array에 넣음
	$("input[name='chkbox']:checked").each(function(i){
		checkArray.push(parseInt($(this).val()));
	});
	return checkArray;
}

//상품목록에서 체크박스 선택시 처리
function selectedProd(){
	console.log("체크박스를 선택해서 selectedProd()메서드가 호출되었다.");
	var checkArray = checkCnt();
	var product_id=0;
	if(checkArray.length==1){
		//checkbox의 value인 product_id추출
		product_id = parseInt(checkArray[0]);
		console.log("checkArray로부터 추출한 product_id"+product_id);
		$.ajax({
			url:"/admin/product/"+product_id,
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

//체크박스에서 선택한 상품 정보를 폼영역에 표시
function fillData(result){
	console.log(result);
	//폼 영역 채우기 전에 초기화
	$("#prodForm").trigger("reset");
	//폼 영역 input, select box 채우기
	$("#topSelect").val(result.topcategory_id).prop("selected",true);
	$("#subSelect").val(result.subcategory_id).prop("selected",true);
	$("input[name='prod_name_kor']").val(result.prod_name_kor);
	$("input[name='prod_name_eng']").val(result.prod_name_eng);
	$("input[name='price']").val(result.price);
	$("#fake_input").val(result.prod_img);//db까지 들어가있는 이미지명을 표시	
	$("input[name='stock']").val(result.stock);
	$("textarea[name='prod_desc']").text(result.prod_desc);
}

//상품수정
function updateProd(){
	var checkArray = checkCnt();
	console.log("checkArray.length확인 : "+checkArray.length);
	if(checkArray.length==0){
		alert("수정할 상품을 체크하세요.");
	}else if(checkArray.length>1){
		alert("한 번에 한 상품정보만 수정가능합니다.");
		//체크된 배열은 새로 생성한 것으로 초기화
		checkArray = new Array();
	}
	alert("서브카테고리 확인: "+$("#subSelect").val());
	
	if(confirm("상품정보를 정말 수정하시겠습니까?")==true){
		var form = $("#prodForm")[0];
		var formData = new FormData(form);
		formData.append("subcategory_id",$("#subSelect").val());
		formData.append("product_id",$("input[name='chkbox']:checked").val());
		
		$.ajax({
			url:"/admin/product/update",
			data:formData,
			enctype:"multipart/form-data",
			type:"POST",
			dataType:'json',
			processData:false,
			contentType:false,
			success:function(resultCode){
				console.log(resultCode);
				//수정등록 후 갱신
				getTopList();
				getSortProdList(formData.get('subcategory_id'));
				$("#prodForm").trigger("reset");
				$("textarea").text("");
				checkArray = new Array();
			}
		});
	}else{
		alert("상품정보 수정을 취소하셨습니다.");
	}
	
}

// 선택상품 삭제(0개에서 전체 사이 커버)
function deleteProd(){
	//선택된 체크박스 조사
	//체크박스가 선택될 때 상품 고유값과 그 고유값을 담을 Array선언
	//var productSeq="";
	//var checkArray = new Array();
	//체크된 고유값을 Array에 넣음,push
	//jQuery로 반복문을 수행하며 check된 input의 value를 배열에 담음
	/*
	$("input[name='chkbox']:checked").each(function(i){
		console.log("체크박스 체크하며 담긴 product_id가 숫자인지 판별"+typeof($(this).val()));//String이라 int로 바꿔 넘겨야함
		checkArray.push(parseInt($(this).val()));
	});
	*/
	var checkArray = checkCnt();		
	if(checkArray.length==0){
		alert("삭제할 상품을 체크하세요.");
	}else{
		if(confirm("선택 상품을 삭제하시겠습니까?")==true){
			$.ajax({
				url:"/admin/product/del",
				type:"GET",
				data:{
					checkArray:checkArray
				},
				success:function(result){
					var json = JSON.parse(result);
					if(json.result==1){						
						getTopList();
						getSortProdList($("#subSelect").val());
						$("#prodForm").trigger("reset");
						$("textarea").text("");
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

//checkbox전체선택,전체해제 toggle
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

//전체목록 excel받기
function saveAsExcel(){
	console.log("엑셀다운로드 버튼을 눌러 호출됐다.");
	alert("엑셀다운로드를 진행하시겠습니까?");
	//var target = "product";
	/*
	$.ajax({
		url:"/excelDownload?target=product",
		type:"GET",
		success:function(result){
			console.log("엑셀다운로드 컨트롤러를 훑고 success로 왔다.");
		}
	});
	*/
	location.href="/excelDownload?target=product";
}

//상품검색 엔터키
function prodSearchKey(){
	if(event.keyCode==13){
		prodSearch();
	}
}
//상품검색 수행
function prodSearch(){
	alert("검색결과가 있다면 하단 표에 표시됩니다.");
	var searchWord=$("#prodSearch").val();
	console.log("검색어 확인 : "+searchWord);
	if(searchWord==""){
		location.href="/admin/product/page";
	}else{
		$.ajax({
			type:"get",
			url:"/admin/product/search/"+searchWord,
			success:function(result){
				console.log("검색결과를 얻어왔다.");
				renderAllProd(JSON.parse(result));
				$("#prodForm").trigger("reset");
			}
		});
	}
}