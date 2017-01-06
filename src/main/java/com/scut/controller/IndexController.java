package com.scut.controller;

import com.scut.entity.*;
import com.scut.service.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import javax.annotation.*;
import javax.servlet.http.*;
import java.util.*;

/**
 * Created by pc on 2016/12/30.
 */
@Controller
public class IndexController {
    @Resource
    private UserService userService;
    @Resource
    private QuestionService questionService;

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

    @GetMapping(value = "/searchQuestion")
    public String searchQuestion(){
        return "searchResultQue";
    }

    @GetMapping(value = "/searchUser")
    public String searchUser(){
        return "searchResultUser";
    }

    @PostMapping(value = "/searchQResult")
    @ResponseBody
    public Map<String,Object> getSearchQResult(@RequestParam("key")String key){
        Map<String,Object> map=new HashMap<>();
        if(key==null || "".equals(key.trim())){
            map.put("count",0);
            return map;
        }
        List<Question> questionList=questionService.searchQuestion(key);
        if(questionList.size()==0){
            map.put("count",0);
        }else{
            map.put("count",questionList.size());
            map.put("content",questionList);
        }
        return map;
    }

    @PostMapping(value = "/searchUResult")
    @ResponseBody
    public Map<String,Object> getSearchUResult(@RequestParam("key")String key){
        Map<String,Object> map=new HashMap<>();
        if(key==null || "".equals(key.trim())){
            map.put("count",0);
            return map;
        }
        List<User> userList=userService.searchUser(key);
        if(userList.size()==0){
            map.put("count",0);
        }else{
            map.put("count",userList.size());
            map.put("content",userList);
        }
        return map;
    }

}
