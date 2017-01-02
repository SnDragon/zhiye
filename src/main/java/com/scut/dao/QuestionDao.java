package com.scut.dao;

import com.scut.entity.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.*;
import org.springframework.data.repository.Repository;
import org.springframework.stereotype.*;

import java.util.*;

/**
 * Created by pc on 2016/12/31.
 */
@org.springframework.stereotype.Repository
public interface QuestionDao extends PagingAndSortingRepository<Question,Integer>{
//    Question save(Question question);

    List<Question> findAll();

//    List<Question>
}
