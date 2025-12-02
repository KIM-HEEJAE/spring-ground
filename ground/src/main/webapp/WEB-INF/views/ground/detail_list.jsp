<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item"%>
<%@page
	import="org.hibernate.usertype.internal.OffsetDateTimeCompositeUserType.OffsetDateTimeEmbeddable"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.example.ground.dto.GroundDTO"%>
<%@ page import="com.example.ground.dto.ReservationDTO"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Time"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.example.ground.dao.ReservationDAOImpl"%>
<%@page import="com.example.ground.dao.ReservationDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장예약</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
    window.onload = function() {
        // 예약된 시간을 담을 배열
        var reservedTimes = [];

        // JSP에서 받은 예약된 시간 목록을 JavaScript 배열에 추가
        <c:forEach var="time" items="${reserve}">
            reservedTimes.push("<fmt:formatDate value='${time.RESERVATION_DATE}' pattern='yyyy-MM-dd HH:mm' />");
        </c:forEach>

        console.log(reservedTimes);

        // 현재 시간을 가져오는 함수
        function getCurrentTime() {
            var now = new Date();
            var year = now.getFullYear();
            var month = String(now.getMonth() + 1).padStart(2, '0');
            var date = String(now.getDate()).padStart(2, '0');
            var hours = String(now.getHours()).padStart(2, '0');
            var minutes = String(now.getMinutes()).padStart(2, '0');
            var currentTime = year + "-" + month + "-" + date + " " + hours + ":" + minutes;
            return currentTime;
        }

        // 버튼 비활성화 함수
        function disableReservedTimes() {
            // 현재 시간 가져오기
            var currentTime = getCurrentTime();

            // 모든 버튼을 가져옴
            var buttons = document.querySelectorAll("#date button");
            
            // 각 버튼에 대해 처리
            buttons.forEach(function(button) {
                // 버튼의 값(시간)을 가져옴
                var time = button.value;

                // 예약된 시간 배열에 해당 시간이 포함되어 있는지 확인
                if (reservedTimes.includes(time) || time < currentTime) {
                    // 포함되어 있거나 현재 시간 이전이라면 버튼을 비활성화
                    button.classList.add("disabled");
                }
            });
        }

        // 버튼 비활성화 함수 호출
        disableReservedTimes();
    };
</script>
<style>
.ground-image {
	max-width: 400px;
	height: auto;
	display: block;
	margin: 10px 0;
}

button {
	background-color: lightgray;
	border: none;
	padding: 10px 20px;
	margin: 5px;
	cursor: pointer;
}

/* 선택된 버튼 스타일 */
button.selected {
	background-color: lightblue;
}

