package com.lcl.controller.Home;

import cn.hutool.json.JSONObject;
import com.github.pagehelper.PageInfo;
import com.lcl.entity.Log;
import com.lcl.entity.User;
import com.lcl.entity.custom.ArticleListVo;
import com.lcl.entity.custom.CommentListVo;
import com.lcl.service.*;
import com.lcl.util.Functions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户的controller
 * @author lcl
 */
@Controller
@RequestMapping("users")
public class UserController {

	@Autowired
	private  HttpServletRequest request;


	@Autowired
	private Functions functions;


    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LinkService linkService;
    @Autowired
    private LogService logService;

    @ModelAttribute
    public void init(Model model) throws Exception {

    }

    //后台首页
    @RequestMapping("/user")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //文章列表
        List<ArticleListVo> articleCustomList = articleService.listArticle(null);
        modelAndView.addObject("articleCustomList", articleCustomList);
        //评论列表
        List<CommentListVo> commentListVoList = commentService.listCommentVo(null);
        modelAndView.addObject("commentListVoList", commentListVoList);
        //评论数
        Integer allCommentCount = commentService.countComment(null);
        Integer approvedCommentCount = commentService.countComment(1);
        Integer hiddenCommentCount = commentService.countComment(0);
        modelAndView.addObject("allCommentCount", allCommentCount);
        modelAndView.addObject("approvedCommentCount", approvedCommentCount);
        modelAndView.addObject("hiddenCommentCount", hiddenCommentCount);

        modelAndView.setViewName("/User/index");
        return modelAndView;
    }

    //登录页面显示
    @RequestMapping("/login")
    public ModelAndView loginView() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/User/login");
        return modelAndView;
    }

    //登录验证
    @RequestMapping(value = "/loginVerify", method = RequestMethod.POST)
    @ResponseBody
    public String loginVerify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberme = request.getParameter("rememberme");
        User user = userService.getUserByNameOrEmail(username);
        if (user == null) {
            map.put("code", 0);
            map.put("msg", "用户名无效！");
        } else if (!user.getUserPass().equals(password)) {
            map.put("code", 0);
            map.put("msg", "密码错误！");
        } else {
            //登录成功
            map.put("code", 1);
            map.put("msg", "");
            //添加session
            request.getSession().setAttribute("user", user);
            //添加cookie
            if (rememberme != null) {
                //创建两个Cookie对象
                Cookie nameCookie = new Cookie("username", username);
                //设置Cookie的有效期为3天
                nameCookie.setMaxAge(60 * 60 * 24 * 3);
                Cookie pwdCookie = new Cookie("password", password);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }
            user.setUserLastLoginTime(new Date());
            user.setUserLastLoginIp(Functions.getIpAddr(request));
            userService.updateUser(user);

        }
        String result = new JSONObject(map).toString();
        return result;
    }

    //退出登录
    @RequestMapping(value = "/user/logout")
    public String logout(HttpSession session) throws Exception {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }


    @RequestMapping(value = "/user/getLogs", method = RequestMethod.GET)
    public ModelAndView getLogs(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum) {
//        Map map = new HashMap<String, Object>();
        ModelAndView modelAndView = new ModelAndView();
        PageInfo<Log> allLogsBypage = logService.findAllLogsBypage(pageNum);
        modelAndView.addObject("logs",allLogsBypage);
        modelAndView.setViewName("/User/Log/index");
        return modelAndView;
    }








}
