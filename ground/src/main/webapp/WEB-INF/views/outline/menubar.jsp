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
<link rel="icon" href="../../resources/images/logo/icon1.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	#mainmenu {
	  border: none;
	  cursor: pointer;
	  outline: none;
	  position: relative;
	  overflow: hidden;
	}
	
	#mainmenu::before {
	  content: "";
	  position: absolute;
	  bottom: 0;
	  left: -100%;
	  width: 100%;
	  height: 100%;
	  border-bottom: 2px solid rgb(112, 215, 9);
	  transition: left 0.2s ease;
	}
	
	#mainmenu:hover::before {
	  left: 0;
	}

	.banner-container {
	  position: relative;
	}
	
	.btn-close {
	  position: absolute;
	  top: 15px;
	  right: 430px;
	  z-index: 1000;
	}
	
	#stickmenu {
	position: sticky; 
	top: 0; 
	background-color: white; 
	z-index: 1000;
	}
</style>

	<script>
	  function hideBanner() {
	    var banner = document.getElementById('bannerImage');
	    var closeButton = document.querySelector('.btn-close');
	    banner.style.display = 'none';
	    closeButton.style.display = 'none';
	  }
	</script>

</head>

<body>

<div class="banner-container">
<a href="/" >
  <img src="../../resources/images/adver/banner.png" style="width: 100%; height: auto;" id="bannerImage"></a>
  <button type="button" class="btn-close" aria-label="Close" onclick="hideBanner()"></button>
</div>

<c:choose>
	<c:when test="${sessionScope.userid==null}">
		<nav class="navbar navbar-expand-lg bg-white" style="padding-bottom: 0;">
		  <div class="container-fluid" >
		    <div class="collapse navbar-collapse" id="navbarSupportedContent"style="height : 17px; margin-right: 200px;  font-family: Noto Sans KR, sans-serif; font-size : 12px;">
		      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" href="/member_origin/register.do">회원가입</a>
		        </li>
		         <!-- <li class="nav-item">
		          <a class="nav-link" href="https://kauth.kakao.com/oauth/authorize?client_id=6af5904faf501d1253a5af1ab06cfed0&redirect_uri=http://localhost/kakao/callback&response_type=code">로그인</a>
		        </li> -->
		        <li class="nav-item">
		          <a class="nav-link" href="/login_page.do">로그인</a>
		        </li>
		         <li class="nav-item">
		          <a class="nav-link" href="/help/list.do">고객센터</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</c:when>
	<c:otherwise>
		<nav class="navbar navbar-expand-lg bg-white" style="padding-bottom: 0;">
			<div class="container-fluid" >
			    <div class="collapse navbar-collapse" id="navbarSupportedContent"style="height : 17px; margin-right: 200px; font-family: Noto Sans KR, sans-serif; font-size : 12px;">
			      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				      <li class="nav-item">
			       	   <%-- <a class="nav-link disabled" aria-disabled="true">${nickname}님 환영합니다.</a> --%>
			       	   	<a class="nav-link disabled" aria-disabled="true">
					       <script>
					            var nickname = "${sessionScope.nickname}";
					            var sessionName = "${sessionScope.name}";
					
					            // nickname 또는 sessionName 중 하나가 존재하는 경우에만 표기
					            if (nickname || sessionName) {
					                document.write((nickname ? nickname : sessionName) + "님 환영합니다.");
					            }
					        </script>
					    </a>
			      	  </li>
			         <li class="nav-item">
			          <a class="nav-link" href="https://kauth.kakao.com/oauth/logout?client_id=6af5904faf501d1253a5af1ab06cfed0&logout_redirect_uri=http://localhost/kakao/logout">로그아웃</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="/mypage/detail.do">마이페이지</a>
			        </li>
			         <li class="nav-item">
			          <a class="nav-link" href="/help/list.do">고객센터</a>
			        </li>
			      </ul>
			    </div>
			  </div>
		  </nav>
	</c:otherwise>
</c:choose>


<div id="stickmenu" >
<nav class="navbar sticky-top navbar-expand-lg bg-white"  >
  <div class="container-fluid" style="margin-left : 200px;  ">
    <a class="navbar-brand" href="/"> <img src="../../resources/images/logo/logo4.png"  width="250" height="46"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="font-family: Noto Sans KR, sans-serif; font-size : 16px; ">
		<li class="nav-item">
          <a class="nav-link" href="/ground/list.do" id="mainmenu">구장예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="social.do" id="mainmenu">소셜매치</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/teammate.do" id="mainmenu">팀관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list.do" id="mainmenu">커뮤니티</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="/magazine/list.do" id="mainmenu">매거진</a>
        </li>
 		<li class="nav-item dropdown">
		   <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		     임시 메뉴
		   </a>
		   <ul class="dropdown-menu" >
		     <li><a class="dropdown-item" href="old.do">(구)홈페이지</a></li>
		     <li><a class="dropdown-item" href="#">임시2</a></li>
		     <li><a class="dropdown-item" href="#">임시3</a></li>
		   </ul>
		 </li>
      </ul>
      
      <form class="d-flex" role="search" style="margin:0 195px 0 0;">
		  <div class="input-group">
		    <input class="form-control me-2" type="search" placeholder="검색" aria-label="Search">
		    <button class="btn btn-outline-success" type="submit">
		      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
				  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
				</svg>
		    </button>
		  </div>
		</form>
  
    </div>
  </div>
</nav>

<hr style="border: 1px solid #ccc; width:100%; margin: 0 ;">
</div>

</body>

</html>