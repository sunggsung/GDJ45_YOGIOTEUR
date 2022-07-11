	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
	$(document).ready(function(){
		$('#hidden_tipPrice').attr('value', $('#hidden_roomPrice').val());
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
				// document.getElementById('f').submit();
				paymentData();
			}
		}
	}
	function comma(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function uncomma(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	}
	function tipVal() {
		let roomPr = $('#hidden_roomPrice').val();
		let tip = (roomPr / 10);
		let tal = parseInt(roomPr) + parseInt(tip);
		$('#tip_price').attr('value', comma(uncomma(Math.round(tip))));
		$('#total_price').attr('value', comma(uncomma(Math.round(tal))));
	}
	function count(type) {
		const cntFood1 = document.getElementById('food1');
		const cntFood2 = document.getElementById('food2');
		const cntRoomPr = document.getElementById('room_price');
		const cntTotalPr = document.getElementById('total_price');
		const cntTipPr = document.getElementById('tip_price');
		const cntHidden1 = document.getElementById('hidden_tipPrice');
		const cntHidden2 = document.getElementById('hidden_foodPrice');
		const cntHidden3 = document.getElementById('hidden_roomPrice');
		const sum1 = document.getElementById('sum');
		
		const cntAdult = document.getElementById('adult');
		let cntMax = cntAdult.value;;
		
		let food1 = cntFood1.value;
		let food2 = cntFood2.value;
		let sumVal = sum1.value; 
		let roomPr = cntRoomPr.value;
		let total = cntTotalPr.value;
		let tip = cntTipPr.value;
		let hiddenTip = cntHidden1.value;
		let hiddenFood = cntHidden2.value;
		let hiddenRoom = cntHidden3.value;
		
		let foodPrice = 50000;
		let plusPrice = 0;
		let minusPrice = 0;

		/* if(tipPr != null) {
			$('#tip_price').val('0');
		} */
		if(type == 'plus1') {
			food1 = parseInt(food1) + 1;
			sumVal = parseInt(food1) * foodPrice;

			hiddenTip = (parseInt(hiddenRoom) + parseInt(sumVal)) / 10;
			tip = parseInt(hiddenRoom) + parseInt(sumVal);
			total = parseInt(tip) + parseInt(hiddenTip);
			if(cntFood1.value == cntMax) {
				return false;
			}
		} else if(type == 'minus1') { 
			if(cntFood1.value != 0) {
				food1 = parseInt(food1) - 1;
				sumVal = parseInt(hiddenFood) - foodPrice;

				tip = parseInt(hiddenTip) - foodPrice;
				hiddenTip = (parseInt(hiddenTip) - foodPrice) / 10;
				total = parseInt(tip) + parseInt(hiddenTip);
			} else if(cntFood1.value == 0){
				return false;
			}
			
		}
		
		$('#food1').attr('value', comma(uncomma(food1)));
		$('#food2').attr('value', comma(uncomma(food1)));
		$('#sum').attr('value', comma(uncomma(sumVal)));
		$('#hidden_foodPrice').attr('value', sumVal);
		$('#hidden_tipPrice').attr('value', tip);
		$('#tip_price').attr('value', comma(uncomma(Math.round(hiddenTip))));
		$('#total_price').attr('value', comma(uncomma(total)));
		$('#real_food').attr('value', sumVal);
		$('#real_tip').attr('value', hiddenTip);
		$('#real_total').attr('value', total);
		
		return sumVal;
	}
	function countP(type) {
		const cntAdult = document.getElementById('adult');
		const cntChild = document.getElementById('child');

		let adult = cntAdult.value;
		let child = cntChild.value;
		let cntMaxA = cntAdult.value;;
		let cntMaxB = cntChild.value;;
		
		if(type == 'plus2') {
			adult = parseInt(adult) + 1;
			if(adult == cntMaxA) {
				return false;
			}
		} else if(type == 'minus2') { 
			if(cntAdult.value != 0) {
				adult = parseInt(adult) - 1;
			} else if(cntAdult.value == 0){
				return false;
			}
		}
		$('#adult').attr('value', adult);

		if(type == 'plus3') {
			child = parseInt(child) + 1;
			if(child == cntMaxB) {
				return false;
			}
		} else if(type == 'minus3') { 
			if(cntChild.value != 0) {
				child = parseInt(child) - 1;
			} else if(cntChild.value == 0){
				return false;
			}
		}
		$('#child').attr('value', child);
	}
	function paymentData() {
		const data = {
				merchant : $('#resReserNo').val(),
				roomName : $('#resRoomName').val(),
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
	        amount: 103,
	        buyer_email: data.userEmail,
	        buyer_name: data.userName,
	        buyer_tel: data.userTel,
	        buyer_addr: data.userAddr,
	        buyer_postcode: data.userPost
	    }, function (rsp) { // callback
            console.log(rsp);
	        if (rsp.success) {
	        	let payments = JSON.stringify(
	    			{
	    				impUid : rsp.imp_uid,
		        		merchantUid : rsp.merchant_uid,
		        		response : "",
		        		amount : rsp.paid_amount
	    			}		
	    		);
	        	$.ajax({
	        		url: '${contextPath}/payment/complete',
	        		type: 'POST',
	        		data: payments,
	        		contentType: 'application/json',
	        	}).done(function(data) {
	        		 var msg = '결제되었습니다.\n';
	     	            
	                 msg += '주분 번호 : ' + rsp.imp_uid + '\n';
	                 msg += '예약 번호 : ' + rsp.merchant_uid + '\n';
	                 msg += '결제 금액 : ' + rsp.paid_amount;
	                 alert(msg); 
	     	         document.getElementById('f').submit();
	            })
	            .fail(function() {
	            	var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                alert(msg);
	            })
	        } else {
	        	
	        }
	        
	    });
    }
