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
<script type="text/javascript">
</script>
</head>
<body>
		
	<table>
			
		<tbody>
			
			<c:forEach items="${roomList}" var="room">
				<form id="reservationPost" name="reservationPost" action="/reservation/reservationPage" method="post" >
					<tr>
						<td>
						<input type= "hidden" value="${room.roomNo}"><a href="${contextPath}/room/detail?roomNo=${room.roomNo}"><img src="${contextPath}/room/view?roomNo=${room.roomNo}" width="300px"></a>
						</td>
						<td><input type= "hidden" value="${room.roomName}"><a href="${contextPath}/room/detail?roomNo=${room.roomNo}">${room.roomName}</a>
						</td>			
						<td><input type="submit" id="reservation" name="reservation" value="${room.roomPrice}KRW"></td>
					</tr>
				</form>
				
			</c:forEach>
			
		</tbody>
		
	</table>
</body>
</html>
