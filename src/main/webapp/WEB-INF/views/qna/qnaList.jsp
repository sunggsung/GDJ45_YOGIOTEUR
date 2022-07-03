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
    
 	function fnRemove(no){      
        if(confirm('게시글을 삭제할까요?')){
           location.href='${contextPath}/qna/qnaRemove?qnaNo=' + $(no).data('qna_no');
        }
  }
 	
</script>
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>
   
   <jsp:include page="../layout/header.jsp"></jsp:include>
   
  <h1>QnA 게시판</h1>
  
  
   <c:if test = "${loginMember.memberId eq null}">
	   	로그인 후 작성가능합니다.
   </c:if> 
   <c:if test = "${loginMember.memberId ne null}">
	   	<a href="${contextPath}/qna/qnaSavePage">새글작성</a>
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
	  					<td><a href="${contextPath}/qna/qnaDetailPage?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></td>
	  					<td>${qna.memberId}</td>
	  					<td>${qna.qnaCreated}</td>
	  					<td>${qna.qnaHit}</td>	  					
	  					<c:if test = "${loginMember.memberId eq qna.memberId || loginMember.memberId eq 'admin123'}">
	  						<td><input type="button" value="삭제" data-qna_no = "${qna.qnaNo}" onclick="fnRemove(this)"></td>
	  					</c:if>
	  				</tr>
  			</c:forEach>
  		
  	</tbody>
  </table>
  
  	<div>${paging}</div>
  	
  	<jsp:include page="../layout/footer.jsp"></jsp:include>
  	
</body>
</html>