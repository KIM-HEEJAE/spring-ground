<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${dto.name},<img src="/resources/images/${dto.logo}"><br>
${dto.gender},${dto.age}
팀멤버
 <c:forEach var="member" items="${member}">
    <c:choose>
        <c:when test="${member.grade == 2}">
            ${member.name} 운영진
        </c:when>
        <c:otherwise>
            ${member.name}
        </c:otherwise>
    </c:choose>
</c:forEach>
팀 레벨 ${dto.skil}<br> 
모임 시간 ${dto.time}<br>
활동 요일 ${dto.days} <br>
</body>
</html>