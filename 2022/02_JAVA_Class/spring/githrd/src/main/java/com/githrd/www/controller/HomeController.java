package com.githrd.www.controller;
/*
    Created by HG on 2022-05-31
    
*/
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Log4j
public class HomeController {

    @RequestMapping("/")
    public ModelAndView index(){
        log.info("index controller start!!");

        ModelAndView mav = new ModelAndView();
        mav.addObject("title", "Spring Test");
        mav.addObject("content", "Hello World!!");
        mav.setViewName("index");

        return mav;
    }
}