package com.scut.service;

import com.scut.dao.*;
import com.scut.entity.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import javax.annotation.*;
import java.sql.*;

/**
 * Created by pc on 2017/1/2.
 */
@Service
public class CommentService {
    @Resource
    private CommentDao commentDao;
    @Resource
    private CommentContentDao commentContentDao;

    @Transactional
    public Comment saveComment(Comment comment) {
        Timestamp time=new Timestamp(System.currentTimeMillis());
        comment.setTime(time);
        System.out.println(comment);
        String summary=comment.getSummary();
        if(summary.length()>250){
            comment.setSummary(summary.substring(0,250));
            comment=commentDao.save(comment);
            CommentContent commentContent=new CommentContent(comment.getId(),summary);
            commentContentDao.save(commentContent);
        }else{
           comment=commentDao.save(comment);
        }
        return comment;
    }


}
