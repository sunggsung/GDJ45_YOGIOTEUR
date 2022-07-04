<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Charis+SIL:wght@700&family=Kdam+Thmor+Pro&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
</head>
<style>
	
	.detailSize{
		
		margin: auto;
		width: 1200px;
	
	}
	
	.btn-15 {
	  background: #000;
	  color: #fff;
	  z-index: 1;
	}
	.btn-15:after {
	  position: absolute;
	  content: "";
	  width: 100%;
	  height: 0;
	  bottom: 0;
	  left: 0;
	  z-index: -1;
	  background: #fff;
	  transition: all 0.3s ease;
	}
	.btn-15:hover {
	  color: #000;
	}
	.btn-15:hover:after {
	  top: 0;
	  height: 100%;
	}
	.btn-15:active {
	  top: 2px;
	}

</style>
<script>
	
</script>
		<jsp:include page="../layout/header.jsp"></jsp:include>
<body>
	<div class="detailSize">
	
	 <button class="custom-btn btn-15" onclick="history.back()">뒤로가기</button>
		<c:choose>
			<c:when test="${rn.rtNo eq 1}">
				<div>
				<img src="${contextPath}/room/view?roomNo=${rn.roomNo}" width="500px;">
				<h2>${rn.roomName}</h2>
				<span>현대적 세련미와 은은한 불빛이 조화롭게 어우러진 객실로, 비즈니스 여행객과 레저 여행객 모두에게 아늑한 숙박을 제공 합니다.</span>
				<br><br>
				<span>※상기 객실 이미지는 실제 제공되는 객실과 다를 수 있습니다.</span><br>
				<hr>
				객실타입 : ${rn.roomTypeDTO.rtType} <br>
				객실 정원수 : ${rn.roomTypeDTO.rtMax} <br>
				객실 면적 : 34.4~37 ㎡ <br>
				
				</div>
			</c:when>
			<c:when test="${rn.rtNo eq 2}">
				<div>
				<img src="${contextPath}/room/view?roomNo=${rn.roomNo}" width="500px;">
				<h2>${rn.roomName}</h2>
				<span>현대적 세련미와 은은한 불빛이 조화롭게 어우러진 객실로, 비즈니스 여행객과 레저 여행객 모두에게 아늑한 숙박을 제공 합니다.</span>
				<br><hr>
				<span>※상기 객실 이미지는 실제 제공되는 객실과 다를 수 있습니다.</span><br>
				객실타입 : ${rn.roomTypeDTO.rtType} <br>
				객실 정원수 : ${rn.roomTypeDTO.rtMax}
				</div>
			</c:when>
			<c:when test="${rn.rtNo eq 3}">
				<div>
				<img src="${contextPath}/room/view?roomNo=${rn.roomNo}" width="500px;">
				<h2>${rn.roomName}</h2>
				<span>현대적 세련미와 은은한 불빛이 조화롭게 어우러진 객실로, 비즈니스 여행객과 레저 여행객 모두에게 아늑한 숙박을 제공 합니다.</span>
				<br><hr>
				<span>※상기 객실 이미지는 실제 제공되는 객실과 다를 수 있습니다.</span><br>
				객실타입 : ${rn.roomTypeDTO.rtType} <br>
				객실 정원수 : ${rn.roomTypeDTO.rtMax}
				</div>
			</c:when>
		</c:choose>
	</div>
</body>
		<jsp:include page="../layout/footer.jsp"></jsp:include>

</html>