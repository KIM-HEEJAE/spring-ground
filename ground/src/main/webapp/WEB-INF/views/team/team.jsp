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
		margin : 20px 0 0 10px;
		width : 95%;
		font-family: "Noto Sans KR", sans-serif;
		font-size : 20px;
		font-weight: bold;
		}
		
	.title2 {
		padding-bottom : 15px;
		margin : 10px 0 30px 10px;
		width : 95%;
		font-family: "Noto Sans KR", sans-serif;
		font-size : 15px;
		color : #888;
		border-bottom: 2px solid green;
		}
		
	.kan {
	width: 90%;
	height: 42px; 
	border: 1px solid #eee;
	border-radius: 10px;
	margin: 0px 0 5px 20px;
	background-color : rgb(245, 245, 250)
	}
	
	.kan::placeholder {
	font-family: "Noto Sans KR", sans-serif;
	font-weight: 300;
	color: #888;
	font-size: 13px;
	padding-left : 10px;
	}

	.hanjul {
	font-family: "Noto Sans KR", sans-serif;
	font-weight: 600;
	font-size : 14px;
	margin : 20px 0 5px 20px;
	color: #555;
	}
	
	   .submit-btn {
     background-color: #0066ff;
     color: white;
     border: none;
     padding: 10px 30px;
     border-radius: 5px;
     cursor: normal;
     font-family: "Noto Sans KR", sans-serif;
     font-size:14px;
     font-weight: 600;
     margin-top : 10px;
   }
   
   .submit-btn.active:hover {
	background-color: #1051b2;
}
   
</style>
</head>
<body>
	<p class="title1">새로운 팀 만들기</p>
	<p class="title2">원하는 팀 이름과 코드를 입력주세요</p>
	
	<form id="team" method="post" action="/nextteam.do" >
		<p class="hanjul">팀 이름</p>
		<input name="teamname" placeholder="팀 이름"  class="kan"> 
		<p class="hanjul">팀 코드</p>
		<input  name="teamcode" placeholder="예) 1004"  class="kan">
		
		<p style="text-align: center;">
			<input type="submit" class="submit-btn" value="다음으로">
		</p>
	</form>
</body>
</html>