</script>
<style>
	div {
		display: block;
	}
	.reser_image {
		padding: 28px 28px 14px 28px;
		width: 700px;
        height: 450px;
       	margin: 0 auto;
	}
	.reser_infoName {
		position: relative;
		font-weight: 600;
		font-size: 22px;
		margin: 28px 0 8px 198px;
	}
	.reser_option {
		border: 3px solid #025949;
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
		padding-top: 10px;
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
		padding: 0;
		width: 102px;
		height: 30px;
	}
	.subBtn {
		margin: 0;
		widht: 50px;
		height: 15px;
	}
	.plusBtn {
		cursor: pointer;
		margin: 0;
		height: 30px;
		background-color: #025949;
    	color: #ffeee4;
	}
	.minusBtn {
		cursor: pointer;
		margin: 0;
		height: 30px;
		background-color: #025949;
    	color: #ffeee4;
	}
	.out_line {
		padding: 5px 5px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	}
	.out_line:hover {
		letter-spacing: 2px;
	    transform: scale(1.2);
	    cursor: pointer;
	}
	.out_line:active {
		transform: scale(1.5);
	}
	.input_text {
		margin: 0;
		padding: 0 12px;
		position: relative;
    	-webkit-box-flex: 1;
   	 	flex: 1 1 auto;
   	 	width: 1%;
    	min-width: 0;
    	background-color: #fff;
	    font-size: 14px;
	    border-color: #e6edef;
	    color: #717171;
	    font-weight: 400;
	    line-height: 1.5;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    appearance: none;
	}
	.reser_confirm {
		border: 3px solid #025949;
		margin: 20px 0 0;
		padding: 28px 48px 28px 48px;
		width: 1080px;
        height: 120px;
       	margin: 28px auto;
	}
	.reser_textarea {
		position: relative;
		float: left;
		width: calc(50% + 8px);
		min-height: 40px;
		padding-right: 8px;
	}
	.reser_button {
		position: relative;
		float: right;
		min-height: 20px;
		padding: 14px 60px;
	}
	/* .payment_btn:not(:disabled) {
		cursor: pointer;
		display: block;
		width: 100%;
		min-width: 260px;
        height: 100px;
        line-height: 106px;
        background-color: Orange;
        text-decoration: none;
        font-size: 22px;
        font-weight: 800;
        color: #FFF;
        text-align: center;
	} */
	.payment_btn:not(:disabled) {
		cursor: pointer;
	}
	.payment_btn:hover {
    	color: white;
    	background-color: #a07044 !important;
   	 	border-color: #a07044 !important;
	}
	.payment_btn {	
		font-size: 14px;
    	padding: 1.655rem 6.75rem;
    	border-radius: 0.3rem;
    	border-color: #ba895d;
   		color: #ba895d;
    	background-color: transparent;
    	font-weight: 600;
    	border-width: 2px;
   	 	box-shadow: 0 5px 10px 2px rgb(36 105 92 / 19%) !important;
	}
	.payment_btn[type=button] {
		-webkit-appearance: button;
	}
	button {
		text-transform: none;
		overflow: visible;
	}
