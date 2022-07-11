<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	* {
		box-sizing: border-box;
	}
	.ok {
		color: blue;
	}
	.dont {
		color: red;
	} 
	body {
		margin: 0 auto;
	}
	.container {
		padding-left: 20px;
	}
	.tab {
	  float: left;
	  border: 1px solid #ccc;
	  background-color: #214DA6;
	  width: 20%;
	  height: 650px;
	}
	
	.tab button {
	  display: block;
	  background-color: inherit;
	  color: #fff;
	  padding: 22px 16px;
	  width: 100%;
	  border: none;
	  outline: none;
	  text-align: left;
	  cursor: pointer;
	  font-size: 20px;
	  font-family: 'MICEMyungjo';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
      font-weight: 500;
      font-style: normal;
	}
	
	.tab button:hover {
	  background-color: #ddd;
	}
	
	.tab button.active {
	  background-color: #ccc;
	}
	
	.tabcontent {
	  padding: 0 15% 2% 0;
	  border: 1px solid #ccc;
	  width: 100%;
	  border-left: none;
	  height: 650px;
	  display: none;
	}
	.page {
	  text-align: center;
	  padding: 2% 15% 5%;
	}
	.myPage {
		font-family: 'MICEMyungjo';
		font-size: 30px;
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
		text-align: left;
        margin: 30px 0;
	}
	.con {
		text-align: left;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        margin: 5px 0;
	}
	.contain {
		font-family: 'MICEMyungjo';
		font-size: 25px;
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
        margin: 30px 0;
	}
	.contains {
		padding-left: 30%;
		font-family: 'MICEMyungjo';
		font-size: 25px;
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
        margin: 30px 0;
	}
	.pw {
		padding-left: 40%;
		font-family: 'MICEMyungjo';
		font-size: 25px;
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
        margin: 30px 0;
	}
	.container {
		margin: 20px auto;
		text-align: center;
		padding-left: 40%;
	}
	.contain_text {
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 400;
        font-style: normal;
	}
	.conInput {
		width: 60%;
		height: 35px;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        outline: none;
        margin: 5px 0;
	}
	.conInput_ex {
		width: 50%;
		height: 35px;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
        outline: none;
        margin: 2% 0 2% 15%;
	}
    .msg {
       text-align: left;
       font-size: 16px;
       font-family: 'MICEMyungjo';
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
       font-weight: 600;
       font-style: normal;
       padding: 2px 0 8px 0;
    }
	.con_choose {
		text-align: left;
		font-size: 20px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
		padding-left: 20%;
		margin: 2% 0;
	}
    .InputArea {
		display: block;
		position: relative;
		margin: 10px 0;
		width: 100%;
		height: 60px;
		border: solid 1px #dadada;
		padding: 9px 0px 10px 10px;
		box-sizing: border-box;
		vertical-align: top;
	}
	.box {
		border: 0 none;
		display: block;
		width: 90%;
		height: 30px;
		outline: none;
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
		padding: 7px 10px 0 5px;
	 }
	 .reser {
	 	font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
	 }
	.resers {
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
        padding: 0 15% 2% 35%;
	}
	.btn_area {
		display: block;
		text-align: center;
		margin: 0 auto;
		line-height: 30px;
	}
	.btn {
		font-size: 18px;
		font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: 600;
        font-style: normal;
		padding: 15px 40px;
		border: 1px solid #dadada;
		background-color: black;
		color: #fff;
		cursor: pointer;
	}
	.btn_send {
     	text-align: center;
     	font-size: 15px;
        font-family: 'MICEMyungjo';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
        font-weight: bold;
        font-style: normal;
        margin: 0 auto;
        padding: 5px;
        cursor: pointer;
     }
