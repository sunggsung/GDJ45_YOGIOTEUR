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
		fnNonMemberLogin();
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
<style>
	.links > a {
			color : gray;
	}
    .container {
        	margin: auto;
    }
    .text {
    	text-align: center;
    }
</style>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="tab">
	<div class="text">
	<h1>YOGIOTEUR 호텔에 오신 것을 환영합니다.</h1>
	   <p><strong>아이디와 비밀번호를 입력해 주시기 바랍니다.</strong></p>
	   <p>YOGIOTEUR 호텔 회원이되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다.</p>
	</div>

        <!-- 메뉴1 내용 -->
        <div class="content">
        <h3>로그인</h3>
            <form id="Loginform" action="${contextPath}/member/login" method="post">
				<input type="hidden" name="url" value="${url}">
				<input type="text" id="memberId" name="memberId" placeholder="아이디"><br>
				<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호">
				<button>로그인</button><br>
				
				<label>
					<input type="checkbox" id="rememberId">아이디저장
				</label>
			</form>
	
			<div class="links">
				<a href="${contextPath}/member/findIdPage">아이디 찾기</a> |
				<a href="${contextPath}/member/findPwPage">비밀번호 찾기</a> |
				<a href="${contextPath}/member/agreePage">회원가입</a> 
			</div>
			
			<!-- 네이버 아이디 로그인 -->
			<a href="${apiURL}"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
		
		</div>

</body>
</html>