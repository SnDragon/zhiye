package com.scut.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

/**
 * Created by pc on 2017/1/7.
 */
@Controller
public class ExceptionController {
//    @RequestMapping("/exception")
//    public void catchException() {
//        throw new RuntimeException("error occur");
//    }

    @RequestMapping("/500")
    public String showServerError() {
        return "500";
    }

    @RequestMapping(value = "/404")
    public String showNotFoundError(){
        return "404";
    }
}