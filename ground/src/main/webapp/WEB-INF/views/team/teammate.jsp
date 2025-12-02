<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="icon" href="../../resources/images/logo/icon1.png" type="image/x-icon">
<script>
function onClickButton() {
	    // 팝업 창을 띄우기
	    var width = 600;
	    var height = 700;
	    var left = (window.screen.width - width) / 2;
	    var top = (window.screen.height - height) / 2;
	    window.open("/mate.do", 'teammate', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
	}
	function list(page) {
		location.href = "/teammate.do?cur_page=" + page;
	}
</script>
<style>
.floating-button {
	position: fixed;
	bottom: 20px; /* 원하는 위치로 조정 가능 */
	right: 20px; /* 원하는 위치로 조정 가능 */
	width: 50px;
	height: 50px;
	background-color: #007bff; /* 버튼 색상 */
	border-radius: 50%; /* 원형 모양으로 만들기 */
	color: white;
	text-align: center;
	line-height: 47px; /* 버튼 내부 텍스트 세로 가운데 정렬 */
	font-size: 24px;
	cursor: pointer;
	z-index: 999; /* 다른 요소 위로 표시 */
}
.section1 .card-custom {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid #dee2e6; /* 아래쪽 테두리만 남김 */
}
.section1 a {
    text-decoration: none; /* 하이퍼링크의 밑줄 제거 */
    color: inherit; /* 기본 텍스트 색상 상속 */
}

#stickmenu {
background-color: rgba(0, 0, 0, 0.5); /* 반투명한 배경 */
}
</style>

	
</head>
<body>
<%@ include file="../outline/menubar.jsp"%>
<%@ include file="../outline/modal"%>



<section class="section1 container" style="width:60%; margin-top: 30px;">
<img src="../../resources/images/logo/teamup.png" >

	<button id="modalButton">모달 열기</button>
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

	<c:forEach var="row" items="${list}">
		<a href="/teamcollect4.do?code=${row.code}" class="d-flex mb-3">
			<div class="card card-custom" style="width: 100%; margin-top: 15px;">
				<div class="row no-gutters">
					<div class="col-md-4" style="width:9%;">
						<img src="/resources/images/${row.logo_1}" style="margin-top:15px; width: 100px; height:100px;"  class="img-fluid" alt="Team Logo">
					</div>
					<div class="col-md-8" >
						<div class="card-body" style="padding:0 0 0 17px;">
							<h5 class="card-title" style="border:none; padding:0; font-family: Noto Sans KR, sans-serif;  font-size : 17px;">${row.name} <span style="background-color:#eee; font-size:14px; color:#666">
							&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
							  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
							</svg>
							${row.count}&nbsp;</span></h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item" style="border:none; padding:0 0 0 20px; font-family: Noto Sans KR, sans-serif;  color: #666; font-size : 15px;">주 활동 지역, 경기장</li>
							<li class="list-group-item" style="border:none; padding:0 0 20px 20px; font-family: Noto Sans KR, sans-serif;  color: #666; font-size : 15px;">${row.gender}ㆍ${row.age}ㆍ${row.skil}ㆍ${row.days}ㆍ${row.time}</li>
							<p class="card-text" style="border:none; padding:0 0 0 30px;  margin:0; font-family: Noto Sans KR, sans-serif;  color: #888; font-size : 13px;">${row.shot }</p>
							<li class="list-group-item" style="border:none; padding:20px 0 15px 20px; font-family: Noto Sans KR, sans-serif;  color: #888; font-size : 13px;">조회수ㆍ신청수 자리</li>
						</ul>
					</div>
				</div>
			</div>
		</a>
	</c:forEach>

	<table class="table" border="1">
		<tr align="center">
			<td colspan="7">
				<c:if test="${page.curPage > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if>
				<c:if test="${page.curBlock > 1}">
					<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
				</c:if>
				<c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
					<c:choose>
						<c:when test="${num == page.curPage}">
							<span style="color: red">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.curBlock < page.totBlock}">
					<a href="#" onclick="list('${page.nextPage}')">[다음]</a>
				</c:if>
				<c:if test="${page.curPage < page.totPage}">
					<a href="#" onclick="list('${page.totPage}')">[마지막]</a>
				</c:if>
			</td>
		</tr>
	</table>
	
	<c:choose>
    <c:when test="${sessionScope.userid != null}">
        <div class="floating-button" onclick="onClickButton()">+</div>
    </c:when>
    <c:otherwise>
        <div class="floating-button"><a href="/login_page.do">+</a></div>
    </c:otherwise>
</c:choose>
</section>

<%@ include file="../outline/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
