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
<script>
	
</script>
</head>
<body>
	
	<h1>예약 가능 객실 조회</h1>
	
	
	<table>
		<tbody>
			<c:forEach items="${roomList}" var="roomLi">
				<tr>
					<td>${roomLi.imageDTO.imageNo}</td>		
					<td>${roomLi.roomName}</td>			
					<td>${roomLi.roomPrice}</td>		
					<td><input type="button" id="reservation" value="예약하기"></td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
	
</body>
</html>