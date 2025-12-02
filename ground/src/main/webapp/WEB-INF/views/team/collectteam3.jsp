<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<meta charset="UTF-8">
<title>팀 소개</title>
<script>
	function goBack() {
		// 이전 페이지로 이동
		window.history.back();
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
</script>
<style>
/* 파일 선택 버튼을 숨기기 */
input[type="file"] {
	display: none;
}

/* 파일 선택 버튼을 대체할 스타일을 갖는 레이블 */
.custom-file-upload {
	font-family: "Noto Sans KR", sans-serif;
	display: inline-block;
	padding: 8px 12px;
	background-color: #0066ff;
	color: white;
	border-radius: 5px;
	cursor: pointer;
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
	margin: 10px 0 0 10px;
	width: 95%;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	color: #888;
	border-bottom: 2px solid green;
}

/* 파일 선택 버튼을 대체할 레이블의 호버 효과 */
.custom-file-upload:hover {
	background-color: #1051b2;
}

#thumbnail {
	margin-top: 10px;
	max-width: 200px;
	max-height: 200px;
	display: none;
}



.shot1 {
	margin: 20px 0 5px 10px;
	width: 95%;
	height: 30px;
	border: 1px solid #aaa;
	border-radius: 3px;
}

.shot1::placeholder {
	font-family: "Noto Sans KR", sans-serif;
	font-weight: 300;
	color: #888;
	font-size: 13px;
}

.sogegle {
	width: 95%;
	height: 200px;
	margin: 12px 0 5px 10px;
	border: 1px solid #aaa;
	border-radius: 5px;
}

.sogegle::placeholder {
	font-family: "Noto Sans KR", sans-serif;
	font-weight: 400;
	color: #888;
	text-align: center;
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
	cursor: pointer;
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
	<p class="title1">팀 소개</p>
	<p class="title2">소개하는 글과 이미지를 넣어주세요</p>

	<form id="form1" method="post" action="/teamcollect3.do"
		enctype="multipart/form-data">
		<div>
			<input class="shot1" type="text" name="shot"
				placeholder="  제목을 적어주세요">

			
			<input class="sogegle" name="introduce" placeholder="팀 소개글을 작성해주세요">
		</div>
		
		<div style="display: flex; align-items: center; margin-top:15px;">
		    <label style="margin: 0 10px 0 10px;" for="fileUpload" class="imgbtn">소개글 사진 업로드</label>
		    <input type="file" id="fileUpload" name="file1" accept="image/*" onchange="showImage(this);" >
		    <img style="margin:0;" id="thumbnail" src="#" alt="Image thumbnail" />
		</div>
			
			

		<div style="text-align: center; margin-top: 10px;">
			<button type="button" class="btn1" onclick="goBack()">이전으로</button>
			<button type="submit" class="btn1" >완료</button>
		</div>
	</form>
	
</body>
</html>
