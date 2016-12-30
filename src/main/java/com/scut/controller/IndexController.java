package com.scut.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

/**
 * Created by pc on 2016/12/30.
 */
@Controller
public class IndexController {
    @GetMapping(value = {"/","/login"})
    public String index(){
        return "login";
    }

    @GetMapping(value = "/register")
    public String register(){
        return "register";
    }

    @GetMapping(value = "/index")
    public String showIndex(){
        return "home";
    }
}
