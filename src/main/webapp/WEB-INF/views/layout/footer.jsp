<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/footer.css">
</head>
<body>
	
	<div class="footer">
		<div class="end_title">
			<span class="end_logo">Yogioteur</span>
			<a href="${contextPath}/reservation/reservationPage">예약</a>

			<hr>
				<div class="info">
					<p class="infoP">
					(주)여기오떼르 제주특별자치도 서귀포시 비자림로 2074 63616<br>
					대표이사 : 탁지성   개인정보관리 책임자: 김성재 <br>
					사업자등록번호 : 000-00-00000  통신판매업신고 : 0000-제주서귀포-00000 <br>
					여기오떼르예약센터 1111-2222    운영시간 09:00 ~ 18:00 (연중무휴)  이메일 yogioteur@naver.com <br>
					COPYRIGHT © YOGIOTEUR INTERNATIONAL Co., Ltd. All Rights Reserved. </p>
							<nav>
								<ul>
									<li><a href="https://www.facebook.com/"><i class="fa-brands fa-facebook-square"></i></a></li>
									<li><a href="https://twitter.com/"><i class="fa-brands fa-twitter-square"></i></a></li>
									<li><a href="https://www.instagram.com/"><i class="fa-brands fa-instagram"></i></a></li>
								</ul>
							
							</nav>
				</div>
		</div>
	</div>
</body>
</html>