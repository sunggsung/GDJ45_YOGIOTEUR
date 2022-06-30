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
   
	  <h1>QnA 상세보기</h1>
	  
	  <a href="${contextPath}/qna/qnaList">목록으로</a>
	  
	  
	  <hr>
	 
	
	  		번호 	: ${qna.qnaNo}<br>
	  		제목	: ${qna.qnaTitle}<br>
	  		아이디 	: ${qna.memberId}<br>
	  		내용 	: ${qna.qnaCreated}<br>
	
	  <form id="qnaReplyData">
	  	<textarea rows="10" cols="50"></textarea>
	  	<button>댓글 달기</button>
	  </form>
  	
</body>
</html>