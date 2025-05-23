package com.koitex.koitex.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(Model model) {
        model.addAttribute("errorTitle", "오류가 발생했습니다");
        model.addAttribute("errorMessage", "요청을 처리하는 중 문제가 발생했습니다.");
        return "error";
    }
}
