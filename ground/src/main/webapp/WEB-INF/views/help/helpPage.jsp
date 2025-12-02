<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도움말 리스트</title>
</head>
<body>
    <h1>도움말 리스트</h1>
    <table border="1">
        <thead>
            <tr>
             
                <th>제목</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="help">
                <tr>                   
                    <td>${help.title}</td>
                    <td>${help.contents}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
