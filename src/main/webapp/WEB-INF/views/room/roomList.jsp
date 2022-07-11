<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Pacifico&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/148c1051b1.js" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<style>
	
		
	.roomNo{
		color: black;
		padding: 20px;
		font-family: 'MICEMyungjo';
		
	}
	
	table{
		
		width: 1200px;
		margin: auto;
	}
	
	input{
	  margin: 63px;
	  outline: none;
	}
	
	.goPost {
	  	font-size: 14px;
    	padding: 0.655rem 1.75rem;
    	border-radius: 0.3rem;
    	border-color: #ba895d;
   		color: #ba895d;
    	background-color: transparent;
    	font-weight: 600;
    	border-width: 2px;
   	 	box-shadow: 0 5px 10px 2px rgb(36 105 92 / 19%) !important;
	}
	.goPost:not(:disabled) {
		cursor: pointer;
	}
	.goPost[type=button] {
		-webkit-appearance: button;
	}
	.goPost:after {
	  position: absolute;
	  content: "";
	  width: 100%;
	  height: 0;
	  bottom: 0;
	  left: 0;
	  z-index: -1;
	  transition: all 0.3s ease;
	  font-size: 14px;
	}
	.goPost:hover {
    	color: white;
    	background-color: #a07044 !important;
   	 	border-color: #a07044 !important;
	}
</style>
<script type="text/javascript">

/* var openWin;

function openChild(var roomNo)
{
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("${contextPath}/room/detail?roomNo="+roomNo,
            "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
} */
	$(function(){
		$(".goPost").click(function(){
			var goBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = goBtn.parent().parent();
			var td = tr.children();
			
			var ro = td.eq(0).children().val();
			
			console.log(ro);
			

			let f = document.createElement('form');
			const chkIn = document.getElementById('chkIn');
			const chkOut = document.getElementById('chkOut');
			
			f.appendChild(chkIn);
			f.appendChild(chkOut);			
			
			f.setAttribute('method', 'post');
			f.setAttribute('action', '${contextPath}/reservation/reservationPage?roomNo=' + ro);
			document.body.appendChild(f);
			f.submit();
		})
	})
</script>
</head>
		<jsp:include page="../layout/header.jsp"></jsp:include>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<table id="tbl">
			
		<tbody>
			
			<c:forEach items="${roomList}" var="room">
					<tr>
						<td>
						   <input type="hidden" id="roomNo" name="roomNo" value="${room.roomNo}">
						   <a href="${contextPath}/room/detail?roomNo=${room.roomNo}" class="roomNo"><img src="${contextPath}/room/view?roomNo=${room.roomNo}" width="400px" height="300px"></a>
						   <a href="${contextPath}/room/detail?roomNo=${room.roomNo}" class="roomNo">${room.roomName}</a>
						</td>	
						<td>
						   <input type="button" id="goPost" name="goPost" class="goPost" value="${room.roomPrice}KRW">
						</td>
					</tr>
			</c:forEach>
			
		</tbody>
		
	</table>
	
	<input type="hidden" id="chkIn" name="chkIn" value="${chkIn}">
	<input type="hidden" id="chkOut" name="chkOut" value="${chkOut}">	
</body>
		<jsp:include page="../layout/footer.jsp"></jsp:include>
</html>