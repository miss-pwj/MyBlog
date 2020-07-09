package com.lcl.entity.custom;

import com.lcl.entity.Tag;

/**
 * 文章标签的信息的扩展
 * @author lcl
 */
public class TagCustom extends Tag {
	//标签对应的文章数目
	private Integer articleCount;

	public Integer getArticleCount() {
		return articleCount;
	}

	public void setArticleCount(Integer articleCount) {
		this.articleCount = articleCount;
	}
}
