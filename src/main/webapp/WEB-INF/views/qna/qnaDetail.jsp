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
		
		$('.reply_link').on('click', function(){
			$('.reply_form').addClass('blind');
	    	$(this).parent().parent().next().removeClass('blind');
		});
	})
	
	
    
</script>
<style>
	.blind {
		display: none;
	}
</style>
</head>
<body>
   
	  <h1>QnA 상세보기</h1>
	  
	  <a href="${contextPath}/qna/qnaList">목록으로</a>
	  
	  
	  <hr>
		
		 	
		  		번호 	: ${qna.qnaNo}<br>
		  		제목	: ${qna.qnaTitle}<br>
		  		아이디 	: ${qna.memberId}<br>
		  		내용 	: ${qna.qnaContent}<br>
		 	
		 	<br><br>
		 	
		 	<form id="qnaReplyData" method="post" action="${contextPath}/qnaReply/qnaReplySave">
		 		<input type="hidden" name="qnaNo" value="${qna.qnaNo}">
			  	<input type="hidden" name="memberId" value="admintest">		  
			  	<textarea rows="10" cols="50" name="qnaReplyContent"></textarea>
			  	<button>댓글 달기</button>
			</form>
		 	
			
		 
		  
		  <br><br>
		<table>
		
			<tbody>
		 		<c:forEach items="${qnaReplies}" var="qnaReply">
			 		<c:if test="${qnaReply.qnaReplyState == -1}">
						<tr>
							<td></td>
							<td>삭제된 댓글입니다</td>
						</tr>
					</c:if>
					<c:if test="${qnaReply.qnaReplyState == 1}">
						<tr>
							<td>아이디 	: ${qnaReply.memberId}</td>
							<td>
								<!-- Depth만큼 들여쓰기(Depth 1 == Space 2) -->
								<c:forEach begin="1" end="${qnaReply.qnaReplyDepth}" step="1">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
								<!-- 댓글은 re 표시 -->
								<c:if test="${qnaReply.qnaReplyDepth gt 0}"><i class="fa-brands fa-replyd"></i></c:if>
								<!-- 내용 -->
								<c:if test="${qnaReply.qnaReplyContent.length() gt 200}">								
									${qnaReply.qnaReplyContent.substring(0, 200)}
								</c:if>
								<c:if test="${qnaReply.qnaReplyContent.length() le 200}">								
									${qnaReply.qnaReplyContent}
								</c:if>
								<!-- 답글달기(if 있으면 1단 댓글만 허용, if 없으면 다단 댓글 허용) -->
								<%-- <c:if test="${fb.depth eq 0}"> --%>
									<a class="reply_link">답글</a>								
							</td>
							<td>${qnaReply.qnaReplyCreated}</td>
							<td>
								${qnaReply.qnaReplyNo}
									<a href="${contextPath}/qnaReply/qnaReplyRemove?qnaReplyNo=${qnaReply.qnaReplyNo}">
										<i class="fa-solid fa-trash-can"></i>
									</a>
										
									
							</td>
						</tr>
						<tr class="reply_form blind">
							<td >
								<form action="${contextPath}/qnaReply/qnaReplySaveSecond" method="post">
									<input type="hidden" name="qnaNo" value="${qna.qnaNo}" >
									<input type="text" name="memberId" value="member123" size="7" readonly>
									<input type="text" name="qnaReplyContent">
					
									<!-- 원글의 Depth, GroupNo, GroupOrd -->
									<input type="hidden" name="qnaReplyDepth" value="${qnaReply.qnaReplyDepth}">
									<input type="hidden" name="qnaReplyGroupNo" value="${qnaReply.qnaReplyGroupNo}">
									<input type="hidden" name="qnaReplyGroupOrd" value="${qnaReply.qnaReplyGroupOrd}">
									<button>답글달기</button>
								</form>
							</td>
						</tr>
					</c:if>
			  			
			  						 			
		 		</c:forEach>
			
			</tbody>
		
		</table>
		 			
		 			
		 			
				   			
				   		
		 		 	
		 			
					
		 
	   <br><br>
	  
	  	
	    
  		
</body>
</html>