package com.koitex.koitex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
    
    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "서버가 정상적으로 동작하고 있습니다!";
    }
    
    @GetMapping("/test-jsp")
    public String testJsp(Model model) {
        model.addAttribute("message", "JSP 테스트 페이지입니다.");
        return "test";
    }
}