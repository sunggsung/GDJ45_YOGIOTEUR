<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
	
	
	<h1>MAIN PAGE</h1>
	
	<a href="${contextPath}/reservation/reservationPage">예약 페이지</a>
	<a href="${contextPath}/admin/adminPage">관리자 페이지</a>
	${nonMember.nonName}
	${nonMember.nonPhone}
	
	
</body>
</html>