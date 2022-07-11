<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/148c1051b1.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
</head>
<style type="text/css">
	
	@font-face {
	    font-family: 'MICEMyungjo';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEMyungjo.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
    font-family: 'MICEGothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
	
	body{
			margin: 0;
			font-family: 'MICEMyungjo';
			font-size: 20px;
		}
		
	
	a{
		text-decoration: none;
		color: white;
		
	}
	
	header{
		position : absolute;
		bottom : 0;
		
	}
		
	a{
		text-decoration: none;
		color: white;
	}
	
	.mainImg{
		
		position: relative;
	}
	
	
	section{
		a
	}
	
	.headerMain{
		
		position: absolute;
		top:0;
		right: 5%;
		padding: 20px;
	
	}
	
	.header{
		padding: 14px;
		display: inline-block;
		font-size: 25px;
		font-family: 'MICEMyungjo';
	}
	
	.header a{
		
		margin: 0 15px;
	
	}
	
	.header a:hover {
		
		color: #FFF944;
		
	}
	
	.title{
		
		top: 0;
		left: 5%;
		position: absolute;
		padding: 20px;
	}
		
	.title a{
		font-size: 30px;
		font-family: 'Pacifico', cursive;
	}
	
	.roomNo{
		
		font-size: 18px;
    	font-family: 'MICEMyungjo';
	
	}
	
	.post{
		
		width: 100%;
		height: 850px;
		
	}
	
	.po{
		
		width: 300px;
		height: 400px;
	
	}
	
	button {
	  margin: 5px;
	  outline: none;
	}
	
	.custom-btn {
	  width: 122px;
	  height: 45px;
	  padding: 8px 20px;
	  border: 2px solid #214DA6;
	  font-family: 'MICEMyungjo';
	  font-weight: 500;
	  font-size: 18px;
	  background: transparent;
	  cursor: pointer;
	  transition: all 0.3s ease;
	  position: relative;
	  display: inline-block;
	}
	
	/* 13 */
	.btn-13 {
	  background: #214DA6;
	  color: #fff;
	  z-index: 1;
	}
	.btn-13:after {
	  position: absolute;
	  content: "";
	  width: 100%;
	  height: 0;
	  bottom: 0;
	  left: 0;
	  z-index: -1;
	  background: #fff;
	  transition: all 0.3s ease;
	}
	
	.btn-13:active {
	  top: 2px;
	}
	.btn-14 {
	  background: #fff;
	  color: #214DA6;
	  z-index: 1;
	}
	.btn-14:after {
	  position: absolute;
	  content: "";
	  width: 100%;
	  height: 0;
	  bottom: 0;
	  left: 0;
	  z-index: -1;
	  background: #fff;
	  transition: all 0.3s ease;
	}
	.btn-14:hover {
	  color: #214DA6;
	}
	.btn-14:hover:after {
	  top: 0;
	  height: 100%;
	}
	.btn-14:active {
	  top: 2px;;
	}
	
	tr, td{
	
		font-family: 'MICEMyungjo';
	}
	
	.slick-prev, .slick-next {
    font-size: 0;
    position: absolute;
    bottom: 20px;
    color: #fff;
    border: 0;
    background: none;
    z-index: 1;
    top: 20px;
    cursor: pointer;
	
	}
	 
	.slick-prev {
	    left: 20px;
	}
	 
	.slick-prev:after {
	    content: "\f104";
	    font-family: 'MICEMyungjo';
	}
	 
	.slick-next {
	    right: 20px;
	    text-align: right;
	}
	 
	.slick-next:after {
	       content: "\f105";
	     font-family: 'MICEMyungjo';
	}
	 
	.slick-prev:hover:after,
	.slick-next:hover:after {
	    color: #7e7e7e;
	}
	 
	.center{
		width: auto;
		height: 300px;
	}
	
	.search{
		
		background: white;
		width: 1220px;
		height: 90px;
		margin: 0 400px;
		box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	
	}
	
	.searchBar{
		display: flex;
		align-items: center;
	    height: 80px;
		font-size: 30px;
		color: #214DA6;
		padding-left: 190px;
		font-family: 'MICEMyungjo';
		
	}
	
	.about{
		
		font-family: 'MICEGothic Bold';
		font-size: 50px;
		margin-left: 660px;
		margin-top: 50px;
		margin-bottom: 50px;
		color: #202426;
		
	
	}
	
	.aboutColor{
		
		color: #214DA6;
	
	}
	
	.aboutHotel{
		
		font-family: 'MICEMyungjo';
		font-size: 30px;
		margin-left: 400px;
		color: #202426;
	}
	
	.aboutHotelSpan{
		
		font-family: 'MICEMyungjo';
		font-size: 18px;
		margin-left: 400px;
		color: #3c4043;
	
	}
	
	.aboutImg{
		
		margin-left: 400px;
		margin-top: 20px;
		
	}
	
	.aboutImg img{
		
		width: 300px;
		height: 600px;
		object-fit: cover;
	}
	
	.weather_api{

		width: 100%;
		height: 700px;
		margin-top: 100px;
		background: #EDEDED;
		
				
	}
	
	.weatherA{
		display: flex;
		width: 1220px;
		margin-left: 400px;
		padding-top: 82px;
		
	}
	
	.index0{
		
		top: 80%;
		left: 20px;
		color: #202426;
		font-size: 25px;
		text-align: center;
		
	}
	
	.index1{
	
		top: 80%;
		right: 470px;
		color: #202426;
		font-size: 25px;
		text-align: center;
		
	}
	.index2{
		
		top: 80%;
		right: 140px;
		color: #202426;
		font-size: 25px;
		text-align: center;
	
	} 
	
	h1{
		
		font-family: 'MICEGothic Bold';
		font-size: 50px;
	
	}
	
	.restaurantInfo{
		
		width: 100%;
		height: 800px;
	
	}
	
	.breakfast{
		
		display: inline-block;
		width: 1200px;
		height: 300px;
		padding-left: 184px;
		padding-top: 184px;
	
	}
	
	.fixBreak{
		
		vertical-align: top; 
		display:inline-block;
		width:500px;
		height: 500px;
		padding-left: 60px;
		padding-top: 160px;	
		color: #202426;	
	}
	
	.po{
		
		object-fit: cover;
	
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
	
	var aa = jQuery.noConflict();
	//페이지 로드 이벤트
	aa(function(){
		
		
		 aa("#roomCheckIn").datepicker({
			 dateFormat: 'yy/mm/dd'
		    });
		    
		 aa("#roomCheckOut").datepicker({
			 dateFormat: 'yy/mm/dd'
		    });
		 
		 fnDate();
		 
		 
		//폼의 서브밋 이벤트
		aa('#f').on('submit', (ev)=>{
			
			if(aa('#roomCheckIn').val() == '' || aa('#roomCheckOut').val() == ''){
				alert('날짜를 선택하세요.');
				ev.preventDefault();
				return false;
			}
			var date1 = new Date(aa('#roomCheckIn').datepicker('getDate'));
			var date2 = new Date(aa('#roomCheckOut').datepicker('getDate'));
			if(date2 - date1 < 0){
				alert('날짜를 확인해주세요.');
				return false;
			}
			
			return true;
			
		})
		
		 fnTour(); 
	
	})
	
	document.oncontextmenu = function(){return false;}
	
	 function fnDate(){
			
		 aa('#roomCheckIn').datepicker('option', 'minDate','0');//오늘부터 선택가능
		 aa('#roomCheckOut').datepicker('option', 'minDate','+1');//다음날부터 선택가능 특정날짜 키워드로 찾아보기
		
	} 
</script>
<script>	
  //함수
  var cc = jQuery.noConflict();
	function fnTour(){
		cc.ajax({
			url: '${contextPath}/admin/tour',
			type: 'get',
			dataType: 'json',
			success: function(responseText){
				//var items = responseText.response.body.items.item;
				//$('#items').empty();
				var html = '';
				cc.each(responseText, function(i, item){
					html += '<td>' + item.spotName + '</td><br>';
					var sky;
					switch(item.sky){
					case 1: sky = '맑음'; break;
					case 2: sky = '구름조금'; break;
					case 3: sky = '구름많음'; break;
					case 4: sky = '흐림'; break;
					case 5: sky = '비'; break;
					case 6: sky = '비눈'; break;
					case 7: sky = '눈비'; break;
					case 8: sky = '눈'; break;
					default: sky = '모름';
					}
					html += '<td>' + sky + '</td>';
					cc('.index'+i).append(html);
					html = '';
				})
			}
		})
	}
  

	
</script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
	
	var bb = jQuery.noConflict();
	bb(function(){
	 bb('.mainImg').slick({
		 autoplay: true,
		 infinite: true,
		 autoplaySpeed: 2000
		
		}); 
	})
</script>
<script>

	var dd = jQuery.noConflict();
	
	dd(function(){
		dd('.res').slick({
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  infinite: true,
			  autoplay: true,
			  autoplaySpeed: 2000
			  
			});
		})		

</script>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">

	
	
	<div class="head">
	
			<div class="mainImg">
					<div><img class="post" src="resources/image/hotel.jpg" alt="main" ></div>
					<div><img class="post" src="resources/image/rounge.jpg" alt="main"></div>
					<div><img class="post" src="resources/image/pool.jpg" alt="main" ></div>
					<div><img class="post" src="resources/image/restaurant.jpg" alt="main"></div>
			</div>
			
			<div class="title">
				<a href="http://localhost:9090/yogioteur/">Yogioteur</a>
			</div>
				 
			<div class="headerMain">
			
				<div class="header">
				
					<a href="${contextPath}/review/reviewList">REVIEW</a>
					<a href="${contextPath}/faq/faqList">FAQ</a>
					<!-- 로그인 이전 -->
					<c:if test="${loginMember eq null}">
						<a href ="${contextPath}/member/loginPage">LOGIN</a>
						<a href ="${contextPath}/member/agreePage">SIGN</a>	
					</c:if>
				
					<!-- 로그인 이후 -->
					<c:if test="${loginMember ne null}">
						${loginMember.memberName}님
						<a href ="${contextPath}/member/logout">LOGIN OUT</a>
						<a href ="${contextPath}/member/memberPage">MY PAGE</a>		
						<a href="${contextPath}/admin/adminPage">ADMIN PAGE</a>
					</c:if>
					
				</div>
			</div>
			
		
	</div>
	
	
	<div class="center">
		
		<form id="f"  class="search" action="${contextPath}/room/roomList" method="post">
		
		<div class="searchBar">
			
			<div id="checkInOut">
			Check In/Out
			<input type="text" id="roomCheckIn" name="roomCheckIn" style="padding-top: 8px;" autocomplete="off">
			~
			<input type="text" id="roomCheckOut" name="roomCheckOut" style="padding-top: 8px;" autocomplete="off">
			</div>	
			&nbsp;&nbsp;	
			<button class="custom-btn btn-13" >검색</button>
			<button class="custom-btn btn-14" type="reset" id="reset">초기화</button>
		</div>
		
		</form>
		
		<div class="about">
			About <span class="aboutColor">YOGIOTEUR</span> HOTEL
		</div>
		
		<p class="aboutHotel">
			
			아름다운 자연 속에서 진정한 휴식
		</p>
		<p class="aboutHotelSpan">
			특급 호텔 YOGIOTEUR은 수려한 자연경관에 위치한 제주도에서 운영하고 있어<br>
			자연이 주는 여유로움을 만끽할 수 있습니다.
		</p>
		
	</div>
	
	<br><br>
	
	<div class="aboutImg">
		
		<img src="resources/image/gym.jpg" alt="gym">
		<img src="resources/image/rounge.jpg" alt="rounge">
		<img src="resources/image/restaurant.jpg" alt="restaurant">
		<img src="resources/image/pool1.jpg" alt="pool1">
		
	
	</div>
	
	
	<div class="weather_api">
		
		<table class="weatherA">
			<tbody>
				<tr>
					<td><img src="resources/image/waterfall.jpg" alt="image1" width="410px;" height="500px;"></td>
					<td><img src="resources/image/hill.jpg" alt="image2" width="410px;" height="500px;"></td>
					<td><img src="resources/image/hill1.jpg" alt="image3" width="410px;" height="500px;"></td>
				</tr>
				<tr id="items">
					<td class="index0"></td>
					<td class="index1"></td>
					<td class="index2"></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	
	<div class="restaurantInfo">
		<div class="fixBreak">
			<h1>DINING</h1>
			YOGIOTEUR만의 호텔 직영 농장에서 수확한<br>
			식재료로 셰프가 정성을 담아 준비한 다이닝을 만나보세요.
		</div>
		<div class="breakfast">
		
		  	<div class="res">
				<div><img class="po" src="resources/image/food1.jpg" alt="food" ></div>
				<div><img class="po" src="resources/image/food2.jpg" alt="food" ></div>
				<div><img class="po" src="resources/image/food3.jpg" alt="food" ></div>
				<div><img class="po" src="resources/image/food4.jpg" alt="food" ></div>
				<div><img class="po" src="resources/image/food5.jpg" alt="food" ></div>
		    </div>
		</div>
	</div>
    
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>