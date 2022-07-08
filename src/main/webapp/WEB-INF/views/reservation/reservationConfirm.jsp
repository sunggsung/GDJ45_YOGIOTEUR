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
<script>
</script>
<style type="text/css">
	.complete_message {
		text-align: center;
		font-size: 30px;
		font-weight: 600;
		margin-bottom: 25px;
	}
	.reser_complete {
		border: 1px solid #333;
		margin: 20px 0 0;
		padding: 28px 88px 28px 88px;
		width: 680px;
        height: 880px;
       	margin: 0 auto;
       	font-size: 18px;
	}
	.reser_name {
		position: relative;
		float: left;
	}
	.reser_data {
		position: relative;
		float: right;
	}
	.reser_info {
		margin-bottom: 30px;
	}
	.reser_no {
		padding: 0 0 30px 0;
		border-bottom: 1px solid #dcdcdc;
		font-weight: 800;
	}
	.sub_name {
		padding-top: 20px;
		font-weight: 800;
	}
	.member_info {
		margin-bottom: 30px;
	}
	.member_name {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.member_phone {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.member_people {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.room_info {
		margin-bottom: 30px;
	}
	.room_name {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.room_chkIn {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.room_chkOut {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.payment_info {
	}
	.payment_no {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.payment_sub {
		padding: 20px 35px 80px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.payment_total {
		padding: 20px 35px 30px 35px;
		border-bottom: 1px solid #dcdcdc;
	}
	.food_sub {
		position: relative;
		float: left;
		font-size: 14px;
		padding-right: 15px;
	}
	.room_sub {
		position: relative;
		float: left;
		font-size: 14px;
		padding-right: 15px;
	}
	.tip_sub {
		position: relative;
		float: left;
		font-size: 14px;
		padding-right: 15px;
	}
	.food_subData {
		position: relative;
		float: right;
		font-size: 14px;
		padding-left: 15px;
		border-left: 1px solid #dcdcdc;
	}
	.room_subData {
		position: relative;
		float: right;
		font-size: 14px;
		padding-left: 15px;
		border-left: 1px solid #dcdcdc;
	}
	.tip_subData {
		position: relative;
		float: right;
		font-size: 14px;
		padding-left: 15px;
		border-left: 1px solid #dcdcdc;
	}
	.home_button {
		min-height: 20px;
		padding: 44px 170px;
	}
	.home_btn:not(:disabled) {
		cursor: pointer;
	}
	.home_btn:hover {
    	color: white;
    	background-color: #a07044 !important;
   	 	border-color: #a07044 !important;
	}
	.home_btn {	
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
	.home_btn[type=button] {
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
		
		<div class="complete_message">${loginMember.memberName}님 감사합니다.<br> 고객님의 예약이 완료되었습니다.</div>
		
	<div class="reser_complete">
		
		<div class="reser_info">
			<div class="reser_no">
				<span class="reser_name">예약번호</span>
				<span class="reser_data">${reservation.reserNo}</span>
			</div>
		</div>
		
		<div class="member_info">
			<div class="sub_name">예약자 정보</div>
			<div class="member_name">
				<span class="reser_name">예약자 성함</span>
				<span class="reser_data">${loginMember.memberName}</span>
			</div>
			<div class="member_phone">
				<span class="reser_name">예약자 연락처</span>
				<span class="reser_data">${loginMember.memberPhone}</span>
			</div>
			<div class="member_people">
				<span class="reser_name">총 투숙인원</span>
				<span class="reser_data">${reservation.reserPeople}</span>	
			</div>
		</div>
		
		<div class="room_info">
			<div class="sub_name">객실정보</div>
			<div class="room_name">
				<span class="reser_name">객실 이름 및 타입</span> 
				<span class="reser_data">${room.roomName}</span>
			</div>
			<div class="room_chkIn">
				<span class="reser_name">체크인</span> 
				<span class="reser_data">${reservation.reserCheckIn}</span>
			</div>
			<div class="room_chkOut">
				<span class="reser_name">체크아웃</span> 
				<span class="reser_data">${reservation.reserCheckOut}</span>	
			</div>
		</div>
		
		<div class="payment_info">	
			<div class="sub_name">결제정보</div>
			<div class="payment_no">
				<span class="reser_name">결제번호</span>
				<span class="reser_data">${impUid}</span>
			</div>
			<div class="payment_sub">
				<span class="reser_name">결제 금액 세부사항</span>
				<div class="reser_data">
					<span class="food_sub">조식비</span><span class="food_subData"><fmt:formatNumber value="${money.foodPrice}" pattern="#,###" /></span><br>
					<span class="room_sub">객실비</span><span class="room_subData"><fmt:formatNumber value="${money.roomPrice}" pattern="#,###" /></span><br>
					<span class="tip_sub">세금 및 봉사료</span><span class="tip_subData"><fmt:formatNumber value="${money.tipPrice}" pattern="#,###" /></span>
				</div>
			</div>
			<div class="payment_total">
				<span class="reser_name">총 결제 금액</span> 
				<span class="reser_data"><fmt:formatNumber value="${money.totalPrice}" pattern="#,###" /></span>
			</div>
			<div class="home_button">
				<input type="button" value="메인화면으로" onclick="location.href='${contextPath}'" class="home_btn">
			</div>
		</div> 
	</div>

	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>