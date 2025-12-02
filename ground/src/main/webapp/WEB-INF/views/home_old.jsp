<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

</head>
<body>
	<c:choose>
		<c:when test="${userid==null}">
			<div class="main-menu">

				<a
					href=https://kauth.kakao.com/oauth/authorize?client_id=6af5904faf501d1253a5af1ab06cfed0&redirect_uri=http://localhost/kakao/callback&response_type=code><img
					src="/images/kakao_login.png"></a>&nbsp;|&nbsp; <a
					href="/member/register.do">회원가입</a>&nbsp;|&nbsp;<a
					href="/mypage/detail.do">마이페이지</a>&nbsp;|&nbsp;<a
					href="/cboard/main.do">고객센터</a>
					<a href="/board/list.do">게시판</a>
					<a href="/help/list.do"><img class="help-image" src="/resources/images/help.png" alt="도움말">도움말</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="main-menu">
				${nickname}님 환영합니다. <a
					href="https://kauth.kakao.com/oauth/logout?client_id=6af5904faf501d1253a5af1ab06cfed0&logout_redirect_uri=http://localhost/kakao/logout"><img
					src="/resources/images/icon/logout white.png"><br>로그아웃</a> |<a
					href="/mypage/detail.do"><img
					src="/resources/images/icon/mypage white.png"><br>마이페이지</a>
				| <a href="/cboard/main.do"><img
					src="/resources/images/icon/callcenter white.png"><br>고객센터</a>
					| <a href="/teammate.do"><img
					src="/resources/images/icon/callcenter white.png"><br>팀</a>
					<a href="/board/list.do">게시판</a>
					<a href="/help/list.do"><img class="help-image" src="/resources/images/help.png" alt="도움말">도움말</a>
                    <a href="/ground/list.do">구장 예약</a>
			</div>
		</c:otherwise>
	</c:choose>
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
	<div id="map" style="width: 100%; height: 350px;"></div>

	<!-- <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4285c46b1f618b3f33055fe15acbc069
&libraries=services"></script> -->
	<%-- <%@ page import="com.example.ground.calendar.CalendarUtil"%>
	<%
	java.util.Calendar cal = java.util.Calendar.getInstance();
	int year = cal.get(java.util.Calendar.YEAR);
	int month = cal.get(java.util.Calendar.MONTH) + 1;
	String calendarHtml = CalendarUtil.generateCalendar(year, month);
	out.println(calendarHtml);
	%> --%>
	<!-- <script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('이태원 맛집', placesSearchCB);

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	</script> -->
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
