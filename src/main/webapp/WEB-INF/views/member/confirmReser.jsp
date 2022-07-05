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
<style>
	ul li a {
		color: gray;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		popupOpen();
	})
	
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
			var popOption = "width=640, height=360, top=50, left=310, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)	
			window.open(popUrl,"",popOption);	
		})
	}
</script>
</head>
<body>
		
	<jsp:include page="../layout/header.jsp"></jsp:include>
			
	<ul>
		<li><a href="${contextPath}/member/memberInfo">내정보</a></li>
		<li><a href="${contextPath}/member/modifyPwPage">비밀번호 변경</a></li>
		<li><a href="${contextPath}/member/confirmReserPage">예약내역</a></li>
	</ul>
			
	 <div class="container">
       <h3>예약 확인</h3>
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
						<td>예약취소</td> <!--  -->
					</tr>
				</thead>
				<tbody id="confirmReser">
					<c:forEach items="${reservations}" var="reservation"> <!--  -->
						<tr>
							<td>${reservation.reserNo}</td>
							<td>${reservation.roomNo}</td>
							<td>${loginMember.memberName}</td>
							<td>${reservation.reserCheckin}</td>
							<td>${reservation.reserCheckout}</td>
							<td>${reservation.reserPeople}</td>
							<td>예약상태</td>
							<td><input type="button" value="예약취소" class="cancelBtn"></td>
						</tr>
					</c:forEach> <!--  -->
				</tbody>
			</table>
    </div>


</body>
</html>