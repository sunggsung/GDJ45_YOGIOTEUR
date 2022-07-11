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
		fnFindId();
	})
	
	function fnFindId(){
		$('#findIdForm').on('submit', function(e){
			if($('#memberName').val() == '' || $('#memberEmail').val() == ''){
				alert('이름과 이메일을 입력해주세요.');
				e.preventDefault();
				return;
			}
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/;  
			if(regEmail.test($('#memberEmail').val())==false){
				alert('잘못된 형식의 이메일입니다.');
				$('#memberEmail').focus();
				return false;
			}
		})
	}

</script>
<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Pacifico&display=swap" rel="stylesheet">
<style>
	@font-face {
	    font-family: 'MICEMyungjo';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
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
    	margin: 110px auto;
    	padding: 60px 50px 51px;
    	border: 1px solid #dadada;
  	    font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .findId {
       	width: 100%;
       	height: 40px;
       	margin: 0 auto 30px;
       	text-align: center;
       	font-size: 40px;
    }
    .findId a {
 		text-decoration: none;
		color: #333;	
    }
    .content {
    	margin: 10px 0;
    }
    .find_box {
        display: block;
        height: 60px;
        margin-top: 10px;
        margin-bottom: 12px;
        border: 1px solid #d7d7d7;
        position: relative;
    }
	.find_box > input {
         width: 350px;
         height: 17px;
         padding: 20px 19px 15px;
         color: #333;
         outline: none;
         border: none;
         position: absolute;
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-style: normal;
         font-size: 20px;
         font-weight: bold;
        }
     .btn_findId {
         display: block;
         height: 60px;
         width: 390px;
         background-color: black;
         font-weight: bold;
         color: #fff;
         letter-spacing: -0.5px;
         text-align: center;
         line-height: 60px;	
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-size: 18px;
         font-weight: bold;
         margin: 0 auto;
         cursor: pointer;
     }
	.button_box {
         margin-top: 30px;
         text-align: center;
         border-top: 1px solid #f2f2f5;
         font-size: 14px;
         cursor: pointer;
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
	
	<div class="join" >
		<form id="findIdForm" action="/member/findId" method="post">
		<div class="findId">
			<a href="/member/findIdPage">아이디 찾기</a>
		</div>
			<div class="content">
				<div class="find_box">
					<input type="text" name="memberName" id="memberName" placeholder="이름"><br>
				</div>
				<div class="find_box">
					<input type="text" name="memberEmail" id="memberEmail" placeholder="이메일"><br>
				</div>
			</div>
				<button class="btn_findId">확인</button> 
		</form>
		<div class="button_box">
			<a href="/member/agreePage">회원가입</a> |
			<a href="/member/findPwPage">비밀번호 찾기</a> 
		</div>
	</div>
	

</body>
</html>