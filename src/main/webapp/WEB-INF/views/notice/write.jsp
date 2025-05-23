<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성 - KOITEX</title>
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
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 20px;
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
        
        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: #333;
        }
        
        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e9ecef;
            border-radius: 5px;
            font-size: 1rem;
            font-family: inherit;
            transition: border-color 0.3s ease;
        }
        
        .form-group input[type="text"]:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .form-group textarea {
            min-height: 200px;
            resize: vertical;
        }
        
        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }
        
        .btn {
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background: #667eea;
            color: white;
        }
        
        .btn-primary:hover {
            background: #5a6fd8;
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
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
        
        @media (max-width: 768px) {
            .container {
                margin: 1rem auto;
                padding: 0 10px;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>✏️ 공지사항 작성</h1>
            <p>111새로운 공지사항을 작성해주세요</p>
        </div>
        
        <div class="nav-links">
            <a href="/">홈으로</a>
            <a href="/notice/list">공지사항 목록</a>
        </div>
        
        <div class="form-container">
            <form action="/notice/write" method="post">
                <div class="form-group">
                    <label for="title">제목 *</label>
                    <input type="text" id="title" name="title" required 
                           placeholder="공지사항 제목을 입력하세요">
                </div>
                
                <div class="form-group">
                    <label for="author">작성자 *</label>
                    <input type="text" id="author" name="author" required 
                           placeholder="작성자명을 입력하세요">
                </div>
                
                <div class="form-group">
                    <label for="content">내용 *</label>
                    <textarea id="content" name="content" required 
                              placeholder="공지사항 내용을 입력하세요"></textarea>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">📝 작성완료</button>
                    <a href="/notice/list" class="btn btn-secondary">❌ 취소</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // 폼 유효성 검사
        document.querySelector('form').addEventListener('submit', function(e) {
            const title = document.getElementById('title').value.trim();
            const author = document.getElementById('author').value.trim();
            const content = document.getElementById('content').value.trim();
            
            if (!title || !author || !content) {
                e.preventDefault();
                alert('모든 필수 항목을 입력해주세요.');
                return false;
            }
            
            if (title.length > 200) {
                e.preventDefault();
                alert('제목은 200자 이내로 입력해주세요.');
                return false;
            }
        });
    </script>
</body>
</html>