</style>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="reser_main">
		<div class="reser_image">
			<img src="${contextPath}/room/view?roomNo=${rn.roomNo}" width="700px;">
		</div>
		
		<hr>
		
		<form id="f" action="${contextPath}/payments" method="post">
			<div class="reser_infoName">예약 옵션</div>
			<div class="reser_option">
				<div class="option_cnt">
					<div class="people_cnt">
						<div class="option_name">
							객실 인원
						</div>
						<div class="adult">
							<span class="sub_name">성인</span> 
								<div id="btn">
								  	<span><button type="button" value="+" onclick="countP('plus2')" class="plusBtn out_line">
										<i class="fa-solid fa-plus"></i>
								  	</button></span>
									<input type="text" id="adult" name="adult" value="0" class="input_text" style="width:9px;border:none;border:0px;" readonly>
							  	  	<span><button type="button" value="-" onclick="countP('minus2')" class="minusBtn out_line">
							  	  		<i class="fa-solid fa-minus"></i>
							  	  	</button></span>
							  	</div>
						</div>
						<div class="child">
							<span class="sub_name">어린이</span> 
								<div id="btn">
								  	<span><button type="button" value="+" onclick="countP('plus3')" class="plusBtn out_line">
										<i class="fa-solid fa-plus"></i>
								  	</button></span>
									<span><input type="text" id="child" name="child" value="0" class="input_text" style="width:9px;border:none;border:0px;" readonly></span>
							  	  	<span><button type="button" value="-" onclick="countP('minus3')" class="minusBtn out_line">
							  	  		<i class="fa-solid fa-minus"></i>
							  	  	</button></span>
							  	</div>
						</div>
					</div>
					<div class="food_cnt">
						<div class="option_name">
							<span>조식신청(성인)</span>
							<span class="sub_txt">모든 투숙일에 적용됩니다.</span>
						</div>
						<div class="food">
							<span class="sub_name">성인 조식  50,000 KRW / 1인 1박</span>
								<div id="btn">
								  	<span><button type="button" value="+" onclick="count('plus1')" class="plusBtn out_line">
										<i class="fa-solid fa-plus"></i>
								  	</button></span>
									<input type="text" id="food1" name="food" value="0" class="input_text" style="width:9px;border:none;border:0px;" readonly>
							  	  	<span><button type="button" value="-" onclick="count('minus1')" class="minusBtn out_line">
							  	  		<i class="fa-solid fa-minus"></i>
							  	  	</button></span>
							  	</div>
						</div>
							  	
					</div>
					<div class="reser_request">
						<div class="option_name">
							추가 요청
						</div> 
						<div class="text"><textarea rows="7px" cols="80px" name="req">
