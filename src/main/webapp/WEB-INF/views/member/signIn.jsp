<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ok {
		color: blue;
	}
	.dont {
		color: red;
	}
	.signIn {
		text-align: center;
		border-bottom: 1px solid black;
		width: 40%;
		margin: 30px auto;
		padding-bottom: 20px;
	}
	.signIn a {
 		text-decoration: none;
		color: #333;	
		font-size: 40px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 500;
        font-style: normal;
    }
	.join_container {
		margin: 0 auto;
		width: 460px;
		box-sizing: border-box;
	}
	.input {
		margin: 22px 0 8px;
		font-size: 22px;
		font-weight: 600;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
	}
	label {
		cursor: pointer;
	}
	. InputAreaWrapper {
		margin-bottom: 10px;
	}
	.InputArea {
		display: block;
		position: relative;
		margin: 0;
		width: 100%;
		height: 60px;
		border: solid 1px #dadada;
		padding: 10px 110px 10px 14px;
		box-sizing: border-box;
		vertical-align: top;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
	}
	.InputArea_con {
		display: block;
		position: relative;
		width: 100%;
		height: 90px;
		border: solid 1px #dadada;
		padding: 10px 110px 10px 14px;
		box-sizing: border-box;
		vertical-align: top;
	}
	.box {
		border: 0 none;
		display: block;
		width: 100%;
		height: 40px;
		outline: none;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
	}
	.boxes {
		height: 30px;
		width: 60%;
		border: solid 1px #dadada;
		outline: none;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
	}
	.msg {
       font-size: 16px;
       font-family: 'MICEMyungjo';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
       font-weight: 600;
       font-style: normal;
       padding: 2px 0 8px 0;
    }
	.BtnArea {
		text-align: center;
		display: block;
		line-height: 30px;
		margin: 20px 0;
	}
	.btn_signIn {
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
		padding: 20px 40px;
		border: 1px solid #dadada;
		background-color: black;
		color: #fff;
		cursor: pointer;
	}
	.btn_send {
     	text-align: center;
     	font-size: 15px;
        font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
        margin: 0 auto;
        padding: 5px;
        cursor: pointer;
     }
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		fnSignIn();
		fnIdCheck();
		fnPwCheck();
		fnPwConfirm();
		fnEmailAuth();
		fnPhoneCheck();
		fnBirthCheck();
	})
	// ??????
	function fnSignIn(){
		$('#SignInform').on('submit', function(event){
			if(idPass == false){
				alert('???????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			if(pwPass == false || rePwPass == false){
				alert('??????????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			if(authCodePass == false){
				alert('????????? ????????? ????????? ?????????.');
				event.preventDefault();
				return false;
			}
			if(phonePass == false){
				alert('??????????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			if(birthPass == false){
				alert('??????????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			if($('#memberPostcode').val() == ''){
				alert('??????????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			if($('#memberRoadAddress').val() == ''){
				alert('????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			if($('#memberName').val() == ''){
				alert('????????? ???????????????.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}
	
	
	// ???????????? ?????????
	let birthPass = false;
	function fnBirthCheck(){
		$('#memberBirth').on('keyup', function(){
			let regBirth = /^\d{6}$/;
			if(regBirth.test($('#memberBirth').val())==false){
				$('#memberBirthMsg').text('??????????????? ???????????? ???????????? ??????????????????.').addClass('dont').removeClass('ok');
				birthPass = false;
			} else {
				$('#memberBirthMsg').text('');
				birthPass = true;
			}
		})
	}
	
	
	// ????????? ?????????
	let phonePass = false;
	function fnPhoneCheck(){
		$('#memberPhone').on('keyup', function(e){
			let regPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
			if(regPhone.test($('#memberPhone').val())==false){
				$('#memberPhoneMsg').text('??????????????? -(?????????)?????? ??????????????????.').addClass('dont').removeClass('ok');
				phonePass = false;
			} else {
				$('#memberPhoneMsg').text('');
				phonePass = true;
			}
		})
	}
	
	
	// ????????? ??????
	function fnEmailCheck(){
		return new Promise(function(resolve, reject) {
			// ????????? 
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/; 
			if(regEmail.test($('#memberEmail').val())==false){
				reject(1000);      
				return;
			}
			// ?????? 
			$.ajax({
				url: '/member/emailCheck',
				type: 'get',
				data: 'memberEmail=' + $('#memberEmail').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						resolve();     
					} else {
						reject(2000); 
					}
				}
			})
		});
	}
	
	// ????????? ??????
	let authCodePass = false;
	function fnVerifyAuthCode(authCode){  
		$('#btnVerifyAuthCode').on('click', function(){
			if($('#authCode').val() == authCode){
				alert('?????????????????????.');
				authCodePass = true;
			} else {
				alert('????????? ??????????????????.');
				authCodePass = false;
			}
		})
	}
	
	// ????????? ????????????
	function fnEmailAuth(){
		$('#btnGetAuthCode').on('click', function(){
			fnEmailCheck().then(
				function(){
					$.ajax({
						url: '/member/sendAuthCode',
						type: 'get',
						data: 'memberEmail=' + $('#memberEmail').val(),
						dataType: 'json',
						success: function(obj){  
							$('#memberEmailMsg').text('?????? ????????? ??????????????????.').addClass('ok').removeClass('dont');;
							alert('??????????????? ??????????????????. ???????????? ??????????????????.');
							fnVerifyAuthCode(obj.authCode);  
						},
						error: function(jqXHR){
							alert('???????????? ????????? ??????????????????.');
						}
					})
				}
			).catch(
				function(code){
					if(code == 1000){
						$('#memberEmailMsg').text('????????? ????????? ???????????? ????????????.').addClass('dont').removeClass('ok');
						$('#authCode').prop('readonly', true);
					} else if(code == 2000){
						$('#memberEmailMsg').text('?????? ?????? ?????? ??????????????????.').addClass('dont').removeClass('ok');
						$('#authCode').prop('readonly', true);
					}
				}
			)
		})
	}
	
	// ???????????? ?????????
	let rePwPass = false;
	function fnPwConfirm(){
		$('#memberPwConfirm').on('keyup', function(){
			if($('#memberPwConfirm').val() != '' && $('#memberPw').val() != $('#memberPwConfirm').val()){
				$('#memberPwConfirmMsg').text('??????????????? ??????????????????.').addClass('dont').removeClass('ok');
				rePwPass = false;
			} else {
				$('#memberPwConfirmMsg').text('');
				rePwPass = true;
			}
		})
	}
	
	
	// ???????????? ?????????
	let pwPass = false;
	function fnPwCheck(){
		$('#memberPw').on('keyup', function(){
			let regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/; 
			if(regPw.test($('#memberPw').val())==false){
				$('#memberPwMsg').text('8~12?????? ??????, ??????, ???????????? ????????????????????? ???????????????.').addClass('dont').removeClass('ok');
				pwPass = false;
			} else {
				$('#memberPwMsg').text('?????? ????????? ?????????????????????.').addClass('ok').removeClass('dont');
				pwPass = true;
			}
		})
	}
	
	
	// ?????????(??????&?????????)
	let idPass = false;
	function fnIdCheck(){
		$('#memberId').on('keyup', function(){
			// ????????? 
			let regId = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,11}$/; 
			if(regId.test($('#memberId').val())==false){
				$('#memberIdMsg').text('6~12?????? ??????,????????? ?????????????????????.').addClass('dont').removeClass('ok');
				idPass = false;
				return;
			}
			// ????????? ?????? ??????
			$.ajax({
				url: '/member/idCheck',
				type: 'get',
				data: 'memberId=' + $('#memberId').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#memberIdMsg').text('?????? ????????? ??????????????????.').addClass('ok').removeClass('dont');
						idPass = true;
					} else {
						$('#memberIdMsg').text('?????? ?????????????????? ????????? ??????????????????.').addClass('dont').removeClass('ok');
						idPass = false;
					}
				},
				error: function(jqXHR){
					$('#memberIdMsg').text(jqXHR.responseText).addClass('dont').removeClass('ok');
					idPass = false;
				}
			})
		})
	}
	
	function fnPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; 
	                $('#memberPostcode').val(data.zonecode);
	                $('#memberRoadAddress').val(roadAddr);
            }
        }).open();
    }
</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="signInWapper">
		<div class="signIn" >
			<a href="/member/agreePage">????????????</a>
		</div>
		
		<div class="join_container">
			<form id="SignInform" action="/member/signIn" method="post">
			
				<input type="hidden" name="info" value="${agreements[0]}">
				<input type="hidden" name="event" value="${agreements[1]}">
				<div class="group">
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberId">?????????</label>
						</div>
							<div class="InputArea">
								<input type="text" name="memberId" id="memberId" class="box" placeholder="6~12??? ??????,??????">
							</div>
							<div id="memberIdMsg" class="msg"></div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberPw">????????????</label>
						</div>
							<div class="InputArea">
								<input type="password" name="memberPw" id="memberPw" class="box" placeholder="??????, ??????, ???????????? ???????????? 8~12???">
							</div>
							<div id="memberPwMsg" class="msg"></div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberPwConfirm">???????????? ?????????</label>
						</div>
							<div class="InputArea">
								<input type="password" id="memberPwConfirm" class="box" placeholder="??????, ??????, ???????????? ???????????? 8~12???">
							</div>
							<div id="memberPwConfirmMsg" class="msg"></div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberName">??????</label>
						</div>
							<div class="InputArea">
								<input type="text" name="memberName" id="memberName" class="box" placeholder="??????">
							</div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberPhone">?????????</label>
						</div>	
							<div class="InputArea">
								<input type="text" name="memberPhone" id="memberPhone" class="box" placeholder="?????????(-)??? ?????? ??????" maxlength="13">
							</div>
							<div id="memberPhoneMsg" class="msg"></div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberBirth">????????????</label>
						</div>	
							<div class="InputArea">
								<input type="text" name="memberBirth" id="memberBirth" class="box" placeholder="????????????(6???)" maxlength="6">
							</div>
							<div id="memberBirthMsg" class="msg"></div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberGender">??????</label>
						</div>	
							<div class="InputArea">
								<input type="radio" name="memberGender" id="male" value="male" checked="checked">
								<label for="male" >Male</label>
								<input type="radio" name="memberGender" id="female" value="female">
								<label for="female" >Female</label>
							</div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							??????
						</div>	
							<div class="InputArea_con">
								<input type="text" name="memberPostCode" id="memberPostcode" class="boxes" placeholder="????????????">
								<input type="button" class="btn_send" onclick="fnPostcode()" value="???????????? ??????">
								<input type="text" name="memberRoadAddr" id="memberRoadAddress" class="boxes"  placeholder="???????????????">
							</div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberEmail">????????? ??????</label>
						</div>	
							<div class="InputArea">
								<input type="text" name="memberEmail" id="memberEmail" class="boxes" placeholder="?????????">
								<input type="button" class="btn_send" id="btnGetAuthCode" value="??????????????????"><br>
								<div id="memberEmailMsg" class="msg"></div>
							</div>
					</div>
					<div class="InputAreaWapper">
						<div class="input">
							<label for="authCode">????????? ??????</label>
						</div>
							<div class="InputArea">	
								<input type="text" name="authCode" id="authCode" class="boxes" placeholder="??????????????? ???????????????">
								<input type="button" class="btn_send" value="????????????" id="btnVerifyAuthCode">
							</div>
					</div>
					
					<div class="InputAreaWapper">
						<div class="input">
							<label for="memberPromoAdd">????????? ????????????</label>
						</div>	
							<div class="InputArea">
								<input type="radio" name="memberPromoAdd" id="agree_yes" value="yes" checked="checked">
								<label for="agree_yes">?????????</label>
								<input type="radio" name="memberPromoAdd" id="agree_no" value="no">
								<label for="agree_no">????????????</label>
							</div>
					</div>
				</div>
				
				<div class="BtnArea">
					<input type="button" class="btn_signIn" value="??????" onclick="location.href='${contextPath}/'"> 
					<button class="btn_signIn">??????</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>
