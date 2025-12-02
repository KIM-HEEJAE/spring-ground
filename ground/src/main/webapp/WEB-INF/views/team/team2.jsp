<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<script>
	function goToNextPage() {
		document.getElementById("form1").submit(); // 폼 제출
		// 여기에 다음 페이지로 이동하는 코드를 추가할 수도 있습니다.
		// window.location.href = "/nextteam2.do";
	}

	// 파일 선택 시 실행되는 함수
	function showImage(input) {
		// 파일이 선택되었는지 확인
		if (input.files && input.files[0]) {
			const reader = new FileReader();
			reader.onload = function(e) {
				const thumbnail = document.getElementById('thumbnail');
				thumbnail.src = e.target.result;
				thumbnail.style.display = 'block';
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
	function goBack() {
		// 이전 페이지로 이동
		window.history.back();
	}
</script>
<style>
/* 파일 선택 버튼을 숨기기 */
input[type="file"] {
	display: none;
}

/* 파일 선택 버튼을 대체할 스타일을 갖는 레이블 */
.custom-file-upload {
	display: inline-block;
	padding: 8px 12px;
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
	cursor: pointer;
}

/* 파일 선택 버튼을 대체할 레이블의 호버 효과 */
.custom-file-upload:hover {
	background-color: #45a049;
}

.title1 {
	margin: 20px 0 0 10px;
	width: 95%;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	font-weight: bold;
}

.title2 {
	padding-bottom: 15px;
	margin: 10px 0 30px 10px;
	width: 95%;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	color: #888;
	border-bottom: 2px solid green;
}

.name1 {
	padding-bottom: 15px;
	margin: 10px 0 0px 20px;
	font-family: "Noto Sans KR", sans-serif;
	font-weight: 600;
	font-size: 14px;
	color: #555;
}

.name2 {
	font-size: 16px;
	color: #333;
	font-weight: 700;
}

#thumbnail {
	margin-top: 10px;
	max-width: 200px;
	max-height: 200px;
	display: none;
}

.imgbtn {
	font-family: "Noto Sans KR", sans-serif;
	margin: 0px 20px 0 20px;
	background-color: rgb(50, 200, 80);
	color: white;
	border-radius: 5px;
	cursor: pointer;
	padding: 9px 17px;
}

.imgbtn:hover {
	background-color: #009933;
}

.btn1 {
	background-color: #0066ff;
	color: white;
	border: none;
	padding: 7px 15px;
	border-radius: 5px;
	cursor: normal;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin-top: 10px;
}

.btn1:hover {
	background-color: #1051b2;
}
</style>
</head>
<body>
	<p class="title1">팀 엠블럼</p>
	<p class="title2">팀 엠블럼을 지정해주세요</p>

	<p class="name1">
		팀 이름&nbsp;&nbsp;:&nbsp;&nbsp;<span class="name2">${sessionScope.teamname}</span>
	</p>
	<p class="name1">
		팀 코드&nbsp;&nbsp;:&nbsp;&nbsp;<span class="name2">${sessionScope.teamcode}</span>
	</p>
	<form id="form1" method="post" action="/nextteam2.do"
		enctype="multipart/form-data">

		<div style="display: flex; align-items: center; margin-top: 15px;">
			<label for="fileUpload" class="imgbtn">사진 업로드</label> <input
				type="file" id="fileUpload" name="file1" onchange="showImage(this)">
			<img style="margin: 0;" id="thumbnail" src="#" alt="Image thumbnail" />
		</div>
	</form>
	<p style="text-align: center">
		<button onclick="goBack()" class="btn1">< 뒤로 가기</button>
		&nbsp;&nbsp;
		<button onclick="goToNextPage()" class="btn1">다음으로 ></button>
	</p>
</body>
</html>