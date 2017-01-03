package com.scut.service;

import com.scut.dao.*;
import com.scut.entity.*;
import org.springframework.data.domain.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import javax.annotation.*;
import java.sql.*;
import java.util.*;

/**
 * Created by pc on 2017/1/2.
 */
@Service
public class CommentService {
    @Resource
    private CommentDao commentDao;
    @Resource
    private CommentContentDao commentContentDao;
    @Resource
    private SupportDao supportDao;

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


    public Page<Comment> getHotCommentsByPage(Pageable pageable) {
        return commentDao.findByHot(pageable);
    }

    public List<Comment> getChildComment(Integer uid, Integer qid, String thread) {
        List<Comment> commentList=commentDao.findByThread(qid,thread);
        if(uid!=null){
            for(Comment comment:commentList){
                if(supportDao.isSupportExisted(uid,comment.getId())>0){
                    comment.setSupport(true);
                }
            }
        }
        return commentList;
    }
}
