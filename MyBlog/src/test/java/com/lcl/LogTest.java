package com.lcl;

import com.github.pagehelper.PageInfo;
import com.lcl.entity.Log;
import com.lcl.entity.User;
import com.lcl.entity.custom.UserCustom;
import com.lcl.service.LogService;
import com.lcl.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;


/**
 * @author lcl
 * @date 2020/5/14 0:57
 * @Description
 */

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration(locations = {"classpath:spring/springmvc.xml","classpath:spring/applicationContext-*.xml"})
//@ContextConfiguration(locations = {"classpath:spring/springmvc.xml"})
//@ContextConfiguration(locations = {"classpath:spring/applicationContext-*.xml"})
@Controller
public class LogTest {

    @Autowired
    private UserService userService;

    @Autowired
    private LogService logService;


    
    @Test
    public void testLog() {
        System.out.println("hah");
    }
    
    @Test
    public void testLogin() throws Exception {
        User user = userService.getUserByName("shilan");
        System.out.println(user);
    }

    @Test
    public void testAddUser() {
        User user = new User();
        user.setUserId(7);
        user.setUserName("xiaokeai");
        user.setUserPass("123");
        user.setUserAvatar("b");
        user.setUserEmail("xiaokeai@xiao");
        try {
            userService.insertUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("a");
    }

    @Test
    public void testDelete() {
//        User user = new User();
//        user.setUserName("wwww");
//        user.setUserPass("123");
//        user.setUserAvatar("b");
        try {
            userService.deleteUser(4);
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("a");
    }

    @Test
    public void testselect() {
        User userById = null;
        try {
            userById = userService.getUserByNameOrEmail("zhang");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(userById);
    }

    @Test
    public void testUpdate() throws Exception {
        User user = new User();
        user.setUserId(4);
        user.setUserName("dakeai");
        userService.updateUser(user);
    }

    @Test
    public void testLogs() {
        PageInfo pageInfo = logService.findAllLogsBypage(1);
        System.out.println(pageInfo);
//        allLog.forEach((x)->System.out.println(x));
//        System.out.println(allLog);
    }


}
