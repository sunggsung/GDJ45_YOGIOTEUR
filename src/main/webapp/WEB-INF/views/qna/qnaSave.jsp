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
   
   <h1>QnA 문의사항</h1>
  
   <a href="${contextPath}/qna/qnaList">목록으로</a>
  
  
   <form id="QnaAdd" method="post" action="${contextPath}/qna/qnaSave">
   		<input type="hidden" name="memberId" value="${loginMember.memberId}"> 
   		제목 : <input type="text" id="qnaTitle" name="qnaTitle"><br>
   		내용 : <textarea rows="20" cols="50" name="qnaContent"></textarea>
   		<button>등록하기</button>
   </form>
  
  
  
  
</body>
</html>