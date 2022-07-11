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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
		
	$(function(){
		fnLogin();	
		fnRememberId();
	})
	function fnLogin(){
	
		$('#Loginform').on('submit', function(e){
			if($('#memberId').val() == ''){
				alert('아이디를 입력하세요.');
				e.preventDefault();
				return false;
			}
			if($('#memberPw').val() == ''){
				alert('비밀번호를 입력하세요.');
				e.preventDefault();
				return false;
			}
			if($('#rememberId').is(':checked')){			
				$.cookie('rememberId', $('#memberId').val());		
			} else{
				$.cookie('rememberId', '');					
			}
			return true;
		})
	}
	function fnRememberId(){
		let rememberId = $.cookie('rememberId');
		if(rememberId !=''){	
			$('#memberId').val(rememberId);
			$('#rememberId').prop('checked', true);
		} else {				
			$('#memberId').val('');
			$('#rememberId').prop('checked', false);
		}
	}

</script>
<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Pacifico&display=swap" rel="stylesheet">
<style>
	@font-face {
	    font-family: 'MICEMyungjo';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	    font-family: 'Kaushan Script', cursive; 
 	}
    * {
    	padding: 0;
    	margin: 0;
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
	.login > a {
		color : #333;
		text-decoration: none;
	}
    .text {
    	text-align: center;
    	font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .text_con {
    	font-size: 16px;
    	font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .join {
    	width: 410px;
    	margin: 110px auto;
    	padding: 30px 60px 50px;
    	border: 1px solid #dadada;
    }
    .login {
       	width: 100%;
       	height: 50px;
       	margin: 0 0 85px 0;
       	text-align: center;
	    font-size: 80px;
	}
    .content {
    	margin: 10px 0;
    }
    .login_box {
        display: block;
        height: 60px;
        margin-top: 10px;
        margin-bottom: 12px;
        border: 1px solid #d7d7d7;
        position: relative;
    }
	.login_box > input {
         width: 350px;
         height: 17px;
         position: absolute;
         padding: 20px 19px 15px;
         color: #333;
         outline: none;
         border: none;
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-style: normal;
         font-size: 20px;
         font-weight: bold;
        }
     .btn_login {
         display: block;
         height: 60px;
         width: 410px;
         background-color: black;
         color: #fff;
         letter-spacing: -0.5px;
         text-align: center;
         line-height: 60px;	
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-size: 18px;
         font-weight: bold;
         font-style: normal;
         margin: 0 auto;
     }
     .auto {
     	margin-top: 10px;
     	font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        font-size: 18px;
     }
	.button_box {
         margin: 30px 0;
         text-align: center;
         border-top: 1px solid #f2f2f5;
         font-size: 14px;
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-weight: normal;
         font-style: normal;
     }
     .button_box > a {
         display: inline-block;
         padding: 19px 18px 0;
         color: #333;
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-weight: normal;
         font-style: normal; 
         font-size: 16px;
     }

</style>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
        <div class="join">
       		<form id="Loginform" action="/member/login" method="post">
				<div class="login">
					<a href="/">Yogioteur</a>
				</div>
				
				<div class="text">
				   <p class="text_con"><strong>아이디와 비밀번호를 입력해 주시기 바랍니다.</strong></p>
				   <p class="text_con">Yogioteur 호텔 회원이되시면 회원만을 위한 다양한 서비스와 
				      혜택을 받으실 수 있습니다.</p>
				</div>
				<input type="hidden" name="url" value="${url}">
				<div class="content">
					<div class="login_box">
						<input type="text" id="memberId" name="memberId" class="login_id" placeholder="아이디">
					</div>
					<div class="login_box">
						<input type="password" id="memberPw" name="memberPw" class="login_pw" placeholder="비밀번호">
					</div>
				</div>
				<button class="btn_login" >로그인</button>
				
				<div class="auto">
					<label>
						<input type="checkbox" id="rememberId">아이디저장
					</label>
				</div>
			</form>
	
			<div class="button_box">
				<a href="/member/findIdPage">아이디 찾기</a> |
				<a href="/member/findPwPage">비밀번호 찾기</a> |
				<a href="/member/agreePage">회원가입</a> 
			</div>
			
			<!-- 네이버 아이디 로그인 -->
			<a href="${apiURL}"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" class="btn_login"/></a>
		
		</div>

</body>
</html>