package com.scut.dao;

import com.scut.entity.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.*;

import java.util.*;

/**
 * Created by pc on 2016/12/30.
 */
@Repository
public interface UserDao extends JpaRepository<User,Integer> {


    List<User> findByEmailAndPassword(String email, String password);
}
