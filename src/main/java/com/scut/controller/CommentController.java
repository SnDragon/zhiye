package com.scut.controller;

import com.scut.dto.*;
import com.scut.entity.*;
import com.scut.service.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import javax.annotation.*;

/**
 * Created by pc on 2017/1/2.
 */
@Controller
@RequestMapping(value = "/comments")
public class CommentController {
    @Resource
    private CommentService commentService;

    @PostMapping(value = "/comment")
    @ResponseBody
    public Message<Comment> insertComment(@RequestBody Comment comment){
        Message<Comment> message=new Message<>();
        Comment comment1=commentService.saveComment(comment);
        if(comment1!=null){
            message.setFlag("success");
            message.setContent(comment1);
        }else{
            message.setFlag("fail");
        }
        return message;
    }

}
