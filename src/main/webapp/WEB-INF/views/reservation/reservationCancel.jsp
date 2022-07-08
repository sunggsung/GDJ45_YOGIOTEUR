<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../resources/js/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$('#removeReser').on('click', function() {
			const status1 = document.getElementById('popUpReserStatus');
			let status = status1.value;
			status = parseInt(status) - 1;
			$('#popUpReserStatus').attr('value', status)
			let reservation = JSON.stringify({
				reserNo : $('#popUpReserNo').val(),
				roomNo : $('#popUpRoomNo').val(),
				reserStatus : $('#popUpReserStatus').val(),
				reserRequest : $('#popUpReason option:selected').val()
			});
			if($('#popUpReason').val() == "") {
				alert('취소사유를 선택해주세요');
			} else {
				if (confirm('예약을 취소하시겠습니까?')) {
					$.ajax({
						url : '${contextPath}/reserModify',
						type : 'PUT',
						data : reservation,
						contentType : 'application/json',
						success : function(obj) {
							if (obj.res > 0) {
								alert('예약이 취소되었습니다.');
								opener.parent.location.reload();
								window.close();
							} else {
								alert('예약 취소가 실패하였습니다.');
							}
						}
					})
					return true;
				} else {
					alert('취소하셨습니다.');
					return false;
				}
			}
		})
	})
