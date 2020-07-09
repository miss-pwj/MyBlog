package com.lcl.mapper.custom;

import com.lcl.entity.custom.ArticlemdCustom;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author lcl
 * @Description
 */

@Repository
public interface ArticlemdMapperCustom {
	//获取文章总数
	public Integer countArticle(@Param(value="status") Integer status) throws Exception;
	
	//获得留言总数
	public Integer countArticleComment(@Param(value="status")Integer status) throws Exception;
	
	//获得浏览量总数
	public Integer countArticleView(@Param(value="status")Integer status) throws Exception;
	
	//获得所有文章(文章归档)
	public List<ArticlemdCustom> listArticle(@Param(value="status")Integer status) throws Exception;
	
	//根据id查询用户信息/后台根据ID查询文章进行重新编辑
	public ArticlemdCustom getArticleById(@Param(value="status")Integer status,@Param(value="id")Integer id) throws Exception;
	
	//分页操作
	public List<ArticlemdCustom> listArticleByPage(@Param(value="status") Integer status,@Param(value="startPos") Integer startPos, @Param(value="pageSize") Integer pageSize) throws Exception;
	
	//文章结果查询结果的数量
	public Integer getSearchResultCount(@Param(value="status") Integer status,@Param(value="query")String query) throws Exception;
	
	//查询文章分页操作
	public List<ArticlemdCustom> listSearchResultByPage(@Param(value="status") Integer status,@Param(value="query") String query,@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize) throws Exception;
	
	//获得同分类的文章(相关文章)
	public List<ArticlemdCustom> listArticleWithSameCategory(
			@Param(value="status") Integer status,
			 @Param(value = "parentCategory") Integer parentCategory
			,@Param(value = "childCategory") Integer childCategory
			,@Param(value = "limit") Integer limit
	) throws Exception;
	
	//获得访问最多的文章(猜你喜欢)
	public List<ArticlemdCustom> listArticleByViewCount(@Param(value="status") Integer status,@Param(value = "limit") Integer limit) throws Exception;
	
	//获得上一篇文章
	public ArticlemdCustom getAfterArticle(@Param(value="status") Integer status,@Param(value="id") Integer id) throws Exception;
	
	//获得下一篇文章
	public ArticlemdCustom getPreArticle(@Param(value="status") Integer status,@Param(value="id") Integer id) throws Exception;
	
	//获得随机文章
	public List<ArticlemdCustom> listRandomArticle(@Param(value="status") Integer status,@Param(value = "limit") Integer limit) throws  Exception;

	//热评文章
	public List<ArticlemdCustom> listArticleByCommentCount(@Param(value="status") Integer status,@Param(value = "limit") Integer limit) throws Exception;

	//获得该分类的文章数
	public Integer countArticleByCategory(@Param(value="status") Integer status,@Param(value = "id") Integer id) throws Exception;

	//获得该分类的文章数
	public Integer countArticleByTag(@Param(value="status") Integer status,@Param(value = "id") Integer id) throws Exception;

	//更新文章的评论数
	public void updateCommentCount(@Param(value = "articleId") Integer articleId) throws Exception;

	//获得最后更新的记录
	public ArticlemdCustom getLastUpdateArticle() throws Exception;
}



