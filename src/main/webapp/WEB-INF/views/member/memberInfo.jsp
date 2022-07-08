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
	.ok {
		color: blue;
	}
	.dont {
		color: red;
	} 
	a {
		color: #24695c;
		cursor: pointer;
	}
	* {box-sizing: border-box}

	/* Style the tab */
	.tab {
	  float: left;
	  border: 1px solid #ccc;
	  background-color: #f1f1f1;
	  width: 30%;
	  height: 500px;
	}
	
	/* Style the buttons that are used to open the tab content */
	.tab button {
	  display: block;
	  background-color: inherit;
	  color: black;
	  padding: 22px 16px;
	  width: 100%;
	  border: none;
	  outline: none;
	  text-align: left;
	  cursor: pointer;
	  transition: 0.3s;
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	  background-color: #ddd;
	}
	
	/* Create an active/current "tab button" class */
	.tab button.active {
	  background-color: #gray;
	}
	
	/* Style the tab content */
	.tabcontent {
	  float: left;
	  padding: 0px 12px;
	  border: 1px solid #ccc;
	  width: 70%;
	  border-left: none;
	  height: 500px;
	}
</style>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		fnModify();
		fnEmailCheck();
		fnPhoneCheck();
		fnPwCheck();
		fnPwConfirm();
		fnOpenInfo();
	})
	
	function fnModify(){
		$('#modifyForm').on('submit', function(event){
			 if(phonePass == false){
				alert('연락처를 확인하세요.');
				event.preventDefault();
				return false;
			} 
			else if($('#memberEmail').val() == ''){
				alert('이메일을 확인하세요.');
				event.preventDefault();
				return false;
			}
			else if($('#memberPostCode').val() == ''){
				alert('우편번호를 확인하세요.');
				event.preventDefault();
				return false;
			}
			else if($('#memberRoadAddress').val() == ''){
				alert('주소를 확인하세요.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}
	
	let phonePass = false;
	function fnPhoneCheck(){
		$('#memberPhone').on('keyup', function(){
			let regPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;
			if(regPhone.test($('#memberPhone').val())==false){
				$('#memberPhoneMsg').text('전화번호는 -(하이픈)포함 입력해주세요.').addClass('dont').removeClass('ok');
				phonePass = false;
			} else {
				$('#memberPhoneMsg').text('');
				phonePass = true;
			}
		})
	}
	
	// 이메일 확인
	function fnEmailCheck(){
		// 정규식 
		let regEmail = /^[a-zA-Z0-9-_]+@[a-zA-Z0-9]+(\.[a-zA-Z]{2,}){1,2}$/; 
		if(regEmail.test($('#memberEmail').val())==false){
			$('#memberEmailMsg').text('이메일 형식이 올바르지 않습니다.').addClass('dont').removeClass('ok');     
			return;
		}
		$('#btnConfirmEmail').on('click', function(){
			$.ajax({
				url: '${contextPath}/member/emailCheck',
				type: 'get',
				data: 'memberEmail=' + $('#memberEmail').val(),
				dataType: 'json',
				success: function(obj){
					if(obj.res == null){
						$('#memberEmailMsg').text('사용가능한 이메일입니다.').addClass('ok').removeClass('dont');    
					} else {
						$('#memberEmailMsg').text('이미 사용 중인 이메일입니다.').addClass('dont').removeClass('ok');
					}
				}
			})
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

	function fnOpenCity(event, cityName) {
		  // Declare all variables
		  var i, tabcontent, tablinks;

		  // Get all elements with class="tabcontent" and hide them
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }

		  // Get all elements with class="tablinks" and remove the class "active"
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }

		  // Show the current tab, and add an "active" class to the link that opened the tab
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " active";
		}
</script>
</head>
<body>
	
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="tab">
	  <button class="tablinks" onclick="fnOpenCity(event, 'memberInfo')">내정보</button>
	  <button class="tablinks" onclick="fnOpenCity(event, 'modifyPw')">비밀번호변경</button>
	  <button class="tablinks" onclick="fnOpenCity(event, 'confirmReser')">예약확인</button>
	</div>
	
	<div id="memberInfo" class="tabcontent">
	  <h3>내정보</h3>
	  <div class="container">
	      <form id="modifyForm" action="${contextPath}/member/modifyMember" method="post">
           	아이디<input type="text" name="memberId" id="memberId" value="${loginMember.memberId}" readonly="readonly"><br>
           	이름<input type="text" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly"><br>
			생년월일
			<input type="text" name="memberBirth" id="memberBirth" value="${loginMember.memberBirth}" readonly="readonly"><br>
           	연락처
           	<input type="text" name="memberPhone" id="memberPhone" value="${loginMember.memberPhone}" maxlength="13"><br>
			<span id="memberPhoneMsg"></span>
			주소<br>
			<input type="text" id="memberPostcode" name="memberPostCode" value="${loginMember.memberPostCode}">
			<input type="button" onclick="fnPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="memberRoadAddress" name="memberRoadAddr" value="${loginMember.memberRoadAddr}"><br>
			성별
			<label>Male
				<input type="radio" name="memberGender" value="male" <c:if test="${loginMember.memberGender eq 'male'}">checked="checked"</c:if>/>
			</label>
			<label>Female
			<input type="radio" name="memberGender" value="female" <c:if test="${loginMember.memberGender eq 'female'}">checked="checked"</c:if>/>
			</label>
			<br>
			이메일<br>
			<input type="text" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail}" >
			<input type="button" value="중복확인" id="btnConfirmEmail"><br>
			<span id="memberEmailMsg"></span>
			<input type="hidden" name="memberId" value="${loaginMember.memberId}"><br>
			이메일 수신여부
			<label>동의함
				<input type="radio" name="memberPromoAdd" value="yes" <c:if test="${loginMember.memberPromoAdd eq 'yes'}">checked="checked"</c:if>/>
			</label>
			<label>동의안함
				<input type="radio" name="memberPromoAdd" value="no" <c:if test="${loginMember.memberPromoAdd eq 'no'}">checked="checked"</c:if>/>
			</label>
          		<br>
			<button>수정</button>
			<input type="button" value="회원탈퇴" onclick="location.href='${contextPath}/member/confirm'">
           </form>
		</div>
	</div>
	
	<div id="modifyPw" class="tabcontent">
	  <h3>비밀번호 변경</h3>
	  <div class="container">
        <p>주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.</p>
			<form id="modifyPwForm" action="${contextPath}/member/modify" method="post">
				<input type="password" name="memberPw" id="memberPw" placeholder="새 비밀번호"><br>
				<span id="pwMsg"></span><br>
				<input type="password" id="memberRePw" placeholder="새 비밀번호 확인"><br>
				<span id="rePwMsg"></span><br>
				<input type="hidden" name="memberId" value="${loginMember.memberId}">
				<button>변경</button>
				<input type="button" value="취소" onclick="location.href='${contextPath}/'">
			</form>
   		 </div>
	</div>
	
	<div id="confirmReser" class="tabcontent">
	  <h3>예약확인</h3>
	  <p>Tokyo is the capital of Japan.</p>
	</div>

</body>
</html>