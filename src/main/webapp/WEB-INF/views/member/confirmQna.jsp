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
</head>
<body>
		
	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<ul>
		<li><a href="${contextPath}/member/memberInfo">내정보</a></li>
		<li><a href="${contextPath}/member/modifyPwPage">비밀번호 변경</a></li>
		<li><a href="${contextPath}/member/confirmReserPage">예약내역</a></li>
		<li><a href="${contextPath}/member/confirmQnaPage">문의내역</a></li>
	</ul>
	
	<div class="content">
		<h3>문의내역 확인</h3>
			<table class="qna" border="1">
				<thead>
					<tr>
						<td>게시글번호</td>
						<td>제목</td>
						<td>작성일</td>
					</tr>
				</thead>
				<tbody id="confirmQna">
						<tr>
							<td>${faq.faqNo}</td>
							<td>${faq.faqTitle}</td>
							<td>${faq.faqCreated}</td>
						</tr>
				</tbody>
			</table>
		</div>

</body>
</html>