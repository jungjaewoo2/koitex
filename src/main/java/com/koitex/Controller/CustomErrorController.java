package com.koitex.koitex.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Object message = request.getAttribute(RequestDispatcher.ERROR_MESSAGE);
        Object exception = request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
        
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            model.addAttribute("statusCode", statusCode);
            model.addAttribute("errorMessage", message != null ? message.toString() : "알 수 없는 오류가 발생했습니다.");
            
            if (exception != null) {
                model.addAttribute("exception", exception.toString());
            }
            
            // 상태 코드별 처리
            switch (statusCode) {
                case 404:
                    model.addAttribute("errorTitle", "페이지를 찾을 수 없습니다");
                    break;
                case 500:
                    model.addAttribute("errorTitle", "내부 서버 오류");
                    break;
                default:
                    model.addAttribute("errorTitle", "오류 발생");
            }
        }
        
        return "error";
    }
}