button.disabled {
	background-color: gray;
	pointer-events: none;
}
</style>
</head>
<body>

	<h1>구장 상세 정보</h1>

	<h2>구장 정보</h2>
	<p>구장 이름: ${item.getName()}</p>
	<p>구장 주소: ${item.getAddress()}</p>

	<!-- 이미지 표시 -->
	<div>
		<img src="../../resources/images/ground/${item.getFilename()}"
			alt="Ground Image" class="ground-image">
	</div>
	<%
	Date now = new Date();
	Date next = new Date(now.getTime() + 24 * 60 * 60 * 1000);
	Date nextnext = new Date(next.getTime() + 24 * 60 * 60 * 1000);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String format = sdf.format(now);
	String format2 = sdf.format(next);
	String format3 = sdf.format(nextnext);
	%>
	<h3 id="today"><%=format%></h3>
	<div id="date">
		<var id="selectdate1" data-date="<%=format%>">
			<button value="<%=format%> 08:00" data-price="${item.price}"
				onclick="go(this)">08:00 - 10:00</button>
			<button value="<%=format%> 10:00" data-price="${item.price}"
				onclick="go(this)">10:00 - 12:00</button>
			<button value="<%=format%> 12:00" data-price="${item.price}"
				onclick="go(this)">12:00 - 14:00</button>
			<button value="<%=format%> 14:00" data-price="${item.price}"
				onclick="go(this)">14:00 - 16:00</button>
			<button value="<%=format%> 16:00" data-price="${item.price}"
				onclick="go(this)">16:00 - 18:00</button>
			<button value="<%=format%> 18:00" data-price="${item.price}"
				onclick="go(this)">18:00 - 20:00</button>
			<button value="<%=format%> 20:00" data-price="${item.price}"
				onclick="go(this)">20:00 - 22:00</button>
			<button value="<%=format%> 22:00" data-price="${item.price}"
				onclick="go(this)">22:00 - 24:00</button>
		</var>



		<h3 id="next"><%=format2%></h3>

		<var id="selectdate2" data-date="<%=format2%>">
			<button value="<%=format2%> 08:00" data-price="${item.price}"
				onclick="go(this)">08:00 - 10:00</button>
			<button value="<%=format2%> 10:00" data-price="${item.price}"
				onclick="go(this)">10:00 - 12:00</button>
			<button value="<%=format2%> 12:00" data-price="${item.price}"
				onclick="go(this)">12:00 - 14:00</button>
			<button value="<%=format2%> 14:00" data-price="${item.price}"
				onclick="go(this)">14:00 - 16:00</button>
			<button value="<%=format2%> 16:00" data-price="${item.price}"
				onclick="go(this)">16:00 - 18:00</button>
			<button value="<%=format2%> 18:00" data-price="${item.price}"
				onclick="go(this)">18:00 - 20:00</button>
			<button value="<%=format2%> 20:00" data-price="${item.price}"
				onclick="go(this)">20:00 - 22:00</button>
			<button value="<%=format2%> 22:00" data-price="${item.price}"
				onclick="go(this)">22:00 - 24:00</button>
		</var>

		<h3><%=format3%></h3>

		<var id="selectdate3" data-date="<%=format3%>">
			<button value="<%=format3%> 08:00" data-price="${item.price}"
				onclick="go(this)">08:00 - 10:00</button>
			<button value="<%=format3%> 10:00" data-price="${item.price}"
				onclick="go(this)">10:00 - 12:00</button>
			<button value="<%=format3%> 12:00" data-price="${item.price}"
				onclick="go(this)">12:00 - 14:00</button>
			<button value="<%=format3%> 14:00" data-price="${item.price}"
				onclick="go(this)">14:00 - 16:00</button>
			<button value="<%=format3%> 16:00" data-price="${item.price}"
				onclick="go(this)">16:00 - 18:00</button>
			<button value="<%=format3%> 18:00" data-price="${item.price}"
				onclick="go(this)">18:00 - 20:00</button>
			<button value="<%=format3%> 20:00" data-price="${item.price}"
				onclick="go(this)">20:00 - 22:00</button>
			<button value="<%=format3%> 22:00" data-price="${item.price}"
				onclick="go(this)">22:00 - 24:00</button>
		</var>
	</div>
	<div id="priceDisplay">
		가격: <span id="total">0</span>원
	</div>
	
	
	<div>
		<button onclick="kakaopay()">결제하기</button>
		<div>
	
	
	사이즈 :<span>${item.groundsize}</span><br>
	<c:choose>
	<c:when test="${item.shower == '샤워 가능'}">
	<img src="../resources/images/ground/showerposs.png" >
	</c:when>
	<c:when test="${item.shower== '샤워 불가능'}">
	<img src="/resources/images/ground/showerimposs.png">
	</c:when>
	</c:choose>
	<br>
	<c:choose>
	<c:when test="${item.parking == '주차 공간 협소'}">
	<img src="../resources/images/ground/parkingposs.png" >
	</c:when>
	<c:when test="${item.parking== '주차 공간 없음'}">
	<img src="/resources/images/ground/parkingposs.png" style="opacity: 0.5;">
	</c:when>
	</c:choose>
		<br>
	<c:choose>
	<c:when test="${item.borrow == '신발 대여 가능'}">
	<img src="../resources/images/ground/borrowposs.png" >
	</c:when>
	<c:when test="${item.borrow== '신발 대여 불가능'}">
	<img src="/resources/images/ground/borrowimposs.png">
	</c:when>
	</c:choose>
		<br>
	<c:choose>
	<c:when test="${item.drinking == '음료 판매'}">
	<img src="../resources/images/ground/drinkingposs.png" >
	</c:when>
	<c:when test="${item.drinking== '음료 미판매'}">
	<img src="../resources/images/ground/drinkingposs.png" style="opacity: 0.5;">

	</c:when>
	</c:choose>
	</div>
		<script>
		let total = 0;
		let selectedTimes = [];

		function go(button) {
			let price = parseInt(button.getAttribute("data-price"));
			let time = button.value;

			if (button.classList.contains("selected")) {
				button.classList.remove("selected");
				total -= price;
				selectedTimes = selectedTimes.filter(t => t !== time);
			} else {
				button.classList.add("selected");
				total += price;
				selectedTimes.push(time);
			}
			document.getElementById("total").innerHTML = total;
		}

		function kakaopay() {
			var amount = total;
			console.log(amount);
			IMP.init('imp68066408');
			IMP.request_pay({
				pg: "kakaopay",
				pay_method: "card",
				merchant_uid: 'merchant_' + new Date().getTime(),
				name: "그라운드어스",
				amount: amount,
				buyer_name: '${sessionScope.userid}'
			}, function(rsp) {
				if (rsp.success) {
					alert('결제가 완료되었습니다.');
					var userid = '${sessionScope.userid}';
					var groundname = '${item.name}';
		            var reservation_date = selectedTimes.join(", ")
					console.log(userid);
					console.log(groundname);
					console.log(reservation_date);
					insert(userid, groundname, reservation_date);
				} else {
					alert('결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg);
				}
			});
		}

		function insert(userid, groundname, reservation_date) {
			$.ajax({
				type: "post",
				url: "/reservation/insert.do",
				data: {
					"userid": userid,
					"groundname": groundname,
					"reservation_date": reservation_date,
				},
				success: function(response) {
					console.log("삽입 성공: " + response);
					
					
					
					 location.reload();
				},
				error: function(xhr, status, error) {
					console.error("오류 발생: " + error);
					// 오류 발생 시 처리할 내용
				}
			});
		}
		
		</script>
		
	</div>
</body>
</html>
