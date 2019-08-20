/**
 * 권한관리 페이지 관련 기능
 */

$(function(){
	getList();
});
function getList(){
	$.ajax({
		url:"/admin/assign",
		type:"get",
		success:function(result){
			viewList(result);
		}
	});
}
//권한 추가
function authAdd(){
	$.ajax({
		url:"/admin/assign",
		type:"post",
		success:function(){
			getList();//추가 후 갱신
		}
	});
}
//권한 삭제
function authDelete(auth_id){
	if(!confirm("권한을 삭제하시겠습니까?")){
		return;
	}
	$.ajax({
		url:"/admin/assign/"+auth_id,
		type:"DELETE",
		success:function(result){
			showMsg(result);
			getList();//삭제 후 갱신
		}
	});
}
//권한 수정
function authEdit(auth_id,button){
	if(!confirm("권한을 수정하시겠습니까?")){
		return;
	}
	var trTag = button.parentElement.parentElement;//tr태그
	var auth_name = trTag.childNodes[0].children[0].value;
	var admin_assign = trTag.childNodes[1].children[0].checked;
	var member_del = trTag.childNodes[2].children[0].checked;
	var board_del = trTag.childNodes[3].children[0].checked;
	var review_del = trTag.childNodes[4].children[0].checked;
	var review_comment_del = trTag.childNodes[5].children[0].checked;
	var product_del = trTag.childNodes[6].children[0].checked;
	var branch_del = trTag.childNodes[7].children[0].checked;
	$.ajax({
		url:"/admin/assign",
		type:"post",
		data:{
			_method:"PUT",
			auth_id:auth_id,
			auth_name:auth_name,
			admin_assign:admin_assign,
			member_del:member_del,
			board_del:board_del,
			review_del:review_del,
			review_comment_del:review_comment_del,
			product_del:product_del,
			branch_del:branch_del
		},
		success:function(result){
			showMsg(result);
			getList();//수정 후 갱신
		}
	});
}
function showMsg(json){
	var msg = JSON.parse(json);
	alert(msg.msg);
}

//페이지에 내용표시
function viewList(json){
	var con=$("#container");
	con.html("");//기존 데이터 비우기
	for(var i=0;i<json.length;i++){
		var obj = json[i];
		var str="";
		str+="<tr id='table_tr_"+obj.auth_id+"'>";
		str+="<td><input type='text' value='"+obj.auth_name+"'/></td>";
		if(i<2){//기본으로 사용되는 것은 수정 못하도록
			//obj.admin_assign
			if(obj.admin_assign){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}
		
			//obj.member_del
			if(obj.member_del){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}
			
			//obj.board_del
			if(obj.board_del){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}

			//obj.review_del
			if(obj.review_del){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}
			
			//obj.review_comment_del
			if(obj.review_comment_del){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}
			
			//obj.product_del
			if(obj.product_del){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}
			
			//obj.branch_del
			if(obj.branch_del){
				str+="<td><input type='checkbox' disabled='disabled' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox' disabled='disabled'/></td>";
			}
		}else{
			if(obj.admin_assign){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}
			
			//obj.member_del
			if(obj.member_del){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}
			
			//obj.board_del
			if(obj.board_del){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}

			//obj.review_del
			if(obj.review_del){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}
			
			//obj.review_comment_del
			if(obj.review_comment_del){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}
			
			//obj.product_del
			if(obj.product_del){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}

			//obj.branch_del
			if(obj.branch_del){
				str+="<td><input type='checkbox' checked='checked'/></td>";
			}else{
				str+="<td><input type='checkbox'/></td>";
			}
			
			str+="<td><button onClick='authDelete("+obj.auth_id+")'>삭제</button>";
		}
		str+="<button onClick='authEdit("+obj.auth_id+",this)'>수정</button>";
		str+="</td>";
		str+="</tr>";
		con.append(str);
	}
}
