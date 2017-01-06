package com.scut.dao;


import com.scut.entity.*;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.*;
import org.springframework.data.repository.Repository;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import java.util.*;

/**
 * Created by pc on 2017/1/2.
 */
@org.springframework.stereotype.Repository
public interface CommentDao extends Repository<Comment,Integer>{
//    Comment save(Comment comment);

    Comment save(Comment comment);

    @Query("select c from Comment c where c.thread='/'")
    Page<Comment> findByHot(Pageable pageable);

    @Query("select count(c.id) from Comment c where c.authorId=?1 and c.thread='/'")
    Integer getCommentCountByUserId(Integer id);

    @Query("select c from Comment c where c.thread='/' and c.authorId=?1")
    Page<Comment> getUserAnswers(Integer uid, Pageable pageable);

    @Query("select c from Comment c where c.question.id=?1 and c.thread like CONCAT(?2,'%') ")
    List<Comment> findByThread(Integer qid,String thread);

    @Query("select c from Comment c where c.question.id=?1")
    Page<Comment> getQuestionComments(Integer qid, Pageable pageable);

    @Query("delete from Comment c where c.id=?1 and c.authorId=?2")
    int removeComment(Integer cid, Integer uid);
}
