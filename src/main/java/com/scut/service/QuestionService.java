package com.scut.service;

import com.scut.dao.*;
import com.scut.entity.*;
import org.springframework.stereotype.*;

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


    public Question insert(Question question) {
        Timestamp time=new Timestamp(System.currentTimeMillis());
        question.setTime(time);
        return questionDao.save(question);
    }

    public List<Question> getQuestionListByPage(int page) {
        System.out.println(page);
        return questionDao.findAll();
    }
}
