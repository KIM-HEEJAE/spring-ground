
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>


	<div class="section1">
		<table>
			<tr>
				<td>
			
	
		<div class="container">
			<div class="sidebar" style="margin-top: 30px;">
				<div
					style="display: flex; justify-content: center; align-items: center; flex-direction: column; text-align: center;">
					<div
						style="border: 1px solid #000; border-radius: 10px; background-color: #fff; padding: 10px; margin-bottom: 10px; width: 180px; height: 180px; font-size: 18px; font-weight: bold">
						<img src="/resources/images/profile/${sessionScope.filename}" alt="이미지"
							onerror="this.onerror=null; this.src='/resources/images/basic.png';"
							style="border-radius: 50%; overflow: hidden; width: 150px; height: 150px; margin-bottom: 8px;"
							height="120px"><br> ${sessionScope.name}님
					</div>
				</div>
				<div
					style="border: 1px solid #000; border-radius: 10px; background-color: #fff; padding: 10px; margin-bottom: 10px; text-align: center">
					<a href="/mypage/list.do"
						style="color: black; text-decoration: none;">기대되는 영화</a>
				</div>
				<div
					style="border: 1px solid #000; border-radius: 10px; background-color: #fff; padding: 10px; margin-bottom: 10px; text-align: center">
					<a href="#" style="color: black; text-decoration: none;">내가 본 영화</a>
				</div>
				<div
					style="border: 1px solid #000; border-radius: 10px; background-color: #fff; padding: 10px; text-align: center">
					<a href="/review/list.do" style="color: black; text-decoration: none;">내가 쓴 리뷰</a>
				</div>
			</div>

		</div>

</td>
<td>

		<div class="main-content"">
	<c:choose>
    <c:when test='${type == "like"}'>
        <c:choose>
            <c:when test='${empty list or list.size() == 0}'>
                <div style="text-align: center;">
                    <h3 style="margin-right: 100px;">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>기대되는 영화가 없습니다.<br> 영화 상세에서 '하트버튼'을 클릭하여 영화를 추가해보세요.
                    </h3>
                    <br>
                    <button onclick="window.location.href='/moviechart.do'">무비차트</button>
                </div>
            </c:when>
            <c:otherwise>
            <p style="margin: 25px 0 30px 35px; font-size : 22px; font-weight:bold;">기대되는 영화</p>
                <c:forEach var="row" items="${list}">
                    <div class="poster" style="margin : 0 40px 40px 40px;">
                        <a href="/like/heart.do?movieCd=${row.moviecode}"><img src="/resources/images/poster/${row.moviecode}.jpg"
                            style="width: 240px; height: 360px; margin:0;"></a>
                        <button class="deleteButton" onclick="deleteLike('${row.moviecode}')">X </button>
                        <hr style="border: 1px solid #ccc; margin: 7px 0 4px 0;">
                        <p style="text-align:center; font-size:24px; font-weight:bold; margin:0"> ${row.movieTitle}</p>
                        <hr style="border: 1px solid #ccc; margin: 4px 0 7px 0;">
                        <p style="text-align:center; margin-top:2px;"><button onclick="moviebook('${row.moviecode}')" class="redbutton">예매</button></p>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test='${type == "review"}'>
        <c:choose>
            <c:when test='${empty list or list.size() == 0}'>
                <div style="text-align: center;">
                    <h3 style="margin-right: 100px;">
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>작성한 리뷰가 없습니다.<br> 영화 상세에서 '리뷰버튼'을 클릭하여 리뷰를 남겨주세요.
                    </h3>
                    <br>
                    <button onclick="window.location.href='/moviechart.do'">무비차트</button>
                </div>
            </c:when>
            <c:otherwise>
            	<p style="margin: 25px 0 30px 35px; font-size : 22px; font-weight:bold;">내가 작성한 리뷰</p>
                  <c:forEach var="row" items="${list}">
                    <div class="poster" style="margin : 0 40px 40px 40px;">
                    	<div style="display: flex;    line-height: 35px;border-bottom: 1px solid #ddd; ">
                    		<div>
		                        <a href="/like/heart.do?movieCd=${row.moviecode}"><img src="/resources/images/poster/${row.moviecode}.jpg"
		                            style="width: 140px; height: 200px; margin:0;"></a>
		                        <button class="deleteButton" onclick="deleteReview('${row.review_id}')">X </button>
	                        </div>
	                        <div style="width:650px; margin-left: 50px">
		                        <p style="text-align:left; font-size:24px; font-weight:bold; margin-bottom:15px; display: inline-block;  line-height: 35px;border-bottom: 2px solid #bbb;"> ${row.movieTitle}</p>
		                        <p style="text-align:left; font-size:24px; font-weight:bold; margin:0">
								    <script>
								        // 숫자값 가져오기
								        var ratingValue = ${row.value};
								
								        // 별 생성 함수
								        function generateStars(value) {
								            var stars = '';
								            for (var i = 0; i < value; i++) {
								                stars += '★'; // 별 문자 추가
								            }
								            return stars;
								        }
								        // 별 출력
								        document.write(generateStars(ratingValue));
								    </script>
								</p>
		                         <p style="text-align:left; font-size:16px; font-weight:normal; margin:15px 0 0 0; display: inline-block;  line-height: 35px; " > ${row.content}</p>

	                        </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </c:when>
</c:choose>
		</div>
		
		</td>
		</tr>
		</table>

	</div>
</body>
<script>
function deleteReview(review_id) {
	$.ajax({
		type : "post",
		url : "/review/delete.do",
		data : {
			"review_id" : review_id
		// 올바른 데이터 필드 사용
		},
		success : function(txt) {
			location.reload();
		}
	});
}
	function deleteLike(moviecode) {
		$.ajax({
			type : "post",
			url : "/like/delete.do",
			data : {
				"moviecode" : moviecode
			// 올바른 데이터 필드 사용
			},
			success : function(txt) {
				location.reload();
			}
		});
	}
	function moviebook(movieCd) {
		window.location.href = '/ticket/book_tickets.do?movieCd='+ movieCd;
	}
</script>
				
</html>
