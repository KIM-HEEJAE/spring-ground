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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
.selected {
	background-color: #ff0000; /* 색상 변경할 때 적용될 스타일 */
}

.select {
	background-color: #ff0000; /* 색상 변경할 때 적용될 스타일 */
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
	font-size: 15px;
	color: #333;
	font-weight: 700;
	margin-bottom: 3px;
}

.name2 {
	font-size: 12px;
	color: #999;
	font-weight: 700;
	margin-bottom: 0px;
}

   .choice{
   border: 2px solid #888;
    border-radius: 10px; /* 테두리 끝만 둥글게 하기 위해 변경 */
    font-family: "Noto Sans KR", sans-serif;
    background-color : #fff;
    padding : 5px 10px 5px 10px;
    cursor: pointer;
   }
   
   .choice.select {
     color: #0066ff;
     font-weight:bold;
     border: 2px solid #0066ff;
   }
   
      .choice.selected {
     color: #0066ff;
     font-weight:bold;
     border: 2px solid #0066ff;
   }
   
   .hanjul {
   margin : 20px 0 3px 0;
   	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	font-weight: 600;
	color : #888;
   }
   
.submit-btn {
	background-color: #888;
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

.submit-btn.active {
	background-color: #0066ff; /* 활성화된 상태의 색상 */
	cursor: pointer;
}

.submit-btn.active:hover {
	background-color: #1051b2;
}
</style>
</head>
<body>

	<p class="title1">멤버 구성</p>
	<p class="title2">선호하는 멤버 구성을 선택해주세요</p>
	
	<div class="row" style="margin-bottom: 20px; width:95%">
		<div class="col-auto" style="margin: 5px 0px 0 20px">
			<img src="/resources/images/${sessionScope.filename}" style="width: 50px; height: 50px;">
		</div>
		<div class="col-auto" style="margin: 10px 10px 0 20px; padding:0;">
			<p class="name1">${sessionScope.teamname}</p>
			<p class="name2">${sessionScope.teamcode}</p>
		</div>
	</div>
	
	<form id="dayForm" method="post" action="/nextteam4.do">
		<div style="margin-left:20px;">
		
			<p class="hanjul">나이대</p>
			<button type="button" class="choice" onclick="toggleAge(this)">10대</button>
			<button type="button" class="choice" onclick="toggleAge(this)">20대</button>
			<button type="button" class="choice" onclick="toggleAge(this)">30대</button>
			<button type="button" class="choice" onclick="toggleAge(this)">40대</button>
			<button type="button" class="choice" onclick="toggleAge(this)">50대</button>
			<button type="button" class="choice" onclick="toggleAge(this)">60대이상</button>
			<input type="hidden" id="selectedAge" name="selectedAge" value="">
			
			<p class="hanjul">성별</p>
			<button type="button" class="choice" onclick="toggleGender(this)">남자</button>
			<button type="button" class="choice" onclick="toggleGender(this)">여자</button>
			<button type="button" class="choice" onclick="toggleGender(this)">남녀모두</button>
			<input type="hidden" id="selectedGender" name="selectedGender" value="">
		
		</div>
		<p style="text-align: center;">
			<input type="submit" id="submitButton" class="submit-btn"
				value="선택완료" disabled data-toggle="tooltip" data-placement="bottom"
				title="항목을 전부 선택해주세요">
		</p>
	</form>

	<script>
		function toggleAge(button) {
			button.classList.toggle('select'); // 클릭된 요일 버튼의 선택 상태를 토글

			// 선택된 요일 업데이트
			updateSelectedAge();
			checkFormCompletion(); // 폼 검증 함수 호출
		}

		function updateSelectedAge() {
			var buttons = document
					.querySelectorAll('#dayForm button[type="button"]:not([onclick="toggleGender(this)"])'); // 요일 버튼 선택
			var selectedAges = []; // 선택된 요일 초기화

			// 선택된 요일 버튼을 찾아서 배열에 추가
			buttons.forEach(function(button) {
				if (button.classList.contains('select')) {
					selectedAges.push(button.textContent);
				}
			});

			// 숨겨진 input 요소의 값으로 선택된 요일 업데이트 (배열로 전달)
			document.getElementById('selectedAge').value = selectedAges
					.join(', ');
		}

		function toggleGender(button) {
			var buttons = document
					.querySelectorAll('#dayForm button[type="button"]:not([onclick="toggleAge(this)"])'); // 시간대 버튼 선택

			// 모든 시간대 버튼의 선택 상태 제거
			buttons.forEach(function(btn) {
				btn.classList.remove('selected');
			});

			button.classList.add('selected'); // 클릭된 시간대 버튼에 선택 상태 추가

			// 선택된 시간대 업데이트
			updateSelectedGender();
			checkFormCompletion(); // 폼 검증 함수 호출
		}

		function updateSelectedGender() {
			var selectedGender = ''; // 선택된 시간대 초기화
			var selectedButton = document
					.querySelector('#dayForm button.selected:not([onclick="toggleAge(this)"])'); // 선택된 시간대 버튼 선택

			if (selectedButton) {
				selectedGender = selectedButton.textContent; // 선택된 시간대 버튼의 텍스트(시간대)를 가져옴
			}

			// 숨겨진 input 요소의 값으로 선택된 시간대 업데이트
			document.getElementById('selectedGender').value = selectedGender;
		}
		
		function checkFormCompletion() {
	        var selectedAge = document.getElementById('selectedAge').value;
	        var selectedGender = document.getElementById('selectedGender').value;

	        var submitButton = document.getElementById('submitButton');

	        if (selectedAge && selectedGender) {
	            submitButton.disabled = false;
	            submitButton.classList.add('active');
	        } else {
	            submitButton.disabled = true;
	            submitButton.classList.remove('active');
	        }
	    }
		
	    $(document).ready(function(){
	        $('[data-toggle="tooltip"]').tooltip();   
	      });
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>