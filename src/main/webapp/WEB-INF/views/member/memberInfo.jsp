<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    a {
        color: #000;
        text-decoration: none;
    }

    .tabmenu {
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
    }
    .memberInfo {
        list-style-type: none;
        padding: 0;
        margin: 0;
        overflow: hidden;
    }
    .memberInfo > li {
        float: left;
    }
    .memberInfo > li > a {
        display: block;
        padding: 10px 30px;
    }
    .memberInfo > li > a:hover {
        border-bottom: 3px solid skyblue;
    }
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		fnSignIn();
		fnEmailAuth();
		fnPhoneCheck();
	})
	
	function fnSignIn(){
		$('#SignInform').on('submit', function(event){
			if(authCodePass == false){
				alert('이메일 인증을 받아야 합니다.');
				event.preventDefault();
				return false;
			}
			else if(phonePass == false){
				alert('연락처를 확인하세요.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}
	
	let phonePass = false;
	function fnPhoneCheck(){
		$('#memberPhone').on('keyup', function(){
			let regPhone = /^[0-9]{1,11}$/;
			if(regPhone.test($('#memberPhone').val())==false){
				$('#memberPhoneMsg').text('전화번호는 -없이 숫자로만 입력해주세요.').addClass('dont').removeClass('ok');
				phonePass = false;
			} else {
				$('#memberPhoneMsg').text('');
				phonePass = true;
			}
		})
	}
	
	// 이메일 확인
	function fnEmailCheck(){
		return new Promise(function(resolve, reject) {
			// 정규식 
			let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/; 
			if(regEmail.test($('#memberEmail').val())==false){
				reject(1000);      
				return;
			}
			// 중복 
			$.ajax({
				url: '${contextPath}/member/emailCheck',
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
	
	// 이메일 인증
	let authCodePass = false;
	function fnVerifyAuthCode(authCode){  
		$('#btnVerifyAuthCode').on('click', function(){
			if($('#authCode').val() == authCode){
				alert('인증되었습니다.');
				authCodePass = true;
			} else {
				alert('인증에 실패했습니다.');
				authCodePass = false;
			}
		})
	}
	
	// 이메일 인증발송
	function fnEmailAuth(){
		$('#btnGetAuthCode').on('click', function(){
			fnEmailCheck().then(
				function(){
					$.ajax({
						url: '${contextPath}/member/sendAuthCode',
						type: 'get',
						data: 'memberEmail=' + $('#memberEmail').val(),
						dataType: 'json',
						success: function(obj){  
							alert('인증코드를 발송했습니다. 이메일을 확인해주세요.');
							fnVerifyAuthCode(obj.authCode);  
						},
						error: function(jqXHR){
							alert('인증코드 발송이 실패했습니다.');
						}
					})
				}
			).catch(
				function(code){
					if(code == 1000){
						$('#memberEmailMsg').text('이메일 형식이 올바르지 않습니다.').addClass('dont').removeClass('ok');
						$('#authCode').prop('readonly', true);
					} else if(code == 2000){
						$('#memberEmailMsg').text('이미 사용 중인 이메일입니다.').addClass('dont').removeClass('ok');
						$('#authCode').prop('readonly', true);
					}
				}
			)
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
        <!-- 개인정보 내용 -->
        <div class="content">
            <p>정보 수정시, 비밀번호를 꼭 다시 한번 확인해 주세요.</p>
            <form id="modifyForm" action="${contextPath}/member/modifyMember" method="post">
            	아이디<input type="text" name="memberId" id="memberId" value="${loginMember.memberId}" readonly="readonly"><br>
            	이름<input type="text" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"><br>
				생년월일
				<input type="text" name="memberBirth" id="memberBirth" value="${loginMember.memberBirth}" readonly="readonly"><br>
            	연락처
            	<input type="text" name="memberPhone" id="memberPhone" value="${loginMember.memberPhone}" maxlength="11"><br>
				<span id="memberPhoneMsg"></span>
				주소<br>
				<input type="text" id="memberPostcode" name="memberPostCode" value="${loginMember.memberPostCode}">
				<input type="button" onclick="fnPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="memberRoadAddress" name="memberRoadAddr" value="${loginMember.memberRoadAddr}"><br>
				성별
				<label>남
					<input type="radio" name="memberGender" value="male" <c:if test="${loginMember.memberGender eq 'male'}">checked="checked"</c:if>/>
				</label>
				<label>여
				<input type="radio" name="memberGender" value="female" <c:if test="${loginMember.memberGender eq 'female'}">checked="checked"</c:if>/>
				</label>
				<br>
				이메일<br>
				<input type="text" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail}" >
				<input type="button" value="인증번호받기" id="btnGetAuthCode"><br>
				<span id="memberEmailMsg"></span>
				<input type="text" name="authCode" id="authCode" placeholder="인증코드를 입력하세요">
				<input type="button" value="인증하기" id="btnVerifyAuthCode"><br>
				<input type="hidden" name="memberId" value="${loaginMember.memberId}">
				이메일 수신여부<br>
				<label>동의함
					<input type="radio" name="memberPromoAdd" value="yes" <c:if test="${loginMember.memberPromoAdd eq 'yes'}">checked="checked"</c:if>/>
				</label>
				<label>동의안함
					<input type="radio" name="memberPromoAdd" value="no" <c:if test="${loginMember.memberPromoAdd eq 'no'}">checked="checked"</c:if>/>
				</label>
           		<br>
				<button>수정하기</button>
				<input type="button" value="회원탈퇴" onclick="location.href='${contextPath}/member/signOut?memberId=${loginMember.memberId}'">
            </form>
        </div>

        <!-- 예약확인 내용 -->
        <div class="content">
			<a href="${contextPath}/member/memberReser">예약확인</a>
        </div>
	
		<!-- 비밀번호 변경 -->
		<div class="content">
			<a href="{contextPath}/member/pwModifyPage">비밀번호변경</a>
		</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>