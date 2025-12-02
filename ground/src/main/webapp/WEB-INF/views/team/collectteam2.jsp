<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .selected {
      background-color: #ff0000; /* 색상 변경할 때 적용될 스타일 */
   }
   
   .select {
      background-color: #ff0000; /* 색상 변경할 때 적용될 스타일 */
   }

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
   
   .p1{
   font-family: "Noto Sans KR", sans-serif;
   font-size : 16px;
   margin: 15px 0 6px 0;
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
   
   #dayForm{
   margin-left : 12px;
   }
   
   .submit-btn {
     background-color: #888;
     color: white;
     border: none;
     padding: 10px 20px;
     border-radius: 5px;
     cursor: normal;
     font-family: "Noto Sans KR", sans-serif;
     font-size:14px;
     font-weight: 600;
     margin-top : 10px;
   }
   
   .submit-btn.active {
     background-color: #0066ff; /* 활성화된 상태의 색상 */
     cursor: pointer;
   }
   

</style>
</head>

<body>
<p class="title1">팀 활동</p>
<p class="title2">선호하는 팀 활동 요소를 선택해주세요</p>
	
   <form id="dayForm" method="post" action="/teamcollect2.do">
      <p class="p1">주요 활동 요일 (중복 가능)</p>
      <button type="button" class="choice" onclick="toggleDay(this)">월</button>
      <button type="button" class="choice" onclick="toggleDay(this)">화</button>
      <button type="button" class="choice" onclick="toggleDay(this)">수</button>
      <button type="button" class="choice" onclick="toggleDay(this)">목</button>
      <button type="button" class="choice" onclick="toggleDay(this)">금</button>
      <button type="button" class="choice" onclick="toggleDay(this)">토</button>
      <button type="button" class="choice" onclick="toggleDay(this)">일</button>
      <input type="hidden" id="selectedDay" name="selectedDay" value="">
      <p class="p1">주요 활동 시간</p>
      <button type="button" class="choice" onclick="toggleTime(this)">아침</button>
      <button type="button" class="choice" onclick="toggleTime(this)">낮</button>
      <button type="button" class="choice" onclick="toggleTime(this)">저녁</button>
      <button type="button" class="choice" onclick="toggleTime(this)">심야</button>
      <input type="hidden" id="selectedTime" name="selectedTime" value="">
      <p class="p1">주요 활동 나이 (중복 가능)</p>
      <button type="button" class="choice" onclick="toggleAge(this)">10대</button>
      <button type="button" class="choice" onclick="toggleAge(this)">20대</button>
      <button type="button" class="choice" onclick="toggleAge(this)">30대</button>
      <button type="button" class="choice" onclick="toggleAge(this)">40대</button>
      <button type="button" class="choice" onclick="toggleAge(this)">50대</button>
      <button type="button" class="choice" onclick="toggleAge(this)">60대이상</button>
      <input type="hidden" id="selectedAge" name="selectedAge" value="">
      <p class="p1">성별</p>
      <button type="button" class="choice" onclick="toggleGender(this)">남자</button>
      <button type="button" class="choice" onclick="toggleGender(this)">여자</button>
      <button type="button" class="choice" onclick="toggleGender(this)">남녀모두</button>
      <input type="hidden" id="selectedGender" name="selectedGender"
         value=""> 
      <p class="p1">레벨 (중복 가능)</p>
      <button type="button" class="choice" onclick="toggleClass(this)">스타터</button>
      <button type="button" class="choice" onclick="toggleClass(this)">비기너</button>
      <button type="button" class="choice" onclick="toggleClass(this)">아마추어</button>
      <button type="button" class="choice" onclick="toggleClass(this)">세미프로</button>
      <button type="button" class="choice" onclick="toggleClass(this)">프로</button>
      <input type="hidden" id="selectedClass" name="selectedClass" value="">
      <br>
      
      <p style="text-align: center;">
          <input type="submit" id="submitButton" class="submit-btn" value="선택완료" disabled 
          data-toggle="tooltip" data-placement="bottom" title="5개 항목을 전부 선택해주세요">
	   </p>

   </form>
   
<script>
    function toggleDay(button) {
        button.classList.toggle('select');
        updateSelectedDay();
        checkFormCompletion();
    }

    function updateSelectedDay() {
        var buttons = document.querySelectorAll('#dayForm button[type="button"][onclick^="toggleDay"]');
        var selectedDays = [];

        buttons.forEach(function(button) {
            if (button.classList.contains('select')) {
                selectedDays.push(button.textContent);
            }
        });

        document.getElementById('selectedDay').value = selectedDays.join(', ');
    }

    function toggleTime(button) {
        var buttons = document.querySelectorAll('#dayForm button[type="button"][onclick^="toggleTime"]');

        buttons.forEach(function(btn) {
            btn.classList.remove('select');
        });

        button.classList.add('select');
        updateSelectedTime();
        checkFormCompletion();
    }

    function updateSelectedTime() {
        var selectedTime = '';
        var selectedButton = document.querySelector('#dayForm button.select[onclick^="toggleTime"]');

        if (selectedButton) {
            selectedTime = selectedButton.textContent;
        }

        document.getElementById('selectedTime').value = selectedTime;
    }

    function toggleAge(button) {
        button.classList.toggle('select');
        updateSelectedAge();
        checkFormCompletion();
    }

    function updateSelectedAge() {
        var buttons = document.querySelectorAll('#dayForm button[type="button"][onclick^="toggleAge"]');
        var selectedAges = [];

        buttons.forEach(function(button) {
            if (button.classList.contains('select')) {
                selectedAges.push(button.textContent);
            }
        });

        document.getElementById('selectedAge').value = selectedAges.join(', ');
    }

    function toggleGender(button) {
        var buttons = document.querySelectorAll('#dayForm button[type="button"][onclick^="toggleGender"]');

        buttons.forEach(function(btn) {
            btn.classList.remove('select');
        });

        button.classList.add('select');
        updateSelectedGender();
        checkFormCompletion();
    }

    function updateSelectedGender() {
        var selectedGender = '';
        var selectedButton = document.querySelector('#dayForm button.select[onclick^="toggleGender"]');

        if (selectedButton) {
            selectedGender = selectedButton.textContent;
        }

        document.getElementById('selectedGender').value = selectedGender;
    }

    function toggleClass(button) {
        button.classList.toggle('select');
        updateSelectedClass();
        checkFormCompletion();
    }

    function updateSelectedClass() {
        var buttons = document.querySelectorAll('#dayForm button[type="button"][onclick^="toggleClass"]');
        var selectedClasses = [];

        buttons.forEach(function(button) {
            if (button.classList.contains('select')) {
                selectedClasses.push(button.textContent);
            }
        });

        document.getElementById('selectedClass').value = selectedClasses.join(', ');
    }

    function checkFormCompletion() {
        var selectedDay = document.getElementById('selectedDay').value;
        var selectedTime = document.getElementById('selectedTime').value;
        var selectedAge = document.getElementById('selectedAge').value;
        var selectedGender = document.getElementById('selectedGender').value;
        var selectedClass = document.getElementById('selectedClass').value;

        var submitButton = document.getElementById('submitButton');

        if (selectedDay && selectedTime && selectedAge && selectedGender && selectedClass) {
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

</body>
</html>