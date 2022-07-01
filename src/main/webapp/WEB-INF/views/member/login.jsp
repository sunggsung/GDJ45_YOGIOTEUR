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
	.links > a {
		color : gray;
	}
	* {
         padding: 0;
         margin: 0;
         box-sizing: border-box;
    }
    input[type=radio] { 
         display: none;
    }
    .info {  
         display: flex;
    }
    .info > label {
         display: inline-block;
         width: 250px;
         height: 30px;
         text-align: center;
         line-height: 30px;
         border-top: 1px solid gray; 
         border-left: 1px solid gray;
         border-bottom: 1px solid gray;
    }
    .info > label:last-of-type {
         border-right: 1px solid gray;
    }
    .info > label:hover {
         cursor: pointer;
    }
        
    #member:checked ~ div:first-of-type > label:nth-of-type(1) { 
         background-color: black;
         color: lightgray;
    }
    #nonMember:checked ~ div:first-of-type > label:nth-of-type(2) {
         background-color: black;
         color: lightgray;
    }
    .container {
    	text-align: center;
    }
    .text {
    	text-align: center;
    }
    .content {
         width: 506px;
         height: 100px;
         border-right: 1px solid gray;
         border-left: 1px solid gray;
         border-bottom: 1px solid gray;
         display: none;
         margin: 0px 30px 0px 400px;
    }
    #member:checked ~ div:nth-of-type(2) { 
         display: block;
    }
    #nonMember:checked ~ div:nth-of-type(3) {
         display: block;
    }
    #nonLoginForm #findNonMemberReser {
    	width: 250px;
    	float: left;
    }
    
 	.nonMemInfo > label:hover {
		cursor: pointer;
	}
</style>
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
	
	function fnNonMemberLogin() {
		$('#nonLoginForm').on('submit', function(e){
			if($('#nonName').val() == '' || $('#nonBirth').val() == '' || $('#nonPhone').val() == '') {
				alert('필수정보를 입력하세요.');
				e.preventDefault();
				return false;
			}
			return true;
		})
	}
	
	function fnNonMemberForm() {
		$('#find').on('click', function() {
			$('#')
			
		})
		
	}

</script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="tab">
	<div class="text">
	<h1>YOGIOTEUR 호텔에 오신 것을 환영합니다.</h1>
	   <p><strong>아이디와 비밀번호를 입력해 주시기 바랍니다.</strong></p>
	   <p>YOGIOTEUR 호텔 회원이되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다.</p>
	</div>

	<div class="container">

        <!-- 상단 탭 메뉴 -->
        <input type="radio" name="tabmenu" id="member" checked="checked">
        <input type="radio" name="tabmenu" id="nonMember">
        <div class="info">
            <label for="member">회원</label>
            <label for="nonMember">비회원</label>
        </div>

        <!-- 메뉴1 내용 -->
        <div class="content">
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
		</div>

        <!-- 메뉴2 내용 -->
        <div class="content">
	        <input type="radio" name="nonMenu" id="login" checked="checked">
	        <input type="radio" name="nonMenu" id="find">
	        <div class="nonMemInfo">
	            <label for="login">비회원 로그인</label> | 
	            <label for="find">비회원 예약확인</label>
	        </div>
        	<form id="nonLoginForm" action="${contextPath}/nonMember/login" method="post">
        		<input type="hidden" name="url" value="${url}">
	            이름 <input type="text" name="nonName" id="nonName" placeholder="이름을 입력해 주세요"><br>
	            생년월일 <input type="text" name="nonBirth" id="nonBirth" maxlength="6" placeholder="생년월일(6자)을 입력해 주세요"><br>
	            휴대폰번호 <input type="text" name="nonPhone" id="nonPhone" maxlength="11" placeholder="휴대폰 번호(- 생략)를 입력해 주세요"><br>
	            <button>로그인</button>
        	</form>
        	<form id="findNonMemberReser" action="${contextPath}/nonMember/findReser" method="post">
        		이름 <input type="text" name="nonName" id="nonName" placeholder="이름을 입력해 주세요"><br>
        		휴대폰번호 <input type="text" name="nonPhone" id="nonPhone" maxlength="11" placeholder="휴대폰 번호(- 생략)를 입력해 주세요"><br>
        		<button>예약확인</button>
        	</form>
        </div>
        
        
		
    </div>
    </div>
    <br><br>
    
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    
</body>
</html>