package com.scut.controller;

import org.springframework.web.bind.annotation.*;

/**
 * Created by pc on 2017/1/7.
 */
@RestController
public class ExceptionController {
    @RequestMapping("/exception")
    public void catchException() {
        throw new RuntimeException("error occur");
    }

    @RequestMapping("/500")
    public String showServerError() {
        return "server error";
    }

    @RequestMapping(value = "/404")
    public String showNotFoundError(){
        return "not found";
    }
}