</style>
<script>
	$(document).ready(function(){
		fnModify();
		fnEmailCheck();
		fnPhoneCheck();
		fnPwCheck();
		fnPwConfirm();
		fnChangePw();
		popupOpen();
		deleteReser();
		reviewPage();
		openInfo();
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
	
	let pwPass = false;
	function fnPwCheck(){
		$('#memberPw').on('keyup', function(){
			let regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/; 
			if(regPw.test($('#memberPw').val())==false){
				$('#pwMsg').text('영문, 숫자, 특수문자 포함 8~12자로 입력해주세요.').addClass('dont').removeClass('ok');
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
	

	function fnChangePw(){
		$('#modifyPwForm').on('submit', function(event){
			if(pwPass == false || rePwPass == false){
				alert('비밀번호를 확인하세요.');
				event.preventDefault();
				return false;
			}
			return true;
		})
	}


	function popupOpen(){	
		$(".cancelBtn").click(function(){ 
			var cancelBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = cancelBtn.parent().parent();
			var td = tr.children();
			
			var no = td.eq(0).text();
			
			console.log(no);
		
			var popUrl = "${contextPath}/reservation/reservationCancel/" + no; //팝업창에 출력될 페이지 URL	
			var popOption = "width=640, height=520, top=50, left=310, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)	
			window.open(popUrl,"",popOption);	
		})
	}
	
	function deleteReser(){
		$('.deleteBtn').click(function(){
			var deleteBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = deleteBtn.parent().parent();
			var td = tr.children();
			
			var resNo = td.eq(0).text();
			
			console.log(resNo);
			
			let deleteReservation = 0;
			let deletePayments = 0;
			let deletePrice = 0;
			$.ajax({
				url: '${contextPath}/reserRemove/' + resNo,
				type: 'DELETE',
				dataType: 'json',
				success: function(obj){
					alert('예약 내역을 제거합니다.');
					location.reload();
					deleteReservation += obj.res1;
					deletePayments += obj.res2;
					deletePrice += obj.res3;
				}
			})
		})
	}
	function reviewPage(){	
		$(".reviewBtn").click(function(){ 
			var reviewBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = reviewBtn.parent().parent();
			var td = tr.children();
			
			var roomNo = td.eq(1).text();
			
			console.log(roomNo);
			/*
			$.ajax({
				url: '${contextPath}/review/reviewSavePage',
				type: 'GET',
				data: { "roomNo" : roomNo }
			})
			*/
			location.href = '${contextPath}/review/reviewSavePage?roomNo=' + roomNo;
		})
	}
	
	function openInfo(event, info) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(info).style.display = "block";
		  event.currentTarget.className += " active";
		}
</script>
</head>
<body>
	
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<div class="page">
		<div class="myPage">
			마이페이지
		</div>
	<div class="tab">
	  <c:if test="${loginMember.memberGender ne null}">
		  <button class="tablinks" onclick="openInfo(event, 'memberInfo')">내정보</button>
		  <button class="tablinks" onclick="openInfo(event, 'modifyPw')">비밀번호변경</button>
	  </c:if>
	  <button class="tablinks" onclick="openInfo(event, 'reservation')">예약확인</button>
	</div>
	
	<div id="memberInfo" class="tabcontent">
	  <div class="contain">
	  	내정보
	  </div>
	  <div class="container">
	      <form id="modifyForm" class="modifyForm" action="${contextPath}/member/modifyMember" method="post">
			<table>
				<tbody>
					<tr>
						<td><label class="con">아이디</label></td>
						<td>
          				 	<input type="text" class="conInput" name="memberId" id="memberId" class="form-controll" value="${loginMember.memberId}" readonly="readonly"><br>
						</td>
					</tr>
					<tr>
						<td><label class="con">이름</label></td>
						<td>
							<input type="text" class="conInput" name="memberName" id="memberName" value="${loginMember.memberName}" readonly="readonly">								
						</td>
					</tr>
					<tr>
						<td><label class="con">생년월일</label></td>
						<td>
							<input type="text" class="conInput" name="memberBirth" id="memberBirth" value="${loginMember.memberBirth}" readonly="readonly"><br>
						</td>
					</tr>
					<tr>
						<td><label class="con">연락처</label></td>
						<td>
							<input type="text" class="conInput" name="memberPhone" id="memberPhone" value="${loginMember.memberPhone}" maxlength="13">						
							<br>
							<span id="memberPhoneMsg" class="conInput"></span>
						</td>
					</tr>
					<tr>
						<td><label class="con">주소</label></td>
						<td colspan="2">
							<input type="text" class="conInput_ex" id="memberPostcode" name="memberPostCode" value="${loginMember.memberPostCode}">
							<input type="button" class="btn_send" onclick="fnPostcode()" value="우편번호 찾기">
							<input type="text" class="conInput" id="memberRoadAddress" name="memberRoadAddr" value="${loginMember.memberRoadAddr}"><br>
						</td>
					</tr>
					<tr>
						<td><label class="con">성별</label></td>
						<td>
							<div class="con_choose">
								<input type="radio" name="memberGender" id="male" value="male" <c:if test="${loginMember.memberGender eq 'male'}">checked="checked"</c:if>/>
								<label for="male">Male</label>
								<input type="radio" name="memberGender" id="female" value="female" <c:if test="${loginMember.memberGender eq 'female'}">checked="checked"</c:if>/>
								<label for="female">Female</label>
							</div>
						</td>
					</tr>
					<tr>
						<td><label class="con">이메일</label></td>
						<td>
							<input type="text" class="conInput_ex" name="memberEmail" id="memberEmail" value="${loginMember.memberEmail}" >
							<input type="button" class="btn_send" value="중복확인" id="btnConfirmEmail"><br>
							<span id="memberEmailMsg" class="conInput_ex"></span>
						</td>
					</tr>
					<tr>
						<td><label class="con">이메일 수신여부</label></td>
						<td>
							<div class="con_choose">
								<input type="radio" name="memberPromoAdd" id="yes" value="yes" <c:if test="${loginMember.memberPromoAdd eq 'yes'}">checked="checked"</c:if>/>
								<label for="yes">동의함</label>
								<input type="radio" name="memberPromoAdd" id="no" value="no" <c:if test="${loginMember.memberPromoAdd eq 'no'}">checked="checked"</c:if>/>
								<label for="no">동의안함</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="memberId" value="${loaginMember.memberId}"><br>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="btn_area">
								<button class="btn">수정</button>
								<input type="button" class="btn" value="회원탈퇴" onclick="location.href='${contextPath}/member/confirm'">
							</div>
						</td>
					</tr>
					</tbody>
				</table>
           </form>
		</div>
	</div>
	
	<div id="modifyPw" class="tabcontent">
	  <div class="pw">
	  	비밀번호 변경
	  </div>
	  <div class="container">
        <div class="contain_text">
        	주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.
        </div>
        <div class="form">
			<form id="modifyPwForm" action="${contextPath}/member/modify" method="post">
				<div class="InputArea">
					<input type="password" class="box" name="memberPw" id="memberPw" placeholder="새 비밀번호"><br>
				</div>
					<div id="pwMsg" class="msg"></div>
				<div class="InputArea">
					<input type="password" class="box" id="memberRePw" placeholder="새 비밀번호 확인"><br>
				</div>
					<div id="rePwMsg" class="msg"></div>
				<input type="hidden" name="memberId" value="${loginMember.memberId}">
				<br>
				<div class="btn_area">
					<button class="btn">변경</button>
					<input type="button" class="btn" value="취소" onclick="location.href='${contextPath}/'">
				</div>
			</form>
        </div>
   	  </div>
	</div>
	
	<div id="reservation" class="tabcontent">
		<div class="resers">
			<div class="contains">예약 확인</div>
			<table class="reser" border="1">
				<thead>
					<tr>
						<td>예약번호</td>
						<td>객실이름</td>
						<td>회원이름</td>
						<td>체크인날짜</td>
						<td>체크아웃날짜</td>
						<td>예약인원</td>
						<td>예약상태</td>
						<td>리뷰</td>
						<td></td> <!--  -->
					</tr>
				</thead>
				<tbody id="confirmReser">
					<c:forEach items="${reservations}" var="reservation"> <!--  -->
						<tr>
							<td>${reservation.reserNo}</td>
							<td>${reservation.roomNo}</td>
							<td>${loginMember.memberName}</td>
							<td>${reservation.reserCheckIn}</td>
							<td>${reservation.reserCheckOut}</td>
							<td>${reservation.reserPeople}</td>
							<td>
								<c:if test="${reservation.reserStatus ne 0}">
									예약 확정
								</c:if>
								<c:if test="${reservation.reserStatus eq 0}">
									예약 취소
								</c:if>
							</td>
							<td>
								<input type="button" value="리뷰" class="reviewBtn">
							</td>
							<td>
								<c:if test="${reservation.reserStatus ne 0}">
									<input type="button" value="예약취소" class="cancelBtn">
								</c:if>
								<c:if test="${reservation.reserStatus eq 0}">
									<input type="button" value="내역삭제" class="deleteBtn">
								</c:if>
								<c:if test="${reservation.reserStatus eq -1}">
									<input type="button" value="내역삭제" class="deleteBtn">
								</c:if>
							</td>
						</tr>
					</c:forEach> <!--  -->
				</tbody>
			</table>
		  </div>
		</div>
	</div>
</body>
</html>