<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<link rel="icon" href="../../resources/images/logo/icon1.png" type="image/x-icon">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .card {
    position: relative;
  }

  .overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
  }
  
  #three {
    justify-content: center;
  }


  
  #card1:hover .card-img-top {
        content: url("../../resources/images/etc/field.png"); /* 다른 이미지의 경로로 변경하세요 */
        color: #ff0000
    }

    #card1:hover .card-title {
        color: #fff !important;
    }
    
      #card2:hover .card-img-top {
        content: url("../../resources/images/etc/match.png"); /* 다른 이미지의 경로로 변경하세요 */
        color: #ff0000
    }

    #card2:hover .card-title {
        color: #fff !important;
    }
    
      #card3:hover .card-img-top {
        content: url("../../resources/images/etc/team.png"); /* 다른 이미지의 경로로 변경하세요 */
        color: #ff0000
    }

    #card3:hover .card-title {
        color: #fff !important;
    }
    
    #homego:hover {
    	content: url("../../resources/images/logo/homego_light.png");
    	width: 220px;
    	height: 38px;
    	display: block; 
    	margin: auto; 
    	margin-top: 40px;
    }

	@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

	#content {
	    animation: fadeIn 1s ease forwards;
	    animation-delay: 0.8s;
	}
	
	#content2 {
	    animation: fadeIn 1s ease forwards;
	    animation-delay: 0.2s;
	}

</style>




</head>
<body>
    <div class="card text-bg-dark" >
	  <img src="../../resources/images/etc/background.jpg" class="card-img" alt="..."  style="width:1856px;">
	  <div class="overlay"></div>
	  <div class="card-img-overlay">
	  
	  
	  
	  <a class="navbar-brand" id="content" style="opacity: 0;" href="/"> <img src="../../resources/images/logo/logo_dark.png"  width="250" height="46" style="margin:50px 0 0 200px;"></a><br>
	    <img src="../../resources/images/logo/slogun.png"  id="content2"  style="opacity: 0; display: block; margin: auto; margin-top: 50px; margin-bottom: 50px;">
	   
	   <div id="content" style="opacity: 0;">
	   
	    <div class="card-group"  id="three" style="width:70%; margin: auto;" >
	    	<div class="card"  id="card1" style="width: 18rem; margin-right : 30px; border:none; background-color:transparent;">
	    		<a href="/" style="text-decoration: none;">
				 <img src="../../resources/images/etc/field_gray.png" class="card-img-top" alt="..." >
				    <div class="card-body">
					    <h5 class="card-title" style="font-family: Noto Sans KR, sans-serif;  font-size : 20px; text-align: center; color:#ccc;">구장 예약</h5>
					</div>
			  	</a>
			</div>
			
			<div class="card" id="card2" style="width: 18rem; margin-right : 30px; border:none; background-color:transparent;">
				<a href="/" style="text-decoration: none;">
				 <img src="../../resources/images/etc/match_gray.png" class="card-img-top" alt="..." >
				    <div class="card-body">
					    <h5 class="card-title" style="font-family: Noto Sans KR, sans-serif;  font-size : 20px; text-align: center; color:#ccc">소셜 매치</h5>
					</div>
				  </a>
			</div>
			
			<div class="card" id="card3" style="width: 18rem; margin-right : 30px; border:none; background-color:transparent;">
				<a href="/" style="text-decoration: none;">
				 <img src="../../resources/images/etc/team_gray.png" class="card-img-top" alt="..." >
				    <div class="card-body">
					    <h5 class="card-title" style="font-family: Noto Sans KR, sans-serif;  font-size : 20px; text-align: center; color:#ccc">팀 관리</h5>
					</div>
			  </a>
			</div>

		</div>
		
		<a class="navbar-brand" id="homego" href="home.do"> <img src="../../resources/images/logo/homego.png" width="220" height="38" style="display: block; margin: auto; margin-top: 40px;"></a>
		
		</div>
		
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<%@ include file="../outline/footer_dark.jsp"%>



</body>
</html>
