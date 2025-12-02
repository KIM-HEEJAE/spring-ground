<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	function openPopup1() {
		// 팝업 창을 띄우기
		window.open("/maketeam.do", 'edit', 'width=550, height=450');
	}
</script>
<style>
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
</style>
</head>
<body>
	<script>
		function openpopup() {
			window.open('/reservation.write.do','edit','width=550, height=450');
		}
	</script>

	<div>
		<h1>그라운드어스에 오신 ${dto.name}님 반갑습니다!</h1>
		<c:choose>
			<c:when test="${empty reservelist}">
				<button onclick="window.location='/ground/list.do'">구장 예약하러
					가기</button>
			</c:when>
			<c:otherwise>
				<c:set var="today" value="<%=new java.util.Date()%>" />
				<!-- 현재날짜 -->
				<c:set var="date">
					<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
				</c:set>
				<p>현재 날짜 및 시간: ${date}</p>
				<c:forEach var="reservation" items="${reservelist}">
					<c:set var="reservationDate"
						value="${reservation.reservation_date}" />
					<fmt:formatDate value="${reservationDate}"
						pattern="yyyy-MM-dd HH:mm" var="formattedDate" />
					<p>내가 예약한 구장 정보: ${reservation.groundname}</p>
					<p>예약 시간: ${formattedDate}</p>
					<c:choose>
						<c:when test="${formattedDate>date}">

							<button disabled>리뷰 쓰러 가기</button>
						</c:when>
						<c:when test="${formattedDate<date}">
							<button onclick='openpopup()' >리뷰 쓰러 가기</button>

						</c:when>
					</c:choose>
				</c:forEach>

			</c:otherwise>
		</c:choose>
	</div>
	<div>
		<!-- 내가 쓴 리뷰 보기 버튼 -->
		<button id="viewReviewBtn">내가 쓴 리뷰 보기</button>
		<script>
			
		</script>
	</div>
	 <div>
		<button id="modalButton">내 팀</button>
		<!-- 모달 -->
		<div id="myModal" class="modal">
			<!-- 모달 내용 -->
			<div class="modal-content">
				<c:forEach var="team" items="${team}">
					<a href="/selectteamdetail.do?code=${team.code}"><img
						src="/resources/images/${team.logo}"
						style="width: 200px; height: 100px;" alt="Team Logo">,${team.name}</a>
					<br>
				</c:forEach>
				<span class="close">&times;</span>
				<button onclick="openPopup1()"
					style="border: none; background: none; cursor: pointer;">
					새로운팀 만들기</button>
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
</body>
</html>
