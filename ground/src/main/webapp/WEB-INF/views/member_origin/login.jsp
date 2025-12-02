<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.io.IOException"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="org.json.simple.parser.ParseException"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>

<head>
<script>
    function openPopup1(event) {
        event.preventDefault(); // 기본 동작 방지
        window.open("/member_origin/idsearch.do", 'edit', 'width=550, height=450');
    }

    function openPopup2(event) {
        event.preventDefault(); // 기본 동작 방지
        window.open("/member_origin/pwsearch.do", 'edit', 'width=550, height=450');
    }
</script>
<style>
</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- SweetAlert2 스크립트 먼저 호출 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 그 다음에 스위트 얼럿을 표시하는 스크립트 호출 -->
<c:if test='${message=="error"}'>
	<script>
		alert("아이디 혹은 비밀번호가 잘못되었습니다.")
	</script>
</c:if>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<header> </header>

	<div class=section1
		style="display: flex; justify-content: center; align-items: center; background: #eee">



		<div
			style="display: flex; align-items: center; margin: 50px 0 50px 0;">
			<div>
				<div class=titleword>
					로그인<a href="/admin/admin_login.do"></a>
				</div>
				<hr style="border: 1px solid #ccc; margin: 10px 0;">

				<form id="loginForm" method="post">

					<div style="display: flex; align-items: center;">
						<div style="width: 260px;">
							<input name="userid" placeholder="아이디를 입력하세요"
								style="width: 242px; height: 40px; margin-bottom: 5px;">
							<input type="password" name="pwd1" placeholder="비밀번호를 입력하세요"
								style="width: 250px; height: 41px;">
						</div>
						<div>
							<button type="submit" formaction="/member_origin/login.do"
								style="width: 90px; height: 90px; margin: 0 5px; font-size: 18px; font-weight: bold;">
								로그인</button>

						</div>
					</div>
					<a
						href=https://kauth.kakao.com/oauth/authorize?client_id=6af5904faf501d1253a5af1ab06cfed0&redirect_uri=http://localhost/kakao/callback&response_type=code><img
						src="/images/kakao_login.png"></a>
					<p class="blue"
						style="display: flex; justify-content: center; align-items: center; margin: 20px 0 0 0;">
						<a href="/member/register.do"
							style="font-size: 13px; color: black">회원가입</a>
							&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;
						<button onclick="openPopup1(event)" style="border: none; background: none; cursor: pointer;">아이디찾기</button>
						&nbsp;&nbsp;/&nbsp;&nbsp;
						<button onclick="openPopup2(event)" style="border: none; background: none; cursor: pointer;">비밀번호찾기</button>
						&nbsp;&nbsp;/&nbsp;&nbsp;
						<button type="submit" formaction="/admin/login.do"
							style="border: none;">관리자</button>
					</p>
				</form>
			</div>
		</div>
	</div>


</body>

</html>