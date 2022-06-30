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
		$('#payment').on('click', function(){
			requestPay();
		})
		/* $('#payment').on('click', function(event){
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
					
				}
			}
			
		})  */
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
				// requestPay();
			}
		}
	}
	function count(type) {
		const cntFood1 = document.getElementById('food1');
		const cntFood2 = document.getElementById('food2');
		const cntAdult = document.getElementById('adult');
		const cntChild = document.getElementById('child');
		const sum1 = document.getElementById('sum');
		
		let food1 = cntFood1.value;
		let food2 = cntFood2.value;
		let adult = cntAdult.value;
		let child = cntChild.value;
		let sumVal = sum1.value; 
		
		if(type == 'plus1') {
			food1 = parseInt(food1) + 1;
			sumVal = parseInt(food1) * 45000;
		} else if(type == 'minus1') { 
			if(cntFood1.value != 0) {
				food1 = parseInt(food1) - 1;
				sumVal = parseInt(sumVal) - 45000;
			}
		}
		$('#food1').attr('value', food1);
		$('#food2').attr('value', food1);
		$('#sum').attr('value', sumVal);
		
		if(type == 'plus2') {
			adult = parseInt(adult) + 1;
		} else if(type == 'minus2') { 
			if(cntAdult.value != 0) {
				adult = parseInt(adult) - 1;
			}
		}
		$('#adult').attr('value', adult);

		if(type == 'plus3') {
			child = parseInt(child) + 1;
		} else if(type == 'minus3') { 
			if(cntChild.value != 0) {
				child = parseInt(child) - 1;
			}
		}
		$('#child').attr('value', child);
	}
	function requestPay() {
		var IMP = window.IMP;
		IMP.init("imp40476994");
		
	    IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: 'card',
	        merchant_uid: "merchant_" + new Date().getTime(),
	        name: "노르웨이",
	        amount: 101,
	        buyer_email: "gildong@gmail.com",
	        buyer_name: "홍이동",
	        buyer_tel: "010-4242-4242",
	        buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181",
	        m_redirect_url: 'https://http://localhost:9090/payments/complete'
	    }, function (rsp) { // callback
            console.log(rsp);
	        if (rsp.success) {
	            var msg;
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
		padding: 38px;
		width: 880px;
        height: 380px;
       	margin: 0 auto;
	}
	.option_cnt {
		position: relative;
		float: left;
		width: calc(50% + 28px);
		min-height: 400px;
		padding-right: 48px;
	}
	.option_result {
		position: relative;
		float: right;
		min-height: 400px;
		margint-top: 0;
		padding: 160px 48px;
	}
	.people_cnt {
		padding-top: 5px;
	}
	.food_cnt {
		padding-top: 20px;
		border-top: 1px solid #dcdcdc;
	}
	.reser_request {
		padding-top: 20px;
		border-top: 1px solid #dcdcdc;
	}
	.adult {
		padding-top: 15px;
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
</style>
</head>
<body>

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
							<span class="sub_name">성인</span> <input type="button" value="+" onclick="count('plus2')">
								<span><input type="text" id="adult" name="people" value="0" style="width:14px;border:none;border:0px" readonly></span>
							  						   <input type="button" value="-" onclick="count('minus2')"><br>
						</div>
						<div class="child">
							<span class="sub_name">어린이</span> <input type="button" value="+" onclick="count('plus3')">
								<span><input type="text" id="child" name="people" value="0" style="width:14px;border:none;border:0px" readonly></span>
							 						     <input type="button" value="-" onclick="count('minus3')">
						</div>
					</div>
					<div class="food_cnt">
						<div class="option_name">
							<span>조식신청(성인)</span>
							<span class="sub_txt">모든 투숙일에 적용됩니다.</span>
						</div>
						<div class="food">
							<span class="sub_name">성인 조식  50,000 KRW / 1인 1박</span>
							<span><input type="button" value="+" onclick="count('plus1')">
								<span><input type="text" id="food1" name="food" value="0" style="width:14px;border:none;border:0px" readonly></span>
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
					<div class="">
						객실 요금
					</div>
					<div>
						<span></span>
					</div>
					<div>
						옵션 요금
					</div>
					<div>
						조식신청(성인)
					</div>
					<div>
						<span>성인조식 <input type="text" id="food2" name="food" value="0" style="width:14px;border:none;border:0px" readonly>x 박</span>
						<input type="text" id="sum" name="sum" size="8" value="0" style="border:none;border:0px" readonly>
					</div>
					<div>
						<span>세금 및 봉사료</span>
					</div>
					<div>
						객실 총 요금
					</div>
				</div>
			</div>
			
				<input type="hidden" name="memberNo" id="memberNo" value="1">
				<input type="hidden" name="roomNo" id="roomNo" value="1">
			
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