<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="icon" href="../../resources/images/logo/icon1.png" type="image/x-icon">
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Ground Us</title>


<style>
    /* 캐러셀 전체 크기 조절 */
    #carouselExampleRide {
      width: 63%; 
      margin: auto; /* 가운데 정렬 */
    }
    
    .banner-container {
      position: relative;
    }
    
    .btn-close {
      position: absolute;
      top: 15px;
      right: 430px;
      z-index: 1000;
    }
    
    .soje {
	    display: flex;
	    justify-content: space-between;
	}

	<%@ include file="../outline/morebutton_css"%>
.today {
	color: red;
	font-weight: bold;
}

.modal {
	display: none; /* 초기에는 보이지 않도록 설정 */
	position: fixed; /* 화면에 고정 */
	z-index: 1; /* 다른 요소들보다 위에 표시 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명한 배경 */
}

/* 모달 내용 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 모달을 화면 중앙에 위치 */
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* 모달 너비 */
}

/* 모달 닫기 버튼 스타일 */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

    .help-image {
        position: fixed;
        bottom: 10px;
        right: 10px;
        width: 50px; /* 이미지의 크기 조정 */
        height: auto; /* 가로 세로 비율 유지 */
        z-index: 9999; /* 다른 요소 위에 표시되도록 설정 */
    }

</style>
<script>
	function openPopup1() {
		// 팝업 창을 띄우기
		window.open("/maketeam.do", 'edit', 'width=550, height=450');
	}

	
	  function hideBanner() {
	    var banner = document.getElementById('bannerImage');
	    var closeButton = document.querySelector('.btn-close');
	    banner.style.display = 'none';
	    closeButton.style.display = 'none';
	  }
	</script>
	
</head>
<body>

      
<%@ include file="../outline/menubar.jsp"%>

<p style="margin:60px 0 60px 0;"></p>

<div style="background: rgb(243,243,243); padding: 20px 0 20px 0;">
<div id="carouselExampleRide" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000" data-bs-ride="carouse1" data-bs-pause="false";>
	 <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
 	</div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="home.do" ><img src="../../resources/images/adver/ad2.png" class="d-block w-100" alt="..."></a>
    </div>
    <div class="carousel-item">
      <a href="home.do" ><img src="../../resources/images/adver/ad3.png" class="d-block w-100" alt="..."></a>
    </div>
    <div class="carousel-item">
      <a href="home.do" ><img src="../../resources/images/adver/ad4.png" class="d-block w-100" alt="..."></a>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev" >
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</div>

<p style="margin:60px 0 60px 0;"></p>

	<div class="soje" style="width: 63%; margin: auto;">
		<div class="left">
			<p style="color: black; margin: 0; font-size: 24px; font-weight: bold; text-align: center;">매거진</p>
			<hr style="border: 1px solid black; width: 120px; height: 1px; margin-top: 6px">
		</div>
		<div class="right" >
			<button onclick="#" class="moreButton" style="margin-top: 10px;">
			   <span>더보기 ></span>
			 </button>
		  </div>
	</div>


<div class="card-group" style="width:63%; margin: auto;">
<div class="card border" style="width: 18rem; margin-right : 30px;">
<a href="home.do" style="text-decoration: none; color: black;">
  <img src="../../resources/images/magazine/league.png" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title" style="font-family: Noto Sans KR, sans-serif;  font-size : 18px; text-align: center;">제1회 그라운드어스 풋살 리그 개막</h5>
  </div>
  </a>
</div>

<div class="card border" style="width: 18rem; margin-right : 30px;">
<a href="home.do" style="text-decoration: none; color: black;">
	  <img src="../../resources/images/magazine/interview.jpg"  class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title" style="font-family: Noto Sans KR, sans-serif;  font-size : 18px; text-align: center;">우리들의 이야기 : FC기린 인터뷰</h5>
	  </div>
  </a>
</div>

<div class="card border" style="width: 18rem;">
<a href="home.do" style="text-decoration: none; color: black;">
	  <img src="../../resources/images/magazine/drink.jpg" class="card-img-top" alt="..." >
	  <div class="card-body">
	    <h5 class="card-title" style="font-family: Noto Sans KR, sans-serif;  font-size : 18px; text-align: center;">여름철 안전사고 예방수칙</h5>
	  </div>
  </a>
</div>
</div>

<div class="card border" style="width:63%; margin: auto; margin-top: 100px;">
<a href="home.do" style="text-decoration: none; color: black;">
	  <img src="../../resources/images/adver/rule.png" class="card-img-top" alt="..." >
  </a>
</div>
<div>
		<button id="modalButton">모달 열기</button>

		<!-- 모달 -->
		<div id="myModal" class="modal">
			<!-- 모달 내용 -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<button onclick="openPopup1()"
					style="border: none; background: none; cursor: pointer;">
					새로운팀 만들기</button>
					
					<%-- <c:forEach var="dto" items="${dto}">
            <tr align="center">
                <td><<img src="/resources/images/${dto.logo}"
		style="width: 50px; height: 50;"></td>
                <td>${dto.name}</td>
        </c:forEach> --%>
			</div>
		</div>
	</div>
	<script>
		var modalBtn = document.getElementById("modalButton");

		//모달
		var modal = document.getElementById("myModal");

		//모달 열기 버튼 클릭 시
		modalBtn.onclick = function() {
			modal.style.display = "block"; // 모달 보이기
		}

		//모달 닫기 버튼 선택
		var closeBtn = document.getElementsByClassName("close")[0];

		//모달 닫기 버튼 클릭 시
		closeBtn.onclick = function() {
			modal.style.display = "none"; // 모달 숨기기
		}

		//모달 외부를 클릭하면 모달 닫기
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none"; // 모달 숨기기
			}
		}
	</script>
<p style="margin:60px 0 60px 0;"></p>

<%@ include file="../outline/footer.jsp"%>

</body>
</html>