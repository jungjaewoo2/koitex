<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP 테스트</title>
</head>
<body>
    <h1>JSP 테스트 페이지</h1>
    <p>${message}</p>
    <p>현재 시간: <%= new java.util.Date() %></p>
    <a href="/">홈으로 돌아가기</a>
</body>
</html>