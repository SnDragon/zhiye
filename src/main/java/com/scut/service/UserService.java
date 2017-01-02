package com.scut.service;

import com.scut.dao.*;
import com.scut.dto.*;
import com.scut.dto.Message;
import com.scut.entity.*;
import com.scut.util.*;
import com.sun.xml.internal.ws.api.message.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import javax.annotation.*;
import java.util.*;

/**
 * Created by pc on 2016/12/30.
 */
@Service
public class UserService {
    @Resource
    private UserDao userDao;


    public Message<String> insertUser(String email, String username, String password1, String password2) {
        Message<String> message=new Message<>();
        message.setFlag("fail");
        if(!password1.equals(password2)){
            message.setContent("密码不一致");
            return message;
        }
        String md5Pass= MD5Util.getMD5(password1);
        User user=new User(email,username,md5Pass);
        try{
            userDao.save(user);
            message.setFlag("success");
        }catch (Exception e){
            e.printStackTrace();
            message.setContent("插入数据库出错");
        }
        return message;

    }

    public User doLogin(User user) {
        String md5Pass=MD5Util.getMD5(user.getPassword());
        user.setPassword(md5Pass);
        User user1=userDao.findByEmailAndPassword(user.getEmail(),user.getPassword());

        return user1;
    }

    public User findUserById(Integer id) {
        return userDao.findOne(id);
    }
    @Transactional
    public boolean updateUserSex(Integer uid, Integer sex) {
        try{
            userDao.updateUserSex(uid,sex);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Transactional
    public String updatePassword(Integer uid, String oldPass, String newPass1, String newPass2) {
        if(!newPass1.equals(newPass2)){
            return "密码不同";
        }
        if(userDao.updatePassword(uid,MD5Util.getMD5(oldPass),MD5Util.getMD5(newPass1))>0){
            return "success";
        }else{
            return "原密码错误";
        }

    }
}
