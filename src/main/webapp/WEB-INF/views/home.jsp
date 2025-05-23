<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>한국정보평가원 - KOITEX</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        
        header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        nav {
            background: white;
            padding: 1rem 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }
        
        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 2rem;
        }
        
        nav a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        
        nav a:hover {
            background: #667eea;
            color: white;
        }
        
        .main-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        .section {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .section h2 {
            color: #667eea;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
            border-bottom: 2px solid #667eea;
            padding-bottom: 0.5rem;
        }
        
        .item-list {
            list-style: none;
        }
        
        .item-list li {
            padding: 0.8rem 0;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .item-list li:last-child {
            border-bottom: none;
        }
        
        .item-list a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .item-list a:hover {
            color: #667eea;
        }
        
        .date {
            color: #666;
            font-size: 0.9rem;
        }
        
        .more-link {
            text-align: right;
            margin-top: 1rem;
        }
        
        .more-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
        
        .more-link a:hover {
            text-decoration: underline;
        }
        
        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 2rem 0;
            margin-top: 3rem;
        }
        
        .status-badge {
            padding: 0.2rem 0.5rem;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: bold;
        }
        
        .answered {
            background: #d4edda;
            color: #155724;
        }
        
        .unanswered {
            background: #f8d7da;
            color: #721c24;
        }
        
        @media (max-width: 768px) {
            .main-content {
                grid-template-columns: 1fr;
            }
            
            nav ul {
                flex-direction: column;
                gap: 0.5rem;
                text-align: center;
            }
            
            header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <h1>한국정보평가원</h1>
            <p>Korea Information Technology Evaluation Institute</p>
        </div>
    </header>
    
    <nav>
        <div class="container">
            <ul>
                <li><a href="/">홈</a></li>
                <li><a href="/notice/list">공지사항</a></li>
                <li><a href="/qna/list">문의사항</a></li>
                <li><a href="/notice/write">공지작성</a></li>
                <li><a href="/qna/write">문의작성</a></li>
            </ul>
        </div>
    </nav>
    
    <div class="container">
        <div class="main-content">
            <!-- 최신 공지사항 -->
            <div class="section">
                <h2>📢 최신 공지사항</h2>
                <c:choose>
                    <c:when test="${not empty recentNotices}">
                        <ul class="item-list">
                            <c:forEach var="notice" items="${recentNotices}">
                                <li>
                                    <a href="/notice/detail/${notice.id}">
                                        ${notice.title}
                                        <span class="view-count">(조회: ${notice.viewCount})</span>
                                    </a>
                                    <span class="date">
                                        <fmt:formatDate value="${notice.createdDate}" pattern="MM-dd"/>
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <p>등록된 공지사항이 없습니다.</p>
                    </c:otherwise>
                </c:choose>
                <div class="more-link">
                    <a href="/notice/list">더보기 →</a>
                </div>
            </div>
            
            <!-- 최신 문의사항 -->
            <div class="section">
                <h2>❓ 최신 문의사항</h2>
                <c:choose>
                    <c:when test="${not empty recentQnAs}">
                        <ul class="item-list">
                            <c:forEach var="qna" items="${recentQnAs}">
                                <li>
                                    <a href="/qna/detail/${qna.id}">
                                        ${qna.title}
                                        <c:choose>
                                            <c:when test="${qna.answered}">
                                                <span class="status-badge answered">답변완료</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge unanswered">미답변</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                    <span class="date">
                                        <fmt:formatDate value="${qna.createdDate}" pattern="MM-dd"/>
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <p>등록된 문의사항이 없습니다.</p>
                    </c:otherwise>
                </c:choose>
                <div class="more-link">
                    <a href="/qna/list">더보기 →</a>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        <div class="container">
            <p>&copy; 2025 한국정보평가원. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>