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
		/* fnAdminReply(); */
		fnAdminReplySave();
		/*fnAdminReplyRemove();*/
		fnInit();
	})
	
	/* function fnAdminReply(){
		$.ajax({
			url:'${contextPath}/reply/reviewReplyList',
			type: 'get',
			data: 'reviewNo=${reviewNo}',
			dataType: 'json',
			sucess:function(obj){
				$.each(obj.replies, function(i, reply){
					var ul = $('<ul>')
					.append($('<li>').text(reply.replyContent))
					.append($('<li>').text(reply.replyCreated));
						
					$(ul).appendTO('#adminReplyList');
				})
			}
		}) */
		
	}
	
	
	function fnAdminReplySave(){
		$('#replyAdd').on('click', function(){
			$.ajax({
				url:'${contextPath}/reply/reviewReplySave',
				type: 'post',
				data: $('#replydata').serialize(),
				dataType: 'json',
				sucess:function(obj){
					if(obj.res > 0){
						alert('댓글이 등록되었습니다');
						fnInit();
					}
				}
			})
		})
	}
	
	function fnAdminReplyRemove(){
		$('#removeReplyLink').on('click',function(){
			if(confirm('삭제할까요?')){
				$.ajax({
					url: '${contextPath}/reply/replyRemove',
					type: 'get',
					date: 'replyNo=' + $(this).data('reply_no'),
					dataType: 'json',
					success: function(obj){
						if(obj.res > 0){
							alert('댓글이 삭제되었습니다.');
							fnAdminReply();
							fnInit();
						}
					}
				})
			}
		})
	}
	
	function fnInit(){
		$('#replyContent').val('');
	}
	
	 function fnReviewRemove(rn){      
	       if(confirm('삭제할까요?')){
	          location.href='${contextPath}/review/reviewRemove?reviewNo=' + $(rn).data('review_no');
	       }
	 }
	 
	 function fnReviewReply(rr){
		 location.href='${contextPath}/review/reviewReply?reviewNo=' + $(rr).data('review_no');
	 }
</script>
<style>
	.reviewbox {
		background-color : #f0f0f0;
	}
</style>
</head>
<body>

   <jsp:include page="../layout/header.jsp"></jsp:include>
   
   <h1>리뷰목록</h1>
   
   <a href="${contextPath}/review/reviewSavePage">새 리뷰 작성하기</a>
   
  
   
   <c:forEach items="${reviews}" var="review">
   		<div>
   			<div class="memberReview">
   				<div class="reviewbox"> 
   					별점 : ${review.reviewRevNo}<br>
   					<c:forEach var="i" begin="1" end="5">
   						<c:if test="${review.reviewRevNo ge i}">
	   						<span id="staro">★</span>					
   						</c:if>
   						<c:if test="${review.reviewRevNo lt i}">
	   						<span id="staro">☆</span>					
   						</c:if>	
   					</c:forEach>
   					
   					
   					리뷰제목 : ${review.reviewTitle}<br>
   					리뷰 내용 : ${review.reviewContent}<br>
   					<div><img src="${contextPath}/review/display?reviewNo=${review.reviewNo}" width="300px" onerror="this.style.display='none'"></div>				
					
					
					
		   			<input type="button" value="삭제" name="reviewRemoveBtn" data-review_no="${review.reviewNo}" onclick="fnReviewRemove(this)">
		   			<input type="button" value="댓글달기" name="reviewReplyBtn" data-review_no="${review.reviewNo}" onclick="fnReviewReply(this)">
		   			
		   			<hr>
		   			
   				</div>
   			</div>
   			
	   			<div class="adminReply">
		   			
		   				관리자 댓글 :
		   				<div id="adminReplyList" data-review_no="${review.reviewNo}">
		   				
		   				</div>
		   				
		   				<input type="button" id="removeReplyLink" value="댓글 삭제">

		   			<form id="replydata" action="${contextPath}/reply/replySave">
		   				<input type="hidden" name="reviewNo" value="${review.reviewNo}">
		   				<textarea rows="10" cols="50" id="replyContent" name="replyContent"></textarea>
		   				<button type="button" id="replyAdd">댓글 등록</button>
		   			</form>
		   		
	   			
	   			
	   			</div>
   			
   		</div>
   </c:forEach>
   
   <div class="noList">${paging}</div>
   
   <jsp:include page="../layout/footer.jsp"></jsp:include>
   
</body>
</html>