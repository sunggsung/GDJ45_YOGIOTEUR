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
	//비밀번호 정규식
	$(function(){
		fnConfirm();
	})
	
	function fnConfirm(){
		$('#confirmPwForm').on('submit', function(e){
			if($('#memberPw').val() == ''){
				alert('비밀번호를 입력하세요.');
				e.preventDefault();
				return false;
			}
		})
	}
</script>
<style>
	.dont {
		color: red;
	}
	.ok {
		color: blue;
	}
	.join {
    	width: 390px;
    	height: 350px;
    	margin: 110px auto;
    	padding: 50px 50px 80px;
    	border: 1px solid #dadada;
    }
	.confirm {
		width: 100%;
       	height: 40px;
       	margin: 0 auto 30px;
       	text-align: center;
       	font-size: 40px;
        font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
	}
	.text {
	    font-size: 16px;
        font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
	}
	.InputArea {
		display: block;
		position: relative;
		margin: 20px 0;
		width: 100%;
		height: 60px;
		border: solid 1px #dadada;
		padding: 10px 0px 10px 10px;
		box-sizing: border-box;
		vertical-align: top;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
	}
	.box {
		border: 1px solid #dadada;
		display: inline-block;
		width: 70%;
		height: 30px;
		outline: none;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
		padding: 7px 10px 0 5px;
	}
	.btn {
		display: block;
		text-align: center;
		margin: 0 auto;
		line-height: 30px;
		margin: 0 0 20px 0;
	}
	.btn_confirm {
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
		padding: 20px 40px;
		border: 1px solid #dadada;
		background-color: black;
		color: #fff;
	}
</style>
</head>
<body>
		
	<jsp:include page="../layout/header.jsp"></jsp:include>
		
		<div class="join" >
			<form id="confirmPwForm" action="${contextPath}/member/signOut" method="post">
				<div class="authArea">
					<div class="confirm">회원 인증</div>
					<div class="text">
						<p>
						<strong>정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</strong>
						<br>비밀번호가 타인에게 노출되지 않도록 항상 주의해주세요.
						</p>
					</div>
					<div class="InputArea">	
						아이디 : ${loginMember.memberId}
					</div>
					<div class="InputArea">	
						비밀번호 : <input type="password" class="box" name="memberPw" id="memberPw">
					</div>
					<input type="hidden" name="memberId" value="${loginMember.memberId}">
					<div class="btn">
						<button class="btn_confirm">확인</button>
						<input type="button" class="btn_confirm" value="취소" onclick="location.href='${contextPath}/'">
					</div>
				</div>
			</form>
		</div>
</body>
</html>