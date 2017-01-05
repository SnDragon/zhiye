package com.scut.controller;

import com.scut.entity.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.servlet.http.*;

/**
 * Created by pc on 2016/12/30.
 */
@Controller
public class IndexController {
    @GetMapping(value = {"/","/login"})
    public String index(HttpSession session){
//        return "login";
        User user=new User();
        user.setUserName("dragon");
        user.setId(1);
        user.setSex(1);
        user.setEmail("1803240383@qq.com");
        user.setIntegral(0);
        session.setAttribute("user",user);
        return "redirect:/index";
    }

    @GetMapping(value = "/register")
    public String register(){
        return "register";
    }

    @GetMapping(value = "/index")
    public String showIndex(){
        return "home";
    }

    @GetMapping(value = "/discovery")
    public String showDescovery(){
        return "discovery";
    }
    @GetMapping(value = "/test")
    @ResponseBody
    public String test(){
        return "hello";
    }
}
