package com.koitex.koitex.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "qna")
public class QnA {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 200)
    private String title;
    
    @Column(columnDefinition = "TEXT")
    private String content;
    
    @Column(nullable = false, length = 50)
    private String author;
    
    @Column(name = "created_date")
    private LocalDateTime createdDate;
    
    @Column(name = "updated_date")
    private LocalDateTime updatedDate;
    
    @Column(name = "view_count")
    private int viewCount = 0;
    
    @Column(name = "is_answered")
    private boolean isAnswered = false;
    
    @Column(columnDefinition = "TEXT")
    private String answer;
    
    @Column(name = "answer_date")
    private LocalDateTime answerDate;
    
    // 기본 생성자
    public QnA() {}
    
    // 생성자
    public QnA(String title, String content, String author) {
        this.title = title;
        this.content = content;
        this.author = author;
        this.createdDate = LocalDateTime.now();
        this.updatedDate = LocalDateTime.now();
    }
    
    // Getter, Setter
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getAuthor() {
        return author;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    public LocalDateTime getCreatedDate() {
        return createdDate;
    }
    
    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
    
    public LocalDateTime getUpdatedDate() {
        return updatedDate;
    }
    
    public void setUpdatedDate(LocalDateTime updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    public int getViewCount() {
        return viewCount;
    }
    
    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }
    
    public boolean isAnswered() {
        return isAnswered;
    }
    
    public void setAnswered(boolean answered) {
        isAnswered = answered;
    }
    
    public String getAnswer() {
        return answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
        if (answer != null && !answer.trim().isEmpty()) {
            this.isAnswered = true;
            this.answerDate = LocalDateTime.now();
        }
    }
    
    public LocalDateTime getAnswerDate() {
        return answerDate;
    }
    
    public void setAnswerDate(LocalDateTime answerDate) {
        this.answerDate = answerDate;
    }
    
    @PreUpdate
    public void preUpdate() {
        this.updatedDate = LocalDateTime.now();
    }
}