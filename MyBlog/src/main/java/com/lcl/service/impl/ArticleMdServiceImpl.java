package com.lcl.service.impl;

import com.lcl.entity.custom.ArticlemdCustom;
import com.lcl.mapper.custom.ArticlemdMapperCustom;
import com.lcl.service.ArticleMdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ArticleMdServiceImpl implements ArticleMdService {

    @Autowired
    private ArticlemdMapperCustom articlemdMapperCustom;
    @Override
    public ArticlemdCustom getArticleById(Integer status, Integer id) throws Exception {
        return articlemdMapperCustom.getArticleById(status,id);
    }
}
