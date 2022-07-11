<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Pacifico&display=swap" rel="stylesheet">
<head>
<style type="text/css">
	@font-face {
		font-family: 'MICEMyungjo';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
		font-weight: normal;
		font-style: normal;
	}
	.index > a, h3 {
		font-family: 'MICEMyungjo';
	}
</style>
</head>
<body>
	
	<div class="grid_item index">
		<h3>관리자 메뉴</h3><br>
		<a href="/admin/member">회원목록</a>
		<br><br><br><br><br>
		<a href="/admin/reservationList">예약목록</a>
		<br><br><br><br><br>
		<a href="/admin/room">객실목록</a><br><br><br><br><br>
		<a href="/admin/addRoomPage">객실등록</a><br><br><br><br>
	</div>
	
</body>
</html>