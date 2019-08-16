<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/include/head.jsp" %>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		//regist
		$(function(){
			$("input[name='join_button']").click(function(){
				regist();
			});
		});
		function regist(){
			$("form[name='joinForm']").attr({
				method:"post",
				action:"/member/regist"
			});
			$("form[name='joinForm']").submit();
		}
		//id 중복확인
		function IDchkBtns(){
			var userid=document.getElementById("userid");
			var IDchkDesc = document.getElementById("IDchkDesc");
			if(userid.value==""){
				alert ("아이디가 비어있습니다.");
				userid.focus();
				IDchkDesc.innerHTML="<strong style='color:red'>아이디 필수 입력</strong>";
			}else{
				$.ajax({
					url:"/member/idCheck",
					type:"post",
					data:{
						id:$("input[name='userid']").val()
					},
					success:function(result){
						var json = JSON.parse(result);
						if(json.result==1){
							alert(json.result+","+json.msg);
							IDchkDesc.innerHTML="<strong style='color:blue'>"+json.msg+"</strong>";
						}else if(json.result==0){
							alert(json.result+","+json.msg);
							IDchkDesc.innerHTML="<strong style='color:red'>"+json.msg+"</strong>";
						}
					}
				});
			}
		}
		
		//postcode
		function postcode(){
			new daum.Postcode({
				oncomplete: function(data) {
					document.getElementById("post1").value = data.postcode1;
					document.getElementById("post2").value = data.postcode2;
					document.getElementById("post3").value = data.zonecode;
					console.log("post3 : ",document.getElementById("post3").value);
					console.log("post3 확인 : ",data.zonecode);
					document.getElementById("add1").value = data.address;
					document.getElementById("add2").focus();
				}
			}).open();
		}
	</script>
</head>
<body>
	<div id="wrap">
		<%@include file="/include/header.jsp"%>
		<div class="join_container">
			<form name="joinForm">
				<legend>회원가입하기</legend>
				<p class="join_textArea">
					전세계 상위 1% 스페셜티만을 소개합니다. <br/>
					산지 직접 계약 원두의 신선함을 약속드립니다.
				</p>
				<p class="join_idArea">
					<label for="userid">아이디</label>
					<input id="userid" type="text" name="userid" maxlength="10" placeholder="10자 까지 입력가능"/>
					<span id="IDchkDesc"> ※ 아이디 중복체크 </span>
					<input id="IDchkBtn" type="button" name="IDchkBtn" value="중복체크" onclick="IDchkBtns();" style="cursor:pointer;"/>
				</p>
				<p>
					<label for="userpass"> 비밀번호 </label>
					<input id="userpass" type="password" name="userpass" maxlength="8" placeholder="8자 까지 입력가능" required/>
				</p>
				<p>
					<label for="username"> 이름 </label>
					<input id="username" type="text" name="username" placeholder="이름을 입력해주세요." required/>
				</p>
				<p>
					<label for="usermail"> 이메일 </label>
					<input id="usermail" type="email" name="usermail" placeholder="이메일을 입력해주세요."  required/>
				</p>
				<p>
					<label for="userphone"> 전화번호 </label>
					<input id="userphone" type="tel" name="userphone" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="예) 010-123-4567" required/>
				</p>
	
				<p id="postArea">
					<label for="post1">우편번호: </label><input id="post1" type="text" name="post1" title="우편번호 앞자리"/> 
					<span>-</span><input id="post2" type="text" name="post2" title="우편번호 뒷자리"/><br/>
					<input id="post3"  type="text" name="post3" title="새로운우편번호" placeholder="새로운 우편번호"/>
					<input id="postBtn" type="button"  value="우편번호찾기" onclick="postcode();"/>
				</p>
				<p>
					<label for="add1">상세주소: </label><input id="add1" type="text" name="add1" title="상세주소1"/> 
					<input id="add2" type="text" name="add2" title="상세주소2"/>
				</p>
				<p id="join_button">
					<input type="button" name="join_button" value="가입하기"/> <input type="reset" value="다시작성"/>
				</p>
			</form>
		</div>
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>