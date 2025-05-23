package com.koitex.koitex.service;

import com.koitex.koitex.entity.QnA;
import com.koitex.koitex.repository.QnARepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class QnAService {
    
    @Autowired
    private QnARepository qnaRepository;
    
    // 모든 문의사항 조회 (최신순)
    public List<QnA> getAllQnAs() {
        return qnaRepository.findAllByOrderByCreatedDateDesc();
    }
    
    // ID로 문의사항 조회
    public Optional<QnA> getQnAById(Long id) {
        return qnaRepository.findById(id);
    }
    
    // 문의사항 저장
    public QnA saveQnA(QnA qna) {
        return qnaRepository.save(qna);
    }
    
    // 문의사항 삭제
    public void deleteQnA(Long id) {
        qnaRepository.deleteById(id);
    }
    
    // 문의사항 수정
    public QnA updateQnA(Long id, QnA updatedQnA) {
        Optional<QnA> existingQnA = qnaRepository.findById(id);
        if (existingQnA.isPresent()) {
            QnA qna = existingQnA.get();
            qna.setTitle(updatedQnA.getTitle());
            qna.setContent(updatedQnA.getContent());
            qna.setAuthor(updatedQnA.getAuthor());
            return qnaRepository.save(qna);
        }
        return null;
    }
    
    // 답변 등록
    public QnA addAnswer(Long id, String answer) {
        Optional<QnA> existingQnA = qnaRepository.findById(id);
        if (existingQnA.isPresent()) {
            QnA qna = existingQnA.get();
            qna.setAnswer(answer);
            return qnaRepository.save(qna);
        }
        return null;
    }
    
    // 조회수 증가
    public void increaseViewCount(Long id) {
        Optional<QnA> qna = qnaRepository.findById(id);
        if (qna.isPresent()) {
            QnA q = qna.get();
            q.setViewCount(q.getViewCount() + 1);
            qnaRepository.save(q);
        }
    }
    
    // 미답변 문의사항 조회
    public List<QnA> getUnansweredQnAs() {
        return qnaRepository.findByIsAnsweredFalseOrderByCreatedDateDesc();
    }
    
    // 답변 완료된 문의사항 조회
    public List<QnA> getAnsweredQnAs() {
        return qnaRepository.findByIsAnsweredTrueOrderByCreatedDateDesc();
    }
    
    // 제목으로 검색
    public List<QnA> searchByTitle(String title) {
        return qnaRepository.findByTitleContaining(title);
    }
    
    // 키워드로 검색 (제목 + 내용)
    public List<QnA> searchByKeyword(String keyword) {
        return qnaRepository.findByTitleOrContentContaining(keyword);
    }
}