<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	$(function(){
		fnPwCheck();
		fnPwConfirm();
		fnEmailAuth();
		fnToUpperCase();
		fnChangePw();
	})
	
	let pwPass = false;
	function fnPwCheck(){
		$('#memberPw').on('keyup', function(){
			let regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/; 
			if(regPw.test($('#memberPw').val())==false){
				$('#pwMsg').text('영문, 숫자, 특수문자 포함 8~12자로 입력해주세요.').addClass('dont').removeClass('ok');
				pwPass = false;
			} else {
				$('#pwMsg').text('사용 가능한 비밀번호입니다.').addClass('ok').removeClass('dont');
				pwPass = true;
			}
		})
	}
	
	let rePwPass = false;
	function fnPwConfirm(){
		$('#memberRePw').on('keyup', function(){
			if($('#memberRePw').val() != '' && $('#memberPw').val() != $('#memberRePw').val()){
				$('#rePwMsg').text('비밀번호를 확인하세요.').addClass('dont').removeClass('ok');
				rePwPass = false;
			} else {
				$('#rePwMsg').text('');
				rePwPass = true;
			}
		})
	}
	
	function fnIdEmailCheck(){
		return new Promise(function(resolve, reject){
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;
			if(regEmail.test($('#memberEmail').val())==false){
				alert('잘못된 형식의 이메일입니다.');
				return;
			}
			$.ajax({
				url: '/member/idEmailCheck',
				type: 'get',
				data: 'memberId=' + $('#memberId').val() + '&memberEmail=' + $('#memberEmail').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.findMember != null){ 
						resolve();
					} else {
						reject(401);  
					}
				}
			})
		})
	}
	
	function fnEmailAuth(){
		$('#btnGetAuthCode').on('click', function(){
			fnIdEmailCheck()
				.then(function(){
					$.ajax({
						url: '/member/sendAuthCode',
						type: 'get',
						data: 'memberEmail=' + $('#memberEmail').val(),
						dataType: 'json',
						success: function(obj){  
							alert('인증코드를 발송했습니다. 이메일을 확인하세요.');
							fnVerifyAuthCode(obj.authCode);  
						},
						error: function(){
							alert('인증코드 발송이 실패했습니다.');
						}
					})
				}).catch(function(errorCode){
					alert('예외코드[' + errorCode + '] 회원 정보를 찾을 수 없습니다.');
				})
		})
	}
	
	let authCodePass = false;
	function fnVerifyAuthCode(authCode){
		$('#btnVerifyAuthCode').on('click', function(){
			if($('#authCode').val() == authCode){
				alert('인증되었습니다.');
				$('.authArea').css('display', 'none');
				$('.changeArea').css('display', 'block');
				authCodePass = true;
			} else {
				alert('인증에 실패했습니다.');
				authCodePass = false;
			}
		})
	}
	
	function fnToUpperCase(){
		$('#authCode').on('keyup', function(){
			$('#authCode').val($('#authCode').val().toUpperCase());
		})
	}
	
	function fnChangePw(){
		$('#findPwForm').on('submit', function(event){
			if(pwPass == false || rePwPass == false){
				alert('비밀번호를 확인하세요.');
				event.preventDefault();
				return false;
			}
			else if(authCodePass == false){
				alert('이메일 인증을 받아야 합니다.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}
	
</script>
<style>
	.changeArea {
		display: none;
	}
	.dont {
		color: red;
	}
	.ok {
		color: blue;
	}
	form > a {
		text-decoration: none;
		color: gray;	
		font-size: 30px;
	}
	.button_box > a {
		color : #333;
		text-decoration: none;
	}
    * {
    	padding: 0;
    	margin: 0;
    }
    .join {
    	width: 390px;
    	height: 350px;
    	margin: 110px auto;
    	padding: 50px 50px 80px;
    	border: 1px solid #dadada;
    }
    .findPw {
       	width: 100%;
       	height: 40px;
       	margin: 0 auto 30px;
       	text-align: center;
       	font-size: 40px;
        font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .findPw a {
 		text-decoration: none;
		color: #333;	
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .text {
       font-size: 18px;
       font-family: 'MICEMyungjo';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
       font-weight: normal;
       font-style: normal;
    }
    .content {
    	margin: 10px 0;
    }
    .msg {
       font-size: 16px;
       font-family: 'MICEMyungjo';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
       font-weight: 600;
       font-style: normal;
       padding: 5px 0 12px 0;
    }
    .InputArea {
		display: block;
		position: relative;
		width: 100%;
		height: 60px;
		border: solid 1px #dadada;
		padding: 9px 0px 10px 12px;
		box-sizing: border-box;
		vertical-align: top;
	}
    .box {
		border: 0 none;
		display: block;
		width: 90%;
		height: 30px;
		outline: none;
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
		padding: 7px 10px 0 5px;
	 }
    .boxes {
		height: 30px;
		width: 70%;
		border: solid 1px #dadada;
		outline: none;
		padding: 4px 0px 4px 6px;
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
	 }
	.button_box {
         margin-top: 20px;
         text-align: center;
         border-top: 1px solid #f2f2f5;
         font-size: 14px;
     }
    .button_box > a {
         display: inline-block;
         padding: 19px 18px 0;
         color: #333;
         font-size: 16px;
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-weight: normal;
         font-style: normal;
     }
    .btn_find {
         display: block;
         height: 60px;
         width: 390px;
         background-color: black;
         font-size: 16px;
         color: #fff;
         letter-spacing: -0.5px;
         text-align: center;
         line-height: 60px;	
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-weight: bold;
         font-style: normal;
         margin: 0 auto;
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
         background-color: black;
         color: #fff;
         cursor: pointer;
     }
</style>
</head>
<body>

		<jsp:include page="../layout/header.jsp"></jsp:include>
		
		<div class="join" >
			<form id="findPwForm" action="${contextPath}/member/findPw" method="post">
			<div class="authArea">
				<div class="findPw">
					<a href="${contextPath}/member/findPwPage">비밀번호 찾기</a>
				</div>
					<div class="text">
						<p><strong>본인확인 후 비밀번호를 다시 설정할 수 있습니다.</strong></p>
					</div>
					<div class="InputArea">	
						<input type="text" name="memberId" id="memberId" class="box" placeholder="아이디">
					</div>
					<div class="find_box">
						<div class="InputArea">
							<input type="text" id="memberEmail" class="boxes" placeholder="이메일">
							<input type="button" class="btn_send" value="인증번호받기" id="btnGetAuthCode">
						</div>
							<span id="emailMsg"></span>
						<div class="InputArea">
							<input type="text" id="authCode" class="boxes" placeholder="인증코드를 입력하세요">
							<input type="button" class="btn_send" value="인증하기" id="btnVerifyAuthCode">
						</div>
						<div class="button_box">
							<a href="/member/findIdPage">아이디찾기</a> |
							<a href="/member/loginPage">로그인</a> 
						</div>
					</div>
			</div>
				<div class="changeArea">
					<div class="findPw">
						비밀번호 재설정
					</div>
					<div class="InputArea">
						<input type="password" name="memberPw" id="memberPw" class="box" placeholder="새 비밀번호">
					</div>
					<div id="pwMsg" class="msg"></div>
					<div class="InputArea">
						<input type="password" id="memberRePw" class="box" placeholder="새 비밀번호 확인">
					</div>
						<div id="rePwMsg" class="msg"></div>
					<button class="btn_find">확인</button>
				</div>
			</form>
		</div>

</body>
</html>