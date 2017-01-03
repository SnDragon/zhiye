package com.scut.service;

import com.scut.dao.*;
import com.scut.entity.*;
import com.sun.org.apache.xml.internal.utils.*;
import org.springframework.data.domain.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import javax.annotation.*;
import javax.naming.event.*;
import java.sql.*;
import java.util.*;

/**
 * Created by pc on 2016/12/31.
 */
@Service
public class QuestionService {
    @Resource
    private QuestionDao questionDao;
    @Resource
    private QuestionContentDao questionContentDao;
    @Resource
    private CommentDao commentDao;
    @Resource
    private SupportDao supportDao;

    @Transactional
    public Question insert(Question question) {
        Timestamp time=new Timestamp(System.currentTimeMillis());
        question.setTime(time);
        String summary=question.getSummary();
//        System.out.print("summary:"+summary);
        if(summary.length()>250){
            question.setSummary(summary.substring(0,250));
            question=questionDao.save(question);

            QuestionContent questionContent=new QuestionContent(question.getId(),summary);
            questionContentDao.save(questionContent);
        }else{
            question=questionDao.save(question);
        }
        return question;
    }

//    public List<Question> getQuestionListByPage(int page) {
//        return questionDao.findAll();
//    }

    public QuestionContent getQuestionContent(Integer id) {
        QuestionContent q=questionContentDao.findByQuestionId(id);
        return q;
    }

    public Page<Question> getQuestionListByPageOrderByTime(Pageable pageable) {
        return questionDao.findAll(pageable);
    }

    public Page<Question> getQuestionListByPageOrderByHot(Pageable pageable) {
        return questionDao.findAll(pageable);
    }

    public int  getQuestionCountByAuthorId(Integer uid){
        return questionDao.getQuestionCountByAuthorId(uid);
    }

    public Question getQuestionById(Integer qid) {
        return questionDao.findById(qid);
    }

    public Map<String,Object> getQuestionComments(Integer uid,Integer qid, Pageable pageable) {
        Page<Comment> commentPage = commentDao.getQuestionComments(qid, pageable);
        List<Comment> commentList=commentPage.getContent();
        if(uid!=null){
            for(Comment comment:commentList){
                if(supportDao.isSupportExisted(uid,comment.getId())>0){
                    comment.setSupport(true);
                }
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("last", commentPage.isLast());
        map.put("content", commentList);
        return map;
    }
}
