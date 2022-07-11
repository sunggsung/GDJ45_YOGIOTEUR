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
	.findId_result > a {
		text-decoration: none;
		color: #333;
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
    }
    .findId_result {
       	width: 100%;
       	height: 40px;
       	margin: 0 auto 40px;
       	text-align: center;
       	font-size: 40px;
       	font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .findId_result > a {
 		text-decoration: none;
		color: #333;	
    }
    .content {
    	margin: 10px 0;
    	text-align: center;
    	font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    .find_box {
        display: block;
        height: 30px;
        margin-bottom: 12px;
        border: 1px solid #d7d7d7;
        position: relative;
        padding: 20px 0 10px 15px;
        text-align: left;
    }
	.find_box > input {
         width: 350px;
         height: 17px;
         padding: 16px 19px 15px;
         font-size: 18px;
         font-weight: bold;
         color: #333;
         outline: none;
         border: none;
         position: absolute;
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-weight: normal;
         font-style: normal;
        }
     .btn_findId {
         display: block;
         height: 60px;
         width: 390px;
         background-color: black;
         font-size: 16px;
         font-weight: bold;
         color: #fff;
         letter-spacing: -0.5px;
         text-align: center;
         line-height: 60px;	
         font-family: 'MICEMyungjo';
         src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
         font-weight: bold;
         font-style: normal;
         cursor: pointer;
     }
	.button_box {
         margin-top: 30px;
         text-align: center;
         border-top: 1px solid #f2f2f5;
         font-size: 14px;
     }
     .button_box > a {
         display: inline-block;
         padding: 19px 18px 0;
         color: #333;
     }
    .false {
   		width: 390px;
   		margin: 110px auto;
  	 	padding: 60px 50px 40px;
  	 	border: 1px solid #dadada;
    }
    .Btn {
    	display: block;
		text-align: center;
		margin: 0 auto;
		line-height: 30px;
		margin: 20px 0 10px 0;
    }
    .btn_notFound {
    	padding: 20px 30px;
    	font-size: 18px;
    	font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
		border: 1px solid #dadada;
		background-color: black;
		color: #fff;
		cursor: pointer;
    }

</style>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<c:if test="${memberConfirm != null}">
		<div class="join" >
			<div class="findId_result">
				<a href="/member/findIdPage">아이디 찾기</a>
			</div>
				<div class="content">
					<div class="find_box">
						아이디 : ${memberConfirm.memberId} 
					</div>
					<div class="find_box">
						가입일 : ${memberConfirm.signIn}
					</div>
					<input type="button" value="로그인" class="btn_findId" onclick="location.href='/member/loginPage'">
				</div>
		</div>
	</c:if>
	
	<c:if test="${memberConfirm == null}">
		<div class="false" >
			<div class="findId_result">
				<a href="/member/findIdPage">아이디 찾기</a>
			</div>
				<div class="content">
					입력하신 정보로 등록된 회원이 없습니다.<br>
					정보를 다시 확인하시고 시도해주세요.
				</div>
				<div class="Btn">
					<input type="button" class="btn_notFound" value="취소" onclick="location.href='/'">
					<input type="button" class="btn_notFound" value="회원가입" onclick="location.href='/member/agreePage'">
				</div>
		</div>
	</c:if>
	
	
	
</body>
</html>