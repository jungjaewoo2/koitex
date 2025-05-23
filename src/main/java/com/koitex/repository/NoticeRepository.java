package com.koitex.koitex.repository;

import com.koitex.koitex.entity.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeRepository extends JpaRepository<Notice, Long> {
    
    // 제목으로 검색
    List<Notice> findByTitleContaining(String title);
    
    // 작성자로 검색
    List<Notice> findByAuthor(String author);
    
    // 생성일 기준으로 내림차순 정렬
    List<Notice> findAllByOrderByCreatedDateDesc();
    
    // 조회수 기준으로 내림차순 정렬
    List<Notice> findAllByOrderByViewCountDesc();
    
    // 제목이나 내용에서 키워드 검색
    @Query("SELECT n FROM Notice n WHERE n.title LIKE %:keyword% OR n.content LIKE %:keyword%")
    List<Notice> findByTitleOrContentContaining(@Param("keyword") String keyword);
}