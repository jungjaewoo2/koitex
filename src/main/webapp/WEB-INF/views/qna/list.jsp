<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의사항 목록 - KOITEX</title>
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
        
        .filter-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .filter-btn {
            padding: 0.8rem 1.5rem;
            border: 2px solid #667eea;
            background: white;
            color: #667eea;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .filter-btn:hover,
        .filter-btn.active {
            background: #667eea;
            color: white;
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
        
        .qna-table {
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
        
        .status-badge {
            padding: 0.3rem 0.8rem;
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
            
            .filter-buttons {
                flex-wrap: wrap;
                gap: 0.5rem;
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
            <h1>❓ 문의사항</h1>
            <p>궁금한 내용을 문의해주세요</p>
        </div>
        
        <div class="nav-links">
            <a href="/">홈으로</a>
            <a href="/notice/list">공지사항</a>
        </div>
        
        <!-- 필터 버튼 -->
        <div class="filter-buttons">
            <a href="/qna/list" class="filter-btn ${empty listType ? 'active' : ''}">전체</a>
            <a href="/qna/unanswered" class="filter-btn ${listType == 'unanswered' ? 'active' : ''}">미답변</a>
            <a href="/qna/answered" class="filter-btn ${listType == 'answered' ? 'active' : ''}">답변완료</a>
        </div>
        
        <!-- 검색 폼 -->
        <form class="search-form" action="/qna/search" method="get">
            <input type="text" name="keyword" placeholder="제목이나 내용으로 검색하세요..." 
                   value="${keyword}" required>
            <button type="submit">🔍 검색</button>
        </form>
        
        <div class="write-btn">
            <a href="/qna/write">✏️ 문의 작성</a>
        </div>
        
        <div class="qna-table">
            <c:choose>
                <c:when test="${not empty qnas}">
                    <table>
                        <thead>
                            <tr>
                                <th width="8%">번호</th>
                                <th width="45%">제목</th>
                                <th width="12%" class="hide-mobile">상태</th>
                                <th width="15%" class="hide-mobile">작성자</th>
                                <th width="12%" class="hide-mobile">작성일</th>
                                <th width="15%">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="qna" items="${qnas}">
                                <tr>
                                    <td>${qna.id}</td>
                                    <td class="title">
                                        <a href="/qna/detail/${qna.id}">
                                            ${qna.title}
                                        </a>
                                    </td>
                                    <td class="hide-mobile">
                                        <c:choose>
                                            <c:when test="${qna.answered}">
                                                <span class="status-badge answered">답변완료</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-badge unanswered">미답변</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="hide-mobile">${qna.author}</td>
                                    <td class="hide-mobile">
                                        <fmt:formatDate value="${qna.createdDate}" pattern="MM-dd"/>
                                    </td>
                                    <td>
                                        <a href="/qna/edit/${qna.id}" 
                                           style="color: #667eea; text-decoration: none; margin-right: 0.5rem;">수정</a>
                                        <a href="/qna/delete/${qna.id}" 
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
                            <c:when test="${listType == 'unanswered'}">
                                미답변 문의사항이 없습니다.
                            </c:when>
                            <c:when test="${listType == 'answered'}">
                                답변완료된 문의사항이 없습니다.
                            </c:when>
                            <c:otherwise>
                                등록된 문의사항이 없습니다.
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>