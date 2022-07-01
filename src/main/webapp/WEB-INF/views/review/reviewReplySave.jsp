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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
	
	
</script>


</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
   
   	리뷰 번호 : ${review.reviewNo}<br>
    예약번호 : ${review.reserNo}<br>
    리뷰 제목 : ${review.reviewTitle}<br>
    리뷰 내용 : ${review.reviewContent}<br>
    작성일 : ${review.reviewCreated}<br>
    별점 : ${review.reviewRevNo}<br>
    <div><img src="${contextPath}/review/display?reviewNo=${review.reviewNo}" width="300px" onerror="this.style.display='none'"></div>
   	
	<form id="replydata"  action="${contextPath}/review/reviewReplySave" method="post">
		<input type="hidden" name="reviewNo" value="${review.reviewNo}">
		<textarea rows="10" cols="50" id="replyContent" name="replyContent"></textarea>
		<button>댓글 등록</button>
	</form>
   
	<jsp:include page="../layout/footer.jsp"></jsp:include>
   
</body>
</html>