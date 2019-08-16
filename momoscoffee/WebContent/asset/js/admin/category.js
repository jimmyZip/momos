/**
 * admin page 중 admin_category관련기능
 */
$(function(){
	getCateList();
});


//비동기 목록요청
function getCateList(){
	console.log("카테고리 관리 페이지 들어오자마자 현재목록 출력하기 위해 호출");
	$.ajax({
		url:"/admin/category",
		type:"get",
		success:function(result){
			console.log("서버에서 받아온 목록 수는 : "+result.length);
			console.log(result);
			console.log(JSON.parse(result));
			renderList(JSON.parse(result));
		},
		error:function(result){}
	});
}

//하위에서 상위분류별 보기
function selectByTopId(topcategory_id){
	console.log("넘겨받은 topcategory_id : ",topcategory_id);
	$.ajax({
		url:"/admin/category/sort/"+topcategory_id,
		type:"get",
		success:function(result){
			//renderList(JSON.parse(result));
			//getCateList();
			renderSortList(JSON.parse(result));
		}
	});
}
//하위카테고리 모두보기버튼처리
function showAllSub(){
	getCateList();
}

function renderSortList(jsonArray){
	$("#subContainer").html("");
	
	for(var s=0;s<jsonArray.length;s++){
		var obj = jsonArray[s];
		//sub 출력
		
		$("#subContainer").append("<tr>");
		if(obj.subcategory_id!=null && obj.subcate_name!=null){			
			$("#subContainer").append("<td>"+(s+1)+"</td>");
			$("#subContainer").append("<td>"+obj.topcate_name+"</td>");
			$("#subContainer").append("<td>"+obj.subcate_name+"</td>");
			$("#subContainer").append("<button onClick=\"updateSubCate("+obj.subcategory_id+",this)\">수정</button>");
			$("#subContainer").append("<button onClick=\"deleteSubCate("+obj.subcategory_id+")\">삭제</button>");
			$("#subContainer").append("</td>");
		}else{			
			$("#subContainer").append("<td></td>");
			$("#subContainer").append("<td></td>");
			$("#subContainer").append("<td></td>");
		}
		$("#subContainer").append("</tr>");
	}
}

//컨트롤러에서 받은 목록을 화면에 출력, 리스트 화면처리
function renderList(jsonArray){
	$("#container").html("");
	
	console.log("renderList로 넘어온 jsonArray원형 : ",jsonArray);
	console.log("jsonArray의 0번째 : ",jsonArray[0]);
	//하위분류관리에서 상위분류 고르는 select태그 option채우기
	createTopOption(jsonArray[0]);
	//하위분류관리에서 상위분류 고르는 input radio 채우기
	createTopRadio(jsonArray[0]);
	//테이블 채우기
	for(var k=0;k<jsonArray[0].length;k++){
		var arr = jsonArray[0][k];//끄집어내기
		console.log("jsonArray의 k번째를 arr변수에 담음",arr);
		//top 출력
		$("#container").append("<tr>");
		//$("#container").append("<td>"+arr.topcategory_id+"</td>");
		$("#container").append("<td>"+(k+1)+"</td>");
		$("#container").append("<td>"+arr.topcate_name+"</td>");
		$("#container").append("<td>");
		$("#container").append("<button onClick=\"updateTopCate("+arr.topcategory_id+",this)\">수정</button>");
		$("#container").append("<button onClick=\"deleteTopCate("+arr.topcategory_id+")\">삭제</button>");
		$("#container").append("</td>");
		$("#container").append("</tr>");
	}
	renderSub(jsonArray);
}

function renderSub(jsonArray){
	$("#subContainer").html("");
	console.log("jsonArray의 1번째 : ",jsonArray[1]);
	
	for(var s=0;s<jsonArray[1].length;s++){
		var arr2 = jsonArray[1][s];
		//sub 출력
		console.log("render에서 jsonArray[1]["+s+"] 자체 확인 : "+jsonArray[1][s]);
		console.log("sub_id : "+arr2.subcategory_id);
		console.log("sub_top_id : "+arr2.topcategory_id);
		console.log("sub_name : "+arr2.subcate_name);
		
		$("#subContainer").append("<tr>");
		if(arr2.subcategory_id!=null && arr2.subcate_name!=null){			
			$("#subContainer").append("<td>"+(s+1)+"</td>");
			$("#subContainer").append("<td>"+arr2.topcate_name+"</td>");
			$("#subContainer").append("<td>"+arr2.subcate_name+"</td>");
			$("#subContainer").append("<button onClick=\"updateSubCate("+arr2.subcategory_id+",this)\">수정</button>");
			$("#subContainer").append("<button onClick=\"deleteSubCate("+arr2.subcategory_id+")\">삭제</button>");
			$("#subContainer").append("</td>");
		}else{			
			$("#subContainer").append("<td></td>");
			$("#subContainer").append("<td></td>");
			$("#subContainer").append("<td></td>");
		}
		$("#subContainer").append("</tr>");
	}
}

//동적으로 topcategory select박스 옵션 생성
function createTopOption(jsonArray){
	$("select[name='topcategory_id']").html("");
	$("select[name='topcategory_id']").append("<option value='0' selected>상위분류선택</option>");
	for(var i=0;i<jsonArray.length;i++){
		var arr = jsonArray[i];//끄집어내기
		$("select[name='topcategory_id']").append("<option value=\""+arr.topcategory_id+"\">"+arr.topcate_name+"</option>");
	}
}

