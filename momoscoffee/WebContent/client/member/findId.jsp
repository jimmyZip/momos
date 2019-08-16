<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">	
		//id찾기
		function findId(){
			$.ajax({
				url:"/member/findId",
				type:"post",
				data:{
					username:$("input[name='username']").val(),
					userphone:$("input[name='userphone']").val()
				},
				success:function(result){
					var json=JSON.parse(result);
					if(json.result==1){
						$("#idResult").val(json.msg);
					}else if(json.result==0){
						$("#idResult").val(json.msg);
					}
				},
				error:function(result){}
			});
		}
	</script>
</head>
<body>
	<div id="wrap">
		<div class="findId_container">
			<h3>가입 시 기재한 성명과 전화번호를 입력해주세요.</h3>
			<form name="findIdForm">
				<div id="findMyId">
					<input id="username" type="text" name="username" placeholder="이름을 입력해주세요." required/>
					<input id="userphone" type="tel" name="userphone" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="예) 010-123-4567" required/>
				</div>
				<div class="findBtn">
					<input type="button" id="btnFind" title="찾기버튼" value="ID찾기" onClick="findId()"/>
				</div>
			</form>
			<div class="findResult">
				<input id="idResult" type="text" name="idResult" placeholder="ID찾기 결과" readonly/>
			</div>
		</div>
	</div>
</body>
</html>