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
<link rel="stylesheet" href="../resources/css/qnaList.css?a">

<script>
 
 	$(function(){
 		$(document).ready(function(){
 		    $('table tbody tr td').click(function(){
 		    	if($(this).data('href') == null){
 		    		return false;
 		    	}
 		    	
 		        window.location = $(this).data('href');
 		        return false;
 		    });
 		    
 		});
 	})
 	
 	function fnDetailOneSelect(){
 		$('#qna_${qna.qnaNo}').on('click', function(){
 			location.href='${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}';
 		});
 	}
    
 	function fnRemove(no){      
        if(confirm('게시글을 삭제할까요?')){
           location.href='${contextPath}/qna/qnaRemove?qnaNo=' + $(no).data('qna_no');
        }
  }
 	
 	
 	
</script>

</head>
<body>
   
   <jsp:include page="../layout/header.jsp"></jsp:include>
   
  <h1>QnA 게시판</h1>
  
  
   <c:if test = "${loginMember.memberId eq null}">
	   	로그인 후 작성가능합니다.
   </c:if> 
   <c:if test = "${loginMember.memberId ne null}">
	   	<a class="qnaAddA" href="${contextPath}/qna/qnaSavePage">새글작성</a>
   </c:if>
  
  <hr>
  
  <table border="1">
  	<thead>
  		<tr>
  			<td>제목</td>
  			<td>작성자</td>
  			<td>작성일자</td>
  			<td>조회수</td>
  			<c:if test = "${loginMember.memberId ne null}">
  			<td>삭제</td>
  			</c:if>
  		</tr>
  	</thead>
  	<tbody>
  			<c:forEach items="${qnas}" var="qna">
	  				<tr id="qna_${qna.qnaNo}">
	  					<td data-href="${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</td>
	  					<td data-href="${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}">${qna.memberName}</td>
	  					<td data-href="${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}">${qna.qnaCreated}</td>
	  					<td data-href="${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}">${qna.qnaHit}</td>	  					
	  					<c:if test = "${loginMember.memberId eq qna.memberId || loginMember.memberId eq 'admin12'}">
	  						<td><input id="qnaListDelBtn" type="button" value="삭제" data-qna_no = "${qna.qnaNo}" onclick="fnRemove(this)"></td>
	  					</c:if>
	  				</tr>
  			</c:forEach>
  		
  	</tbody>
  </table>
  
  	<div class="paging">${paging}</div>
  	
  	<jsp:include page="../layout/footer.jsp"></jsp:include>
  	
</body>
</html>