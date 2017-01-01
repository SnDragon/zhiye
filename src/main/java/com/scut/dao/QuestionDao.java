package com.scut.dao;

import com.scut.entity.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.*;

/**
 * Created by pc on 2016/12/31.
 */
@Repository
public interface QuestionDao extends JpaRepository<Question,Integer>{

}
