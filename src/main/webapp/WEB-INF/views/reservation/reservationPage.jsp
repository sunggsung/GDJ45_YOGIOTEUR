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
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	$(document).ready(function(){
		$('#f').on('submit', function(event){
			if($('#privacy').is(':checked') == false){
				alert('필수 약관에 동의하세요.')
				event.preventDefault();
				return false;
			}
			return true;
		})
	})
	
	function count(type) {
		const cntElement1 = document.getElementById('cnt1');
		const cntElement2 = document.getElementById('cnt2');
		const sum1 = document.getElementById('sum');
		
		let number1 = cntElement1.value;
		let number2 = cntElement2.value;
		let sumVal = sum1.value; 
		
		if(type == 'plus1') {
			number1 = parseInt(number1) + 1;
			sumVal = parseInt(number1) * 45000;
		} else if(type == 'minus1') { 
			if(cntElement1.value != 0) {
				number1 = parseInt(number1) - 1;
				sumVal = parseInt(sumVal) - 45000;
			}
		}
		$('#cnt1').attr('value', number1);
		$('#sum').attr('value', sumVal);
		
		if(type == 'plus2') {
			number2 = parseInt(number2) + 1;
		} else if(type == 'minus2') { 
			if(cntElement2.value != 0) {
				number2 = parseInt(number2) - 1;
			}
		}
		$('#cnt2').attr('value', number2);
	}
</script>
<style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script>
	$(document).ready(function(){
		$('#total_price').attr('value', $('#room_price').val());
		$('#hidden_price').attr('value', $('#room_price').val());
		tipVal();
		
	})
	function fnPayment() {
		if($('#adult').val() == 0) {
			alert('최소 인원은 1명입니다.');
			event.preventDefault();
			return false;
		} else if($('#privacy').is(':checked') == false){
			alert('필수 약관에 동의하세요.');
			event.preventDefault();
			return false;
		} else {
			if(!confirm('결제하시겠습니까?')) {
				alert('취소하셨습니다.');
				return false;
			} else {
				document.getElementById('f').submit();
				// paymentData();
			}
		}
	}
	function tipVal() {
		let roomPr = $('#room_price').val();
		let tip = (roomPr / 10);
		$('#tip_price').attr('value', tip);
	}
	function count(type) {
		const cntFood1 = document.getElementById('food1');
		const cntFood2 = document.getElementById('food2');
		const cntAdult = document.getElementById('adult');
		const cntChild = document.getElementById('child');
		const cntRoomPr = document.getElementById('room_price');
		const cntTotalPr = document.getElementById('total_price');
		const cntTipPr = document.getElementById('tip_price');
		const cntHidden = document.getElementById('hidden_price');
		const sum1 = document.getElementById('sum');
		
		let food1 = cntFood1.value;
		let food2 = cntFood2.value;
		let adult = cntAdult.value;
		let child = cntChild.value;
		let sumVal = sum1.value; 
		let roomPr = cntRoomPr.value;
		let total = cntTotalPr.value;
		let tip = cntTipPr.value;
		let hidden = cntHidden.value;
		
		let foodPrice = 50000;
		let cntMax = 4;

		/* if(tipPr != null) {
			$('#tip_price').val('0');
		} */
		if(type == 'plus1') {
			food1 = parseInt(food1) + 1;
			sumVal = parseInt(food1) * foodPrice;
			hidden = parseInt(hidden) + foodPrice;
			total = parseInt(total) + foodPrice;
			if(cntFood1.value == cntMax) {
				return false;
			}
		} else if(type == 'minus1') { 
			if(cntFood1.value != 0) {
				food1 = parseInt(food1) - 1;
				sumVal = parseInt(sumVal) - foodPrice;
				hidden = parseInt(hidden) - foodPrice;
				total = parseInt(total) - foodPrice;
			} else if(cntFood1.value == 0){
				return false;
			}
			
		}
		tip = parseInt(hidden) / 10;
		
		$('#food1').attr('value', food1);
		$('#food2').attr('value', food1);
		$('#sum').attr('value', sumVal);
		$('#total_price').attr('value', total);
		$('#hidden_price').attr('value', hidden);
		$('#tip_price').attr('value', tip);
		
		if(type == 'plus2') {
			adult = parseInt(adult) + 1;
			if(adult == cntMax) {
				return false;
			}
		} else if(type == 'minus2') { 
			if(cntAdult.value != 0) {
				adult = parseInt(adult) - 1;
			} else if(cntFood1.value == 0){
				return false;
			}
		}
		$('#adult').attr('value', adult);

		if(type == 'plus3') {
			child = parseInt(child) + 1;
			if(child == cntMax) {
				return false;
			}
		} else if(type == 'minus3') { 
			if(cntChild.value != 0) {
				child = parseInt(child) - 1;
			} else if(cntFood1.value == 0){
				return false;
			}
		}
		$('#child').attr('value', child);
		
		return sumVal;
	}
	function paymentData() {
		const data = {
				merchant : $('#resReserNo').val(),
				roomName : $('#resRoomNo').val(),
				amount : $('#total_price').val(),
				userEmail : $('#userEmail').val(),
				userName : $('#userName').val(),
				userTel : $('#userTel').val(),
				userAddr : $('#userAddr').val(),
				userPost : $('#userPost').val()
		}
		requestPay(data);
	}
	
	function requestPay(data) {
		var IMP = window.IMP;
		IMP.init("imp40476994");
		
	    IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: 'card',
	        merchant_uid: data.merchant,
	        name: data.roomName,
	        amount: data.amount,
	        buyer_email: data.userEmail,
	        buyer_name: data.userName,
	        buyer_tel: data.userTel,
	        buyer_addr: data.userAddr,
	        buyer_postcode: data.userPost
	    }, function (rsp) { // callback
            console.log(rsp);
	        if (rsp.success) {
	            var msg = '결제되었습니다.'
	            var result = {
	            		"imp_uid" : rsp.imp_uid,
	            		"merchant_uid" : rsp.merchant_uid,
	            		
	            }
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
	            document.getElementById('f').submit();
	        } else {
	        	var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
	        }
	        alert(msg);
	    });
    }
