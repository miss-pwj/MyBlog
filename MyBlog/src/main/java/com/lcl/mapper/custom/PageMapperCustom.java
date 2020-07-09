package com.lcl.mapper.custom;

import com.lcl.entity.custom.PageCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lcl
 * @Description
 */
public interface PageMapperCustom {
	//获得页面列表
	public List<PageCustom> listPage(@Param(value="status") Integer status) throws Exception;

	//根据key获得页面
	public PageCustom getPageByKey(@Param(value="status") Integer status,@Param(value="key")String key) throws Exception;
}
