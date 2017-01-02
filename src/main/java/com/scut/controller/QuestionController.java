package com.scut.controller;

import com.google.gson.*;
import com.scut.dto.*;
import com.scut.entity.*;
import com.scut.service.*;
import org.springframework.data.domain.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;
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
//保存问题
    @PostMapping(value = "/question")
    @ResponseBody
    public Message<Question> insertQuestion(@RequestBody Question question){
        Message<Question> message=new Message<>();
        Question question1=questionService.insert(question);
        if(question1!=null){
            message.setFlag("success");
            question1.setNumOfAnswers(0);
        }else{
            message.setFlag("fail");
        }
        message.setContent(question1);
        return message;
    }


//返回问题详情内容
    @GetMapping(value = "/q/{id}/detail")
    @ResponseBody
    public Map<String,String> getQuestionContent(@PathVariable("id")Integer id){
        Map<String,String> map=new HashMap<>();
        QuestionContent questionContent= questionService.getQuestionContent(id);
        if(questionContent!=null){
            map.put("result","success");
            map.put("content", questionContent.getContent());
        }else{
            map.put("result","fail");
        }
       return map;
    }

//    按时间排序分页返回问题列表
    @GetMapping(value = "/time")
    @ResponseBody
    public Map<String,Object> getTimeQuestionList(@RequestParam(value = "page",defaultValue = "0")Integer page,
                                                @RequestParam(value = "size",defaultValue = "2")Integer size){
        Sort sort=new Sort(Sort.Direction.DESC,"time");
        Pageable pageable=new PageRequest(page,size,sort);
        Page<Question> questionPage = questionService.getQuestionListByPageOrderByTime(pageable);
        Map<String,Object> map=new HashMap<>();
        map.put("last",questionPage.isLast());
        map.put("content",questionPage.getContent());
        return map;
    }

//按评论数排序
    @GetMapping(value = "/hot")
    @ResponseBody
    public Map<String,Object> getHotQuestionList(@RequestParam(value = "page",defaultValue = "0")Integer page,
                                                    @RequestParam(value = "size",defaultValue = "2")Integer size){
        Sort sort=new Sort(Sort.Direction.DESC,"numOfAnswers");
        Pageable pageable=new PageRequest(page,size,sort);
        Page<Question> questionPage = questionService.getQuestionListByPageOrderByHot(pageable);
        Map<String,Object> map=new HashMap<>();
        map.put("last",questionPage.isLast());
        map.put("content",questionPage.getContent());
        return map;
    }

}
