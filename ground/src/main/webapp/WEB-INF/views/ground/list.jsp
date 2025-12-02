<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>축구장 리스트</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .thumbnail {
            max-width: 200px; /* 이미지의 최대 너비 */
            max-height: 200px; /* 이미지의 최대 높이 */
            display: block; /* 블록 요소로 표시하여 다른 요소와 수평으로 정렬되도록 함 */
            margin: auto; /* 가운데 정렬 */
        }
    </style>
    <script src="http://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>

    <div class="container">
        <h1 class="my-4">축구장 리스트</h1>
        
      <div><select id="region" name="region" size="1">
			<option value="">선택하세요.</option>
			<option value="서울">서울</option>
			<option value="경기">경기</option>
		</select></div>
        <table class="table">
            <thead>
                <tr>
                
                    <th scope="col">이름</th>
                    <th scope="col">주소</th>
                    <th scope="col">구장 이미지</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="ground">
    <tr>
        <td><a href="detail.do?name=${ground.name}">${ground.name}</a></td>
        <td>${ground.address}</td>
        <td><img src="../../resources/images/ground/${ground.filename}" alt="구장 이미지" class="thumbnail"></td>
    </tr>
</c:forEach>

            </tbody>
        </table>
        
        <!-- 페이지 번호 표시 -->
        <c:if test="${page.totPage > 1}">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:forEach begin="1" end="${page.totPage}" var="pageNum">
                        <c:url value="/ground/list.do" var="pageLink">
                            <c:param name="cur_page" value="${pageNum}" />
                        </c:url>
                        <li class="page-item">
                            <a class="page-link" href="${pageLink}">${pageNum}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </div>
    
    <!-- 부트스트랩 JS 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script>
    document.getElementById("region").addEventListener("change", function() {
        var selectedRegion = document.getElementById("region").value;
        if (selectedRegion !== "" && selectedRegion !== "선택하세요.") {
            search(selectedRegion);
        }
    });
    function search(region) {
		$.ajax({
			type: "post",
			url: "/ground/search.do",
			data: {
				"region": region,
			},
			success: function(response) {
				console.log("삽입 성공: " + response);
				location.reload();
			},
			error: function(xhr, status, error) {
				console.error("오류 발생: " + error);
				// 오류 발생 시 처리할 내용
			}
		});
	}
    </script> -->
    
    <script>
    document.getElementById("region").addEventListener("change", function() {
        var selectedRegion = document.getElementById("region").value;
        if (selectedRegion !== "" && selectedRegion !== "선택하세요.") {
            search(selectedRegion);
        }
    });

    function search(region) {
        $.ajax({
            type: "post",
            url: "/ground/search.do",
            data: {
                "region": region,
            },
            success: function(response) {
                document.write(response);
                document.close();
            },
            error: function(xhr, status, error) {
                console.error("오류 발생: " + error);
            }
        });
    }
    </script>
</body>
</html>
