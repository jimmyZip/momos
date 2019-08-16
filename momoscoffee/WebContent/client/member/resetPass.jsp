<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">	
		//비밀번호 재설정용 메일발송 직전 아이디, 이메일로 회원확인
		function infoCheck(){
			alert("인증을 진행합니다. 잠시만 기다려주세요.");
			var idCheck=document.getElementById("idCheck").value;
			var mailCheck=document.getElementById("mailCheck").value;
			console.log("메일발송 전 확인할 아이디 : ",idCheck);
			console.log("메일 발송 전 확인할 이메일 : ",mailCheck);
			$.ajax({
				type:"GET",
				//url:"/member/infoCheck/"+userid+"/"+usermail,
				url:"/member/infoCheck/"+idCheck+"/"+mailCheck+"/",
				success:function(result){
					var json=JSON.parse(result);
					if(json.result==1){
						alert(json.msg);
						console.log(json.result+"이니까 sendMail()로 간다.");
						sendMail();
						//$("#confirmCode,#btnConfirm").attr("disabled",false);
					}else{
						alert(json.msg);
					}
				},error:function(result){}
			});
		}
		
		//인증메일 발송
		function sendMail(){
			console.log("infoCheck 완료되었으니 일로 왔으니 이메일을 보내겠음");
			$.ajax({
				url:"/member/sendMail",
				type:"post",
				success:function(result){
					if(result==true){
						alert("인증메일을 발송했습니다.");
						$("#confirmCode,#btnConfirm").attr("disabled",false);
					}
				},error:function(result){}
			});
		}
		
		//메일인증확인
		function checkCode(){
			alert("인증코드를 비교합니다. 잠시만 기다려주세요.");
			$.ajax({
				url:"/member/codeCheck",
				type:"post",
				data:{
					id:document.getElementById("idCheck").value,
					email:document.getElementById("mailCheck").value,
					num : confirmCode.value
				},
				success:function(result){
					console.log("인증코드확인 result : ",result);
					var json=JSON.parse(result);
					console.log("인증확인 result json : ",json);
					if(json.result==1){
						alert(json.msg);
						$("#newpass,#btnResetPw").attr("disabled",false);
					}else{
						alert(json.msg);
					}
				},error:function(result){}
			});
		}
		
		function resetPw(){
			alert("비밀번호 재설정을 진행합니다. 잠시만 기다려주세요");
			$.ajax({
				url:"/member/resetpw",
				type:"post",
				data:{
					userpass : newpass.value,
					userid:document.getElementById("idCheck").value,
					usermail:document.getElementById("mailCheck").value
				},
				success:function(result){
					console.log("비번 재설정 result : ",result);
					var json=JSON.parse(result);
					console.log("비번 재설정 result json : ",json);
					if(json.result==1){
						alert(json.msg);
						$("#modal_full,#modal_view").hide();
						location.href="redirect:/member/gologin";
					}else if(json.result==0){
						alert(json.msg);
						location.href="redirect:/member/gologin";
					}
				}
			});
		}
		/*
			resetPw에서 userid와 usermail은 
			session.getAttribute("targetId"), session.getAttribute("targetMail")을 사용했으나
			테스트 시 너무 불안정해서 컨트롤러 이후 단에서 확인이 되었다면 
			최초로 받은 input의 value로 계속 사용
		*/
	</script>
</head>
<body>
	<div id="wrap">
		<div class="resetPw_container">
			<h3>비밀번호 재설정 진행을 위해 이메일을 입력해주세요.</h3>
			<form name="resetPwForm">
				<div class="checkEmail">
					<input id="idCheck" type="text" name="idCheck" placeholder="아이디를 입력해주세요."  required/>
					<input id="mailCheck" type="email" name="mailCheck" placeholder="이메일을 입력해주세요."  required/>
				</div>
				<div class="sendMailBtn">
					<input type="button" id="btnSendMail" title="메일발송버튼" value="SendMail" onClick="infoCheck()"/>
				</div>
				<hr/>
				<div class="checkCode">
					<input id="confirmCode" type="text" name="confirmCode" placeholder="인증코드 입력" required disabled="true"/>
				</div>
				<div class="checkConfirm">
					<input type="button" id="btnConfirm" title="인증코드 입력 버튼" value="confirm" onClick="checkCode()" disabled="true"/>
				</div>
				<hr/>
				<div class="resetMyPw">
					<input id="newpass" type="password" name="newpass" maxlength="8" placeholder="새 비밀번호 입력(8자 까지 가능)" required disabled="true"/>
				</div>
				<div class="resetPwBtn">
					<input type="button" id="btnResetPw" title="비번재설정버튼" value="PW reset" onClick="resetPw()" disabled="true"/>
				</div>
			</form>
		</div>
	</div>
</body>
</html>