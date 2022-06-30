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
 		fnDetailOneSelect();
 	})
 	
 	function fnDetailOneSelect(){
 		$('#qna_${qna.qnaNo}').on('click', function(){
 			location.href='${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}';
 		});
 	}
    
</script>

</head>
<body>
   
  <h1>QnA 게시판</h1>
  
  <a href="${contextPath}/qna/qnaSavePage">새글작성</a>
  
  
  <hr>
  
  <table border="1">
  	<thead>
  		<tr>
  			<td>번호</td>
  			<td>제목</td>
  			<td>작성자</td>
  			<td>작성일자</td>
  		</tr>
  	</thead>
  	<tbody>
  			<c:forEach items="${qnas}" var="qna">
  				<tr id="qna_${qna.qnaNo}">
  					<td>${qna.qnaNo}</td>
  					<td><a href="${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></td>
  					<td>${qna.memberId}</td>
  					<td>${qna.qnaCreated}</td>
  				</tr>
  			</c:forEach>
  		
  	</tbody>
  </table>
  
  	<div>${paging}</div>
</body>
</html>