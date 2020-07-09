package com.lcl.entity.custom;

import com.lcl.entity.Category;


/**
 * 文章分类目录的信息的扩展
 * @author lcl
 */
public class CategoryCustom extends Category {
    //分类对应的文章数
    private Integer articleCount;

    //分类的父分类名称
    private String categoryPname;

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }

    public String getCategoryPname() {
        return categoryPname;
    }

    public void setCategoryPname(String categoryPname) {
        this.categoryPname = categoryPname;
    }
}
