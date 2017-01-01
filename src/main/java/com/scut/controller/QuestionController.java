package com.scut.controller;

import com.google.gson.*;
import com.scut.dto.*;
import com.scut.entity.*;
import com.scut.service.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;
import javax.servlet.http.*;
import java.util.*;

/**
 * Created by pc on 2016/12/31.
 */
@Controller
@RequestMapping(value = "/questions")
public class QuestionController {

    @Resource
    private QuestionService questionService;
    private Gson gson=new Gson();

    @PostMapping(value = "/question")
    @ResponseBody
    public Message<Question> insertQuestion(@RequestBody Question question){
        System.out.println(question);
        Message<Question> message=new Message<>();
        Question question1=questionService.insert(question);
        if(question1!=null){
            message.setFlag("success");
        }else{
            message.setFlag("fail");
        }
        message.setContent(question1);
        return message;
    }

    @GetMapping(value = "/all")
    @ResponseBody
    public List<Question> getQuestionListByPage(@RequestParam(value = "page",defaultValue = "1")int page, ModelMap modelMap,
                                                HttpServletRequest request,HttpServletResponse response){
//        modelMap.addAttribute("questionList",questionService.getQuestionListByPage(page));
//        return "questionPage";
        return questionService.getQuestionListByPage(page);
    }
}