ex) 추가 베개 요청
						</textarea></div>
					</div>
				</div>
				<div class="option_result">
					<div class="room_price1">
						객실 요금
					</div>
					<div class="room_price2">
						<input type="hidden" id="hidden_roomPrice" name="roomPrice" value="${rn.roomPrice}">
						<span>2022년 06월 28일</span><span id="krw"><input type="text" id="room_price" size="6" value="<fmt:formatNumber value='${rn.roomPrice}' pattern='#,###' />" style="border:none;border:0px" readonly> KRW</span> 
					</div>
					<div class="option_price">
						옵션 요금
					</div>
					<div class="adult_food1">
						조식신청(성인)
					</div>
					<div class="adult_food2">
						<input type="hidden" id="hidden_foodPrice" name="hidden_foodPrice" value="0">
						<input type="hidden" id="real_food" name="foodPrice" value="0">
						<span>성인조식 <input type="text" id="food2" name="food" value="0" style="width:8px;border:none;border:0px" readonly>x박</span>
						<span id="krw"><input type="text" id="sum" size="6" value="0" style="border:none;border:0px" readonly> KRW</span>
					</div>
					<div class="tip_price">
						<input type="hidden" id="hidden_tipPrice" name="hidden_tipPrice" value="0">
						<input type="hidden" id="real_tip" name="tipPrice" value="0">
						<span id="tip_pr">세금 및 봉사료</span><span id="krw"><input type="text" id="tip_price" size="6" value="0" style="border:none;border:0px" readonly> KRW</span>
					</div>
					<div class="total_price">
						<input type="hidden" id="real_total" name="totalPrice" value="0">
						<span id="total_pr">객실 총 요금</span><span id="krw"><input type="text" id="total_price" size="6" value="0" style="border:none;border:0px" readonly> KRW</span>
					</div>
				</div>
			</div>
			
				<input type="hidden" name="resMemberNo" id="resMemberNo" value="${loginMember.memberNo}">
				<input type="hidden" name="resReserNo" id="resReserNo" value="${reserNo}">
				
				<input type="hidden" name="resCheckIn" id="resCheckIn" value="${roomInfo.chkIn}">			
				<input type="hidden" name="resCheckOut" id="resCheckOut" value="${roomInfo.chkOut}">	
				<input type="hidden" name="resRoomNo" id="resRoomNo" value="${rn.roomNo}">	
				<input type="hidden" name="resRoomName" id="resRoomName" value="${rn.roomName}">	
				<input type="hidden" name="resRoomPr" id="resRoomPr" value="${rn.roomPrice}">	
				
				<input type="hidden" name="userName" id="userName" value="${loginMember.memberName}">
				<input type="hidden" name="userEmail" id="userEmail" value="${loginMember.memberEmail}">
				<input type="hidden" name="userTel" id="userTel" value="${loginMember.memberPhone}">
				<input type="hidden" name="userAddr" id="userAddr" value="${loginMember.memberRoadAddr}">
				<input type="hidden" name="userPost" id="userPost" value="${loginMember.memberPostCode}">
			
			<div class="reser_confirm">
				<div class="reser_textarea">
					<textarea rows="7px" cols="80px" readonly>
1. 개인정보 수집항목
- 성명(영문), 연락처(모바일, 자택 또는 회사), 이메일 등

2. 개인정보 수집 및 이용목적
- 객실 예약 서비스 제공, 예약 관련 안내 및 고지사항 전달, 익스프레스 체크인 서비스 제공, 고객 불만 등 민원 처리, 부정이용 방지, 법적 분쟁 등의 처리
* 수집된 신용카드 정보는 개런티/위약금 결제를 위해 이용되며, 객실요금은 추후 체크인시 결제됩니다.

3. 개인 정보 보유 및 이용 기간
- 수집일로부터 2년. 단, 예약 취소 시 취소일로부터 5일후 파기됩니다.

4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익
- 귀하는 위와 같은 개인정보의 수집이용에 대한 동의를 거부할 수 있으나, 동의 거부 시, 객실 예약이 불가능합니다.
					</textarea><br>
					<input type="checkbox" id="privacy">
					<label for="privacy" class="item">개인정보 수집에 동의합니다.</label><br>
				</div>
				<div class="reser_button">
					<!-- <a href="javascript:fnPayment()" class="payment_btn">결제하기</a> -->
					<input type="button" value="결제하기" onclick="fnPayment()" class="payment_btn">
				</div>
			</div>
		</form>
	
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>