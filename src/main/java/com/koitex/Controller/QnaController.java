package com.koitex.koitex.controller;

import com.koitex.koitex.entity.QnA;
import com.koitex.koitex.service.QnAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/qna")
public class QnAController {
    
    @Autowired
    private QnAService qnaService;
    
    // 문의사항 목록
    @GetMapping("/list")
    public String qnaList(Model model) {
        List<QnA> qnas = qnaService.getAllQnAs();
        model.addAttribute("qnas", qnas);
        return "qna/list";
    }
    
    // 문의사항 상세보기
    @GetMapping("/detail/{id}")
    public String qnaDetail(@PathVariable Long id, Model model) {
        Optional<QnA> qna = qnaService.getQnAById(id);
        if (qna.isPresent()) {
            qnaService.increaseViewCount(id);
            model.addAttribute("qna", qna.get());
            return "qna/detail";
        }
        return "redirect:/qna/list";
    }
    
    // 문의사항 작성 폼
    @GetMapping("/write")
    public String writeForm(Model model) {
        model.addAttribute("qna", new QnA());
        return "qna/write";
    }
    
    // 문의사항 작성 처리
    @PostMapping("/write")
    public String writeQnA(@ModelAttribute QnA qna) {
        qnaService.saveQnA(qna);
        return "redirect:/qna/list";
    }
    
    // 문의사항 수정 폼
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        Optional<QnA> qna = qnaService.getQnAById(id);
        if (qna.isPresent()) {
            model.addAttribute("qna", qna.get());
            return "qna/edit";
        }
        return "redirect:/qna/list";
    }
    
    // 문의사항 수정 처리
    @PostMapping("/edit/{id}")
    public String editQnA(@PathVariable Long id, @ModelAttribute QnA qna) {
        qnaService.updateQnA(id, qna);
        return "redirect:/qna/detail/" + id;
    }
    
    // 문의사항 삭제
    @GetMapping("/delete/{id}")
    public String deleteQnA(@PathVariable Long id) {
        qnaService.deleteQnA(id);
        return "redirect:/qna/list";
    }
    
    // 답변 등록 처리
    @PostMapping("/answer/{id}")
    public String addAnswer(@PathVariable Long id, @RequestParam String answer) {
        qnaService.addAnswer(id, answer);
        return "redirect:/qna/detail/" + id;
    }
    
    // 미답변 문의사항 목록
    @GetMapping("/unanswered")
    public String unansweredList(Model model) {
        List<QnA> qnas = qnaService.getUnansweredQnAs();
        model.addAttribute("qnas", qnas);
        model.addAttribute("listType", "unanswered");
        return "qna/list";
    }
    
    // 답변완료 문의사항 목록
    @GetMapping("/answered")
    public String answeredList(Model model) {
        List<QnA> qnas = qnaService.getAnsweredQnAs();
        model.addAttribute("qnas", qnas);
        model.addAttribute("listType", "answered");
        return "qna/list";
    }
    
    // 문의사항 검색
    @GetMapping("/search")
    public String searchQnA(@RequestParam String keyword, Model model) {
        List<QnA> qnas = qnaService.searchByKeyword(keyword);
        model.addAttribute("qnas", qnas);
        model.addAttribute("keyword", keyword);
        return "qna/list";
    }
}