package com.koitex.koitex.service;

import com.koitex.koitex.entity.Notice;
import com.koitex.koitex.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class NoticeService {
    
    @Autowired
    private NoticeRepository noticeRepository;
    
    // 모든 공지사항 조회 (최신순)
    public List<Notice> getAllNotices() {
        return noticeRepository.findAllByOrderByCreatedDateDesc();
    }
    
    // ID로 공지사항 조회
    public Optional<Notice> getNoticeById(Long id) {
        return noticeRepository.findById(id);
    }
    
    // 공지사항 저장
    public Notice saveNotice(Notice notice) {
        return noticeRepository.save(notice);
    }
    
    // 공지사항 삭제
    public void deleteNotice(Long id) {
        noticeRepository.deleteById(id);
    }
    
    // 공지사항 수정
    public Notice updateNotice(Long id, Notice updatedNotice) {
        Optional<Notice> existingNotice = noticeRepository.findById(id);
        if (existingNotice.isPresent()) {
            Notice notice = existingNotice.get();
            notice.setTitle(updatedNotice.getTitle());
            notice.setContent(updatedNotice.getContent());
            notice.setAuthor(updatedNotice.getAuthor());
            return noticeRepository.save(notice);
        }
        return null;
    }
    
    // 조회수 증가
    public void increaseViewCount(Long id) {
        Optional<Notice> notice = noticeRepository.findById(id);
        if (notice.isPresent()) {
            Notice n = notice.get();
            n.setViewCount(n.getViewCount() + 1);
            noticeRepository.save(n);
        }
    }
    
    // 제목으로 검색
    public List<Notice> searchByTitle(String title) {
        return noticeRepository.findByTitleContaining(title);
    }
    
    // 키워드로 검색 (제목 + 내용)
    public List<Notice> searchByKeyword(String keyword) {
        return noticeRepository.findByTitleOrContentContaining(keyword);
    }
    
    // 인기 공지사항 (조회수 기준)
    public List<Notice> getPopularNotices() {
        return noticeRepository.findAllByOrderByViewCountDesc();
    }
}