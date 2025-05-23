package com.koitex.koitex.repository;

import com.koitex.koitex.entity.QnA;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QnARepository extends JpaRepository<QnA, Long> {
    
    // 제목으로 검색
    List<QnA> findByTitleContaining(String title);
    
    // 작성자로 검색
    List<QnA> findByAuthor(String author);
    
    // 답변 여부로 검색
    List<QnA> findByIsAnswered(boolean isAnswered);
    
    // 생성일 기준으로 내림차순 정렬
    List<QnA> findAllByOrderByCreatedDateDesc();
    
    // 미답변 질문만 조회
    List<QnA> findByIsAnsweredFalseOrderByCreatedDateDesc();
    
    // 답변 완료된 질문만 조회
    List<QnA> findByIsAnsweredTrueOrderByCreatedDateDesc();
    
    // 제목이나 내용에서 키워드 검색
    @Query("SELECT q FROM QnA q WHERE q.title LIKE CONCAT('%', :keyword, '%') OR q.content LIKE CONCAT('%', :keyword, '%')")
    List<QnA> findByTitleOrContentContaining(@Param("keyword") String keyword);
}