<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록 - KOITEX</title>
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
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .header h1 {
            color: #667eea;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .search-form {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
            align-items: center;
        }
        
        .search-form input[type="text"] {
            flex: 1;
            padding: 0.8rem;
            border: 2px solid #e9ecef;
            border-radius: 5px;
            font-size: 1rem;
        }
        
        .search-form button {
            padding: 0.8rem 1.5rem;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s ease;
        }
        
        .search-form button:hover {
            background: #5a6fd8;
        }
        
        .notice-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th {
            background: #667eea;
            color: white;
            padding: 1rem;
            text-align: center;
            font-weight: 600;
        }
        
        td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            text-align: center;
        }
        
        td.title {
            text-align: left;
        }
        
        td.title a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        td.title a:hover {
            color: #667eea;
        }
        
        .view-count {
            color: #666;
            font-size: 0.9rem;
            margin-left: 0.5rem;
        }
        
        .write-btn {
            text-align: right;
            margin: 2rem 0;
        }
        
        .write-btn a {
            display: inline-block;
            padding: 0.8rem 2rem;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            transition: background 0.3s ease;
        }
        
        .write-btn a:hover {
            background: #218838;
        }
        
        .nav-links {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .nav-links a {
            display: inline-block;
            margin: 0 1rem;
            padding: 0.5rem 1rem;
            text-decoration: none;
            color: #667eea;
            border: 2px solid #667eea;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover {
            background: #667eea;
            color: white;
        }
        
        .empty-message {
            text-align: center;
            padding: 3rem;
            color: #666;
            font-size: 1.1rem;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .search-form {
                flex-direction: column;
            }
            
            .search-form input[type="text"] {
                width: 100%;
            }
            
            table {
                font-size: 0.9rem;
            }
            
            th, td {
                padding: 0.5rem;
            }
            
            .hide-mobile {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📢 공지사항</h1>
            <p>최신 공지사항을 확인하세요</p>
        </div>
        
        <div class="nav-links">
            <a href="/">홈으로</a>
            <a href="/qna/list">문의사항</a>
        </div>
        
        <!-- 검색 폼 -->
        <form class="search-form" action="/notice/search" method="get">
            <input type="text" name="keyword" placeholder="제목이나 내용으로 검색하세요..." 
                   value="${keyword}" required>
            <button type="submit">🔍 검색</button>
        </form>
        
        <div class="write-btn">
            <a href="/notice/write">✏️ 공지 작성</a>
        </div>
        
        <div class="notice-table">
            <c:choose>
                <c:when test="${not empty notices}">
                    <table>
                        <thead>
                            <tr>
                                <th width="8%">번호</th>
                                <th width="50%">제목</th>
                                <th width="15%" class="hide-mobile">작성자</th>
                                <th width="12%" class="hide-mobile">작성일</th>
                                <th width="10%" class="hide-mobile">조회수</th>
                                <th width="15%">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="notice" items="${notices}" varStatus="status">
                                <tr>
                                    <td>${notice.id}</td>
                                    <td class="title">
                                        <a href="/notice/detail/${notice.id}">
                                            ${notice.title}
                                            <span class="view-count">(${notice.viewCount})</span>
                                        </a>
                                    </td>
                                    <td class="hide-mobile">${notice.author}</td>
                                    <td class="hide-mobile">
                                        <fmt:formatDate value="${notice.createdDate}" pattern="MM-dd"/>
                                    </td>
                                    <td class="hide-mobile">${notice.viewCount}</td>
                                    <td>
                                        <a href="/notice/edit/${notice.id}" 
                                           style="color: #667eea; text-decoration: none; margin-right: 0.5rem;">수정</a>
                                        <a href="/notice/delete/${notice.id}" 
                                           style="color: #dc3545; text-decoration: none;"
                                           onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-message">
                        <c:choose>
                            <c:when test="${not empty keyword}">
                                "<strong>${keyword}</strong>" 검색 결과가 없습니다.
                            </c:when>
                            <c:otherwise>
                                등록된 공지사항이 없습니다.
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>