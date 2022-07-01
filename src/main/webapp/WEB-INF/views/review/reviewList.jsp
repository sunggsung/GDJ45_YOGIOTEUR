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
<link rel="stylesheet" href="../resources/css/reviewList.css">
<script>

	// 리뷰수정
	function fnReviewModify(mb){
		location.href='${contextPath}/review/reviewChangePage?reviewNo=' + $(mb).data('review_no');
	}
	//댓글 저장
	function fnReviewReply(bn){
		location.href='${contextPath}/reply/reviewReplySavePage?reviewNo=' + $(bn).data('review_no');
	}
	// 리뷰삭제
	 function fnReviewRemove(rn){      
	       if(confirm('삭제할까요?')){
	          location.href='${contextPath}/review/reviewRemove?reviewNo=' + $(rn).data('review_no');
	       }
	 }

	//댓글 수정
	function fnReviewReplyModify(mr){
		location.href='${contextPath}/reply/reviewReplyChangePage?replyNo=' + $(mr).data('reply_no')+'&reviewNo='+$(mr).data('review_no') ;
	}
	 // 댓글 삭제
	 function fnReviewReplyRemove(rpn){
		 if(confirm('댓글을 삭제할까요?')){
	          location.href='${contextPath}/reply/reviewReplyRemove?replyNo=' + $(rpn).data('reply_no');
	       }
	 }
</script>

</head>
<body>

   <jsp:include page="../layout/header.jsp"></jsp:include>
   
   <h1>리뷰목록</h1>
   
   <div >
   
   
	   <c:if test = "${loginMember.memberId ne null}">
	   		<a id="addRe" href="${contextPath}/review/reviewSavePage">새 리뷰 작성하기</a>
	   </c:if> 
	  
	   
	   <c:forEach items="${reviews}" var="review">
	   		
	   		<div id = "ReviewListONE">
	   			<div class="memberReview">
	   				<div class="reviewbox"> 
	   				리뷰제목 : ${review.reviewTitle}<br>
	   					별점 : ${review.reviewRevNo}<br>
	   					<c:forEach var="i" begin="1" end="5">
	   						<c:if test="${review.reviewRevNo ge i}">
		   						<span id="staro">★</span>					
	   						</c:if>
	   						<c:if test="${review.reviewRevNo lt i}">
		   						<span id="staro">☆</span>					
	   						</c:if>	
	   					</c:forEach>
	   					<br>
	   					
	   					아이디 : ${review.memberId}<br>
	   					
	   					리뷰 내용 : ${review.reviewContent}<br>
	   					
						
						<c:forEach var="reImage" items="${reImages}">
							<c:if test="${review.reviewNo eq reImage.reviewNo}">
								<img alt="${reImage.reImageOrigin}" src="${contextPath}/review/display?reImageNo=${reImage.reImageNo}" width="300px">					
							</c:if>
						</c:forEach>
						
						<c:if test="${loginMember.memberId eq review.memberId || loginMember.memberId eq 'admin123'}">
			   				<input type="button" value="삭제" name="reviewRemoveBtn" data-review_no="${review.reviewNo}" onclick="fnReviewRemove(this)">					
						</c:if>
						
						<c:if test = "${loginMember.memberId eq review.memberId}">
							<input type="button" value="리뷰 수정" name="reviewModifyBtn" data-review_no="${review.reviewNo}" onclick="fnReviewModify(this)">
			   			</c:if>
			   			
			   			<c:if test = "${loginMember.memberId eq 'admin123'}">
			   				<input type="button" value="댓글달기" id ="reviewReplyBtn" data-review_no="${review.reviewNo}" onclick="fnReviewReply(this)">
			   			</c:if>
			   			
			   			
			   			
	   				</div>
	   			</div>
	   			
		   			<div class="adminReply">		
						<c:forEach items="${reviewReplies}" var="reviewReply">
		   						<c:if test="${review.reviewNo eq reviewReply.reviewNo}">
			   						<div id="adminReplyList" >
					   					<div>관리자댓글
											${reviewReply.replyContent}
											<c:if test = "${loginMember.memberId eq 'admin123'}">			   					
								   				<input type="button" id="reviewReplyRemoveBtn" value="댓글 삭제" data-reply_no="${reviewReply.replyNo}" onclick="fnReviewReplyRemove(this)">
								   				<input type="button" id="reviewReplyModifyBtn" value="댓글 수정" data-reply_no="${reviewReply.replyNo}" data-review_no="${review.reviewNo}" onclick="fnReviewReplyModify(this)">
					   						</c:if>
					   					</div>					
					   				</div>		   					   						
		   						</c:if>
						</c:forEach>
		   			</div>
	   			
	   		</div>
	   		
	   </c:forEach>
   </div>
   
   
   <div class="noList">${paging}</div>
   
   <jsp:include page="../layout/footer.jsp"></jsp:include>
   
</body>
</html>