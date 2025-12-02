<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function confirmAction(){
    if (confirm("신청을 취소하시겠습니까?")) {
        document.getElementById("form2").submit();
    }
}

function checkLoginAndShowModal() {
    var isLoggedIn = ${not empty sessionScope.userid}; // JSP에서 세션 값을 확인
    if (isLoggedIn) {
        document.getElementById("myModal").style.display = "block";
    } else {
        alert("로그인이 필요합니다");
    }
}
</script>
<style>
.sinchung {
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin: 20px 0px 20px 20px;
	width: 80%;
	background-color: #0066ff; /* 활성화된 상태의 색상 */
	cursor: pointer;
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
</style>

</head>
<body>
	<%@ include file="../outline/menubar.jsp"%>

	<div class="container"
		style="font-family: Noto Sans KR, sans-serif; margin-top: 30px; margin-bottom: 20px;">
		<div class="row">
			<div class="col-6" style="max-width: 25%;">
				<div class="card card-custom"
					style="width: 100%; margin: auto; padding: 20px 0 0 20px;">
					<div class="row no-gutters">
						<div class="col-md-5"
							style="display: flex; justify-content: center; padding: 0;">
							<img src="/resources/images/${dto.logo_1}"
								style="margin-top: 0px; width: 70px; height: 70px;"
								class="img-fluid" alt="Team Logo">
						</div>
						<div class="col-md-7" style="padding-left: 0">
							<div class="card-body" style="padding: 0 0 0 0px;">
								<h5 class="card-title"
									style="border: none; padding: 0; font-family: Noto Sans KR, sans-serif; font-size: 17px;">
									${dto.name} <span
										style="background-color: #eee; font-size: 14px; color: #666">
										&nbsp;<svg xmlns="http://www.w3.org/2000/svg" width="16"
											height="16" fill="currentColor" class="bi bi-person-fill"
											viewBox="0 0 16 16">
                                      <path
												d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                                    </svg> ${dto.count}&nbsp;
									</span>
								</h5>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item"
									style="border: none; padding: 0 0 0 0px; font-family: Noto Sans KR, sans-serif; color: #666; font-size: 15px;">주
									활동 지역, 경기장</li>
								<li class="list-group-item"
									style="border: none; padding: 2px 0 15px 0px; font-family: Noto Sans KR, sans-serif; color: #888; font-size: 13px;">조회수ㆍ신청수
									자리</li>
							</ul>
						</div>
					</div>

					<div class="container"
						style="font-family: Noto Sans KR, sans-serif; font-size: 16px; margin-top: 5px;">
						<div class="row mb-2">
							<div class="col-5" style="padding-left: 20px;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-diamond" viewBox="0 0 16 16">
                                <path
										d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.48 1.48 0 0 1 0-2.098zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z" />
                            </svg>
								&nbsp;${dto.gender}
							</div>
							<div class="col-7">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-diamond" viewBox="0 0 16 16">
                                <path
										d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.48 1.48 0 0 1 0-2.098zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z" />
                            </svg>
								&nbsp;${dto.skil}
							</div>
						</div>
						<div class="row">
							<div class="col-5" style="padding-left: 20px;">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-diamond" viewBox="0 0 16 16">
                                <path
										d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.48 1.48 0 0 1 0-2.098zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z" />
                            </svg>
								&nbsp;${dto.age}
							</div>
							<div class="col-7">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-diamond" viewBox="0 0 16 16">
                                <path
										d="M6.95.435c.58-.58 1.52-.58 2.1 0l6.515 6.516c.58.58.58 1.519 0 2.098L9.05 15.565c-.58.58-1.519.58-2.098 0L.435 9.05a1.48 1.48 0 0 1 0-2.098zm1.4.7a.495.495 0 0 0-.7 0L1.134 7.65a.495.495 0 0 0 0 .7l6.516 6.516a.495.495 0 0 0 .7 0l6.516-6.516a.495.495 0 0 0 0-.7L8.35 1.134z" />
                            </svg>
								&nbsp;${dto.days}ㆍ${dto.time}
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${ttdto==null}">
							<c:choose>
								<c:when test="${check == null}">
									<div>
										<button id="modalButton" type="button" class="sinchung"
											onclick="checkLoginAndShowModal()">가입신청</button>
										<!-- 모달 -->
										<div id="myModal" class="modal">
											<!-- 모달 내용 -->
											<div class="modal-content">
												<span class="close">&times;</span>
												<form id="form1" action="/application.do" method="post">
													<textarea placeholder="팀가입 신청합니다." name="introduce"></textarea>
													<button type="submit">가입신청</button>
													<input type="hidden" value="${dto.code}" name="code">
												</form>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<button id="modalButton" type="button"
											onclick="checkLoginAndShowModal()">내신청서 확인</button>
										<!-- 모달 -->
										<div id="myModal" class="modal">
											<!-- 모달 내용 -->
											<div class="modal-content">
												<span class="close">&times;</span>
												<form id="form2" action="/applicationdelete.do"
													method="post">
													<textarea name="introduce">${check.introduce}</textarea>
													<button type="button" onclick="confirmAction()">신청
														취소</button>
													<input type="hidden" value="${check.num}" name="num">
													<input type="hidden" value="${dto.code}" name="code">
												</form>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
				</div>
			</div>

			<div class="col-6"
				style="width: 75%; background-color: rgb(245, 245, 250); border: 1px solid #eee; border-radius: 5px;">
				<p class="card-text"
					style="border: none; padding: 0 0 0 0px; margin: 20px 0 20px 0; font-family: Noto Sans KR, sans-serif; color: #555; font-size: 16px;">${dto.shot}</p>
				<img src="/resources/images/${dto.logo}" style="width: 55%;">
				<p
					style="font-family: Noto Sans KR, sans-serif; color: #555; font-size: 14px; margin: 20px 0 20px 0;">${dto.introduce}</p>
			</div>
		</div>
	</div>

	<script>
var closeBtn = document.getElementsByClassName("close")[0];

//모달 닫기 버튼 클릭 시
closeBtn.onclick = function() {
    document.getElementById("myModal").style.display = "none"; // 모달 숨기기
}

//모달 외부를 클릭하면 모달 닫기
window.onclick = function(event) {
    var modal = document.getElementById("myModal");
    if (event.target == modal) {
        modal.style.display = "none"; // 모달 숨기기
    }
}
</script>

	<%@ include file="../outline/footer.jsp"%>
</body>
</html>