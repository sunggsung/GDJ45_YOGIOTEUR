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
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
		
	$(function(){
		fnLogin();	
		fnRememberId();
	})

	function fnLogin(){
	
		$('#Loginform').on('submit', function(e){
			if($('#memberId').val() == '' || $('#memberPw').val() == ''){
				alert('아이디와 비밀번호를 입력하세요.');
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
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
			
	<h1>로그인</h1>
	<form id="Loginform" action="${contextPath}/member/login" method="post">
		
		<input type="hidden" name="url" value="${url}">
		<input type="text" id="memberId" name="memberId" placeholder="아이디"><br>
		<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호">
		<button>로그인</button><br>
		
		<label>
			<input type="checkbox" id="rememberId">아이디저장
		</label>
		
	</form>
	
	
	<div>
		<a href="${contextPath}/member/findIdPage">아이디 찾기</a> |
		<a href="${contextPath}/member/findPwPage">비밀번호 찾기</a> |
		<a href="${contextPath}/member/agreePage">회원가입</a> 
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>