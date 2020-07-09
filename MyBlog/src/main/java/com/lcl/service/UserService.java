package com.lcl.service;

import com.lcl.aop.annotation.LogAnnotation;
import com.lcl.entity.User;
import com.lcl.entity.custom.UserCustom;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lcl
 * @Description
 */

public interface UserService {
    List<UserCustom> listUser() throws Exception;

    //根据id查询用户信息
    @LogAnnotation("用户通过id登录")
    UserCustom getUserById(Integer id) throws Exception;

    //修改用户信息
    @LogAnnotation("用户修改信息")
    void updateUser(User user) throws Exception;

    //删除用户
    @LogAnnotation("删除用户")
    void deleteUser(Integer id) throws Exception;

    //添加用户
    @LogAnnotation("添加用户")
    void insertUser(User user) throws Exception;


    //根据用户名和邮箱查询用户
    @LogAnnotation("用户通过用户名和邮箱登录")
    User getUserByNameOrEmail(String str) throws Exception;

    //根据用户名查询用户
    @LogAnnotation("用户通过用户名登录")
    User getUserByName(String name) throws Exception;


    //根据邮箱查询用户
    @LogAnnotation("用户通过邮箱登录")
    User getUserByEmail(String email) throws Exception;
}
