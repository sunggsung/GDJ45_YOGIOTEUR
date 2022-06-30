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

<<<<<<< HEAD
		$(function(){
			
		})
		
		function fnPwModify(){
			$.ajax({
				url: '${contextPath}/member/pwModify',
				type: 'POST',
				data: 'memberPw=' + $('#memberPw').val(),
				dataType: 'json',
				success: function(obj){
					
				},
				error: function(jqXHR){
					alert('일치하는 회원이 존재하지 않습니다.');
				}
			})
		}
		
		
</script>
<style>
	
</style>
=======
$('#modifyPwForm').on('submit', function(event){
	if(pwPass == false || rePwPass == false){
		alert('비밀번호를 확인하세요.');
		event.preventDefault();
		return false;
	}
	return true;
})

let pwPass = false;
function fnPwCheck(){
	$('#memberPw').on('keyup', function(){
		let regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/; 
		if(regPw.test($('#memberPw').val())==false){
			$('#pwMsg').text('영문 소문자, 숫자, 특수문자 포함 8~12자로 입력해주세요.').addClass('dont').removeClass('ok');
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
</script>
>>>>>>> jae
</head>
<body>
		
	<jsp:include page="../layout/header.jsp"></jsp:include>
<<<<<<< HEAD
			
		<h3>비밀번호 변경</h3>
		<table>
			<thead>
				<tr>
					<td>현재 비밀번호</td>
					<td><input type="text" name="memberPw" id="memberPw"></td>
				</tr>
			</thead>
		</table>
	<!--  
	<form id="findPwForm" action="${contextPath}/member/modifyPw" method="post"></form>
	신규 비밀번호<input type="password" name="memberPw" id="memberPw" placeholder="새 비밀번호">
	<span id="pwMsg"></span><br>
	신규 비밀번호 확인<input type="password" id="memberRePw" placeholder="새 비밀번호 확인">
	<span id="rePwMsg"></span><br>
	-->
	
=======
	
	비밀번호 수정
	<div class="container">
	    	<h3>비밀번호 변경</h3>
	        <p>주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</p>
				<form id="modifyPwForm" action="${contextPath}/member/modifyPw" method="post">
					<input type="password" name="memberPw" id="memberPw" placeholder="새 비밀번호"><br>
					<span id="pwMsg"></span><br>
					<input type="password" id="memberRePw" placeholder="새 비밀번호 확인"><br>
					<span id="rePwMsg"></span><br>
					<input type="hidden" name="memberId" value="${loginMember.memberId}">
					<button>변경</button>
					<input type="button" value="취소" onclick="location.href='${contextPath}/'">
				</form>
	    </div>
>>>>>>> jae
	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>