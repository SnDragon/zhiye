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
 * Created by pc on 2016/12/31.
 */
@Service
public class QuestionService {
    @Resource
    private QuestionDao questionDao;
    @Resource
    private QuestionContentDao questionContentDao;
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

    public List<Question> getQuestionListByPage(int page) {
        return questionDao.findAll();
    }

    public String getQuestionContent(Integer id) {
        QuestionContent q=questionContentDao.findByQuestionId(id);
        if(q!=null){
            return q.getContent();
        }else{
            return "fail";
        }
    }

    public Page<Question> getQuestionListByPageOrderByTime(Pageable pageable) {
        return questionDao.findAll(pageable);
    }

    public Page<Question> getQuestionListByPageOrderByHot(Pageable pageable) {
        return questionDao.findAll(pageable);
    }
}
