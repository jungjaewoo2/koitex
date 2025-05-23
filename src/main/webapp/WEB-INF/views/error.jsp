<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오류 - KOITEX</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .error-container {
            background: white;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            text-align: center;
            max-width: 500px;
            width: 90%;
        }
        
        .error-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        
        .error-title {
            color: #333;
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }
        
        .error-message {
            color: #666;
            margin-bottom: 2rem;
            line-height: 1.6;
        }
        
        .error-code {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            font-family: monospace;
        }
        
        .btn-home {
            display: inline-block;
            padding: 0.8rem 2rem;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-home:hover {
            background: #5a6fd8;
            transform: translateY(-2px);
        }
        
        .debug-info {
            margin-top: 2rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 10px;
            text-align: left;
            font-size: 0.9rem;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">⚠️</div>
        
        <h1 class="error-title">
            <c:choose>
                <c:when test="${not empty errorTitle}">
                    ${errorTitle}
                </c:when>
                <c:otherwise>
                    오류가 발생했습니다
                </c:otherwise>
            </c:choose>
        </h1>
        
        <div class="error-message">
            <c:choose>
                <c:when test="${not empty errorMessage}">
                    ${errorMessage}
                </c:when>
                <c:otherwise>
                    요청을 처리하는 중 오류가 발생했습니다.
                </c:otherwise>
            </c:choose>
        </div>
        
        <c:if test="${not empty statusCode}">
            <div class="error-code">
                오류 코드: ${statusCode}
            </div>
        </c:if>
        
        <a href="/" class="btn-home">🏠 홈으로 돌아가기</a>
        
        <!-- 개발 환경에서만 표시 -->
        <c:if test="${not empty exception}">
            <div class="debug-info">
                <strong>디버그 정보:</strong><br>
                ${exception}
            </div>
        </c:if>
    </div>
</body>
</html>