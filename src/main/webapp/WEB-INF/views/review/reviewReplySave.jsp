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
	
	$(function(){
		fnTextareaLimit();
	})
	
	function fnTextareaLimit(){
		$('#replyContent').on('keyup', function(){
			$('#replyContent_cnt').html("(" + $(this).val().length+" / 500)");
			
			if($(this).val().length > 500){
				$(this).val($(this).val().substring(0,500));
				$('#replyContent_cnt').html("(500 / 500)" );
			}
			
		})
	}
	
</script>


</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>
   
   <h1>댓글 작성하기</h1>
   
   	리뷰 번호 : ${review.reviewNo}<br>
    예약번호 : ${review.reserNo}<br>
    리뷰 제목 : ${review.reviewTitle}<br>
    리뷰 내용 : ${review.reviewContent}<br>
    작성일 : ${review.reviewCreated}<br>
    별점 : ${review.reviewRevNo}<br>
    
    <c:forEach var="reImage" items="${reImage}">
		<img alt="${reImage.reImageOrigin}" src="${contextPath}/review/display?reImageNo=${reImage.reImageNo}&reviewNo=${reImage.reviewNo}" width="300px">					
	</c:forEach>
   	
	<form id="replydata"  action="${contextPath}/review/reviewReplySave" method="post">
		<input type="hidden" name="reviewNo" value="${review.reviewNo}">
		<textarea rows="10" cols="50" id="replyContent" name="replyContent"></textarea>
		<div id="replyContent_cnt">(0 / 500)</div>
		<button>댓글 등록</button>
	</form>
   
	<jsp:include page="../layout/footer.jsp"></jsp:include>
   
</body>
</html>