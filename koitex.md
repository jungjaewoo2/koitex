# koit_ex1 프로젝트
Spring Boot, JSP, MySQL을 활용한 사용자 관리 웹 애플리케이션입니다.

## 프로젝트 설정

- Java 버전: 21
- Spring Boot 버전: 3.5.0
- 데이터베이스: MySQL
- 뷰 템플릿: JSP
- 빌드 도구: Maven

## 프로젝트 구조
koit_ex/
├── pom.xml
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── koit/
│   │   │           ├── KoitexApplication.java
│   │   │           ├── controller
│   │   │           ├── entity
│   │   │           ├── repository
│   │   │           └── service
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── static/
│   │   │   │   └── css/
│   │   │   │   └── images/
│   │   │   │   └── inc/
│   │   │   │   └── js/
│   │   │   │   └── vendors/
│   │   │   └── templates/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── views/
│   │               ├── common/
│   │               ├── home.jsp
│   │               └── admin/
│   └── test/
│       └── java/
│           └── com/
│               └── koit_ex/
│                   └── KoitexApplicationTests.java
└── README.md

### 데이터베이스 설정
- MySQL 데이터베이스명은 testDB 서버에 접속
- 공지사항 테이블명은 notice, 문의사항 테이블명은 qna 로 생성되어 있음
- 접근 계정은 id: root, 패스워드: topy1004