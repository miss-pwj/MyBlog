package com.lcl.mapper.custom;

import com.lcl.entity.custom.LinkCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lcl
 * @Description
 */
public interface LinkMapperCustom {
	
	//获得链接总数
	public Integer countLink(@Param(value = "status") Integer status) throws Exception;
	
	//获得链接列表
	public List<LinkCustom> listLink(@Param(value = "status") Integer status) throws Exception;
	

}
