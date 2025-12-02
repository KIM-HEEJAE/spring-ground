<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>


<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>팀원 모집</title>
<style>
	.bt1 {
	    text-decoration: none; 
	    color: inherit; 
	    width: 100%;
	    background-color: #ddd;
	    border: none;
	    border-radius: 10px; /* 테두리 끝만 둥글게 하기 위해 변경 */
	    font-family: "Noto Sans KR", sans-serif;
	    font-size : 16px;
	    padding : 10px;
	    cursor: pointer;
	}
	
		.bt1:hover {
	  background-color: #ccc ;
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
	
</style>
</head>
<body>

<script>
function navigateToPage(code) {
    window.location.href = '/teamcollect.do?code=' + code;
}

function confirmAction(url) {
    if (confirm("중단하시겠습니까?")) {
        window.location.href = url;
    }
}
</script>
	<p class="title1">팀원 모집</p>
	<p class="title2">모집하고 싶은 팀을 선택해주세요</p>
	
	<div>
		<c:forEach var="row" items="${items}">
		    <button onclick="navigateToPage('${row.code}')" class="bt1" style="margin-top: 10px;">
		        <span style="font-weight:bold;">${row.name}</span> 팀 멤버 모집하기
		    </button>
		</c:forEach>
		<c:forEach var="row" items="${dto}">
		    <button onclick="confirmAction('/teamcollectx.do?code=${row.code}')"  class="bt1" style="margin-top: 10px;">
		        <span style="font-weight:bold;">${row.name}</span> 모집중단하기
		    </button>
		</c:forEach>
	  </div>
		  
</body>
</html>