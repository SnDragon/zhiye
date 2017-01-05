package com.scut.service;

import com.scut.dao.*;
import com.scut.entity.*;
import com.scut.util.*;
import org.springframework.data.domain.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.bind.annotation.*;

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
        if(summary.length()>255){
            comment.setSummary(summary.substring(0,255));
            comment=commentDao.save(comment);
            CommentContent commentContent=new CommentContent(comment.getId(),summary);
            commentContentDao.save(commentContent);
        }else{
           comment=commentDao.save(comment);
        }
        comment.setSummary(ContentUtil.transform(comment.getSummary()));
        return comment;
    }


    public Page<Comment> getHotCommentsByPage(Pageable pageable) {
        Page<Comment> commentPage = commentDao.findByHot(pageable);
        List<Comment> commentList = commentPage.getContent();
        for(Comment comment:commentList){
            comment.setSummary(ContentUtil.transform(comment.getSummary()));
        }
        return commentPage;
    }

    public List<Comment> getChildComment(Integer uid, Integer qid, String thread) {
        List<Comment> commentList=commentDao.findByThread(qid,thread);
        if(uid!=null){
            for(Comment comment:commentList){
                comment.setSummary(ContentUtil.transform(comment.getSummary()));
                if(supportDao.isSupportExisted(uid,comment.getId())>0){
                    comment.setSupport(true);
                }
            }
        }
        return commentList;
    }


    public CommentContent findByCommentId(Integer id) {
        CommentContent commentContent = commentContentDao.findByCommentId(id);
        if(commentContent!=null){
            commentContent.setContent(ContentUtil.transform(commentContent.getContent()));
        }
        return commentContent;
    }
}
