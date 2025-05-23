package com.koitex.koitex.controller;

import com.koitex.koitex.entity.Notice;
import com.koitex.koitex.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    
    @Autowired
    private NoticeService noticeService;
    
    // 공지사항 목록
    @GetMapping("/list")
    public String noticeList(Model model) {
        List<Notice> notices = noticeService.getAllNotices();
        model.addAttribute("notices", notices);
        return "notice/list";
    }
    
    // 공지사항 상세보기
    @GetMapping("/detail/{id}")
    public String noticeDetail(@PathVariable Long id, Model model) {
        Optional<Notice> notice = noticeService.getNoticeById(id);
        if (notice.isPresent()) {
            noticeService.increaseViewCount(id);
            model.addAttribute("notice", notice.get());
            return "notice/detail";
        }
        return "redirect:/notice/list";
    }
    
    // 공지사항 작성 폼
    @GetMapping("/write")
    public String writeForm(Model model) {
        model.addAttribute("notice", new Notice());
        return "notice/write";
    }
    
    // 공지사항 작성 처리
    @PostMapping("/write")
    public String writeNotice(@ModelAttribute Notice notice) {
        noticeService.saveNotice(notice);
        return "redirect:/notice/list";
    }
    
    // 공지사항 수정 폼
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        Optional<Notice> notice = noticeService.getNoticeById(id);
        if (notice.isPresent()) {
            model.addAttribute("notice", notice.get());
            return "notice/edit";
        }
        return "redirect:/notice/list";
    }
    
    // 공지사항 수정 처리
    @PostMapping("/edit/{id}")
    public String editNotice(@PathVariable Long id, @ModelAttribute Notice notice) {
        noticeService.updateNotice(id, notice);
        return "redirect:/notice/detail/" + id;
    }
    
    // 공지사항 삭제
    @GetMapping("/delete/{id}")
    public String deleteNotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        return "redirect:/notice/list";
    }
    
    // 공지사항 검색
    @GetMapping("/search")
    public String searchNotice(@RequestParam String keyword, Model model) {
        List<Notice> notices = noticeService.searchByKeyword(keyword);
        model.addAttribute("notices", notices);
        model.addAttribute("keyword", keyword);
        return "notice/list";
    }
}