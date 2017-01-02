package com.scut.dao;


import com.scut.entity.*;
import org.springframework.data.repository.*;
import org.springframework.data.repository.Repository;
import org.springframework.stereotype.*;

/**
 * Created by pc on 2017/1/2.
 */
@org.springframework.stereotype.Repository
public interface CommentDao extends Repository<Comment,Integer>{
    Comment save(Comment comment);
}