</script>
<style>
	.cancel_mainName {
       	font-size: 26px;
		font-weight: 800;
		text-align: center;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.reser_info {
		border: 1px solid #333;
		padding: 28px 88px 28px 88px;
		width: 480px;
        height: 260px;
       	margin: 0 auto;
       	font-size: 18px;
	}
	.reser_no {
		padding: 0 0 30px 0;
		border-bottom: 1px solid #dcdcdc;
		font-weight: 800;
	}
	.left_name {
		position: relative;
		float: left;
	}
	.right_name {
		position: relative;
		float: right;
	}
	.reser_member {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.reser_chk {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.sub_info {
		margin-top: 20px;
	}
	.member_name {
		padding: 10px 15px 15px 15px;
	}
	.member_phone {
		padding: 10px 15px 15px 15px;
	}
	.chk_in {
		padding: 10px 15px 15px 15px;
	}
	.chk_out {
		padding: 10px 15px 15px 15px;
	}
	.cancel_info {
		position : relative;
		border: 1px solid #333;
		margin: 25px auto;
		padding: 28px 88px 28px 88px;
		width: 480px;
        height: 580px;
       	font-size: 18px;
	}
	.commission_header {
		background-color: #eee;
		color: #444;
		cursor: pointer;
		padding: 5px;
		width: 100%;
		border: none;
		text-align: left;
		outline: none;
		font-size: 14px;
		font-weight: 600;
		text-align:justify;
		transition: 0.4s;
	}
	.active, .commission_header:hover {
  		background-color: #ccc; 
	}
	.commission_body {
	  	padding: 0 18px;
	  	display: none;
	  	font-size: 12px;
	  	background-color: white;
	  	overflow: hidden;
	}
	.cancel_reason {
		padding: 0 35px 15px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.reser_money {
		padding: 20px 35px 25px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.cancel_commission {
		padding: 20px 35px 25px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.cancel_return {
		padding: 20px 35px 25px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.commission_table {
		padding: 20px 35px 25px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.cancel_btn {
		position: absolute;
		margin-left: 100px;
		bottom: 10%;
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
	.cancel_btn:not(:disabled) {
		cursor: pointer;
	}
	.cancel_btn:hover {
    	color: white;
    	background-color: #a07044 !important;
   	 	border-color: #a07044 !important;
	}
	.cancel_btn[type=button] {
		-webkit-appearance: button;
	}
	button {
		text-transform: none;
		overflow: visible;
	}
	.reason_name {
		padding-bottom: 15px;
	}
	.select_reason {
		display: block;
	    width: 100%;
	    padding: 0.375rem 0.75rem;
	    appearance: none;
		border-color: #1b4c43;
    	color: #1b4c43;
    	border-radius: 5px;
    	background-color: #fff;
    	font-size: 14px;
    	background-clip: padding-box;
    	border: 1px solid #ced4da;
        font-weight: 400;
    	line-height: 1.5;
    	word-wrap: normal;
    	text-transform: none;
	}
</style>
<script>
	$(function() {
		fnGuideCommission();
		fnDateCommission();
	})
	function fnGuideCommission() {
		var acc = document.getElementById("commissionGuide");

		acc.addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.display === "block") {
				panel.style.display = "none";
			} else {
				panel.style.display = "block";
			}
		});
	}
	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}
	function fnDateCommission() {
		const chkInEx = document.getElementById("chkIn");
		const totalPrEx = document.getElementById("totalPr");
		let chkIn = chkInEx.value;
		let totalPr = totalPrEx.value;

		var now = new Date();
		var chkInDate1 = new Date(chkIn);
		var chkInDate2 = new Date(chkIn);

		var dayThree = chkInDate2.getDate();
		var dayAgo = chkInDate1.getDate();

		chkInDate2.setDate(dayThree - 3);
		chkInDate2.setHours(chkInDate2.getHours() + 15);

		chkInDate1.setDate(dayAgo - 1);
		chkInDate1.setHours(chkInDate1.getHours() + 15);

		if (now >= chkInDate1) {
			var com = parseInt(totalPr) * 90 / 100;
			var result = parseInt(totalPr) - parseInt(com);
			$('#commission').text(comma(uncomma(com)));
			$('#refund').text(comma(uncomma(result)));
			return true;
		} else if (now >= chkInDate2) {
			var com = parseInt(totalPr) * 50 / 100;
			var result = parseInt(totalPr) - parseInt(com);
			$('#commission').text(comma(uncomma(com)));
			$('#refund').text(comma(uncomma(result)));
			return true;
		} else if (now <= chkInDate2) {
			var com = 0;
			var result = parseInt(totalPr) - parseInt(com);
			$('#commission').text(comma(uncomma(com)));
			$('#refund').text(comma(uncomma(result)));
			return true;
		}
	}
</script>
</head>
<body>
	<input type="hidden" name="popUpReserNo" id="popUpReserNo" value="${reservation.reserNo}">
	<input type="hidden" name="popUpRoomNo" id="popUpRoomNo" value="${room.roomNo}">
	<input type="hidden" name="popUpReserStatus" id="popUpReserStatus" value="${reservation.reserStatus}">
	
	<div class="cancel_mainName">예약/결제 취소하기</div>
	<div class="cancel_page">
		<div class="reser_info">
			<div class="reser_no">
				<span class="left_name">예약번호</span> 
				<span class="right_name">${reservation.reserNo}</span>
			</div>
			<div class="sub_info">
				<div class="reser_member">
					<div class="member_name">
						<span class="left_name">예약자 성함</span> 
						<span class="right_name">${loginMember.memberName}</span>
					</div>
					<div class="member_phone">
						<span class="left_name">예약자 연락처</span> 
						<span class="right_name">${loginMember.memberPhone}</span>
					</div>
				</div>
				<div class="reser_chk">
					<div class="chk_in">
						<input type="hidden" id="chkIn" name="chkIn" value="${reservation.reserCheckIn}">
						<span class="left_name">CHECK IN</span> 
						<span class="right_name">${reservation.reserCheckIn}</span>
					</div>  
					<div class="chk_out">
						<input type="hidden" id="chkOut" name="chkOut" value="${reservation.reserCheckOut}">
						<span class="left_name">CHECK OUT</span> 
						<span class="right_name">${reservation.reserCheckOut}</span>
					</div>
				</div>	
			</div>
		</div>
		<div class="cancel_info">
			<div class="cancel_reason">
				<div class="reason_name">예약 취소 사유</div>
				<select class="select_reason" id="popUpReason" name="selectReason">
					<option value="" selected>취소이유를 선택해주세요</option>
					<option value="여행이 취소되거나 미뤄짐">여행이 취소되거나 미뤄짐</option>
					<option value="다른 호텔로 변경함">다른 호텔로 변경함</option>
					<option value="타사에서 더 저렴한 가격을 찾음">타사에서 더 저렴한 가격을 찾음</option>
					<option value="여행사를 통해 더 나은 상품을 찾음">여행사를 통해 더 나은 상품을 찾음</option>
					<option value="지불 조건이 마음이 들지 않음">지불 조건이 마음이 들지 않음</option>
					<option value="예약취소 정책이 마음에 들지 않음">예약취소 정책이 마음에 들지 않음</option>
					<option value="신뢰성 및 신용에 대한 우려">신뢰성 및 신용에 대한 우려</option>
					<option value="호텔 위치 상 안전에 대한 우려가 있음">호텔 위치 상 안전에 대한 우려가 있음</option>
					<option value="기타">기타</option>
				</select>
			</div>
			
			<div class="reser_money">
				<input type="hidden" id="totalPr" name="totalPr" value="${money.totalPrice}">
				<span class="left_name">총 예약가</span>  
				<span class="right_name"><fmt:formatNumber value="${money.totalPrice}" pattern="#,###" /></span>
			</div>
			<div class="cancel_commission">
				<input type="hidden" id="commissionPr" name="commissionPr" value="0">
				<span class="left_name">취소 수수료</span>
				<span class="right_name" id="commission"></span>
			</div>
			
			<div class="cancel_return">
				<input type="hidden" id="refundPr" name="refundPr" value="0">
				<span class="left_name">환불 금액</span>
				<span class="right_name" id="refund"></span>
			</div> 
		
			<div class="commission_table">
				<button class="commission_header" id="commissionGuide">
					예약 취소에 따른 위약금 규정
				</button>
				<div class="commission_body">
					사용 예정일(체크인 날짜) 3일 전 15시 이후 예약취소 시<br>
					- 하루 숙박 총 요금의 50% 부과<br>
	
					사용 예정일(체크인 날짜) 1일 전 15시 이후 예약취소 시<br>
					- 하루 숙박 총 요금의 90% 부과<br>
					(당일 숙박을 위한 당일예약 후, 예약 취소의 경우도 위약금 규정이 동일하게 적용됩니다.)<br>
					* 사용 예정일(체크인 날짜) 3일 전 15시 이전 예약취소 시 무료취소 가능합니다.<br>
				</div>	
			</div>
			
			<div>
				<input type="button" id="removeReser" value="예약 취소" class="cancel_btn">
			</div>
		</div>
	</div>
	
</body>
</html>