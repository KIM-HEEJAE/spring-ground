<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<style>
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

.bonmun {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 16px;
	color: #666;
	margin: 0px 0 0px 20px;
}

.submit-btn {
	background-color: #0066ff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: normal;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	margin-top: 10px;
}


.submit-btn:hover {
	background-color: #1051b2;
}
</style>

</head>
<body>
	<p class="title1">팀 생성 완료</p>
	<p class="title2">팀 생성이 완료 되었습니다</p>
	<p class="bonmun">우측 하단 <span style="color:blue; font-weight:bold; font-size: 17px;">( + )</span> 버튼을 눌러 팀원 모집을 할 수 있습니다</p>
	
	<div style="text-align:center; margin-top: 20px;">
		<button class="submit-btn" onclick="closeWindow()">확인</button>
	</div>
</body>

    <script>
        function closeWindow() {
            window.close();
        }
    </script>

</html>