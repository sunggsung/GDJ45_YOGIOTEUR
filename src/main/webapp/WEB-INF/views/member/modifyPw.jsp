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

		$(function(){
			
		})
		
		function fnPwModify(){
			$.ajax({
				url: '${contextPath}/member/pwModify',
				type: 'POST',
				data: 'memberPw=' + $('#memberPw').val(),
				dataType: 'json',
				success: function(obj){
					
				},
				error: function(jqXHR){
					alert('일치하는 회원이 존재하지 않습니다.');
				}
			})
		}
		
		
</script>
<style>
	
</style>
</head>
<body>
		
	<jsp:include page="../layout/header.jsp"></jsp:include>
			
		<h3>비밀번호 변경</h3>
		<table>
			<thead>
				<tr>
					<td>현재 비밀번호</td>
					<td><input type="text" name="memberPw" id="memberPw"></td>
				</tr>
			</thead>
		</table>
	<!--  
	<form id="findPwForm" action="${contextPath}/member/modifyPw" method="post"></form>
	신규 비밀번호<input type="password" name="memberPw" id="memberPw" placeholder="새 비밀번호">
	<span id="pwMsg"></span><br>
	신규 비밀번호 확인<input type="password" id="memberRePw" placeholder="새 비밀번호 확인">
	<span id="rePwMsg"></span><br>
	-->
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>

</body>
</html>