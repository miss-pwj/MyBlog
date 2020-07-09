package com.lcl.mapper;

import com.lcl.entity.Article;
import org.apache.ibatis.annotations.Param;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer articleId);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer articleId);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    boolean updateArticle(@Param("article") Article article);
}