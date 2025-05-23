package com.koitex.koitex.controller;

import com.koitex.koitex.entity.Notice;
import com.koitex.koitex.entity.QnA;
import com.koitex.koitex.service.NoticeService;
import com.koitex.koitex.service.QnAService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    
    @Autowired
    private NoticeService noticeService;
    
    @Autowired
    private QnAService qnaService;
    
    @GetMapping("/")
    public String home(Model model) {
        // 최신 공지사항 5개
        List<Notice> recentNotices = noticeService.getAllNotices();
        if (recentNotices.size() > 5) {
            recentNotices = recentNotices.subList(0, 5);
        }
        
        // 최신 문의사항 5개
        List<QnA> recentQnAs = qnaService.getAllQnAs();
        if (recentQnAs.size() > 5) {
            recentQnAs = recentQnAs.subList(0, 5);
        }
        
        model.addAttribute("recentNotices", recentNotices);
        model.addAttribute("recentQnAs", recentQnAs);
        
        return "home";
    }
}