</script>
<style>
	.reser_option {
		border: 1px solid #333;
		margin: 20px 0 0;
		padding: 28px 48px 28px 48px;
		width: 1080px;
        height: 420px;
       	margin: 0 auto;
	}
	.option_cnt {
		position: relative;
		float: left;
		width: calc(50% + 8px);
		min-height: 40px;
		padding-right: 8px;
	}
	.option_result {
		position: relative;
		float: right;
		min-height: 20px;
		padding: 40px 48px;
		background: #f9f9f9;
	    font-size: 16px;
   		color: #333;
	}
	.people_cnt {
		padding-top: 5px;
		padding-bottom: 20px;
	}
	.food_cnt {
		padding-top: 20px;
		padding-bottom: 20px;
		border-top: 1px solid #dcdcdc;
	}
	.reser_request {
		padding-top: 20px;
		border-top: 1px solid #dcdcdc;
	}
	.adult {
		padding-top: 15px;
	}
	.child {
		padding-top: 5px;
	}
	.food {
		padding-top: 15px;
	}
	.text {
		padding-top: 15px;
	}
	.option_name {
		font-weight: 800;
		font-size: 24px;
	}
	.sub_name {
		font-weight: 500;
		font-size: 16px;
	}
	.sub_txt {
		margint-left: 5px;
		font-size: 14px;
		color: #999;
		letter-spacing: 0;
		font-weight: 400;
		line-height: initial;
	}
	.room_price1 {
		font-weight: 600;
	}
	.room_price2 {
		margin-top: 10px;
		margin-left: 15px;
	}
	.option_price {
		font-weight: 600;
		margin-top: 25px;
	}
	.adult_food1 {
		color: #999;
		margin-top: 10px;
	}
	.adult_food2 {
		margin-top: 10px;
		margin-left: 15px;
	}
	.tip_price {
		margin-top: 25px;
	}
	#tip_pr {
		font-weight: 600;
	}
	.total_price {
		margin-top: 25px;
		padding-top: 35px;
		border-top: 1px solid #dcdcdc;
	}
	#total_pr {
		font-weight: 600;
	}
	#krw {
		position: relative;
		float: right;
		padding-left: 40px;
	}
	#btn {
		position: relative;
		float: right;
	}