//동적으로 topcategory 선택 radio버튼 생성
function createTopRadio(jsonArray){
	$("#topRadioZone").html("");
	$("#topRadioZone").append("<p>분류별 보기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onClick=\"showAllSub()\">모두보기</button></p>");
	for(var i=0;i<jsonArray.length;i++){
		var arr = jsonArray[i];//끄집어내기
		$("#topRadioZone").append("<input onClick=\"selectByTopId("+arr.topcategory_id+")\" type=\"radio\" name=\"topcategory_id\" value=\""+arr.topcategory_id+"\"/> "+arr.topcate_name+" &nbsp;");
	}
}

//상위카테고리명 등록 :: topcategory insert() :: 
function topcateInsert(){
	console.log("제품 상위카테고리명을 등록하라고 호출");
	
	$.ajax({
		url:"/admin/category/top",
		type:"post",
		data:{
			topcate_name:$("input[name='topcate_name']").val()
		},
		success:function(result){
			var json = JSON.parse(result);
			alert(json.result);
			if(json.result==1){
				//list 갱신
				//showTopcateList();
				getCateList();
				$("form[name='topcateForm']").trigger("reset");//(placeholder 비우기 :: form의 속성 이용)
			}
		},
		error:function(result){}
	});
}

//하위카테고리명 등록 :: subcategory insert
function subcateInsert(){
	//var sel = $("select[name='topcategory_id']");
	var sel = document.querySelector('select');
	console.log("셀렉트 태그 선택여부 확인 : "+sel);
	var subName = $("input[name='subcate_name']").val();
	console.log("입력받은 신규 하위카테명 : "+subName);
	var selected;
	for(var i=0;i<sel.options.length;i++){
		if(sel.options[i].selected==true){
			selected = parseInt(sel.options[i].value);
			break;
		}
	}
	console.log("선택된 상위카테고리 id : ",selected);
	console.log("선택된 상위카테고리 id 자료형 검사 : ",typeof(selected));
	
	//var selected = sel.options[sel.selectedIndex].value;
	console.log("제품 하위카테고리명 등록 호출");
	$.ajax({
		url:"/admin/category/sub",
		type:"post",
		data:{
			topcategory_id:selected,
			subcate_name:subName
		},
		success:function(result){
			var json = JSON.parse(result);
			alert(json.result);
			if(json.result==1){
				//성공했으니 리스트 갱신
				getCateList();				
				$("form[name='subcateForm']").trigger("reset");//(placeholder 비우기 :: form의 속성 이용)
			}
		}
	});
}

//삭제 : topcategory delete
function deleteTopCate(topcategory_id){
	if(!confirm("해당 카테고리를 정말 삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url:"/admin/category/top/"+topcategory_id,
		type:"delete",
		success:function(result){
			var json = JSON.parse(result);
			if(json.result==1){
				alert("삭제완료");
				getCateList();//목록갱신
				$("form[name='subcateForm'],form[name='topcateForm']").trigger("reset");//(placeholder 비우기 :: form의 속성 이용)
			}else{
				alert("삭제 실패");
			}
		}
	});
}
//삭제 : subcategory delete
function deleteSubCate(subcategory_id){
	if(!confirm("해당 카테고리를 정말 삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url:"/admin/category/sub/"+subcategory_id,
		type:"delete",
		success:function(result){
			var json = JSON.parse(result);
			if(json.result==1){
				alert("삭제완료");
				getCateList();//목록갱신
				$("form[name='subcateForm'],form[name='topcateForm']").trigger("reset");//(placeholder 비우기 :: form의 속성 이용)
			}else{
				alert("삭제 실패");
			}
		}
	});
}

//수정 : topcategory edit
function updateTopCate(top_id){
	//var trTag = button.parentElement.parentElement;//해당 버튼태그의 상위(td)의 상위인 tr태그를 저장
	console.log("수정 대상의 topcategory_id",top_id);
	var newTopName = prompt("please enter new category name");
	console.log("수정한 탑카테이름 : ",newTopName);
	if(newTopName==null||newTopName==""){
		alert("카테고리 수정 취소");
	}else{
		$.ajax({
			url:"/admin/category/top",
			type:"post",
			data:{
				_method:"PUT",
				topcate_name:newTopName,
				topcategory_id:top_id				
			},
			success:function(result){
				var json = JSON.parse(result);
				if(json.result==1){
					alert("수정 성공");
					getCateList();
				}else{
					alert("수정 실패");
				}
			}
		});
	}
}

//수정 : subcategory edit
function updateSubCate(subcategory_id){
	//var trTag = button.parentElement.parentElement;//tr태그
	var newTopName = prompt("수정할 상위카테고리명 입력");	  
	var newSubName = prompt("수정할 하위카테고리명 입력");
	if(newTopName==null||newTopName==""||newSubName==null||newSubName==""){
		alert("카테고리 수정 취소");
	}else{
		$.ajax({
			url:"/admin/category/sub/"+newTopName,
			type:"post",
			data:{
				_method:"PUT",
				subcategory_id:subcategory_id,
				subcate_name:newSubName
			},
			success:function(result){
				var json = JSON.parse(result);
				if(json.result==1){
					getCateList();
				}else{
					alert("수정 실패");
				}
			}
		});
	}
}
