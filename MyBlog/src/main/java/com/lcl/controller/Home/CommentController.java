package com.lcl.controller.Home;

import com.lcl.entity.Article;
import com.lcl.entity.Comment;
import com.lcl.service.ArticleService;
import com.lcl.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author lcl
 * @Description
 */

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;

	@Autowired
	private ArticleService articleService;
	
	//添加评论
	@RequestMapping(value = "/comment/insert",method = {RequestMethod.POST})
	@ResponseBody
	public void insertComment(HttpServletRequest request, Comment comment) throws Exception {
		//添加评论
		comment.setCommentCreateTime(new Date());
		commentService.insertComment(request,comment);
		//更新文章的评论数
		Article article = articleService.getArticleById(null,comment.getCommentArticleId());
		articleService.updateCommentCount(article.getArticleId());
	}


}