</style>
</head>
<body>

	<h1>예약 페이지</h1>
	<hr>
	
	<div>
		<img src="../resources/img/unnamed.jpg" width="50px" height="50px">
	</div>
	
	<hr>
	
	
	
	<h3>예약자 정보</h3>
	
	<form id="f" action="${contextPath}/payments" method="post">
			<div>
				조식 선택 <input type="button" value="+" onclick="count('plus1')">
							<span><input type="text" id="cnt1" name="food" value="0" style="width:14px;border:none;border:0px" readonly></span>
						  <input type="button" value="-" onclick="count('minus1')">
						  	<input type="text" id="sum" name="sum" size="8" value="0" style="border:none;border:0px" readonly><br>
				투숙 날짜 <br>
				객실 인원 <input type="button" value="+" onclick="count('plus2')">
							<span><input type="text" id="cnt2" name="people" value="0" style="width:14px;border:none;border:0px" readonly></span>
						  <input type="button" value="-" onclick="count('minus2')"><br>
			</div>
		<c:if test="${session == null }">
			<div>
				<input type="hidden" name="memberNo" id="memberNo" value="1">
				<input type="hidden" name="roomNo" id="roomNo" value="1">
				이름 <input type="text" name="name" id="name" value="ksj" readonly><br>
				연락처 <input type="text" name="tel" id="tel" value="01012345678" readonly><br>
				이메일 <input type="text" name="email" id="email" value="rlawo32@naver.com" readonly><br>
				체크인 <input type="text" name="roomcheckIn" id="roomcheckIn" value="${roomCheckIn}" readonly>
				체크아웃 <input type="text" name="roomcheckOut" id="roomcheckOut" value="${roomCheckOut}" readonly>
				체크 <input type="text" name="check" id="check" value="${date}" readonly>
			</div>
		</c:if>
		<c:if test="${session != null }">
			<div>
				비회원 이름 <input type="text" name="nonName" id="nonName" value="${session.nonName}" readonly>
				비회원 연락처 <input type="text" name="nonTel" id="nonTel" value="${session.nonTel}" readonly><br>
			</div>
		</c:if>
		
		<textarea readonly>개인정보보호법에 따라 ...</textarea><br>
		
		<input type="checkbox" id="privacy">
		<label for="privacy" class="item">개인정보 수집에 동의합니다.</label><br>
		<br><br>
		
		<input type="button" value="돌아가기" onclick="location.href='${contextPath}'">
		<button id="payment">결제하기</button>
	</form>
	
	<jsp:include page="../layout/header.jsp"></jsp:include>

	<h1>예약 페이지</h1>
	<hr>
	<div class="reser_main">
		<div class="reser_image">
			<img src="../resources/img/unnamed.jpg" width="50px" height="50px">
		</div>
		
		<hr>
		
		<h3>예약자 정보</h3>
		
		
		<form id="f" action="${contextPath}/payments" method="post">
			<div class="reser_option">
				<div class="option_cnt">
					<div class="people_cnt">
						<div class="option_name">
							객실 인원
						</div>
						<div class="adult">
							<span class="sub_name">성인</span> 
							<span id="btn"><input type="button" value="+" onclick="count('plus2')">
									<input type="text" id="adult" name="adult" value="0" style="width:14px;border:none;border:0px" readonly>
							  	  <input type="button" value="-" onclick="count('minus2')"></span>
						</div>
						<div class="child">
							<span class="sub_name">어린이</span> 
							<span id="btn"><input type="button" value="+" onclick="count('plus3')">
									<input type="text" id="child" name="child" value="0" style="width:14px;border:none;border:0px" readonly>
							 	  <input type="button" value="-" onclick="count('minus3')"></span>
						</div>
					</div>
					<div class="food_cnt">
						<div class="option_name">
							<span>조식신청(성인)</span>
							<span class="sub_txt">모든 투숙일에 적용됩니다.</span>
						</div>
						<div class="food">
							<span class="sub_name">성인 조식  50,000 KRW / 1인 1박</span>
							<span id="btn"><input type="button" value="+" onclick="count('plus1')">
									<input type="text" id="food1" name="food" value="0" style="width:14px;border:none;border:0px" readonly>
							  	  <input type="button" value="-" onclick="count('minus1')"></span>
						</div>
							  	
					</div>
					<div class="reser_request">
						<div class="option_name">
							추가 요청
						</div> 
						<div class="text"><textarea rows="7px" cols="60px" name="req"></textarea></div>
					</div>
				</div>
				<div class="option_result">
					<div class="room_price1">
						객실 요금
					</div>
					<div class="room_price2">
						<span>2022년 06월 28일</span><span id="krw"><input type="text" id="room_price" name="roomPrice" size="6" value="475000" style="border:none;border:0px" readonly> KRW</span> 
					</div>
					<div class="option_price">
						옵션 요금
					</div>
					<div class="adult_food1">
						조식신청(성인)
					</div>
					<div class="adult_food2">
						<span>성인조식 <input type="text" id="food2" name="food" value="0" style="width:8px;border:none;border:0px" readonly>x박</span>
						<span id="krw"><input type="text" id="sum" name="foodPrice" size="6" value="0" style="border:none;border:0px" readonly> KRW</span>
					</div>
					<div class="tip_price">
						<input type="hidden" id="hidden_price" name="hidden_price" value="0">
						<span id="tip_pr">세금 및 봉사료</span><span id="krw"><input type="text" id="tip_price" name="tipPrice" size="6" value="0" style="border:none;border:0px" readonly> KRW</span>
					</div>
					<div class="total_price">
						<span id="total_pr">객실 총 요금</span><span id="krw"><input type="text" id="total_price" name="totalPrice" size="6" value="0" style="border:none;border:0px" readonly> KRW</span>
					</div>
				</div>
			</div>
			
				<input type="hidden" name="resMemberNo" id="resMemberNo" value="${loginMember.memberNo}">
				<input type="hidden" name="resReserNo" id="resReserNo" value="${reserNo}">
				
				<input type="hidden" name="resCheckIn" id="resCheckIn" value="${roomInfo.chkIn}">			
				<input type="hidden" name="resCheckOut" id="resCheckOut" value="${roomInfo.chkOut}">	
				<input type="hidden" name="resRoomNo" id="resRoomNo" value="${roomInfo.roomNo}">	
				<input type="hidden" name="resRoomName" id="resRoomName" value="${roomInfo.roomName}">	
				<input type="hidden" name="resRoomPr" id="resRoomPr" value="${roomInfo.roomPrice}">	
				
				<input type="hidden" name="userName" id="userName" value="${loginMember.memberName}">
				<input type="hidden" name="userEmail" id="userEmail" value="${loginMember.memberEmail}">
				<input type="hidden" name="userTel" id="userTel" value="${loginMember.memberPhone}">
				<input type="hidden" name="userAddr" id="userAddr" value="${loginMember.memberRoadAddr}">
				<input type="hidden" name="userPost" id="userPost" value="${loginMember.memberPostCode}">
			
			<textarea readonly>개인정보보호법에 따라 ...</textarea><br>
			
			<input type="checkbox" id="privacy">
			<label for="privacy" class="item">개인정보 수집에 동의합니다.</label><br>
			<br><br>
			
			<input type="button" value="돌아가기" onclick="location.href='${contextPath}'">
			<input type="button" value="결제하기" onclick="fnPayment()">
		</form>
	
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>